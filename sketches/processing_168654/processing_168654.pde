
import netscape.javascript.*; 

Caterpillar cater;
PImage flowers;
PImage bg;


void setup() {
  size(800, 600);  
  flowers = loadImage("rose2.png");  
  bg = loadImage("redrose.png");
  bg.resize(800,600);
  flowers.resize(800, 600);
    cater = new Caterpillar (300, 300);

}

void draw() {
  
  loadPixels();
  flowers.loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y*width;
      
      float r = red(flowers.pixels[loc]);
      float g = green(flowers.pixels[loc]);
      float b = blue(flowers.pixels[loc]);
      float adjustBrightness = map(mouseX, 100, 700, 0.0, 8.0);
      
      r *= adjustBrightness;
      r = constrain(r, 0, 255);
    
      pixels[loc] = color(r, g, b);
    
    }
  }
  updatePixels();
  image(bg, 0, 0);
  cater.show();
  cater.move();
   if (keyPressed) {
      cater.toggleRun();
  }
}

PImage fireflies;

class Caterpillar {

  PVector pos;
  float heading;
  boolean run;
  float panicHeading;

  Caterpillar (float x, float y) {
    pos = new PVector(x, y);
    heading = random(0, 3.14159*2);
   
    fireflies = loadImage("firefly.png");
    fireflies.resize(40, 40);

  }

  void setPosition(float x, float y) {
    pos.x = x;
    pos.y = y;
    
  }

  void move () {
    PVector move;
    if (!run) {
     move = new PVector(random(1, 7), 0);
    heading = heading + random(-.4, .4);
    move.rotate(heading);
    pos.x = pos.x + move.x;
    pos.y = pos.y + move.y;
    } else {
       move = new PVector(random(7, 100), 0);
      panicHeading = panicHeading + random(-.10, .10);
      move.rotate(panicHeading);
      pos.add(move);
      
      }
      
      
    pos.x = constrain( pos.x,-20, width-20);
    pos.y = constrain(pos.y, -20, height-20);
  }
  
    void toggleRun() {
    run = !run;
  }


  PVector getPosition() {
    return pos;
  }

  void show() {
    noStroke();
    fill(random(255));
    ellipse(pos.x+27, pos.y+23, 17, 17);
    stroke(0);
    image(fireflies, pos.x, pos.y);
 
    
    pos.x = constrain(pos.x, 0, width-1);
    pos.y = constrain(pos.y, 0, height-1);
  }
   void be(float x, float y) {
   image(fireflies, x, y);
   ellipse(x+30, y, 30, 30);
  }
}


