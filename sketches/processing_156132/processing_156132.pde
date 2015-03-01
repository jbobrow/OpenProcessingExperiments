
float pMouseX;
float pMouseY;

float mouseXDiff;
float mouseYDiff;
float diff;

color triangleColor;

float triangleColorR;
float triangleColorB;
float triangleColorG;

PImage Lilypad;

void setup (){
  size(600,600);
  Lilypad = loadImage("LilyPad.png");
  
  triangle(150, 125, 300, 250, 450, 600);
  triangle(150, 125, 500, 15, 35, 75);
  triangle(150, 125, 35, 75, 580, 420);
  
  triangleColorR = 255;
  triangleColorG = 151;
  triangleColorB = 47;
  
  triangleColor = color(triangleColorR, triangleColorG, triangleColorB);
}
 void draw(){

  
  mouseXDiff = abs(mouseX - pMouseX);
  mouseYDiff = abs(mouseY - pMouseY);
  
  diff = (mouseXDiff + mouseYDiff) + 20;
  

  triangleColor = color(triangleColorR, triangleColorG, triangleColorB);
  
  triangleColorR = (triangleColorR + 8);
  triangleColorG = (triangleColorG + 1); 
  triangleColorB = (triangleColorB + 1);
  
  float backgroundColor = map(mouseX, 80, width, 230, 280); 

  background(backgroundColor);
  
  noStroke();
  fill(triangleColor, mouseX, mouseY);
  triangle(350, 325, mouseY, 35, 250, mouseX);
  fill(232, 109, 43);
  triangle(350, 325, mouseY, 135, 500, mouseX);
  fill(255, 100, 60);
  triangle(350, 325, mouseY, 335, 100, mouseX);
  fill(232, 54, 43);
  triangle(350, 325, mouseY, 52, 135, mouseX);
  fill(255, 151, 47);
  triangle(350, 325, mouseY, 275, mouseX, 15);
  fill(255, 174, 76);
  triangle(350, 325, mouseX, 135, 540, mouseY);
  fill(233, 103, 83);
  triangle(350, 325, mouseY, 35, 400, mouseX);
  fill(255, 167, 56);
  triangle(350, 325, mouseY, 452, 135, mouseX);
  fill(255, 104, 109);
  triangle(350, 325, mouseY, 275, 200, mouseX);
  
  
 pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount * 0.1));
  image(Lilypad, 0, 0, 450, 350);
  
 
 popMatrix();
 
  pMouseX = mouseX;
  pMouseY = mouseY; 
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    } 
  }

}


