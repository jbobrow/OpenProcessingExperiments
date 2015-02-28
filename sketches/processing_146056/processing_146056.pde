
float Space= 1;

void setup() {
  size(500,500);
  background(250);
  loop();
}
 
void draw() {
  fill(mouseX,0, mouseY);
  stroke(mouseX, 200, mouseY);
  strokeWeight(.7);
  line(Space, Space, mouseX,mouseY);
   
  Space = Space+1;
  if ( Space == width ){ 
    Space = 1;
  }
}



