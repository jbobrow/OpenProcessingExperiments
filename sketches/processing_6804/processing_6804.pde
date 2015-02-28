
	static final int MAX_NUM_PARTICLES = 400;
	Particle[] particles = new Particle[MAX_NUM_PARTICLES];

	private float v = (float) 0.1;

	static final double GRAVITY = 0.0015;
	static final float BOUNCE_DAMPENING = (float) 0.03;

	private int numberOfInstances = 70;
	private float radius = 15;

	private boolean grav = false;

	void setup() {

		size(800, 600);
		frameRate(50);

		for (int i = 0; i < MAX_NUM_PARTICLES; i++) {
			float x = random(0, width);
			float y = random(0, height);
			particles[i] = new Particle(x, y, radius);
			particles[i].charge = (float) 0.5;
		}

		smooth();

		strokeWeight(1);
		stroke(0);
//		noStroke();
	}

	public void draw() {
		particles[0].charge = 0;
		particles[1].charge = 1;
		updateParticles();

		background(127);

		for (int i = 0; i < numberOfInstances; i++) {
			float ladung = particles[i].charge;
			fill((int) (128 + (ladung - 0.5) * 256),128,
					(int) (128 - (ladung - 0.5) * 256));
			int d = parseInt(particles[i].radius * 2);
			ellipse((float) particles[i].posX, (float) particles[i].posY, d, d);
		}

		fill(255);
	}

	public void keyPressed() {
		if (keyPressed) {
			if (key == 'g' || key == 'G') {
				grav = !grav;
			}

			if (key == '+' && numberOfInstances < MAX_NUM_PARTICLES) {
				numberOfInstances++;
			}
			if (key == '-' && numberOfInstances > 1) {
				numberOfInstances--;
			}
		}
	}

	private void updateParticles() {
		for (int i = 0; i < numberOfInstances; i++) {
			Particle particle = particles[i];

			// bounce off bottom
			if (particle.posY > height - particle.radius) {
				particle.vY = -abs(particle.vY) * (1 - BOUNCE_DAMPENING);
				particle.posY = height - particle.radius;
			}

			// bounce off ceiling
			if (particle.posY < particle.radius) {
				particle.vY = abs(particle.vY) * (1 - BOUNCE_DAMPENING);
				particle.posY = particle.radius;
			}

			// bounce off left border
			if (particle.posX < particle.radius) {
				particle.vX = abs(particle.vX) * (1 - BOUNCE_DAMPENING);
				particle.posX = particle.radius;
			}

			// bounce off right border
			if (particle.posX > width - particle.radius) {
				particle.vX = -abs(particle.vX) * (1 - BOUNCE_DAMPENING);
				particle.posX = width - particle.radius;
			}

			// apply interactive gravity
			applyMouseGravity(particle);

			// inter particle
			for (int j = i+1; j < numberOfInstances; j++) {

				// bounce
				particles[i].applyElectroStaticForce(particles[j]);
				particles[i].bounce(particles[j]);
			}

			// apply Gravity
			if (grav) {
				particle.vY += GRAVITY * 0.1 * v;
			}


			// move it
			particle.tick();
		}

	}

	private void applyMouseGravity(Particle particle) {
		if (mousePressed) {
			float d = sqrt(pow(particle.posX - mouseX, 2)
					+ pow(particle.posY - mouseY, 2))
					* (float) 2.0;
			float ang = atan2(particle.posX - mouseX, particle.posY - mouseY);
			float F = (float) 24 * v;
			if (mouseButton == RIGHT) {
				F = -F;
			}

			particle.vX += sin(ang) * F;
			particle.vY += cos(ang) * F;
		}
	}

	class Particle {

		float posX;
		float posY;

		float vX = 0;
		float vY = 0;

		float radius;

		float charge = 0;

		public Particle(float x, float y, float r) {
			posX = x;
			posY = y;
			radius = r;
		}

		public float getVelocity() {
			return sqrt(vX * vX + vY * vY);
		}

		public float getMotionDirection() {
			return atan2(vX, vY);
		}

		public void tick() {
			posX += vX * v;
			posY += vY * v;
		}
		
		public void applyElectroStaticForce(Particle theOtherParticle){
			float d = sqrt(pow((float) (theOtherParticle.posX - posX), 2)
					+ pow((float) (theOtherParticle.posY - posY), 2))*((float)0.8);
			
			float v = (float) 127/(d*d);
			v*= (charge-0.5)*(theOtherParticle.charge-0.5);
			
			float dx = (theOtherParticle.posX - posX);
			float dy = (theOtherParticle.posY - posY);
			
			dx *= v;
			dy *= v;
			
			vX -= dx;
			vY -= dy;
			theOtherParticle.vX += dx;
			theOtherParticle.vY += dy;
		}

		public void bounce(Particle theOtherParticle) {
			if (hit(theOtherParticle)) {
				charge = (float) ((charge + theOtherParticle.charge)*0.5);
				theOtherParticle.charge = charge;
				float commonTangentAngle = atan2(
						(float) (posX - theOtherParticle.posX),
						(float) (posY - theOtherParticle.posY))
						+ asin(1);

				float v1 = theOtherParticle.getVelocity();
				float v2 = getVelocity();
				float w1 = theOtherParticle.getMotionDirection();
				float w2 = getMotionDirection();

				theOtherParticle.vX = sin(commonTangentAngle) * v1
						* cos(w1 - commonTangentAngle)
						+ cos(commonTangentAngle) * v2
						* sin(w2 - commonTangentAngle);
				theOtherParticle.vY = cos(commonTangentAngle) * v1
						* cos(w1 - commonTangentAngle)
						- sin(commonTangentAngle) * v2
						* sin(w2 - commonTangentAngle);
				vX = sin(commonTangentAngle) * v2
						* cos(w2 - commonTangentAngle)
						+ cos(commonTangentAngle) * v1
						* sin(w1 - commonTangentAngle);
				vY = cos(commonTangentAngle) * v2
						* cos(w2 - commonTangentAngle)
						- sin(commonTangentAngle) * v1
						* sin(w1 - commonTangentAngle);

				theOtherParticle.vX *= (1 - BOUNCE_DAMPENING);
				theOtherParticle.vY *= (1 - BOUNCE_DAMPENING);
				vX *= (1 - BOUNCE_DAMPENING);
				vY *= (1 - BOUNCE_DAMPENING);

			}
		}

		private boolean hit(Particle theOtherParticle) {
			return (sqrt(pow((float) (theOtherParticle.posX - posX), 2)
					+ pow((float) (theOtherParticle.posY - posY), 2)) < (theOtherParticle.radius + radius))
					&& (sqrt(pow((float) (theOtherParticle.posX - posX), 2)
							+ pow((float) (theOtherParticle.posY - posY), 2)) > sqrt(pow(
							(float) (theOtherParticle.posX
									+ theOtherParticle.vX*v - posX - vX*v), 2)
							+ pow((float) (theOtherParticle.posY
									+ theOtherParticle.vY*v - posY - vY*v), 2)));
		}

	}


