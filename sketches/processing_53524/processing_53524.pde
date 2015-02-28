
PGraphics pg;
color bg = color(0);
color fg = color(256);
color trans = color(0, 0);
color amask  = color(256, 0);
color pink   = color(192, 75, 164);
int peaceRadius = 200;
int n = 0;

void setup() {
  size(1920, 1200);
  colorMode(RGB);
  background(pink);
//  drawMyBackground();
  pg = createGraphics(2*peaceRadius, 2*peaceRadius, JAVA2D);
  createPeaceSign();
}

void draw() {
	drawPeaceSign();
}


void keyPressed(){
  exit();
}


void drawPeaceSign() {
	float myAlpha = random(192,256);
	color mybg;
	float rand = random(1);
	if (rand<0.25) {
		// orange/yellow
		mybg=color(random(188,255), random(64,164), 0, myAlpha);
	} else if (rand<0.5) {
		// greens
		mybg=color(random(0,64), random(128,256), random(0,64), myAlpha);
	} else {
		// pinks and purples
		mybg=color(random(128,256), random(0,64), random(128,256), myAlpha);
	}
	color myfg = pink;
	float power = 3;
	float d = random(8, 128);
	PGraphics groove = createGraphics(pg.width, pg.height, JAVA2D);
	groove.loadPixels();
	noStroke();
	for (int y=0; y<pg.height; y++) {
		for (int x=0; x<pg.width; x++) {
			float total = 0.0;
			for (float i=d; i>=1; i=i/2.0) {
				total += noise(y/d, x/d) * d;
			}
			float turbulence = 128.0 * total/d;
			float base = (x*0.2) + (y*0.12);
			float offset = base + (power*turbulence/256.0);
			color grey = color(abs(cos(offset))*256.0, myAlpha);
			groove.pixels[y*pg.width+x] = grey;
		}
	}

	PGraphics pgCopy = createGraphics(pg.width, pg.height, JAVA2D);
	pg.loadPixels();
	pgCopy.loadPixels();
	for (int y=0; y<pgCopy.height; y++) {
		for (int x=0; x<pgCopy.width; x++) {
			int pix = y*pgCopy.width+x;
			if (pg.pixels[pix] == bg) {
				pgCopy.pixels[pix] = blendColor(mybg, groove.pixels[pix], SUBTRACT);
				pgCopy.pixels[pix] = color(
					pgCopy.pixels[pix] >> 16 & 0xFF, 
					pgCopy.pixels[pix] >>  8 & 0xFF, 
					pgCopy.pixels[pix]       & 0xFF, 
					256-groove.pixels[pix] & 0xFF);
			} else if (pg.pixels[pix] == fg) {
				pgCopy.pixels[pix] =
					lerpColor(myfg, mybg, (groove.pixels[pix] & 0xFF)/256.0);
				pgCopy.pixels[pix] = color(
					pgCopy.pixels[pix] >> 16 & 0xFF, 
					pgCopy.pixels[pix] >>  8 & 0xFF, 
					pgCopy.pixels[pix]       & 0xFF, 
					myAlpha);
			} else {
				pgCopy.pixels[pix] = trans;
			}
		}
	}
	float scale = peaceRadius*random(0.25, 2.0);
	//translate(mouseX, mouseY);
	translate(random(width), random(height));
	rotate(random(-PI/3.0, +PI/3.0));
	image(pgCopy, -scale/2, -scale/2, scale, scale);
	filter(BLUR);
}

void createPeaceSign() {

	int sw = pg.width/10;
	int w = pg.width  - sw - 2;
	int h = pg.height - sw - 2;

	pg.beginDraw();
	pg.ellipseMode(CENTER);
	pg.translate(pg.width/2, pg.height/2);
	pg.fill(bg);
	pg.stroke(fg);
	pg.strokeWeight(sw);
	pg.ellipse(0, 0, w, h);
	pg.line(0, -h/2.0, 0, h/8.0);
	pg.line(0, h/8.0, -w/3.0, 3.0*h/8.0);
	pg.line(0, h/8.0, +w/3.0, 3.0*h/8.0);
	pg.endDraw();
}

void drawMyBackground() {
	color a = color(0, 222, 0);
	color b = color(256, 75, 231);
	float power = 3;
	float d = random(32, 128);
	translate(width/2, height/2);
	rotate(HALF_PI);
	translate(-width/2, -height/2);
	for (int y=0; y<height; y+=4) {
		for (int x=0; x<width; x+=4) {
			float total = 0.0;
			for (float i=d; i>=1; i=i/2.0) {
				total += noise(x/d, y/d) * d;
			}
			float turbulence = 128.0 * total/d;
			float base = (x*0.12) + (y*0.2);
			float offset = base + (power*turbulence/256.0);
			color c = lerpColor(a, b, abs(cos(-offset)));
			stroke(c);
			fill(c);
			rect(x, y, x+4, y+4);
		}
	}
	filter(BLUR,1);
}

