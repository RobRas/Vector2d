class Test {
	public static function main() {
		var vect2d = new Vector2d(10, 15);
		trace('Vector2d: ' + vect2d.toString());
		trace('Length: ' + vect2d.length());
		trace('Normalized: ' + vect2d.normalize().toString());
		
		var vect2d2 = new Vector2d(1, 1);
		
		var Vect2d3 = Vector2d.add(vect2d, vect2d2);
		trace(Vect2d3.toString());
	}
}

class Vector2d {
	var x : Float;
	var y : Float;
	
	var _length : Float;
	var lengthUpdated : Bool = true;
	
	var _normalized : Vector2d;
	var normalizedUpdated : Bool = true;
	
	public function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}
	
	public function getX() : Float {
		return x;
	}
	
	public function getY() : Float {
		return y;
	}
	
	public function  setX(x:Float) : Void {
		if (this.x != x) {
			this.x = x;
			coordUpdated();
		}
	}
	
	public function  setY(y:Float) : Void {
		if (this.y != y) {
			this.y = y;
			coordUpdated();
		}
	}
	
	public function length() : Float {
		if (lengthUpdated) {
			_length = Math.sqrt(x * x + y * y);
			lengthUpdated = false;
		}
		
		return _length;
	}
	
	public function normalize() : Vector2d {
		if (normalizedUpdated) {
			var norm = new Vector2d(0, 0);
			var len = length();
			norm.x = x / len;
			norm.y = y / len;
			_normalized = norm;
		}
		
		return _normalized;
	}
	
	public static function add(lhs:Vector2d, rhs:Vector2d) : Vector2d {
		return new Vector2d(lhs.getX() + rhs.getX(), lhs.getY() + rhs.getY());
	}
	
	public static function subtract(lhs:Vector2d, rhs:Vector2d) : Vector2d {
		return new Vector2d(lhs.getX() - rhs.getX(), lhs.getY() - rhs.getY());
	}
	
	public static function distance(v1 : Vector2d, v2 : Vector2d) : Float {
		return Math.abs(v1.getX() - v2.getX()) + Math.abs(v1.getY() - v2.getY());
	}
	
	public function toString() {
		return 'x=$x, y=$y';
	}
	
	
	function coordUpdated() {
		lengthUpdated = true;
		normalizedUpdated = true;
	}
}