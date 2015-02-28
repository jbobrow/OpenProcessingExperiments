
ArrayList particles;
void setup(){
	size(400, 400, P2D);
	colorMode(HSB,100);
	noStroke();
	background(100);
	particles = new ArrayList();
	smooth();
}

void draw(){
	fill(100, 50);
	rect(0,0,width, height);
	for(Iterator it = particles.iterator(); it.hasNext();){
		Particle p = (Particle)it.next();
		p.draw();
		if(p.ISDEAD){
			it.remove();
		}
	}
	if(mousePressed){
		PVector loc = new PVector(mouseX, mouseY);
		PVector vel = new PVector(mouseX - pmouseX, mouseY -pmouseY);
		color c = color(map(mouseX, 0, width, 0, 100),
						map(mouseY, 0, height, 0, 100),
						50);
		Particle particle = new Particle(loc, vel, c, random(30, 50));
		particles.add(particle);
	}
}


class Particle{
	PVector loc;
	PVector vel;
	color col;
	float diameter;
	float radius;
	boolean ISDEAD;
	int age;

	Particle(PVector l, PVector v, color c, float d){
		loc = l;
		vel = PVector.add(PVector.div(v,2), new PVector(random(-3,3), random(-3, 3)));
		col = c;
		diameter = d;
		radius = d/2;
		ISDEAD = false;
		age = (int)random(20, 60);
	}

	void draw(){
		move();
		display();
		if(age <= 0){
			ISDEAD = true;
		}
	}

	void move(){
		loc.add(vel);
		age -= 1;
	}

	void display(){
		fill(col, map(age, 0,100, 0, 100) );
		ellipse(loc.x, loc.y, radius, radius);
	}
}
		

