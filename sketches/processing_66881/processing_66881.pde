
float xb = mouseX + 10 ;
float yb = mouseY + 10;
float xc = mouseX + 3;
float yc = mouseY + 3;

void setup(){
  size(500, 500);
  background(100, 200, 0);
  noStroke();
  frameRate(60);
  smooth();
}
void draw(){

}

void mouseDragged(){
  triangle(mouseX, mouseY, xb, yb, xc, yc);
}


