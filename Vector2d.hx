class Test {
	static public function main() {
		var vect2d = new Vector2d(10, 15);
		trace('Vector2d: ' + vect2d.toString());
		trace('Length: ' + vect2d.length);
		trace('Normalized: ' + vect2d.normalize().toString());
	}
}

class Vector2d {
	var x : Float;
	var y : Float;
	
	var length : Float;
	var lengthUpdated : Bool = false;
	
	var normalized : Vector2d;
	var normalizedUpdated : Bool = false;
	
	public function new() {
		x = 0;
		y = 0;
	}
	
	public function getX() : Float {
		return x;
	}
	
	public function getY() : Float {
		return y;
	}
	
	public function  setX(float x) : Void {
		if (this.x != x) {
			this.x = x;
			coordUpdated();
		}
	}
	
	public function  setY(float y) : Void {
		if (this.y != y) {
			this.y = y;
			coordUpdated();
		}
	}
	
	public function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}
	
	public function length() : Float {
		if (lengthUpdated) {
			length = Math.sqrt(x * x + y * y);
			lengthUpdated = false;
		}
		
		return length;
	}
	
	public function normalize() : Void {
		if (normalizedUpdated) {
			var norm = new Vector2d();
			var len = length();
			norm.x = x / len;
			norm.y = y / len;
			normalized = norm;
		}
		
		return normalized;
	}
	
	public function toString() {
		return 'x=$x, y=$y';
	}
	
	function coordUpdated() {
		lengthUpdated = true;
		normalizedUpdated = true;
	}
}