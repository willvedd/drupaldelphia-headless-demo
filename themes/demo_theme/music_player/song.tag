<song>
	<div>
		<h1 style="display:inline"><raw content="{ this.opts.linkedtitle }"/></h1> - 
		<h2 style="display:inline">{this.opts.artist}</h2>
	</div>
	<div>
		<raw if="{!showPlayer}" content="{ embedCode }"/>
	</div>
	<button onClick={togglePlayer}>Toggle Player</button>
	<hr>

	<script>
		var self = this;
		self.showPlayer = false;


		function htmlDecode( html ) {
		    var a = document.createElement( 'a' ); a.innerHTML = html;
		    return a.textContent;
		};

		self.embedCode = htmlDecode(self.opts.embed);

		self.togglePlayer = function(){
			self.showPlayer = !self.showPlayer;
			self.update();
		}

	</script>
</song>
