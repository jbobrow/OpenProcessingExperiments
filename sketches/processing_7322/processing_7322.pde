
	public static int MAX_GRID_WIDTH = 1024;
	public static int MAX_GRID_HEIGHT = 1024;

	private GridNode[][] nodes = new GridNode[MAX_GRID_WIDTH][MAX_GRID_HEIGHT];

	private int gridWidth = 21;
	private int gridHeight = 13;

	public void setup() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = new GridNode();
				node.x = x;
				node.y = y;
				nodes[x][y] = node;
			}
		}
		size(800, 600);
		smooth();
		
		stroke(255);
		fill(255);

	}

	public void draw() {
		update();
		background(0);
	//	drawPoints();
		drawVectors();
	}

	void drawPoints() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				ellipse(node.getPixelX(), node.getPixelY(), 5, 5);
			}
		}

	}

	void drawVectors() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				line(node.getPixelX(), node.getPixelY(), node
						.getDifferentialPixelX(), node.getDifferentialPixelY());
			}
		}

	}

	void update() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				node.dx = mouseX - node.getPixelX();
				node.dy = mouseY - node.getPixelY();
				node.dx *=-0.25;
				node.dy *=-0.25;
			}
		}
	}

	public class GridNode {
		int x, y;
		double dx, dy;

		public int getPixelX() {
			return x * width / (gridWidth - 1);
		}

		public int getPixelY() {
			return y * height / (gridHeight - 1);
		}

		public int getDifferentialPixelX() {
			return (int) (getPixelX() + dx);
		}

		public int getDifferentialPixelY() {
			return (int) (getPixelY() + dy);
		}

	}



