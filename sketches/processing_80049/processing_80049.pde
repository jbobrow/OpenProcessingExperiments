
ArrayList<Particle> particles;
int amount;


void setup(){
	
	size(600, 1000);	
	//smooth();


	fill(180);
	noStroke();

	frameRate(25);


	particles = new ArrayList<Particle>();

	amount = 800;




}

void draw(){
	background(0);
	

	for (int x = 0; x<particles.size(); x++){

		particles.get(x).simulate();
		particles.get(x).draw();	
	}

}



void mouseReleased(){
	for (int x = 0; x<amount; x++){
		Particle p = new Particle();
		particles.add(p);

		p.init( int(random(width)) , int(random(height)) , random(20,100) );
	}

	
	for (int x = 0; x<amount; x++){

		particles.get(x).particleExplode();

	}

}
class Particle  {

	PVector position;
	PVector velocity;
	PVector acceleration;

	Particle() {
		position = new PVector(mouseX, mouseY);
		velocity = new PVector(0, 0);
		acceleration = new PVector(random(-0.2,0.2), random(-0.2,0.2));
	}


	void init(int _positionx, int _positiony,float _velocity) {

		//this.position.set(_positionx,_positiony,0);
		//this.velocity.set(0,_velocity,0);
	}


	void simulate() {
		velocity.add(acceleration);
		position.add(velocity);

		if(position.y > height) {
			position.y = mouseY;
			position.x = mouseX;
			velocity.x = 0;
		}
	}


	void draw() {
		fill(255*norm(velocity.mag(), 0, 20));
		ellipse(position.x, position.y, 3, 3);
	}

	void particleExplode() {
		velocity.x = random(-30,30);
	}

	void reset() {

	}
}


