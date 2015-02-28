
	static final int MAX_NUM_PARTICLES = 2048;
	static final int MAX_NUM_SPRINGS = 2048;
	Particle[] particles = new Particle[MAX_NUM_PARTICLES];
	Spring[] springs = new Spring[MAX_NUM_SPRINGS];

	static final double GRAVITY = .2;
	static final double BOUNCE_DAMPENING = 0.02;

	static final double SPRING_FORCE = 0.04;
	static final double RESISTANCE = .09;

	private int numberOfInstances = 7;

	void setup() {

		cursor(Cursor.CROSSHAIR_CURSOR);

		size(800, 600);

		Particle startParticle = new Particle(width / 2, height / 2, 2);

		for (int i = 0; i < numberOfInstances; i++) {
			Particle endParticle = new Particle(width / 2, height / 2, 2);
			particles[i] = endParticle;
			springs[i] = new Spring(startParticle, endParticle);

			startParticle = endParticle;
		}

		smooth();

		strokeWeight(2.5f);
		stroke(255);
		noFill();
	}

	public void draw() {
		springs[0].startParticle.posX = mouseX;
		springs[0].startParticle.posY = mouseY;
		background(0);

		update();

		noFill();
		beginShape();
		vertex(mouseX, mouseY);
		for (int i = 0; i < numberOfInstances; i++) {
			Particle p = particles[i];
			curveVertex((float) p.posX, (float) p.posY);
		}
		curveVertex((float) particles[numberOfInstances - 1].posX,
				(float) particles[numberOfInstances - 1].posY);
		endShape();

		fill(255);
		ellipse((float) springs[numberOfInstances - 1].endParticle.posX,
				(float) springs[numberOfInstances - 1].endParticle.posY, 5, 5);

	}

	private void update() {
		for (int i = 0; i < numberOfInstances; i++) {
			springs[i].update();
		}
		for (int i = 0; i < numberOfInstances; i++) {
			particles[i].update();
			for (int j = i; j < numberOfInstances; j++) {
				// particles[i].bounce(particles[j]);
			}
		}

		Particle p = springs[0].startParticle;
		p.posX = mouseX;
		p.posY = mouseY;
	}

	class Particle {
		double posX;
		double posY;

		double vX = 0;
		double vY = 0;

		float radius;

		public Particle(float x, float y, float r) {
			posX = x;
			posY = y;
			radius = r;
		}

		public float getVelocity() {
			return sqrt((float) (vX * vX + vY * vY));
		}

		public float getMotionDirection() {
			return atan2((float) vX, (float) vY);
		}

		public void update() {
			// bounce off bottom
			if (posY > height - radius) {
				vY = (float) (-abs((float) vY) * (1 - BOUNCE_DAMPENING));
				posY = height - radius;
			}

			// bounce off ceiling
			if (posY < radius) {
				vY = abs((float) vY) * (1 - BOUNCE_DAMPENING);
				posY = radius;
			}

			// bounce off left border
			if (posX < radius) {
				vX = abs((float) vX) * (1 - BOUNCE_DAMPENING);
				posX = radius;
			}

			// bounce off right border
			if (posX > width - radius) {
				vX = -abs((float) vX) * (1 - BOUNCE_DAMPENING);
				posX = width - radius;
			}

			// apply resistance
			double v = getVelocity() * 0.037;
			float r = (float) max((float) 0, (float) (0.995 - RESISTANCE * v
					* v));
			vX *= r;
			vY *= r;

			// apply Gravity
			vY += GRAVITY;

			posX += vX;
			posY += vY;
		}

		public void bounce(Particle theOtherParticle) {
			if (sqrt(pow((float) (theOtherParticle.posX - posX), 2)
					+ pow((float) (theOtherParticle.posY - posY), 2)) < (theOtherParticle.radius + radius)) {
				if (sqrt(pow((float) (theOtherParticle.posX - posX), 2)
						+ pow((float) (theOtherParticle.posY - posY), 2)) > sqrt(pow(
						(float) (theOtherParticle.posX + theOtherParticle.vX
								- posX - vX), 2)
						+ pow((float) (theOtherParticle.posY
								+ theOtherParticle.vY - posY - vY), 2))) {

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
		}

	}

	class Spring {

		Particle startParticle;
		Particle endParticle;

		public Spring(Particle start, Particle end) {
			startParticle = start;
			endParticle = end;
		}

		public void update() {
			applySpringForce();
		}

		private void applySpringForce() {
			startParticle.vX += (endParticle.posX - startParticle.posX)
					* SPRING_FORCE;
			startParticle.vY += (endParticle.posY - startParticle.posY)
					* SPRING_FORCE;
			endParticle.vX += (startParticle.posX - endParticle.posX)
					* SPRING_FORCE;
			endParticle.vY += (startParticle.posY - endParticle.posY)
					* SPRING_FORCE;
		}
	}

