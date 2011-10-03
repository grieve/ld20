package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import com.flashdynamix.utils.SWFProfiler;
	import com.rushthefence.takethis.TestWorld;

	/**
	 * ...
	 * @author Ryan Grieve
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine
	{

		public function Main():void 
		{
			super(700, 500, 30, false);
			if (stage) ready();
			else addEventListener(Event.ADDED_TO_STAGE, ready);
		}

		private function ready(e:Event = null):void 
		{
			SWFProfiler.init(FP.stage, this);
			removeEventListener(Event.ADDED_TO_STAGE, ready);
			FP.world = new TestWorld();
		}

	}

}