

size(400, 400);
background(255);
stroke(0);

float space = 20;

for(
  float yPos = 50;
  yPos <= height - 50;
  yPos = yPos + space
  ){
  line(50, yPos, width/2, yPos);
  yPos = yPos + space;
  }

for(
  float yPos = 50 + space;
  yPos <= height - (50 - space);
  yPos = yPos + space
  ){
  line(width/2, yPos, width - 50, yPos);
  yPos = yPos + space;
  }



