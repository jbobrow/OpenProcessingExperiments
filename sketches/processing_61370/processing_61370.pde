

size(400, 400);
background(255);
stroke(0);

float yPos = height/6;
float yPos2 = height/6 + 60;
float space = 10;

while(yPos2 <= 5*height/6){
  line(height/6, yPos2, 5*height/6, yPos);
  yPos = yPos + space;
  yPos2 = yPos2 + space;
}



