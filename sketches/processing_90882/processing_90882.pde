
ArrayList<Particle> particles;
Particle bigboy;

float t = 0;

void setup()
{
	size(1280, 720, P3D);
	smooth();

	particles = new ArrayList<Particle>();

	bigboy = new Particle(new PVector(width/2, height/2, 0.0f));
	bigboy.setMass(500);

	for ( int x = 0; x < width; x+=23 ) {
		for (int y = 0; y < height; y+=23) {
			Particle p = new Particle(new PVector(random(width), random(height), 0.0f));
			p.friction = true;
			p.drag =true;
			p.gravity = true;
			p.setMass(random(1, 5));
			p.drawSize = p.mass;
			particles.add(p);
		}
	}
}

void draw()
{
	background(16);
	stroke(165);

	bigboy.setPosition(mouseX, mouseY, 0.0f);
	bigboy.update();
	bigboy.draw();

	for ( int i = 0; i < particles.size(); i++ ) {
		Particle p = particles.get(i);
		if(mousePressed == true){
			p._attract( bigboy );
		}
		p.update();
		p.draw();

	}

	t += 0.0001;
}
class Emitter {

	public Emitter(){}

	public void update()
	{
	}

	public void draw()
	{
	}
}
class Particle {
	public float   drawSize;
	public boolean gravity;
	public boolean friction;
	public boolean drag;
	public boolean screenCollision;

	public PVector position;
	public float   mass;

	public float FRICTION_COEFFICIENT;
	public float DRAG_COEFFICIENT;
	public float MASS_EFFECT;
	public float ATTRACTION_FORCE;

	private float   m_mass;
	private PVector m_position;
	private PVector m_velocity;
	private PVector m_acceleration;

	public Particle(){}

	public Particle(PVector pos)
	{
		m_position = pos;
		m_velocity = new PVector(0.0f, 0.0f, 0.0f);
		m_acceleration = new PVector(0.0f, 0.0f, 0.0f);

		position = m_position.get();

		m_mass = 1.0f;
		drawSize = m_mass;

		mass = m_mass;

		gravity = false;
		friction = false;
		drag = false;
		screenCollision = true;

		// set the environment constant defaults
		FRICTION_COEFFICIENT = 0.005f;
		DRAG_COEFFICIENT = 0.0015f;
		MASS_EFFECT = 0.025f;
		ATTRACTION_FORCE = 0.4f;
	}

	private void _attract( Particle p )
	{
		PVector applied_attraction = PVector.sub(m_position, p.position);
		float distance = applied_attraction.mag();
		distance = constrain(distance, 10.0f, 15.0f);
		applied_attraction.normalize();
		float strength = (ATTRACTION_FORCE * m_mass * p.mass) / (distance * distance);
		applied_attraction.mult(strength);
		m_acceleration.sub(applied_attraction);
	}

	private void _repulse( Particle p )
	{
		PVector applied_attraction = PVector.sub(m_position, p.position);
		float distance = applied_attraction.mag();
		distance = constrain(distance, 5.0f, 50.0f);
		applied_attraction.normalize();
		float strength = (ATTRACTION_FORCE * m_mass * p.mass) / (distance * distance);
		applied_attraction.mult(strength);
		m_acceleration.add(applied_attraction);
	}

	private void _drag()
	{
		PVector drag = m_velocity.get();
		float speed = m_velocity.mag();
		float dragMagnitude = DRAG_COEFFICIENT * speed * speed;
		drag.mult(-1);
		drag.normalize();
		drag.mult(dragMagnitude);
		m_acceleration.add(drag);
	}

	private void _friction()
	{
		PVector friction = m_velocity.get();
		friction.mult( -1 );
		friction.normalize();
		friction.mult(FRICTION_COEFFICIENT);
		m_acceleration.add(friction);
	}

	private void _gravity( float m )
	{
		PVector gravity = new PVector(0.0f, 9.8f * MASS_EFFECT * m_mass, 0.0f);
		gravity.mult(m);
		PVector applied_gravity = PVector.div(gravity, m);
		m_acceleration.add(applied_gravity);
	}

	private void _screenCollision()
	{
	  	if (( m_position.x + drawSize/2) > width) {
	  		m_position.x = width - drawSize/2;
	  		m_velocity.x *= -1;
	  	} else if ( ( m_position.x - drawSize/2) < 0) {
	  		m_velocity.x *= -1;
	  		m_position.x = 0 + drawSize/2;
	    }

	  	if (( m_position.y + drawSize/2) > height) {
	  		m_position.y = height - drawSize/2;
	  		m_velocity.y *= -1;
	  	} else if ( ( m_position.y - drawSize/2) < 0) {
	  		m_velocity.y *= -1;
	  		m_position.y = 0 + drawSize/2;
	    }
	}

	public void setPosition(float _x, float _y, float _z)
	{
		gravity = false;
		friction = false;
		drag = false;

		m_position = new PVector(_x, _y, _z);
	}

	public void setAcceleration(float _x, float _y, float _z)
	{
		m_acceleration.x = _x;
		m_acceleration.y = _y;
		m_acceleration.z = _z;
	}

	public void setVelocity(float _x, float _y, float _z)
	{
		m_velocity.x = _x;
		m_velocity.y = _y;
		m_velocity.z = _z;
	}

	public void setMass(float m)
	{
		m_mass = m;
		mass = m_mass;
	}

	public void collision()
	{
		if ( screenCollision == true ) _screenCollision();
	}

	public void update()
	{
		// apply force
		if ( gravity == true ) _gravity(m_mass);
		if ( friction == true ) _friction();
		if ( drag == true) _drag();

		// calculate velocity
		m_velocity.add(m_acceleration);
		m_position.add(m_velocity);

		// reset acceleration
		m_acceleration.mult(0);

		// publish position
		position = m_position.get();

		// publish mass
		mass = m_mass;
	}

	public void draw()
	{
		beginShape(POINTS);
		  strokeWeight(drawSize);
		  vertex(m_position.x, m_position.y, m_position.z);
		endShape();

		collision();
	}
}


