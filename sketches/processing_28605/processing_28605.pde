
//Created by per Felix Woitzel, http://www.openprocessing.org/visuals/?visualID=8067
//Modified by Roger Olivella, 10/05/2011

//Noise:
float xnoise = 0.0;

	void setup() {
		size(300, 300);
		smooth();
		strokeWeight(6);
		background(255);
	}

	public void draw() {
		loadPixels();
                xnoise = xnoise + .09;//
                float n = noise(xnoise)*width;
		VectorType fernRootPos = new VectorType(width / 2, height*0.97f);
		VectorType fernBranchPos = new VectorType(width / 2 + (n-width/2)*0.2, 300 * 0.8f + 50*0.1);
                float bending = -(100-width/2)*0.0005;
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {

				float scaling, rotation;

				VectorType uv = new VectorType(x, y);

				VectorType limb = new VectorType(uv);
				scaling = 1.23f;
				rotation = bending;
				limb.affineTransformation(scaling, rotation, fernBranchPos);
				limb.x += fernRootPos.x - fernBranchPos.x;
				limb.y += fernRootPos.y - fernBranchPos.y;
				int limbColor = getColor(limb, pixels);

				VectorType leftArm = new VectorType(uv);
				scaling = 2.5f;
				rotation = -0.9+ bending;
				leftArm.affineTransformation(scaling, rotation, fernBranchPos);
				leftArm.x += fernRootPos.x - fernBranchPos.x;
				leftArm.y += fernRootPos.y - fernBranchPos.y;
				int leftArmColor = getColor(leftArm, pixels);

				VectorType rightArm = new VectorType(uv);
				scaling = 2.5f;
				rotation = 0.9 + bending;
				rightArm.affineTransformation(scaling, rotation, fernBranchPos);
				rightArm.x += fernRootPos.x - fernBranchPos.x;
				rightArm.y += fernRootPos.y - fernBranchPos.y;
				int rightArmColor = getColor(rightArm, pixels);

				int col = minColor(leftArmColor, limbColor);
				col = minColor(col, rightArmColor);

				set(x, y, col);

			}
		}

		line(fernRootPos.x, fernRootPos.y, fernBranchPos.x, fernBranchPos.y);
		//ellipse(mouseX, mouseY, 25, 25);
	}

	public int minColor(int c1, int c2) {
		float r1, g1, b1, r2, g2, b2;
		r1 = red(c1);
		r2 = red(c2);
		g1 = green(c1);
		g2 = green(c2);
		b1 = blue(c1);
		b2 = blue(c2);
		return color(min(r1, r2), min(g1, g2), min(b1, b2));
	}

	public int maxColor(int c1, int c2) {
		float r1, g1, b1, r2, g2, b2;
		r1 = red(c1);
		r2 = red(c2);
		g1 = green(c1);
		g2 = green(c2);
		b1 = blue(c1);
		b2 = blue(c2);
		return color(max(r1, r2), max(g1, g2), max(b1, b2));
	}


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
					sourcePixels[indexBottomLeft], sourcePixels[indexBottomRight], u), v);
			float r = red(col);
			float g = green(col);
			float b = blue(col);

			r = constrain(r + 1, 0, 255);
			g = constrain(g + 3, 0, 255);
			b = constrain(b + 0, 0, 255);

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

		public float length() {
			return sqrt(x * x + y * y);
		}

		public float angle() {
			return atan2(x, y);
		}

		public VectorType affineTransformation(float scaling, float rotation,
				VectorType center) {
			sub(center);

			float ang, d;
			ang = angle() + rotation;
			d = length();

			x = scaling * sin(ang) * d;
			y = scaling * cos(ang) * d;

			add(center);
			return this;
		}

	}



