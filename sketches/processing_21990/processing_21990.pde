
PImage img1, img2;
float effectLevel = 0.0;

void setup() {
    size(200,200);
    img1 = loadImage("sunflower.jpg");
	img2 = loadImage("sunflower.jpg");
}

void draw() {
	colorShift();
}

void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			effectLevel += 0.1;
		}
		if (keyCode == DOWN) {
			effectLevel -= 0.1;
			if (effectLevel < 0) {
				effectLevel = 0;
			}
		}
	}
        if (key == ' ') {
                        effectLevel = 0;
                }
}

float colorCheck(float value) {
	if (value > 255) {
		value -= 256;
		colorCheck(value);
	}
	return value;
}

void colorShift() {
    image(img1,0,0);
    image(img2,0,0);
    loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int loc = x + y*img1.width;

		float r1 = red	(img1.pixels[loc]);
		float g1 = green(img1.pixels[loc]);
		float b1 = blue	(img1.pixels[loc]);
		float r2 = red	(img2.pixels[loc]);
		float g2 = green(img2.pixels[loc]);
		float b2 = blue	(img2.pixels[loc]);
		
		float rf = r1 + r2*effectLevel;
		float bf = b1 + b2*effectLevel;
		float gf = g1 + g2*effectLevel;
		
		rf = colorCheck(rf);
		gf = colorCheck(gf);
		bf = colorCheck(bf);
		
		pixels[loc] = color(rf,gf,bf);
      }
    }
    updatePixels();
	println(effectLevel);
}

