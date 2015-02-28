
	NavierStokesSolver fluidSolver;
	double visc, diff, limitVelocity, vScale;
	int oldMouseX = 1, oldMouseY = 1;
	int numParticles;
	Particle[] particles;
	Random rnd = new Random();

	public void setup() {
		fluidSolver = new NavierStokesSolver();
		frameRate(60);

                size(800, 800);
		width = 800;
		height = 800;

		numParticles = 8000;
		particles = new Particle[numParticles];
		visc = 0.0008f;
		diff = 0.25f;
		vScale = 24;

		limitVelocity = 200;

		stroke(color(0));
		fill(color(0));
		smooth();

		initParticles();
	}

	private void initParticles() {
		for (int i = 0; i < numParticles - 1; i++) {
			particles[i] = new Particle();
			particles[i].x = rnd.nextFloat() * width;
			particles[i].y = rnd.nextFloat() * height;
		}
	}

	public void draw() {

		background(color(0));

		handleMouseMotion();

		double dt = 1 / frameRate;
		fluidSolver.tick(dt, visc, diff);

		stroke(color(64));
		paintGrid();
		stroke(color(96));
		paintMotionVector((float) vScale * 2);

		paintParticles();
	}

	private void paintParticles() {

		int n = NavierStokesSolver.N;
		float cellHeight = height / n;
		float cellWidth = width / n;

		int c = color(255);
		for (Particle p : particles) {
			if (p != null) {
				int cellX = floor(p.x / cellWidth);
				int cellY = floor(p.y / cellHeight);
				float dx = (float) fluidSolver.getDx(cellX, cellY);
				float dy = (float) fluidSolver.getDy(cellX, cellY);

				float lX = p.x - cellX * cellWidth - cellWidth / 2;
				if (lX > 0) {
					// interpolate with right neighbor
					float dx2 = (float) fluidSolver.getDx(Math.min(n, cellX + 1), cellY);
					dx = lerp(dx, dx2, lX / cellWidth);
				} else {
					// interpolate with left neighbor
					float dx2 = (float) fluidSolver.getDx(Math.max(0, cellX - 1), cellY);
					dx = lerp(dx, dx2, -lX / cellWidth);
				}

				float lY = p.y - cellY * cellHeight - cellHeight / 2;
				if (lY > 0) {
					// interpolate with lower neighbor
					float dy2 = (float) fluidSolver.getDy(cellX, Math.min(n, cellY + 1));
					dy = lerp(dy, dy2, lY / cellHeight);
				} else {
					// interpolate with upper neighbor
					float dy2 = (float) fluidSolver.getDy(cellX, Math.max(0, cellY - 1));
					dy = lerp(dy, dy2, -lY / cellHeight);
				}

				p.x += dx * vScale;
				p.y += dy * vScale;

				if (p.x < 0 || p.x >= width) {
					p.x = random(width);
				}
				if (p.y < 0 || p.y >= height) {
					p.y = random(height);
				}

				set((int) p.x, (int) p.y, c);
			}
		}

	}

	private void handleMouseMotion() {
		mouseX = max(1, mouseX);
		mouseY = max(1, mouseY);

		int n = NavierStokesSolver.N;
		float cellHeight = height / n;
		float cellWidth = width / n;

		double mouseDx = mouseX - oldMouseX;
		double mouseDy = mouseY - oldMouseY;
		int cellX = floor(mouseX / cellWidth);
		int cellY = floor(mouseY / cellHeight);

		mouseDx = (abs((float) mouseDx) > limitVelocity) ? Math.signum(mouseDx) * limitVelocity : mouseDx;
		mouseDy = (abs((float) mouseDy) > limitVelocity) ? Math.signum(mouseDy) * limitVelocity : mouseDy;

		fluidSolver.applyForce(cellX, cellY, mouseDx, mouseDy);

		oldMouseX = mouseX;
		oldMouseY = mouseY;
	}

	private void paintMotionVector(float scale) {
		int n = NavierStokesSolver.N;
		float cellHeight = height / n;
		float cellWidth = width / n;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				float dx = (float) fluidSolver.getDx(i, j);
				float dy = (float) fluidSolver.getDy(i, j);

				float x = cellWidth / 2 + cellWidth * i;
				float y = cellHeight / 2 + cellHeight * j;
				dx *= scale;
				dy *= scale;

				line(x, y, x + dx, y + dy);
			}
		}
	}

	private void paintGrid() {
		int n = NavierStokesSolver.N;
		float cellHeight = height / n;
		float cellWidth = width / n;
		for (int i = 1; i < n; i++) {
			line(0, cellHeight * i, width, cellHeight * i);
			line(cellWidth * i, 0, cellWidth * i, height);
		}
	}

	public class Particle {
		public float x;
		public float y;
	}


