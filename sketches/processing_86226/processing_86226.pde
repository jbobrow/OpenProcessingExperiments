
//The program demonstrates usage of While loop
//in a short code.


//EllipseS movement mechanism values

  float incrementXCoor = 0;
  float incrementYCoor = 0;
  float incrementWidth = 0;
  float incrementHeight = 0;
  
  float valueToIncreaseX = random(1,5);
  float valueToIncreaseY = random(1,5);
  
  float valueToIncreaseWidth = random(1,3);
  float valueToIncreaseHeight = random(1,2);
  
//Ellipse Center Coordinates
  float elCenterCoorX = 50+ incrementXCoor;
  float elCenterCoorY = 50+ incrementYCoor;
//Ellipse Size Values
  float elWidth= 40+ incrementWidth;
  float elHeight = 40+ incrementHeight;
//Ellipse farest points Coordinates to control
  float elTopPointY = (elCenterCoorY - elHeight/2);
  float elLeftPointX = (elCenterCoorX - elWidth/2);   
  float elBottomPointY = (elCenterCoorY + elHeight/2); 
  float elRightPointX = (elCenterCoorX + elWidth/2);   

void setup() {
  size(300, 300);
  colorMode(HSB);
  background(random(256), random(50, 100), random(50, 100));

  frameRate(60);
}

void draw() {
  //background(0);
  drawEllipse();  
  fadeEffect();
  prepareNextFrame();
}

void drawEllipse() {
  noFill();
  stroke(255);
  ellipse(elCenterCoorX, elCenterCoorY, elWidth, elHeight);
}

void fadeEffect() {
 fill(0,10);
 rect(0,0,width,height); 
}

void prepareNextFrame() {
  changeEllipseValues();
  restrictEllipseWithinBorder();
}

void changeEllipseValues() {
  changeCoordinateValues();
  changeSizeValues(); 
}


//changes the ellipses center coordinates values
void changeCoordinateValues() {
  incrementXCoor = incrementXCoor + valueToIncreaseX;
  incrementYCoor = incrementYCoor + valueToIncreaseY;

  elCenterCoorX = 50+ incrementXCoor;
  elCenterCoorY = 50+ incrementYCoor;
}

//changes the ellipses size values
void changeSizeValues() {
  incrementWidth = incrementWidth + valueToIncreaseWidth;
  incrementHeight = incrementHeight + valueToIncreaseHeight;
  
  elWidth= 50+ incrementWidth;
  elHeight = 50+ incrementHeight;
}

void restrictEllipseWithinBorder() {
   elTopPointY = (elCenterCoorY - (elHeight/2));
   elLeftPointX = (elCenterCoorX - (elWidth/2));   
   elBottomPointY = (elCenterCoorY + (elHeight/2)); 
   elRightPointX = (elCenterCoorX + (elWidth/2));   
   
  if (elLeftPointX < 0 || elRightPointX > 300) {
    valueToIncreaseX = -valueToIncreaseX;
    valueToIncreaseWidth = -valueToIncreaseWidth;
    }
  if (elTopPointY < 0 || elBottomPointY > 300){
    valueToIncreaseY = -valueToIncreaseY;
    valueToIncreaseHeight = -valueToIncreaseHeight;
  }
}




