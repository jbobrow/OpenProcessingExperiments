
size(600,300);

float space = 10;
float y = height / 2;

for(float x = 0; x < width; x = x + space){
  float y2 = y - random(150);
  float x2 = x + random(-50,50);
  line(x,y,x2,y2);
}

