
	NavierStokesSolver fluidSolver;
	double visc, diff, limitVelocity;
	int oldMouseX = 1, oldMouseY = 1;

	void setup() {
		fluidSolver = new NavierStokesSolver();
		frameRate(30);
		size(600, 600);

		visc = 0.01;
		diff = 0.02;
		
		limitVelocity = 100;

		stroke(color(0));
		fill(color(0));
		smooth();

	}

	public void draw() {

		background(color(255));

		handleMouseMotion();

		double dt = 1 / frameRate;
		fluidSolver.tick(dt, visc, diff);

                stroke(color(216));
		paintGrid();

		float scale = 100;
                stroke(color(0));
		paintMotionVector(scale);
		
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

		mouseDx = (abs((float) mouseDx)>limitVelocity) ? Math.signum(mouseDx)*limitVelocity : mouseDx;
		mouseDy = (abs((float) mouseDy)>limitVelocity) ? Math.signum(mouseDy)*limitVelocity : mouseDy;
		
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



