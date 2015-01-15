class Test {
	public static function main() {
		var vect2d = new Vector2d(10, 15);
		trace('vect2d: ' + vect2d.toString());
		trace('Magnitude: ' + vect2d.magnitude());
		trace('Normalized: ' + vect2d.normalize().toString());
		
		var vect2d2 = new Vector2d(1, 1);
		trace('vect2d2: ' + vect2d.toString());
		
		trace('Distance: ' + Vector2d.distance(vect2d, vect2d2));
		
		var Vect2d3 = Vector2d.add(vect2d, vect2d2);
		trace('Added together: ' + Vect2d3.toString());
	}
}

class Vector2d {
	var x : Float;
	var y : Float;
	
	var _magnitude : Float;
	var magnitudeUpdated : Bool = true;
	
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
	
	public function magnitude() : Float {
		if (magnitudeUpdated) {
			_magnitude = Math.sqrt(x * x + y * y);
			magnitudeUpdated = false;
		}
		
		return _magnitude;
	}
	
	public function normalize() : Vector2d {
		if (normalizedUpdated) {
			var norm = new Vector2d(0, 0);
			var mag = magnitude();
			norm.x = x / mag;
			norm.y = y / mag;
			_normalized = norm;
			normalizedUpdated = false;
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
		magnitudeUpdated = true;
		normalizedUpdated = true;
	}
}