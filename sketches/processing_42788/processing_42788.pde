
/**
 * Dithering based on Hilbert curves
 * got the general algortihm from "Chaos and Fractals"
 * used a very nifty trick from "Hacker's Delight" to calculate the hilbert sequence
 *
 * interaction :
 * mouseclik increases resolution 
 * digits [2-9] selects number og greyscales in palette - default is black and white
 */

int n = 0;
PImage in;
int[] palette;
void setup() {
    size(512,512);
    reset();
    palette = new int[] {0, 255};
    n = 4;
}

/**
 * from Warren "Hackers delight" p 248
 */
PVector hilbert(int s, int n) {
    int state,x,y,row;
    state = row = x = y = 0;
    for(int i = 2 *n -2; i >= 0; i -=2) {
	row = 4 * state | (s >> i) & 3;
	x = (x << 1) | (0x936C >> row)&1;
	y = (y << 1) | (0x39C6 >> row)&1;
	state = (0x3E6B94C1 >> 2*row) & 3;
    }
    return new PVector(x,y);
}

void draw() {
    int cnt = 1<<n * 1 <<n;
    int scale = (in.width)/(1<<n);
    if (scale < 1) { n = 4; return;} 

    int draw_scale = (width)/(1<<n);

    println("order " + n + " has " + cnt + " segments (" + scale + ")");
    in.loadPixels();
    float E = 0;
    for(int i = 0; i < cnt; i++) {
	PVector cur = hilbert(i, n);
	float I = E + I(cur, scale);
	for(int c = palette.length -1; c >= 0; c--) {
	    if ( I > palette[c]) {
		E = I - palette[c];
		fill(palette[c]);
		break;
	    }
	}
	noStroke();
	rect(cur.x*draw_scale, cur.y*draw_scale, draw_scale, draw_scale);
    }
    in.updatePixels();
    noLoop();
}

void segment(PVector p1, PVector p2, float s) {
    line( s * p1.x, s * p1.y, s * p2.x, s * p2.y);
}

float I(PVector p, int s) {
    float intensity = 0;
    for(int i = 0; i < s ; i++) {
	for(int j = 0; j < s ; j++) {
	    int x = (int)p.x * s + i;
	    int y = (int)p.y * s + j;
	    int idx = y * in.width + x;
	    intensity += in.pixels[idx]&0xFF;
	}
    }
    return intensity/(s*s);
}

void reset() {
    smooth();
    background(0);
    in = loadImage("david512.png");
}

void mouseClicked() {
    reset();
    n++;
    loop();
}

void keyPressed() {
    if (!Character.isDigit(key))
	return;

    int depth = Character.getNumericValue(key); 
    if (depth < 2 ) return;
    palette = new int[depth];
    for(int i =0 ; i < depth; i++) {
	palette[i] = i * (255/(depth-1));
	println(palette[i]);
    }
    loop();
}

