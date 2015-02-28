
boolean doGray = false;
public void setup() {
		size(600, 600);
		background(255);
	}

	public void draw() {
		if (doGray) {
			drawingTriangleColumnReverse(random(600), 255, 255, 255);
		} else {
			drawingTriangleColumn(random(600), 0, 255, 255);
		}

	}

	public void mouseClicked() {
		drawingRedTriangle(mouseX, mouseY);

	}

	public void keyPressed() {
		doGray = !doGray;
		background(255);

	}

	// 000 191 255 hellblau
	// 025 025 112 dunkelbalau
	public void drawingTriangleColumn(float x, int r, int g, int b) {

		for (int y = 1; y < 60; y = y + 3) {
			fill(r, g, b);
			int posY = y * 10;
			triangle(x, posY, x + 10, posY - 10, x + 10, posY + 10);
			if (r > 0) {
				r = 255 - y * 4;
			}
			if (g > 0) {
				g = 255 - y * 4;
			}
			if (b > 0) {
				b = 255 - y * 4;
			}

		}

	}

	public void drawingTriangleColumnReverse(float x, int r, int g, int b) {

		for (int y = 60; y >= 0; y = y - 3) {
			fill(r, g, b);
			int posY = y * 10;
			triangle(x, posY, x + 10, posY - 10, x + 10, posY + 10);
			if (r > 0) {
				r = 0 + y * 4;
			}
			if (g > 0) {
				g = 0 + y * 4;
			}
			if (b > 0) {
				b = 0 + y * 4;
			}

		}

	}

	public void drawingRedTriangle(int mouseX, int mouseY) {
		int r, g, b;
		r = 255;
		g = 0;
		b = 0;
		fill(r, g, b);
		triangle(mouseX, mouseY, mouseX + 30, mouseY - 30, mouseX + 30,
				mouseY + 30);

	}



