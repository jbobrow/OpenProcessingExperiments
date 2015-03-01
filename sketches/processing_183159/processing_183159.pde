
int rectSize = 0;
int rectX = 100;
int rectY = 100;
int timeCounter = 100;
int shapeX = 200;
int shapeY = 200;
int ellipseSize = 0;
int ellipseX = 100;
int ellipseY = 100;
 
int backgroundColor = 300;
int fillColor = 200;

float rectWidth;
float rectHeight;
float ellipseDiameter;
boolean isShrinking = false;
boolean isRectangle = true;
 
void setup() {
  size(400,400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  

    rectWidth = 1;
  rectHeight = 1;
  ellipseDiameter = 1;  
}




void draw() {
if (isRectangle){
    rect(shapeX, shapeY, rectWidth, rectHeight);

  }
  else {
    ellipse(shapeX, shapeY, ellipseDiameter, ellipseDiameter);
  }
  

  if(isShrinking) {
    rectWidth--;
    rectHeight--;
    ellipseDiameter--;
    
  
    
  }
  else {
    rectWidth++;
    rectHeight++;
    ellipseDiameter++;
 
  }
  

  if (rectWidth == 300 || rectWidth == 0) {
    isShrinking = !isShrinking;
  }
  
  if (rectWidth == 0) {
    isRectangle = !isRectangle;
  }


}



