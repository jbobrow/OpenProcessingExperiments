
final int CNT = 500;
final color BACKGROUND = color(0);
final color FLAKECOLOR = color(255, 255, 255);
Particle[] flakes;

int[] bg;
int[] updates;

PImage img;

void setup() {
  size(600, 400, P2D);
  img = loadImage("osaa3.png");
  snow_init();
}

void snow_init() {

  bg = new int[width * height];
  updates = new int[width * height];
  loadPixels();
  background(BACKGROUND);
  image(img, 0, 0, width, height);

  flakes = new Particle[CNT];
  for (int i = 0; i < CNT; i++) {
    flakes[i] = createFlake();
  }

  arrayCopy(pixels, bg);
  updatePixels();
}

Particle createFlake() {
  Particle p = new Particle(random(0, width), random(-5, 10));
  p.vel = new PVector(random(-3, 3), random(0, 5));
  p.acc = new PVector(0, random(.1, .4));
  return p;
}


void draw() {
  loadPixels();
  arrayCopy(bg, pixels);

  for (int i = 0; i < CNT; i++) {
    // det er nemt at arbejde med p frem for flakes[i] hele tiden og igen
    Particle p = flakes[i];
    int x = (int)p.pos.x;
    int y = (int)p.pos.y; 
    x = constrain(x, 0, width-1); 
    y = constrain(y, 0, height-1);
    int idx = y * width + x;

    pixels[idx] = FLAKECOLOR;

    p.tick();
    x = (int)p.pos.x;
    y = (int)p.pos.y; 
    x = constrain(x, 0, width-1); 
    y = constrain(y, 0, height-1);
    color c = bg[y * width + x];

    if (c != BACKGROUND) {
      flakes[i] = createFlake();
      bg[idx] = FLAKECOLOR;
    } 
    if (y > height) flakes[i] = createFlake();
  }
  updatePixels();
  smooth_snow();
}

boolean isEmpty(int x, int y) {
    if (x < 0 || x >= width)
	return false;
    if (y < 0 || y >= height)
	return false;
    return bg[y * width + x] == BACKGROUND;
}

void setBG(int idx, color c) {
    bg[idx] = c;
    updates[idx] = frameCount;
}

void smooth_snow() {
    
    for(int y = 0; y < height; y++) {
	for(int x = 0; x < width; x++) {
	    int idx = y * width + x;
	    if (FLAKECOLOR != bg[idx]
		|| updates[idx] == frameCount) 
		continue;

	    int next_idx = idx;
	    float p = random(0,1);	    
	    //fall if possible
	    if (isEmpty(x, y+1)) {
		setBG(idx, BACKGROUND);
		//perhaps move sideways
		if ( p > .8) {
		    if (p > .9 && isEmpty(x+1, y+1))
			next_idx++;
		    else if (isEmpty(x-1, y+1))
			next_idx--;
		}
		next_idx += width;
		setBG(next_idx, FLAKECOLOR);
		continue;
	    }

	    //roll if possible
	    boolean leftEmpty = isEmpty(x-1,y+1);
	    boolean rightEmpty = isEmpty(x+1,y+1);
	    if (leftEmpty || rightEmpty) {
		setBG(idx, BACKGROUND);
		next_idx += width;
		if (leftEmpty ^ rightEmpty) {
		    next_idx += (rightEmpty ? 1 : -1);
		} else {
		    next_idx += (random(0,1)>.5 ? 1 : -1);
		}
		setBG(next_idx, FLAKECOLOR);
		continue;
	    }

	    //avoid pyramids
	    //by perhaps move sideways
	    if ( p > .8) {
		if (p > .9 && isEmpty(x+1, y)) {
		    next_idx++;
		} else if (isEmpty(x-1, y)) {
		    next_idx--;
		} else
		    continue;
		setBG(idx, BACKGROUND);
		setBG(next_idx, FLAKECOLOR);
		
	    }

	}
    }
}

void mousePressed() {
  snow_init();
}


