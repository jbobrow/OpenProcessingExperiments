
float x = 0;

void setup() {
  size(400, 400);
  //noLoop();
  background(255);
  smooth();
}

void draw() {
  translate(mouseX, mouseY);
  x = x+2;

  rotate(radians(x));
 
  line(200, 100, 200, 80-x); 

}



