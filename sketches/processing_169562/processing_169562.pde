

/* @pjs preload="dolorosa.png"; */

PImage  mg;

void setup() {
  size (500, 500);

}

void draw() {
  
 
  background(random(500), random(0), 0);

  int i = 0;

  while (i<500) {
    stroke(random(500), random(0), 0);
    line(mouseX, mouseY, 0, i);
    line(mouseX, mouseY, i, 0);
    line(mouseX, mouseY, 500, i);
    line(mouseX, mouseY, i, 500);


    i=i+8;
     PImage mg = loadImage("dolorosa.png");
    image(mg, mouseX-95, mouseY-60);
  noCursor();
  }
}



