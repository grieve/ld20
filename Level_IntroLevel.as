//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	public class Level_IntroLevel extends ThisLevel
	{
		//Embedded media...
		[Embed(source="data/map/mapCSV_Tiles_Terrain.csv", mimeType="application/octet-stream")] public var CSV_TilesTerrain:Class;
		[Embed(source="data/terrain_tiles.png")] public var Img_TilesTerrain:Class;
		[Embed(source="data/map/mapCSV_Tiles_Water.csv", mimeType="application/octet-stream")] public var CSV_TilesWater:Class;
		[Embed(source="data/water_tiles.png")] public var Img_TilesWater:Class;

		//Tilemaps
		public var layerTilesTerrain:FlxTilemap;
		public var layerTilesWater:FlxTilemap;

		//Sprites
		public var SpritesCharactersGroup:FlxGroup = new FlxGroup;


		public function Level_IntroLevel(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerTilesTerrain = new FlxTilemap;
			layerTilesTerrain.loadMap( new CSV_TilesTerrain, Img_TilesTerrain, 32,32, FlxTilemap.OFF, 0, 1, 1 );
			layerTilesTerrain.x = 0.000000;
			layerTilesTerrain.y = 0.000000;
			layerTilesTerrain.scrollFactor.x = 1.000000;
			layerTilesTerrain.scrollFactor.y = 1.000000;
			layerTilesWater = new FlxTilemap;
			layerTilesWater.loadMap( new CSV_TilesWater, Img_TilesWater, 32,32, FlxTilemap.OFF, 0, 1, 1 );
			layerTilesWater.x = 0.000000;
			layerTilesWater.y = 0.000000;
			layerTilesWater.scrollFactor.x = 1.000000;
			layerTilesWater.scrollFactor.y = 1.000000;

			//Add layers to the master group in correct order.
			masterLayer.add(layerTilesTerrain);
			masterLayer.add(layerTilesWater);
			masterLayer.add(SpritesCharactersGroup);


			if ( addToStage )
			{
				addSpritesForLayerSpritesCharacters(onAddSpritesCallback);
				FlxG.state.add(masterLayer);
			}

			mainLayer = layerTilesTerrain;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 1600;
			boundsMaxY = 640;

		}

		override public function addSpritesForLayerSpritesCharacters(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Player, SpritesCharactersGroup , 63.000, 446.000, 0.000, false, 1, 1, onAddCallback );//"player"
			addSpriteToLayer(Robot, SpritesCharactersGroup , 994.000, 456.000, 0.000, false, 1, 1, onAddCallback );//"robot"
		}


	}
}
