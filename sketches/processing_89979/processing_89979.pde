
//import peasy.*;

//PeasyCam cam;

PVector gravity;
PVector wind;
PVector friction;
PVector drag;

PVector origin;
Particle[] particles = new Particle[1500];

//PShader diffuseShader;

void setup()
{
	size(640, 480, P3D);
	smooth();

  //diffuseShader = loadShader("frag.glsl", "vert.glsl");

	origin = new PVector(width/2, height/2, 0);

	//cam = new PeasyCam(this, origin.x, origin.y+64, origin.z, 1024);

	for( int i = 0; i < particles.length; i++ ) {
		particles[i] = new Particle(random(0.1, width), 40.0, random(0.1, -512));
	}
}

void draw()
{
	background(16);

  //shader(diffuseShader);
	lights();

	for( int i = 0; i < particles.length; i++) {
	  	stroke(255);

		gravity = new PVector(0.0f, random(0.4, 1.8), 0.0f);
		gravity.mult(particles[i].m_mass);
		wind = new PVector(0.00, random(-2.1, -3.0), 0.0);
    friction = particles[i].m_velocity.get();

    float c = 0.05;
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);

    c = 0.03;
    float speed = particles[i].m_velocity.mag();
    float dragMag = c * speed * speed;
    PVector drag = particles[i].m_velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);

		particles[i].applyForce(gravity);
		particles[i].applyForce(wind);
		particles[i].applyForce(friction);
    particles[i].applyForce(drag);

		particles[i].update();
		particles[i].draw();
		particles[i].wallCollision();
	}
}

class Particle {
  PVector m_position;
  PVector m_velocity;
  PVector m_acceleration;

  float m_g;
  float m_mass;
  
  Particle(){}
  Particle(float x, float y, float z)
  {
    float m_g = 1;

  	m_position = new PVector(x, y, z);
  	m_velocity = new PVector(0.0f, 0.0f, 0.0f);
  	m_acceleration = new PVector(0.0f, 0.0f, 0.0f);

  	m_mass = random(3.0, 8.0);
  }

  void applyForce(PVector force)
  {
  	PVector forceEffect = PVector.div(force, m_mass);
  	m_acceleration.add(forceEffect);
  }

  PVector attract( Particle p)
  {
    PVector force = PVector.sub(m_position, p.m_position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();

    float strength = (m_g * m_mass * p.m_mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void wallCollision()
  {
  	if (( m_position.x + m_mass/2) > width) {
  		m_position.x = width - m_mass/2;
  		m_velocity.x *= -1;
  	} else if ( ( m_position.x - m_mass/2) < 0) {
  		m_velocity.x *= -1;
  		m_position.x = 0 + m_mass/2;
    }

  	if (( m_position.y + m_mass/2) > height) {
  		m_position.y = height - m_mass/2;
  		m_velocity.y *= -1;
  	} else if ( ( m_position.y - m_mass/2) < 0) {
  		m_velocity.y *= -1;
  		m_position.y = 0 + m_mass/2;
    }

  }
  void update()
  {
  	m_velocity.add(m_acceleration);
  	m_position.add(m_velocity);
  	m_acceleration.mult(0);
  }

  void draw()
  {
  	beginShape(POINTS);
  strokeWeight(m_mass);
  	
    vertex(m_position.x, m_position.y, m_position.z);
 	
  	endShape();
  }
}


