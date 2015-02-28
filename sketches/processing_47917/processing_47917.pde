
// Max antal fnug på skærmen ad gangen.
int CNT = 200000;

// Hvor hurtigt kommer der nye fnug
float SPEED = 10.0;
boolean visPil = false;

int option = 3;

int[] sizeWidth  = new int[] {
  800, 1024, 1280, 600
};
int[] sizeHeight = new int[] {
  600, 768, 720, 400
};

String[] backgroundImageFile = new String[]
{
  "osaa3-800x600-SVGA.png", 
  "osaa3-1024x768-XGA.png", 
  "osaa3-1280x720-standard-HD.png",
  "osaa3-800x600-SVGA.png"

};


long lastFrameCount = 1;

int snowPause = (int)(SPEED < 1 ? 1/SPEED : 1);

final color BACKGROUND = color(0);
final color FLAKECOLOR = color(255, 255, 255);

ArrayList<Particle> flakes;
Particle[] reflakes;


int[] bg;
int[] updates;

PImage img = createImage(sizeWidth[option], sizeHeight[option], RGB);

void setup() {
  //  size(1280, 720, P2D);
  // size(sizeWidth[option], sizeHeight[option], P2D);
  //img = loadImage(backgroundImageFile[option]);
  size(600, 400, P2D);
  img = loadImage("osaa3.png");
  snow_init();
}

void snow_init() {

  bg = new int[width * height];
  updates = new int[width * height];
  loadPixels();
  background(BACKGROUND);
  image(img, 0, 0, sizeWidth[option] + 1, sizeHeight[option] + 1);

  flakes = new ArrayList<Particle>(CNT);
  for (int i = 0; i < SPEED; i++) {
    flakes.add( createFlake() );
  }

  arrayCopy(pixels, bg);
  updatePixels();
}

Particle createFlake() {
  Particle p = new Particle(random(0, width), random(-50, -10));
  p.vel = new PVector(random(-2, 2), random(0, 1));
  p.acc = new PVector(0, random(.1, .1));
  return p;
}


// Bliver kaldt når fnug bliver reset, fx når de rammer noget.
Particle createFlake(float x, float y) {
  Particle p = new Particle(x, y);
  p.vel = new PVector(random(-0, 0), random(0, 1));
  p.acc = new PVector(random(-.05, .05), random(.1, .1));
  return p;
}


void draw() {
  loadPixels();
  arrayCopy(bg, pixels);


  if (frameCount - lastFrameCount > snowPause) {
    int allow = CNT - flakes.size();
    for (int i = 0; i < min(SPEED*snowPause, allow); i++ ) {
      flakes.add( createFlake() );
    }
    lastFrameCount = frameCount;
  }

  for (int i = 0; i < flakes.size(); i++) {
    // det er nemt at arbejde med p frem for flakes[i] hele tiden og igen
    Particle p = flakes.get(i);
    int x = (int)p.pos.x;
    int y = (int)p.pos.y; 
    x = constrain(x, 0, width-1); 
    y = constrain(y, 0, height-1);
    int idx = y * width + x;

    if ( (int)p.pos.y >= 0) {
      pixels[idx] = FLAKECOLOR;

      //Vis pil?
      if (visPil) {
        p.displayVector();
      }
    }

    p.tick();
    x = (int)p.pos.x;
    y = (int)p.pos.y; 
    x = constrain(x, 0, width-1); 
    y = constrain(y, 0, height-1);
    color c = bg[y * width + x];

    if (c != BACKGROUND) {
      flakes.remove(i);
      //resetFlake(i);
      bg[idx] = FLAKECOLOR;
    }

    if ( (int)p.pos.y > height) {
      flakes.remove(i);
      //resetFlake(i);
      //setBG(idx-width, FLAKECOLOR);
    }
  }
  updatePixels();
  smooth_snow();
}

boolean resetFlake(int i) {
  flakes.remove(i);
  if (flakes.size() < CNT) {
    flakes.add( createFlake() );
    return true;
  }
  return false;
}

boolean lineIsFilled(int idx, int x, int sized) {
  int minX = idx - x + constrain(x - sized, 0, width);
  int maxX = idx - x + constrain(x + sized, 0, width);
  for (int i = minX; i < maxX; i++) {
    if (bg[i] != BACKGROUND) return false;
  }
  return true;
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


  //    for(int y = height-1; y >= 0; y--) {
  //	for(int x = width-1; x >= 0; x--) {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int idx = y * width + x;
      if ( bg[idx] != FLAKECOLOR
        || updates[idx] == frameCount) 
        continue;

      int next_idx = idx;
      //fall if possible
      if (isEmpty(x, y+1)) {
        //next_idx += width;
        setBG(idx, BACKGROUND);
        if (y+1 < height)
          flakes.add(createFlake(x, y+1));
        continue;
      }

      //roll if possible
      boolean leftEmpty = isEmpty(x-1, y+1);
      boolean rightEmpty = isEmpty(x+1, y+1);
      if (leftEmpty || rightEmpty) {
        setBG(idx, BACKGROUND);
        next_idx += width;
        if (leftEmpty ^ rightEmpty) {
          next_idx += (rightEmpty ? 1 : -1);
        } 
        else {
          next_idx += (random(0, 1)>.5 ? 1 : -1);
        }
        setBG(next_idx, FLAKECOLOR);
        continue;
      }

      //avoid pyramids
      //by perhaps move sideways
      float p = random(0, 1);	    
      if ( p > .8) {
        if (p > .9 && isEmpty(x+1, y)) {
          next_idx++;
        } 
        else if (isEmpty(x-1, y)) {
          next_idx--;
        } 
        else
          continue;
        setBG(idx, BACKGROUND);
        setBG(next_idx, FLAKECOLOR);
      }
    }
  }
}



void mousePressed() {
  //snow_init();
}

void keyPressed() {
  if ( keyCode == UP) {
    SPEED *= 1.25;
  }
  if ( keyCode == DOWN) {
    SPEED *= 0.8;
  }

  if ( key == 'r' || key == 'R' ) {
    snow_init();
  }
}




