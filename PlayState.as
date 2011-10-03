package
{

	import flash.display.Shape;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		
		//public var level:FlxTilemap;
		//[Embed(source = "data/terrain_tiles.png")] private var TERRAIN_TILES:Class;
		//[Embed(source="data/map/test_level.csv", mimeType="application/octet-stream")] public var TEST_LEVEL:Class;
		public var currentLevel:Level_IntroLevel;
		public var player:Player;
		public var robot:Robot;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaba9a9;
			//level = new FlxTilemap();
			//level.loadMap(new TEST_LEVEL(), TERRAIN_TILES,  32, 32, FlxTilemap.OFF, 0, 1, 5);
			//add(level);
			//Create player (a red box)
			currentLevel = new Level_IntroLevel(true, spriteAdded);
			robot.init(player, currentLevel.mainLayer);
			updateThreats();
			FlxG.worldBounds = new FlxRect(currentLevel.boundsMinX, currentLevel.boundsMinY, currentLevel.boundsMaxX, currentLevel.boundsMaxY); 
			FlxG.camera.setBounds(currentLevel.boundsMinX, currentLevel.boundsMinY, currentLevel.boundsMaxX, currentLevel.boundsMaxY);
		}	
		override public function update():void
		{
			super.update();
			FlxG.collide(currentLevel.mainLayer,player);
			FlxG.collide(currentLevel.mainLayer,robot);
			FlxG.collide(robot, player);
			robot.tilePath = currentLevel.mainLayer.findPath(new FlxPoint(robot.x, robot.y), new FlxPoint(player.x, player.y));
			
            var drawShape:Shape = new Shape();
            drawShape.graphics.lineStyle(1, 0x999999);
			drawShape.graphics.moveTo(robot.tilePath.head().x, robot.tilePath.head().y);
			for (var x:Number = 1; x < robot.tilePath.nodes.length; x++)
			{
				drawShape.graphics.lineTo(robot.tilePath.nodes[x].x, robot.tilePath.nodes[x].y);
			}
			FlxG.flashGfxSprite.addChild(drawShape);
		}
		public function updateThreats():void
		{
			//var waterTiles:Array = currentLevel.layerTilesWater.getTileCoords(
		}
 		
		protected function spriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
			trace(sprite);
			if (sprite is Player)
			{
				player = sprite as Player;
				FlxG.camera.follow(player);
			}
			if (sprite is Robot)
			{
				robot = sprite as Robot;
			}
		}

		
	}
}	

