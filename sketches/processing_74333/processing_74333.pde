
PImage a; 

void setup() {
  size(500, 333);
  
  a = loadImage("2090259627_49e9d02942.jpg");
}

void draw() {
  background (a);
  image(a, 0, 0, mouseX, mouseY); 
 
 
  
}

