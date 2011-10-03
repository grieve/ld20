package

{

	import org.flixel.*;

	[SWF(width="700", height="500", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]



	public class takethis extends FlxGame

	{

		public function takethis()

		{

			super(350,250,PlayState,2, 60, 60);
			forceDebugger = true;
		}

	}

}

