
float xPosition = 0; // Position variable 
float yPosition =100;

void setup() {   //Static things, such as background
  
  size(400,200);
  background(93, 14, 137);
  
}

void draw() {   // Stuff that happens over and over again, moving etc
  {
  
  background(93, 14, 137);   
  ellipse(xPosition,yPosition,50,50);    // x/y/height/width
  if(mousePressed)
  xPosition = xPosition + 3;
  } 
  
}
