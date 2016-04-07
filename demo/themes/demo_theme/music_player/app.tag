<app>

	<input size="38"  type="text" name="searchInput" placeholder="Search Music" value='{this.searchVal}' onchange="{filterBySearch}" onkeyup="{filterBySearch}">
	
	<select value={moodVal} name="moodInput" onchange="{filterByMood}">
		<option value="all">All Moods</option>
		<option value="Thinking of bae">Thinking of Bae</option>
		<option value="Workout">Workout</option>
		<option value="Lizard">Lizard</option>
		<option value="Melancholy">Melancholy</option>
	</select>

	<button if={shouldShowResetFilters()} onClick={resetFilters}>Reset Filters</button>

	<song each="{results}" artist="{artist}" title="{title}" linkedtitle="{linkedtitle}" embed="{embed}" nid="{nid}" mood="{mood}" cta="{url}"></song>

	<script>
		var self = this;//hoist a reference of this
		self.results = [];//initiate empty array for track results
		self.searchVal = '';//default search query
		self.moodVal = 'all';//defaulf mood query

		self.on('mount',function(){//when the app mounts,
			self.results = self.filterMusic();//filter the music and put it in the results array
			self.update();//update the app
		});

		self.filterBySearch = function(){
			self.searchVal = self.searchInput.value;//value of the search input
			self.results = self.filterMusic();//filter the music and put it in the results array
			self.update();//update the app
		}

		self.filterByMood = function(){
			self.moodVal = self.moodInput.value;//value of the mood input
			self.results = self.filterMusic();//filter the music and put it in the results array
			self.update();//update the app
		}


		//iterate through the music props passed at the time of mount. Filter by two criteria, search and mood. If the mood is equal to the mood value set by the mood filter or equal to 'all' - and the search query matches anywhere in the artist or title string, then return it.
		self.filterMusic = function(){
			return self.opts.music_data.filter(function(item){
				if(item.mood == self.moodVal || self.moodVal == 'all'){
					if(item.title.toLowerCase().indexOf(self.searchVal.toLowerCase()) != -1 || item.artist.toLowerCase().indexOf(self.searchVal.toLowerCase()) != -1){
						return true;
					}
				}
			})
		}

		self.shouldShowResetFilters = function(){
			console.log(self.moodVal != 'all',self.searchVal != '');
			return (self.moodVal != 'all') || (self.searchVal != '');
		}

		self.resetFilters = function(){
			self.searchVal = '';//reset the value of the search input
			self.moodVal = 'all';//reset value of the mood input
			self.results = self.filterMusic();//filter the music and put it in the results array
			self.update();//update the app
		}

	</script>
</app>
