
	static final int MAX_NUM_PARTICLES = 400;
	Particle[] particles = new Particle[MAX_NUM_PARTICLES];

	private float dt;
	private int oldMillis;

	static final double GRAVITY = 0.0015;
	static final float BOUNCE_DAMPENING = (float) 0.025;

	private int numberOfInstances = 200;
	private float radius = 6;

	private boolean grav = true;

	void setup() {
		oldMillis = millis();

		size(640, 480);

		for (int i = 0; i < MAX_NUM_PARTICLES; i++) {
			float x = random(0, width);
			float y = random(0, height);
			particles[i] = new Particle(x, y, radius);
		}

		smooth();

		PFont myFont = loadFont("Ziggurat-HTF-Black-32.vlw");
		textFont(myFont, 12);
		fill(255);
		noStroke();
	}

	void draw() {
		updateParticles();

		background(51);

		for (int i = 0; i < numberOfInstances; i++) {
			int d = parseInt(particles[i].radius * 2);
			ellipse((float) particles[i].posX, (float) particles[i].posY, d, d);
		}

		text("fps: " + parseInt(1000 / dt), 10, 20);
		text("click left to push or right to pull", width/2, 20);
		text("[+/-] objects: " + numberOfInstances, 10, 40);
		text("[ g ] gravity: " + grav, 10, 60);
	}

	void keyPressed() {
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

	void updateParticles() {
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

			// inter particle
			for (int j = 0; j < numberOfInstances; j++) {

				// bounce
				bounce(particles[i], particles[j]);
			}

			// apply Gravity
			if(grav){
				particle.vY += GRAVITY*0.1*dt;
			}

			// apply interactive gravity
			applyMouseGravity(particle);

			// move it
			particle.tick();
		}
		dt = millis() - oldMillis;
		oldMillis = millis();

	}

	void applyMouseGravity(Particle particle) {
		if (mousePressed) {
			float d = sqrt(pow(particle.posX - mouseX, 2)
					+ pow(particle.posY - mouseY, 2))
					* (float) 2.0;
			float ang = atan2(particle.posX - mouseX, particle.posY - mouseY);
			float F = (float) 16 * dt;
			F = min(1 / d, 3);
			if (mouseButton == RIGHT) {
				F = -F;
			}

			particle.vX += sin(ang) * F;
			particle.vY += cos(ang) * F;
		}
	}

	void bounce(Particle a, Particle b) {
		if (sqrt(pow(a.posX - b.posX, 2) + pow(a.posY - b.posY, 2)) < (a.radius + b.radius)) {
			if (sqrt(pow(a.posX - b.posX, 2) + pow(a.posY - b.posY, 2)) > sqrt(pow(
					a.posX + a.vX - b.posX - b.vX, 2)
					+ pow(a.posY + a.vY - b.posY - b.vY, 2))) {

				float commonTangentAngle = atan2(b.posX - a.posX, b.posY
						- a.posY)
						+ asin(1);

				float v1 = a.getVelocity();
				float v2 = b.getVelocity();
				float w1 = a.getMotionDirection();
				float w2 = b.getMotionDirection();

				a.vX = sin(commonTangentAngle) * v1 * cos(w1 - commonTangentAngle) + cos(commonTangentAngle) * v2 * sin(w2 - commonTangentAngle);
				a.vY = cos(commonTangentAngle) * v1 * cos(w1 - commonTangentAngle) - sin(commonTangentAngle) * v2 * sin(w2 - commonTangentAngle);
				b.vX = sin(commonTangentAngle) * v2 * cos(w2 - commonTangentAngle) + cos(commonTangentAngle) * v1 * sin(w1 - commonTangentAngle);
				b.vY = cos(commonTangentAngle) * v2 * cos(w2 - commonTangentAngle) - sin(commonTangentAngle) * v1 * sin(w1 - commonTangentAngle);

				a.vX *= (1 - BOUNCE_DAMPENING);
				a.vY *= (1 - BOUNCE_DAMPENING);
				b.vX *= (1 - BOUNCE_DAMPENING);
				b.vY *= (1 - BOUNCE_DAMPENING);

			}
		}
	}

	class Particle {

		float posX;
		float posY;

		float vX = 0;
		float vY = 0;

		float radius;

		Particle(float x, float y, float r) {
			posX = x;
			posY = y;
			radius = r;
		}

		float getVelocity() {
			return sqrt(vX * vX + vY * vY);
		}

		public float getMotionDirection() {
			return atan2(vX, vY);
		}

		void tick() {
			posX += vX * dt;
			posY += vY * dt;
		}

	}


