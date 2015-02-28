
PImage house;
PImage img;
PFont font;

float angle = 0.0;
float offset = 10;
float scalar = 20;
float speed = .5;
int cubex = 100;
int cubey = 320;
float cubeangle = 0.0;
float smokescalar = 1;
float smokeangle = 0.0;
int scalecount = .2;

void setup(){
  size(800, 400);
  img = loadImage("Background.jpg");
  house = loadImage("House.gif");
  font = loadFont("AngsanaNew-48.vlw");
  textFont(font);
  smooth();
}

void draw(){
  
  image(img, 0, 0);
  
  textSize(24);
  text("Left and Right arrows move house, Up arrow creates smoke", 50, 50);
  
  float x = mouseX + cos(angle) * scalar;
  float y = mouseY + sin(angle) * scalar;
  ellipse(x, y, 10, 10);
  angle += speed;
  
  
  if (keyPressed){
    if (key == CODED) {
      if (keyCode == LEFT) {
        cubex = cubex - 3;
        if (cubex < -25){
          cubex = width +25;
        }
      } 
      else if (keyCode == RIGHT) {
        cubex = cubex + 3;
        if (cubex > width + 25){
          cubex = -25;
        }
      }
      else if (keyCode == UP) {
        smokescalar = sin(cubey) + scalecount;
        scalecount +=.2;
        if (scalecount > 10) {
          scalecount = .2;
        }
      }       
    }
  }
  
  image(house, cubex, 320);
  pushMatrix();
  translate(cubex + 10, 320);
  scale(smokescalar);
  ellipse(-2, -20, 20, 10);
  smokeangle += .1;
  popMatrix();
  
  translate(750, 50);
  rotate(cubeangle);
  rect(0, 0, 20, 10);
  cubeangle +=0.1;  
}



