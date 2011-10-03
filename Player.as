package  
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	import org.flixel.*;
	
	public class Player extends FlxSprite 
	{
		[Embed(source = "data/player.png")] private var PLAYER_IMG:Class;
		public function Player(dX:Number, dY:Number) 
		{
			super(dX, dY);
			loadGraphic(PLAYER_IMG, true, true, 32, 32);
			width = 22;
			height = 30;
			centerOffsets();
			maxVelocity.x = 120;
			maxVelocity.y = 400;
			acceleration.y = 400;
			drag.x = maxVelocity.x / 2;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
				
			if (FlxG.keys.LEFT)
				if(isTouching(FlxObject.FLOOR))
					acceleration.x = -maxVelocity.x * 4;
				else	
					acceleration.x = -maxVelocity.x / 2 ;
			if (FlxG.keys.RIGHT)
				if(isTouching(FlxObject.FLOOR))
					acceleration.x = maxVelocity.x * 4;	
				else	
					acceleration.x = maxVelocity.x / 2;
			if(FlxG.keys.SPACE && isTouching(FlxObject.FLOOR))
				velocity.y = -200;
		}
		
	}

}