
PImage gui;
float posX;
float posY;
int scale = 200;
int diameter = 30;
float r = 0;
float g = 0;
float b = 0;
int change = 5;

void setup() {
  size(800, 600);
  background(255);
  gui = loadImage("gui.jpg");

  imageMode(CENTER);
  image(gui, width/2, height/2); // normal coordinates for center before translate

  fill(0);
  textAlign (CENTER);
  text("Use arrow keys", width/2, height/2);
}

void draw() {
  pushMatrix();  
  posX = sin(frameCount/float(500))*scale;
  posY = cos(frameCount/float(500))*scale;
  translate(width/2, height/2);
  rotate(frameCount/float(100));
  //rotate(radians(frameCount/float(100)));
  println(frameCount);
  smooth();
  fill(r, g, b);
  ellipse(posX, posY, diameter, diameter);
  popMatrix();

  if (keyPressed) {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        diameter += change;
        break;
      case DOWN:
        diameter -= change;
        break;
      case LEFT:
        r = random(0, 127);
        b = random(0, 127);
        g = random(0, 127);
        break;
      case RIGHT:
        r = random(0, 255);
        b = random(0, 255);
        g = random(0, 255);
        break;
      }
    }
  }
}


