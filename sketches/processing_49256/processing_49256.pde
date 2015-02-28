
import processing.opengl.*;

int pick;

void setup() {
  size(800,800,JAVA2D);
  background(255);
  smooth();
}

void draw() {
  if(pmouseX != mouseX || pmouseY != mouseY) {
    stroke(color(random(0,255),random(0,255),random(0,255)));
    //fill(color(random(200,255)));
    pick = int(random(8));
    println(pick);
    if(pick == 0) {
      rect(mouseX, mouseY, random(4,16), random(4,16));
    } else {
      ellipse(mouseX, mouseY, random(16,48), random(16,48));
    }
  }
}

void keyPressed() {
  if (key == 'c') {
     background(255);
  }
}
  

