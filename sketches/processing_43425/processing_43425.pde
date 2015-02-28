
// PIXELS ON SAFARI

PImage ss;
PImage s2;

int sw;
int sh;
color c;
color c2;

// declare our class and array count
Safari[] dots;
int hunters = 10000;

// the full array is 400x400
color[] colorArray = new color[160000];

boolean click = false;
int moveCount = 0;

void setup(){
  size(400, 400);
  background(0);
  smooth();
  
  s2 = loadImage("tiger.png");     // this is the image we show
  ss = loadImage("tigerflip.png"); // this is the image we sample
  ss.loadPixels();

  sw = ss.width;
  sh = ss.height;

  int count = 0;
  for (int y=0; y<sh; y++){
    for(int x=0; x<sw; x++){
      color c = getColorAtXYFromImage(x, y, ss);
      colorArray[count] = c;
      count++;
    }
  }

  dots = new Safari[hunters];
  for (int i=0; i<hunters; i++) {
    // since there are fewer hunters than pixels, we need a good sampling of colors
    int averagedIndex = i * (int)Math.floor(((int)sw*(int)sh)/hunters);

    // call our new dot
    dots[i] = new Safari(random(0,width),random(0,height),random(3,9),colorArray[averagedIndex]);
  }
}

void draw(){

  // show the original image
  if (click==true)
  image(s2, 0, 0);

  // show our interpreted image
  else {

    background(0);

    // go through the dots and advance them
    for (int i=0; i<hunters; i++) {
      dots[i].render();
      dots[i].checkColor();
      dots[i].move();
    }
  }
}

class Safari {
  float px;
  float py;

  float runX;
  float runY;
  float mySize;
  color myColor;

  float vx = 0.0;
  float vy = 0.0;

  boolean on = false;
  boolean camo = false;

  Safari(float inx, float iny, float s, color c) {
    px = inx;
    py = iny;
    mySize = s;
    myColor = c;

    // set up each dot with a random velocity
    vy = random(-15,15);
    vx = random(-15,15);
  }

  void render() {
    noStroke();

    // choose the appropriate color, with a bit of transparency
    fill(red(myColor),green(myColor),blue(myColor),204);

    ellipseMode(CENTER);
    ellipse(px,py,mySize,mySize);
  }

  void move() {
    px += vx;
    py += vy;

    // pass through the screen, Atari football style
    if (px > width) px = 0;
    if (px < 0) px = width;

    if (py > height) py = 0;
    if (py < 0) py = height;
  }

  void checkColor() {
    // find the matching color for our position
    int index = (int)px*sw+(int)py;
    if (index<0) index = 0;
    if (index > sw*sh-1) index = sw*sh-1;

    c2 = colorArray[index];

    // check to see if most of the dots have found a home
    if (moveCount > hunters * .95) camo = true;

    // once a dot finds a home, turn on its camoflauge and slow it down
    if (camo || (abs(red(myColor) - red(c2)) < 5 && abs(red(myColor) - red(c2)) < 5 && abs(red(myColor) - red(c2)) < 5)) {
      vx /= 1.2;
      vy /= 1.2;
      myColor = c2;
      if (camo == false) moveCount++;
      camo = true;
    }

  }

}


color getColorAtXYFromImage(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

// cycle between the before and after images
void mousePressed() {
  click = true;
}
void mouseReleased() {
  click = false;
}

