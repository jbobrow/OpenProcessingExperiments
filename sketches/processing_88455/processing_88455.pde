
ParticleController particle_controller;
float rot = 0.001;


void setup()
{
	size(1280, 720, P2D);
	particle_controller = new ParticleController();
	particle_controller.addParticles( 10000 );
}

void draw()
{
	pushMatrix();
	translate(width/2, height/2);
	rotate(radians(rot));
	background(0);
	particle_controller.update();
	particle_controller.draw();
	popMatrix();

	rot++;
}

class Particle {
	PVector m_position;
	PVector m_direction;
	float m_velocity;
	float m_radius;

	Particle(){}
	Particle( PVector position )
	{
		m_position = position;
		m_direction = new PVector( random(-180, 180), random(-180, 180) );
		m_velocity = random( 1.1f );
		m_radius = random(20.0f);
	}

	void update()
	{
		m_direction.mult(m_velocity);
		m_position = m_direction;
	}

	void draw()
	{
		pushStyle();
		  noStroke();
		  fill(color(map(m_radius, 0, 20, 32, 255)));
		  ellipse(m_position.x, m_position.y, m_radius, m_radius);
		popStyle();
	}
}

class ParticleController {
	ArrayList<Particle> mParticles = new ArrayList();

	ParticleController(){}

	void update()
	{
		for(Particle p : mParticles) {
			p.update();
		}
	}
	void draw()
	{
		for(Particle p : mParticles) {
			p.draw();
		}
	}

	void addParticles( int amt )
	{
		for( int i = 0; i < amt; i++ ) {
			float x = random(width);
			float y = random(height);

			PVector pv = new PVector(x, y);
			Particle p = new Particle(pv);

			mParticles.add(0, p);
		}
	}
	void removeParticles(){}
}


