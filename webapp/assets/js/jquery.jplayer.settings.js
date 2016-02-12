<!--
$(function(){
	var playItem = 0,
		title=$('.jp-interface .jp-title'),
		jPlayer=$("#jplayer"),
		myPlayList = [
			{name:"Happy Together",mp3:"assets/audio/HAPPY TOGETHER.mp3", ogg:"assets/audio/HAPPY TOGETHER.ogg"},
			{name:"Virtual Riot Energy+Drink",mp3:"assets/audio/VirtualRiotEnergyDrink.mp3" ,ogg:"assets/audio/VirtualRiotEnergyDrink.ogg"},
			{name:"Black Plant",mp3:"assets/audio/black_plant.mp3",ogg:"assets/audio/black_plant.ogg"},
			{name:"Hidden",mp3:"assets/audio/hidden.mp3",ogg:"assets/audio/hidden.ogg"},
			{name:"The Separation",mp3:"assets/audio/separation.mp3",ogg:"assets/audio/separation.ogg"}
		],		
		jPlay=function(idx){
			if(typeof idx==typeof 0)
				jPlayer.jPlayer("setMedia",myPlayList[idx]).jPlayer('play')
			if(typeof idx==typeof '')
				jPlayer.jPlayer("setMedia",myPlayList[playItem=idx=='next'?(++playItem<myPlayList.length?playItem:0):(--playItem>=0?playItem:myPlayList.length-1)]).jPlayer('play')					
			title.text(myPlayList[playItem].name)
			Cufon.refresh()
		}

	jPlayer.jPlayer({
		ready: function() {
			jPlay(playItem)
		},
		ended:function(){
			jPlay('next')
		}
	})
	
	$(".jp-prev,.jp-next")
		.click( function() { 
			jPlay($(this).is('.jp-next')?'next':'prev')
			return false;
		})
	
});
-->