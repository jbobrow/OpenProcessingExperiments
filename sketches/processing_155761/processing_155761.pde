
float planetPosX; 
float planetPosY; 
float planetWidth;
float planetHeight;
color planetColor; 
color moonColor; 

float planetColorR; 
float planetColorG;
float planetColorB;

float pMouseX; 
float pMouseY; 

float mouseXDiff; 
float mouseYDiff; 
float diff; 

void setup() {
  size(600,600); 
  planetPosX = -100; 
  planetPosY = height/2;
  
  planetColorR = 25;
  planetColorG = 205;
  planetColorB = 115;
  
  planetColor = color(planetColorR, planetColorG, planetColorB);
  moonColor = color(150);
  
  //frameRate(10); 
}


void draw() {
  
  mouseXDiff = abs(mouseX - pMouseX);
  mouseYDiff = abs(mouseY - pMouseY); 
  
  diff = (mouseXDiff + mouseYDiff) + 30;
  
  planetWidth = 200 + sin(frameCount * 0.1) * 30;
  planetHeight = planetWidth; //200 + cos(frameCount * 0.1) * 20; 
  
  planetColor = color(planetColorR, planetColorG, planetColorB);
  
  //exactly the same operation
  //planetColorR = planetColorR + 1; 
  //planetColorR += 1;
  //planetColorR ++; 
  //planetColorG --;
  //planetColorB *= 0.99; 
  
  planetColorR = (planetColorR + 1) % 255;
  planetColorG = abs((planetColorG + 1) % 150); 
  planetColorB = (planetColorB + 1) % 255;
  //println("R: " + planetColorR + " G: " + planetColorG + " B: " + planetColorB);
  
  planetPosX = (planetPosX + 1) % (width + planetWidth/2);
  
  //float backgroundColor = map(diff, 0, 100, 0, 255);
  float backgroundColor = map(mouseX, 0, width, 0, 255); 
  //println("mouseX is " + mouseX + " and mouseY is " + mouseY); 
  
  background(backgroundColor); 
  
  
  
  noStroke(); 
  fill(planetColor);
  ellipse(planetPosX,planetPosY,planetWidth,planetHeight);
  fill(moonColor); 
  //draw moon
  ellipse(mouseX,mouseY,diff,diff);
  fill(planetColor);
  ellipse(planetPosX + 150, planetPosY+ 100, planetHeight/2, planetWidth/2);
  
  
  
  println(diff); 
  
  pMouseX = mouseX;
  pMouseY = mouseY; 
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame(); 
    }
  }
  
  
  
}


