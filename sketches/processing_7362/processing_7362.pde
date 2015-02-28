
	public static int MAX_GRID_WIDTH = 64;
	public static int MAX_GRID_HEIGHT = 48;

	private GridNode[][] nodes = new GridNode[MAX_GRID_WIDTH][MAX_GRID_HEIGHT];

	private int gridWidth = 7;
	private int gridHeight = 7;

	public void setup() {
		size(300, 300);
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = new GridNode();
				node.x = x;
				node.y = y;
				nodes[x][y] = node;
			}
		}
		smooth();
		stroke(255);
		fill(255);
		background(0);
	}

	public void draw() {
		update();
		drawVectors();
		applyWarp();
		drawPoints();
	}

	void drawPoints() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				ellipse(node.getPixelX(), node.getPixelY(), 2.5f, 2.5f);
			}
		}

	}

	void drawVectors() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				line(node.getPixelX(), node.getPixelY(), (float) node
						.getDifferentialPixelX(), (float) node
						.getDifferentialPixelY());
			}
		}

	}

	void applyWarp() {
		loadPixels();
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				VectorType warpedPosition = getWarpedPosition(x, y);
				set(x, y, getColor(warpedPosition));
			}
		}

	}

	/**
	 * This method returns the warped pixel coordinate for a coordinate in the
	 * differential warp field (in pixels). The resulting vector is calculated
	 * by a linear interpolation between the nearest grid node values
	 * 
	 * @param x
	 *            horizontal pixel position
	 * @param y
	 *            vertical pixel position
	 * @return the warped pixel position
	 */
	VectorType getWarpedPosition(float x, float y) {
		int gridX = floor(x / ((float) width / (float) (gridWidth - 1)));
		int gridY = floor(y / ((float) height / (float) (gridHeight - 1)));

		int p0x = nodes[gridX][gridY].getPixelX();
		int p0y = nodes[gridX][gridY].getPixelY();

		float topLeftX = nodes[gridX][gridY].getDifferentialPixelX();
		float topLeftY = nodes[gridX][gridY].getDifferentialPixelY();

		float topRightX = nodes[gridX + 1][gridY].getDifferentialPixelX();
		float topRightY = nodes[gridX + 1][gridY].getDifferentialPixelY();

		float bottomLeftX = nodes[gridX][gridY + 1].getDifferentialPixelX();
		float bottomLeftY = nodes[gridX][gridY + 1].getDifferentialPixelY();

		float bottomRightX = nodes[gridX + 1][gridY + 1]
				.getDifferentialPixelX();
		float bottomRightY = nodes[gridX + 1][gridY + 1]
				.getDifferentialPixelY();

		float cellWidth = (float) width / ((float) gridWidth - 1);
		float cellHeight = (float) height / ((float) gridHeight - 1);
		float u = (x - p0x) / cellWidth;
		float v = (y - p0y) / cellHeight;

		VectorType warpedPosition = new VectorType();
		warpedPosition.x = interpolate(topLeftX, topRightX, bottomLeftX,
				bottomRightX, u, v);
		warpedPosition.y = interpolate(topLeftY, topRightY, bottomLeftY,
				bottomRightY, u, v);
		;
		return warpedPosition;
	}

	/**
	 * @param topLeft
	 * @param topRight
	 * @param bottomLeft
	 * @param bottomRight
	 * @param x horizontal interpolation
	 * @param y vertical interpolation
	 * @return lerp in 2D
	 */
	float interpolate(float topLeft, float topRight, float bottomLeft,
			float bottomRight, float x, float y) {
		return lerp(lerp(topLeft, topRight, x),
				lerp(bottomLeft, bottomRight, x), y);
	}

	/**
	 * @param subPixelPosition
	 * @return bilinear filtered color
	 */
	int getColor(VectorType subPixelPosition) {
		int x = floor(subPixelPosition.x);
		int y = floor(subPixelPosition.y);

		y = constrain(y, 0, height - 2);

		int indexTopLeft = x + y * width;
		int indexTopRight = x + 1 + y * width;
		int indexBottomLeft = x + (y + 1) * width;
		int indexBottomRight = x + 1 + (y + 1) * width;

		float u = subPixelPosition.x - x;
		float v = subPixelPosition.y - y;

		int c = lerpColor(lerpColor(pixels[indexTopLeft],
				pixels[indexTopRight], u), lerpColor(pixels[indexBottomLeft],
				pixels[indexBottomRight], u), v);

		float r = red(c);
		float g = green(c);
		float b = blue(c);

		r = constrain(r - 4, 0, 255);
		g = constrain(g - 4, 0, 255);
		b = constrain(b - 4, 0, 255);

		return color(r, g, b);
	}

	void update() {
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				node.warp.x = mouseX - node.getPixelX();
				node.warp.y = mouseY - node.getPixelY();
				node.warp.x *= 0.2;
				node.warp.y *= 0.2;
			}
		}
	}

	public class VectorType {
		float x, y;
	}

	public class GridNode {
		int x, y;
		VectorType warp = new VectorType();

		public int getPixelX() {
			return x * width / (gridWidth - 1);
		}

		public int getPixelY() {
			return y * height / (gridHeight - 1);
		}

		public float getDifferentialPixelX() {
			return getPixelX() + warp.x;
		}

		public float getDifferentialPixelY() {
			return getPixelY() + warp.y;
		}
	}


