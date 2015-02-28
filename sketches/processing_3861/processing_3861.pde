

void setup() 
{
  size(800, 400); 
  noStroke();
  colorMode(#FF0303);
  rectMode(CENTER);
}

void draw() 
{   
  background(#000000); 
  fill (#E80707);
  rect(mouseX, height/5, mouseY/4+10, mouseY/5+10);
  fill (#0726E8);
  rect(mouseX, height/2, mouseY/4+10, mouseY/4+8);
  fill (#07E808);
  rect(mouseX, height/3.5, mouseY/3+10, mouseY/3+10);
  fill (#E8A107);
  rect(mouseX, height/4, mouseY/5+10, mouseY/6+10);
  fill (#B607E8);
  rect(mouseX, height/1.5, mouseY/6+10, mouseY/8+10);
  fill (#DDBDE8);
  rect(mouseX, height/6, mouseY/7+10, mouseY/7+10);
  fill (155, 80);
  rect(mouseX, height/3, mouseY/4+10, mouseY/7+10);
  
  
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}


