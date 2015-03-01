
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/27487*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
	NavierStokesSolver fluidSolver;
	double visc, diff, limitVelocity, vScale;
	int oldMouseX = 1, oldMouseY = 1;
	int numParticles;
	Particle[] particles;
	Random rnd = new Random();
        int radius = 15;


	public void setup() {
		fluidSolver = new NavierStokesSolver();
		frameRate(60);

                size(900, 600);
		width = 900;
		height = 600;

		numParticles = 1000;
		particles = new Particle[numParticles];
		visc = 0.08f;
		diff = 0.5f;
		vScale = 34;

                int radius;

		limitVelocity = 50;

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
		

		paintParticles();
	}

	private void paintParticles() {

		int n = NavierStokesSolver.N;
		float cellHeight = height / n*1.1;
		float cellWidth = width / n*1.1;

		int c = color(190);
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


	public class Particle {
		public float x;
		public float y;
                
}
         


