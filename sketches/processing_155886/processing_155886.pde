
float pMouseX;
float pMouseY;

float mouseXDiff;
float mouseYDiff;
float diff;

color triangleColor;

float triangleColorR;
float triangleColorB;
float triangleColorG;

void setup (){
  size(600,600);
  triangle(150, 125, 300, 250, 450, 600);
  triangle(150, 125, 500, 15, 35, 75);
  triangle(150, 125, 35, 75, 580, 420);
  
  triangleColorR = 25;
  triangleColorG = 205;
  triangleColorB = 115;
  
  triangleColor = color(triangleColorR, triangleColorG, triangleColorB);
}
void draw(){
  
  mouseXDiff = abs(mouseX - pMouseX);
  mouseYDiff = abs(mouseY -pMouseY);
  
  diff = (mouseXDiff + mouseYDiff) + 20;
  
  //why isn't this working?//
  triangleColor = color(triangleColorR, triangleColorG, triangleColorB);
  
  triangleColorR = (triangleColorR + 1);
  triangleColorG = (triangleColorG + 1); 
  triangleColorB = (triangleColorB + 1);
  
  float backgroundColor = map(mouseX, 80, width, 50, 80); 

  background(backgroundColor);
  
  noStroke();
  fill(205, 114, 180);
  triangle(150, mouseY, 300, 250, mouseX, 600);
  fill(130, 160, 50);
  triangle(150, 125, mouseX, 15, 35, mouseY);
  fill(70, 30, 90);
  triangle(mouseX, mouseY, 35, 75, 580, 420);
  fill(50, 80, 100);
  triangle(mouseX, 85, 100, 340, mouseY, 500);
  fill(230, 190, 10);
  triangle(100, 85, mouseX, 340, mouseY, 500);
  
  pMouseX = mouseX;
  pMouseY = mouseY; 
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    } 
  }

}


