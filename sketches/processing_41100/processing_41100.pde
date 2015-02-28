
void setup() {
  size (600, 600);
  background(190);
  noStroke ();
  smooth();
}


float size; 
 
void draw (){
 float seed = random(size);
 if (mousePressed) {
   size+=0.1;
   fill(255, mouseX, mouseY);
   ellipse(mouseX, mouseY, size, size);
   for (int i=0; i<1000; i++) {
     ellipse(mouseX+tan(random(size)), mouseY+tan(random(size)), seed, seed);
   }
 } else {
   size = 0;
 }
}


