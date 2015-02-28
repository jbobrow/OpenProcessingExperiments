
	private int s = 29;
	private float rsize = 5;
	private int effect = 0;
	private float[] px;
	
	private double beat = 0;
	private double beatspeed = 0.1;

	void setup() {
		size(295,400);
		noStroke();
		background(255);
                px = processBlurCircle(s, effect);
	}

	void draw() {
		beat+=beatspeed ;
		if (beat > Math.PI*2) { beat -=Math.PI*2; }
		float cbeat = (float) Math.abs(Math.cos(beat));
		background(255);
		int ss = (s*2)+1;
		for (int r=0; r<ss; r++) {
			for (int c=0; c<ss; c++) {
				int p = c + (r*ss);
				float res = px[p]*cbeat;
				fill(res*255f,res*255f,res*255f);
				rect(
					c*rsize,
					r*rsize,
					rsize,
					rsize
					);
			}
		}
		int rm = s;
		for (int c=0; c<ss; c++) {
			int p = c + (rm*ss);
			float res = px[p];
			fill(255,0,0);
			float th = (float) 100 * res;
			rect(
				c*rsize,
				height - th,
				rsize,
				th
				);
		}
	}
	
	public void keyPressed() {
		if (keyCode == 32) {
			// [space]
			effect++;
			if(effect > MAX) { effect = 0; }
			px = processBlurCircle(s, effect);
		} else {
			System.out.println(keyCode);
		}
	}


/*-------------------- BLUR CIRCLE --------------------*/

	public static final int NONE = 0;
	public static final int COS = 1;
	public static final int SIN = 2;
	public static final int TAN = 3;
	public static final int COS_PI = 4;
	public static final int SIN_PI = 5;
	public static final int SQUARE = 6;
	public static final int CUBE = 7;
	public static final int COS_SQUARE = 8;
	public static final int COS_CUBE = 9;
	public static final int COS_POW5 = 10;
	public static final int COS_POW10 = 11;
	
	public static final int MAX = 11;
	
	public float[] processBlurCircle(int size, int effect) {
		float middle = (float) size + 0.5f;
		int border = (size*2)+1;
		float[] px = new float[border*border];
		for (int r = 0; r < size+1; r++) {
			float ty = (float) Math.abs(((float)(r)+0.5f) - middle);
			for (int c = 0; c < size+1; c++) {
				float tx = (float) Math.abs(((float)(c)+0.5f) - middle);
				float d = 1f - ( PApplet.dist(tx, ty, 0, 0) / (float) middle);
				if (d < 0) { d = 0; }
				else if (d > 1) { d = 1; }
				switch (effect) {
					case COS:
						d = (float) Math.cos((1-d)*Math.PI*0.5f);
						break;
					case SIN:
						d = 1f - (float) Math.sin((1-d)*Math.PI*0.5f);
						break;
					case TAN:
						d = (float) Math.tan(d);
						break;
					case COS_PI:
						d = 1f - (float) Math.cos(d*Math.PI);
						break;
					case SIN_PI:
						d = (float) Math.sin(d*Math.PI);
						break;
					case SQUARE:
						d = d*d;
						break;
					case CUBE:
						d = d*d*d;
						break;
					case COS_SQUARE:
						float tc = (float) Math.cos((1-d)*Math.PI*0.5f);
						d = tc*tc;
						break;
					case COS_CUBE:
						float tc3 = (float) Math.cos((1-d)*Math.PI*0.5f);
						d = tc3*tc3*tc3;
						break;
					case COS_POW5:
						float tc5 = (float) Math.cos((1-d)*Math.PI*0.5f);
						d = (float) Math.pow(tc5, 5);
						break;
					case COS_POW10:
						float tc10 = (float) Math.cos((1-d)*Math.PI*0.5f);
						d = (float) Math.pow(tc10, 10);
						break;
					default:
						break;
				}
				if (d < 0) { d = 0; }
				else if (d > 1) { d = 1; }
				//d = (float) (Math.sin(d*Math.PI*2));
				px[c+(r*border)] = d;
				if (c < size) {
					px[(border-(c+1))+(r*border)] = d;
				}
				if (r < size) {
					px[c+((border-(r+1))*border)] = d;
					px[(border-(c+1))+((border-(r+1))*border)] = d;
				}
			}
		}
		return px;
	}

