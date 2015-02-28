

size(400, 400);
background(255);
stroke(0);

float space = 5;

for(
  float xPos = width/5;
  xPos <= width/2 - space/2;
  xPos = xPos + space
  ){
  line(xPos, height/5, xPos, 3*height/5);
  xPos = xPos + space;
  }

for(
  float xPos = height/2;
  xPos <= 4*width/5 + space/2;
  xPos = xPos + space
  ){
  line(xPos, 2*height/5, xPos, 4*width/5);
  xPos = xPos + space;
  }





