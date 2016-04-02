<app>
	<h1>Muisc Player!</h1>
	<p>Riot app will go here</p>

	<input size="38"  type="text" name="searchInput" placeholder="Search Music" value='{this.searchVal}' onchange="{filterBySearch}" onkeyup="{filterBySearch}">

	<select name="moodInput" onchange="{filterByMood}">
		<option value="all">All Moods</option>
		<option value="Thinking of bae">Thinking of Bae</option>
		<option value="Workout">Workout</option>
		<option value="Lizard">Lizard</option>
		<option value="Melancholy">Melancholy</option>
	</select>

	<song each="{results}" artist="{artist}" title="{title}" linkedtitle="{linkedtitle}" embed="{embed}" nid="{nid}" mood="{mood}" cta="{url}"></song>



	<script>
		var self = this;
		self.results = [];
		self.searchVal = '';
		self.moodVal = 'all';


		self.on('mount',function(){
			self.filterMusic();
			self.update();
		});

		self.filterBySearch = function(){
			self.searchVal = self.searchInput.value;
			self.filterMusic();
			self.update();
		}

		self.filterByMood = function(){
			self.moodVal = self.moodInput.value;
			self.filterMusic();
			self.update();
		}


		self.filterMusic = function(){
			self.results = self.opts.music_data.filter(function(item){
				if(item.mood == self.moodVal || self.moodVal == 'all'){
					if(item.title.toLowerCase().indexOf(self.searchVal.toLowerCase()) != -1 || item.artist.toLowerCase().indexOf(self.searchVal.toLowerCase()) != -1){
						return true;
					}
				}
			})
		}
	</script>
</app>
