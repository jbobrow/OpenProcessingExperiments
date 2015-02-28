

size(400, 400);
background(255);
stroke(0);

float xPos = width/5;

for(
  float space = 10;
  xPos <= 4*width/5; 
  space = space + 5
  ){
  
  line(xPos, width/5, xPos, 4*width/5);
  xPos = xPos + space;
  }



