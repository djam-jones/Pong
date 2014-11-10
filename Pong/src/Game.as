package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Djamali
	 */
	public class Game extends Sprite{
		
		private var paddlePlayer:Player;
		private var paddleCPU:MovieClip;
		private var ball:MovieClip;
		
		public function Game() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			//addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			paddlePlayer = new Player();
			addChild(paddlePlayer);
			paddlePlayer.x = 50;
			paddlePlayer.y = stage.stageHeight/2;
			
			paddleCPU = new Paddle();
			addChild(paddleCPU);
			paddleCPU.x = 750;
			paddleCPU.y = stage.stageHeight/2;
			
			ball = new Ball();
			addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
		}
	}
}