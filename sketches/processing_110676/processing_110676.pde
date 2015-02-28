
//First sketch by Dean Taylor 20/09/2013

void setup () {
  size(800, 800);
  background(0);
}

void draw() {
 }
void mouseDragged() {
  stroke(random(128), mouseY, random(128), mouseX);
  for(int i=0; i<30; i++){
      ellipse(mouseX, mouseY, random(25), random(25));
   }
}


