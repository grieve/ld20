package  
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	import org.flixel.*;
	
	public class Robot extends FlxSprite 
	{
		[Embed(source = "data/robot.png")] private var ROBOT_IMG:Class;
		private var leader:Player;
		private var map:FlxTilemap;
		private var panic:Boolean;
		private var canSeeLeader:Boolean;
		private var stay:Boolean;
		private var tired:Boolean;
		private var excited:Boolean;
		
		public var tilePath:FlxPath;
		
		public function Robot(dX:Number, dY:Number) 
		{
			super(dX, dY);
			loadGraphic(ROBOT_IMG, true, true, 32, 24);
			width = 24;
			height = 22;
			centerOffsets();
			maxVelocity.x = 160;
			maxVelocity.y = 400;
			acceleration.y = 400;
			drag.x = maxVelocity.x / 2;
			tilePath = new FlxPath();
		}
		
		public function init(player:Player, tilemap:FlxTilemap):void
		{
			leader = player;
			map = tilemap;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			canSeeLeader = map.ray(new FlxPoint(this.x, this.y), new FlxPoint(leader.x, leader.y));
			if (canSeeLeader)
			{
				if (leader.x + 50 > this.x > leader.x - 50)
					if (leader.y + 50 > this.y > leader.y - 50)
						panic = false;
				
				if (leader.x-50 > this.x)
				{
					acceleration.x = maxVelocity.x * 2;
				}
				if (leader.x+50 < this.x)
				{
					acceleration.x = -maxVelocity.x * 2;
				}
				if (leader.y+60 < this.y)
				{
					if (isTouching(FlxObject.FLOOR))
						velocity.y = -200;
				}
			}
		}
		
	}

}