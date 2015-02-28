
	void setup() {
		size(512, 384);
		smooth();
	}

	public void draw() {
		loadPixels();
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {

				float u, v, zoom, c_real, c_imaginary, julia_u, julia_v;

				zoom = 1.88f;
				c_real = 0.1f;
				c_imaginary = 0.11f;

				u = ((float) x / (float) width - 0.5f) * zoom;
				v = ((float) y / (float) height - 0.5f) * zoom;

				julia_u = (u * u - v * v + c_real + 0.5f) * width;
				julia_v = (2 * u * v + c_imaginary + 0.5f) * height;

				VectorType complex_squared = new VectorType(julia_u, julia_v);
				int col = getColor(complex_squared, pixels);
				set(x, y, col);

			}
		}

		ellipse(mouseX, mouseY, 25, 25);
	}

	/**
	 * @param subPixelPosition
	 * @return bilinear filtered color
	 */
	public int getColor(VectorType subPixelPosition, int[] sourcePixels) {
		int x = floor(subPixelPosition.x);
		int y = floor(subPixelPosition.y);
		float u = subPixelPosition.x - x;
		float v = subPixelPosition.y - y;

		if (x < 0 || y < 0 || x >= width - 1 || y >= height - 1) {
			return color(255);
		}

		int indexTopLeft = x + y * width;
		int indexTopRight = x + 1 + y * width;
		int indexBottomLeft = x + (y + 1) * width;
		int indexBottomRight = x + 1 + (y + 1) * width;

		try {
			int col = lerpColor(lerpColor(sourcePixels[indexTopLeft],
					sourcePixels[indexTopRight], u), lerpColor(
					sourcePixels[indexBottomLeft],
					sourcePixels[indexBottomRight], u), v);
			float r = red(col);
			float g = green(col);
			float b = blue(col);

			r = constrain(r - 1, 0, 255);
			g = constrain(g - 1, 0, 255);
			b = constrain(b - 1, 0, 255);

			return color(r, g, b);
		} catch (Exception e) {
			System.out.println("getBufferColor: " + x + " | " + y);
		}
		return color(0);
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

		public VectorType(VectorType v) {
			x = v.x;
			y = v.y;
		}

		public VectorType add(VectorType vector) {
			x += vector.x;
			y += vector.y;

			return this;
		}

		public VectorType sub(VectorType vector) {
			x -= vector.x;
			y -= vector.y;

			return this;
		}

		public float distance(VectorType theOtherVector) {
			return sqrt((x - theOtherVector.x) * (x - theOtherVector.x)
					+ (y - theOtherVector.y) * (y - theOtherVector.y));
		}

	}


