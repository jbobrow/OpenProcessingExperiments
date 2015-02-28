
/*
a magic disappearing box!
cittavritti@shaw.ca
june 2009
*/


void setup() 
{
  size(500, 500);  
  stroke(255);    
  noLoop();
}

float rectx = 30;
float recty = 30;
float posx = 235;
float posy = 235;
float redTint = 0;
float blueTint = 255;

void draw() 
{ 
  background(255, 255, 0);
  recty = recty + 4; 
  rectx = rectx + 4;
  
  posx = posx - 2;
  posy = posy -2;
  
  redTint = redTint + 3;
  blueTint = blueTint -5;
  
  noStroke();
  fill(redTint, 255, blueTint);
  rect(posx, posy, rectx, recty);  
  
  
} 

void mousePressed() 
{
  redraw();
}


