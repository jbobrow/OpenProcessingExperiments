
int chalk = 0;


void setup() {
  size(700, 400);
  background(70,126,81);
  strokeWeight(8);
  smooth();
  stroke(244,255,224);
}

void draw() {
  if (chalk == 1) {
  line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
 void keyPressed() {
   if (key == ' ') {
     background (70,126,81);
   } 
 }

void mousePressed() {
  chalk = 1-chalk;
} 

