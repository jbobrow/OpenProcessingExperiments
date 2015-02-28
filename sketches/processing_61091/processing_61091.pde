
public class BinarySquare {

	private int value;
	private String binaryString;

	private BinaryTriangle[] triangles;

	private float origX;
	private float origY;

	private float scale;

	public BinarySquare(float _origX, float _origY, float _scale, int _value) {
		origX = _origX;
		origY = _origY;

		scale = _scale;

		value = _value;
		init();
	}

	public BinarySquare(float _origX, float _origY, float _scale, char character) {
		origX = _origX;
		origY = _origY;

		scale = _scale;

		value = (int) character;
		init();
	}

	private void init() {
		binaryString = new StringBuffer(binary(value)).reverse().toString();

		triangles = new BinaryTriangle[binaryString.length()];

		for (int i = 0; i < binaryString.length(); i++) {
			if (binaryString.charAt(i) == '1') {
				triangles[i] = new BinaryTriangle(i, origX, origY, scale, 0, 128);
			} else {
				triangles[i] = new BinaryTriangle(i, origX, origY, scale, 255, 128);
			}
		}

	}

	public void update() {
		for (int i = 0; i < triangles.length; i++) {
			triangles[i].update();
		}
	}

	public void update(int _value) {
		if (_value != value) {
			value = _value;
			destroy();
			init();
		}
		for (int i = 0; i < triangles.length; i++) {
			triangles[i].update();
		}
	}

	public void update(char character) {
		if ((int) character != value) {
			value = (int) character;
			destroy();
			init();
		}

		for (int i = 0; i < triangles.length; i++) {
			triangles[i].update();
		}
	}

	private void destroy() {
		for (int i = 0; i < triangles.length; i++) {
			triangles[i] = null;
		}
	}




