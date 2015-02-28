
PImage suburbs;
PImage batman;
PImage men;
PImage plane;

  
void setup() {
  size(450, 500);
  suburbs = loadImage("suburbs.png");
  batman = loadImage("batman.png");
  men = loadImage("pugil.png");
  plane = loadImage("plane.png");
  frameRate(2);
}
  
void draw() {
  background(255);
  float x = random(width/2);
  float y = random(height/2);
  float d = random(300, 200);
  image(suburbs, x+10, y-60, d,d);
  image(batman, x*3, y-200);
  image(men, x+y, y);
  image(plane, -5, y+10, d, d);
}


