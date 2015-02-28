
class Circle {

	Body body;
	PBox2D box2d;
	int radius;
	PImage refImage;

	Circle(PBox2D _box2d, float x, float y, int _radius, PImage image) {
		radius = _radius;
		this.box2d = _box2d;
		makeBody(box2d, x, y);
		refImage = image;
	}
	
	void makeBody(PBox2D box2d, float x, float y) {
		BodyDef bd = new BodyDef();
		bd.position = box2d.screenToWorld(x, y);
		body = box2d.world.createBody(bd);

		// create circular shape
		CircleDef cd = new CircleDef();
		cd.radius = box2d.scaleScreenToWorld(radius);
		cd.density = 1;
		cd.friction = 0.5f;
		cd.restitution = 0.2f;
		body.createShape(cd);

		body.setMassFromShapes();
		// random angular velocity
		body.setAngularVelocity((float) (Math.random() * 5 - 2.5));
	}
	
	void display(){
	    Vec2 pos = box2d.getScreenPos(body);
	    float angle = body.getAngle();	    
	    pushMatrix();
	    translate(pos.x, pos.y);
	    rotate(angle);
	    image(refImage, -radius, -radius);
	    noFill();
	    noStroke();
	    ellipse(0,0, 2* radius,2*radius);
	    popMatrix();
	}
}


