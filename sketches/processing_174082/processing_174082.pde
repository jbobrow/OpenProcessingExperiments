

int strokeLucidity=5;
int lineDensity=10;

PImage img;
float offset = 0;
float easing = 0.05;
float z=100;
float x=100;
float y=100;
boolean paused = false;


void setup() {
  size (200, 180);
  smooth(); 
  frameRate(60);
  img = loadImage("Sin título.png");

}



void draw() {
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127); 
  image(img, offset, 0);
  if (!paused) runMyCode(); 
  line (mouseX, mouseY, 100, 100);
  line (mouseX, mouseY, 200, 200);
  line (mouseX, mouseY, 300, 300);
  line (mouseX, mouseY, 400, 400);
  line (mouseX, mouseY, 500, 500);
  line (mouseX, mouseY, 600, 600);
  line (mouseX, mouseY, 700, 700);



  if (mouseX != 0 && mouseY != 0) {
    for (int i=-100; i<=width+10; i+=lineDensity) {
      smooth();
      noFill();
      if (mousePressed && mouseButton == RIGHT) {
        line (i, height, mouseX, mouseY);
        line (i, 0, mouseX, mouseY);
        stroke(0, #0D0D0C, random(0, 245), random(strokeLucidity));
      }
      
      if (mousePressed && mouseButton == LEFT) {
        ellipse (mouseX, mouseY, 100,100);
        stroke(0, #0D0D0C, random(0, 245), random(strokeLucidity));
      }
      if (keyPressed) {

        background(0);
      }
    }
  }
}



void runMyCode() { 
  x=random(width);
  y=random(height);

  if ((mouseX<width/2) && (mouseY<height/2) && (mousePressed)) {
    stroke (#0A0A0A);
    line (pmouseX, pmouseY, x, y);
  } else if ((mouseX>width/2) && (mouseY<height/2) && (mousePressed)) {
    stroke (#0A0A0A);
    line (pmouseX, pmouseY, x, y);
  } else if ((mouseX<width/2) && (mouseY>height/2) && (mousePressed)) {
    stroke (#0A0A0A);
    line (pmouseX, pmouseY, x, y);
  } else if ((mouseX>width/2) && (mouseY>height/2) && (mousePressed)) {
    stroke (#0A0A0A);
    line (pmouseX, pmouseY, x, y);
  } else {
    stroke (#0A0A0A);
    line (pmouseX, pmouseY, x, y);
  }
}




void keyPressed() {
  paused = !paused;
}


