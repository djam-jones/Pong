package Game 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Game.Ball.Ball;
	import Game.Player.Player;
	/**
	 * ...
	 * @author Collin Loot
	 */
	public class Game extends Sprite
	{
		private var _stage:Stage;
		private var walls:Vector.<MovieClip>;
		private var engine:Engine;
		
		private var player1:Player;
		private var player2:Player;
		
		private var balls:Vector.<Ball>;
		
		public function Game(s:Stage) 
		{
			_stage = s;
			walls = new Vector.<MovieClip>;
			engine = new Engine();
			balls = new Vector.<Ball>;
			startGame();
		}
		
		private function startGame(e:Event = null):void
		{
			var wall1:MovieClip = new BoundingBox();
			var wall2:MovieClip = new BoundingBox();
			wall2.y = _stage.stageHeight - wall1.height;
			addChild(wall1);
			addChild(wall2);
			walls.push(wall1, wall2);
			
			player1 = new Player(87, 83, 50);
			player2 = new Player(38, 40, 750);
			addChild(player1);
			addChild(player2);
			
			var newball:Ball = new Ball(400, 300);
			addChild(newball);
			balls.push(newball);
			
			
			addEventListener(Event.ENTER_FRAME, update);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function update(e:Event):void
		{	
			engine.checkCollision(walls, player1, player2, balls);
			
			engine.update(player1, player2, balls);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (player1)
			{
				player1.onKeyDown(e);
			}
			if (player2)
			{
				player2.onKeyDown(e);
			}
			if (e.keyCode == 32) balls[0].x = balls[0].y = 400;
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (player1)
			{
				player1.onKeyUp(e);
			}
			if (player2)
			{
				player2.onKeyUp(e);
			}
		}
	}

}