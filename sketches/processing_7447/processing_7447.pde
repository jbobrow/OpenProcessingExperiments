
	public static int MAX_GRID_WIDTH = 64;
	public static int MAX_GRID_HEIGHT = 48;

	private GridNode[][] nodes = new GridNode[MAX_GRID_WIDTH][MAX_GRID_HEIGHT];

	private int gridWidth = 11;
	private int gridHeight = 11;
	private float cellWidth;
	private float cellHeight;
	private float cellWidthInverse;
	private float cellHeightInverse;
	private float gridWithInverse;
	private float gridHeightInverse;

	public void setup() {
		// size(256, 256);
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
		// noCursor();
		stroke(255);
		strokeWeight(1.0f);
		fill(255);
		background(0);
	}

	public void draw() {
		update();
		// background(0);
		drawVectors();
		applyWarp();
		drawBorder();
		drawPoints();
	}

	void update() {
		gridWithInverse = 1.0f / (float) (gridWidth - 1);
		gridHeightInverse = 1.0f / (float) (gridHeight - 1);
		cellWidth = (float) width * gridWithInverse;
		cellHeight = (float) height * gridHeightInverse;
		cellWidthInverse = 1.0f / cellWidth;
		cellHeightInverse = 1.0f / cellHeight;

		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				VectorType vector = scale(node.getPosition(), new VectorType(
						(float) mouseX, (float) mouseY), -0.002f);
				vector.add(zoom(node.getPosition(), new VectorType(
						(float) mouseX, (float) mouseY), 0.97f, 1.0f));
				node.warp = vector;
			}
		}
	}

	void drawBorder() {
		stroke(0);
		line(0, 0, width - 1, 0);
		line(0, 0, 0, height - 1);
		line(width - 1, 0, width - 1, height - 1);
		line(0, height - 1, width - 1, height - 1);
	}

	void drawPoints() {
		stroke(255);
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				ellipse(node.getAbsolutePixelX(), node.getAbsolutePixelY(),
						2.5f, 2.5f);
			}
		}

	}

	void drawVectors() {
		stroke(255);
		for (int x = 0; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				GridNode node = nodes[x][y];
				line(node.getAbsolutePixelX(), node.getAbsolutePixelY(),
						(float) node.getDifferentialPixelX(), (float) node
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
		int gridX = floor(x * cellWidthInverse);
		int gridY = floor(y * cellHeightInverse);

		int p0x = nodes[gridX][gridY].getAbsolutePixelX();
		int p0y = nodes[gridX][gridY].getAbsolutePixelY();

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

		float u = (x - p0x) * cellWidthInverse;
		float v = (y - p0y) * cellHeightInverse;

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
	 * @param x
	 *            horizontal interpolation
	 * @param y
	 *            vertical interpolation
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
		float u = subPixelPosition.x - x;
		float v = subPixelPosition.y - y;

		x = x % width;
		y = y % height;

		y = constrain(y, 0, height - 2);
		x = constrain(x, 0, width - 2);

		int indexTopLeft = x + y * width;
		int indexTopRight = x + 1 + y * width;
		int indexBottomLeft = x + (y + 1) * width;
		int indexBottomRight = x + 1 + (y + 1) * width;

		try {
			int col = lerpColor(lerpColor(pixels[indexTopLeft],
					pixels[indexTopRight], u), lerpColor(
					pixels[indexBottomLeft], pixels[indexBottomRight], u), v);
			float r = red(col);
			float g = green(col);
			float b = blue(col);

			r = constrain(r - 1, 0, 255);
			g = constrain(g - 1, 0, 255);
			b = constrain(b - 1, 0, 255);

			return color(r, g, b);
		} catch (Exception e) {
			System.out.println(x + " | " + y);
		}
		return color(1);
	}

	private VectorType scale(VectorType position, VectorType center, float scale) {
		return scale(position, center, scale, scale);
	}

	private VectorType scale(VectorType position, VectorType center,
			float horizontalScale, float verticalScale) {
		VectorType scaleVector = new VectorType();
		scaleVector.x = center.x - position.x;
		scaleVector.y = center.y - position.y;
		scaleVector.x *= horizontalScale;
		scaleVector.y *= verticalScale;

		return scaleVector;
	}

	private VectorType zoom(VectorType position, VectorType center,
			float logFactor, float zoom) {
		float d = distance(position, center);

		VectorType zoomVector = scale(position, center, zoom);
		if (d != 0) {
			zoomVector.x *= pow(logFactor, d);
			zoomVector.y *= pow(logFactor, d);
		}

		return zoomVector;
	}

	public static float distance(VectorType p0, VectorType p1) {
		return sqrt((p0.x - p1.x) * (p0.x - p1.x) + (p0.y - p1.y)
				* (p0.y - p1.y));
	}

	public class VectorType {
		float x, y;

		public VectorType() {
			x = 0;
			y = 0;
		}

		public VectorType(float x, float y) {
			this.x = x;
			this.y = y;
		}

		public VectorType add(VectorType vector) {
			x += vector.x;
			y += vector.y;

			return this;
		}

	}

	public class GridNode {
		int x, y;
		VectorType warp = new VectorType();

		public int getAbsolutePixelX() {
			return floor(width * getNormalizedX());
		}

		public VectorType getPosition() {
			return new VectorType(getAbsolutePixelX(), getAbsolutePixelY());
		}

		public int getAbsolutePixelY() {
			return floor(height * getNormalizedY());
		}

		public float getDifferentialPixelX() {
			return getAbsolutePixelX() + warp.x;
		}

		public float getDifferentialPixelY() {
			return getAbsolutePixelY() + warp.y;
		}

		public float getNormalizedX() {
			return x * gridWithInverse;
		}

		public float getNormalizedY() {
			return y * gridHeightInverse;
		}
	}


