
size(600,300);

float space = 10;
float y = height / 2;

for(float x = 0; x < width; x = x + space){
  float y1 = y + random(-50,50);
  float y2 = y1 + random(150);
  line(x,y1,x,y2);
}

