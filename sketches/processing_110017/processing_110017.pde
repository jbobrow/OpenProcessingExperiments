
void setup() {
  
  // Background Colour and Size
  background(10, 201, 237);
  size(400, 400) ;
}

void draw(){
  
  // Small squares follow the pointer covering the trail everytime the screen/program refreshes.
  fill(10,201,237,40);
  rect(0,0,400,400);
  
  // Allows the mouse to interact with the image, creating a trail.
  for(int i=0; i<100; i++) {
    point(mouseX + random(20), mouseY + random(20)) ;
  }
}
