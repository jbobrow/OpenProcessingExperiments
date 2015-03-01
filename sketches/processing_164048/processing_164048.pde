
void setup(){
 size(1920, 1020);
  background(0,0,0);


}

void draw(){
  fill(200, 170);
  
  
  
  
  int xVal = mouseX;
  int yVal =mouseY;
  println("Mouse x value is " +xVal + " and mouse Y value is " + yVal);
ellipse(mouseX, mouseY, 100, 100);

}

