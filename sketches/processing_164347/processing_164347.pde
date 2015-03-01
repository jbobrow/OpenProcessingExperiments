
import java.util.Iterator;

float grav;
FixedPoint origin;
ArrayList<Orbiter> orbiters;

void setup(){
	size(720,640);
	grav = 20;
	origin = new FixedPoint(new PVector(width/2,height/2));
	orbiters = new ArrayList<Orbiter>();
}

void draw(){
	background(255);
	Iterator <Orbiter> it = orbiters.iterator();
	while (it.hasNext()){
		Orbiter wut = it.next();
		wut.run();
	}
}

void mousePressed() {
	orbiters.add(new Orbiter(new PVector(mouseX,mouseY)));
}
class FixedPoint{
	PVector location;

	FixedPoint(PVector l){
		location = l.get();
	}
}
class Orbiter{
	float diam;
	PVector velocity;
	PVector location;
	PVector accel;

	Orbiter(PVector l){
		location 	= l.get();
		velocity = new PVector(0,4);
		diam		= 20;
	}

	void run(){
		update();
		display();
	}

	void update(){
		accel = new PVector(0,0);
		//asdf - replace this with with accel.mag
		float distance = PVector.dist(location,origin.location);
		PVector accel = PVector.sub(origin.location,location);
		accel.normalize();
		float accelMag = grav/(10+distance);
		accel.mult((float) accelMag);
		velocity.add(accel);
		//velocity.limit(10);
		location.add(velocity);
	}

	void display(){
		fill(20);
		ellipse(location.x,location.y,diam,diam);
	}
}


