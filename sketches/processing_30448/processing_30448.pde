
import java.util.LinkedList;
	class Particle {
		public float x, y, z;
	}

	int numParticles = 1024;
	LinkedList<Particle> particleList = new LinkedList<Particle>();

	float d = 0.85f; // distance between particles
	float s = 0.5f; // size of one particles

	float a = 10.f; // Lorenz-Attractor parameters
	float b = 28.f;
	float c = 8.f / 3.f;

	void advanceParticle(Particle p) {
		float dx = a * (p.y - p.x);
		float dy = p.x * (b - p.z) - p.y;
		float dz = p.x * p.y - c * p.z;
		float l = sqrt((float) (dx * dx + dy * dy + dz * dz));
		dx *= d / l;
		dy *= d / l;
		dz *= d / l;
		p.x += dx;
		p.y += dy;
		p.z += dz;
	}

	public void setup() {
		size(900, 900, P3D);
		frameRate(60);
		fill(255);
		stroke(color(0, 0, 255));
		strokeWeight(1.4f);
		initParticles();
	}

	private void initParticles() {
		float x = random(3), y = random(3), z = random(3);
		Particle p = new Particle();
		p.x = x;
		p.y = y;
		p.z = z;
		particleList.add(p);
		for (int i = 1; i < numParticles; i++) {
			p = new Particle();
			p.x = x;
			p.y = y;
			p.z = z;
			advanceParticle(p);
			x = p.x;
			y = p.y;
			z = p.z;
			particleList.add(p);
		}
	}

	private void advanceParticles() {
		// take and remove the first particle from list
		Particle p = particleList.pollFirst();
		// copy values from the most advanced particle
		Particle end = particleList.peekLast();
		p.x = end.x;
		p.y = end.y;
		p.z = end.z;
		// advance and add to the end of the list
		advanceParticle(p);
		particleList.add(p);
	}

	public void draw() {
		advanceParticles();
		if (mouseY == 0)
			mouseY = 1;
		float w1 = (float) mouseX / (float) width * PI * 2;
		float w2 = (float) mouseY / (float) height * PI;
		float d = 47;
		camera(d * cos(w1) * sin(w2), cos(w2) * d, d * sin(w1) * sin(w2), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);
		background(0);
		Iterator<Particle> it = particleList.iterator();
		while (it.hasNext()) {
			Particle p = it.next();
			pushMatrix();
			translate(p.x, p.y, p.z - 30);
			box(s);
			popMatrix();
		}
	}


