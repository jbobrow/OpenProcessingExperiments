
int PARTICLES_COUNT = 10000;
ArrayList particles;

void setup(){
	size(600, 400);
	particles = new ArrayList();
	for(int i = 0; i < PARTICLES_COUNT; i++){
		particles.add(new Particle(new PVector(random(width), random(height)),
								   new PVector(0, 0),
								   new PVector(0, 0),
								   100
								   ));
	}
	background(0);
}

void draw(){
	fill(0);
	rect(0, 0, width, height);

	for(Iterator it = particles.iterator(); it.hasNext();){
		Particle p = (Particle)it.next();
		p.draw();
	}
	
	if(mousePressed){
		for(Iterator it = particles.iterator(); it.hasNext();){
			Particle p = (Particle)it.next();
			p.attraction();
		}
	}else{
		for(Iterator it = particles.iterator(); it.hasNext();){
			Particle p = (Particle)it.next();
			p.acceleration.set(0,0,0);
		}	
	}
}

		


class Particle{
	PVector location;
	PVector velocity;
	PVector acceleration;
	float gravisphere;


	Particle(PVector l, PVector v, PVector a, float g){
		location = l;
		velocity = v;
		acceleration = a;
		gravisphere = g;
	}

	void draw(){
		move();
		display();
	}

	void move(){
		velocity.add(acceleration);
		velocity.limit(15);
		location.add(velocity);
		if(acceleration.mag() == 0){
			velocity.x *= 0.95;
			velocity.y *= 0.95;
		}
	}

	void display(){
		stroke(255);
		point(location.x, location.y);
	}
	
	void attraction(){
		PVector mouse = new PVector(mouseX, mouseY);
		float dist = mouse.dist(location);
		if(dist <= gravisphere){
			PVector dir = PVector.sub(mouse, location);
			dir.normalize();
			dir.mult((gravisphere - dist) * 0.01);
			acceleration = dir;
		}else{
			acceleration.set(0,0,0);
		}
	}
}

