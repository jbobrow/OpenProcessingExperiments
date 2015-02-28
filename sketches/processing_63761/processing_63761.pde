
	private PImage img;
	private PImage lente;
	
	private int latoLente;
	void setup() {
		size(800, 800);
		img = loadImage("Dali_Galatea_800x800.jpg");
		img.loadPixels();
		noSmooth();
		latoLente = 128;
		

	}
	void draw() {
		background(255);
		pushMatrix();
		image(img, 0, 0);
		lente = createImage(latoLente, latoLente, RGB);
		lente.loadPixels();
		_preparaLente();
		image(lente, mouseX, mouseY);
		popMatrix();
	}
	private void _preparaLente() {
		for (int y = mouseY; y < mouseY + lente.width/2; y=y+1) {
			for (int x = mouseX; x < mouseX + lente.height/2; x=x+1) {
				for (int z = (y-mouseY)*2; z < ((y-mouseY)*2)+2; z++) {
					int loc = x + y * img.width;
					float r = red(img.pixels[loc]);
					float g = green(img.pixels[loc]);
					float b = blue(img.pixels[loc]);
					for (int t = (x-mouseX)*2; t < ((x-mouseX)*2)+2; t++) {
						int loc1 = t + z * lente.width;
						lente.pixels[loc1] = color(r, g, b, 126);
						//println(t);
					}
				}
			}
		}
		lente.updatePixels();
	}



