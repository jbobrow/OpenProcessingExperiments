

size(400, 400);
background(255);
stroke(0);

float xPos = width/6;
float xPos2 = width/6 + 60;
float space = 10;

while(xPos2 <= 5*width/6){
  line(xPos2, width/6, xPos, 5*width/6);
  xPos = xPos + space;
  xPos2 = xPos2 + space;
}

