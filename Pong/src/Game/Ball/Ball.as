package Game.Ball 
{
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Collin Loot
	 */
	public class Ball extends Sprite
	{
		public var dir:Vector3D;
		
		private var ballArt:BallArt;
		
		public function Ball(x:int, y:int) 
		{
			dir  = new Vector3D(20, 0, 0);
			ballArt = new BallArt();
			ballArt.scaleX = 0.25;
			ballArt.scaleY = 0.25;
			this.x = x;
			this.y = y;
			addChild(ballArt);
		}
		
		public function update():void
		{
			this.x += dir.x;
			this.y += dir.y;
		}
		
	}

}