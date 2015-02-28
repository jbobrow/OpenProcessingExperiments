

size(400, 400);
background(255);
stroke(0);

float yPos = height/5;
float space = 10;

while(yPos <= 4*height/5){
  line(height/5, yPos, 4*height/5, yPos);
  yPos = yPos + space;
}

