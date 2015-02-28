
size(600,300);

float space = 10;
float y = height / 2;

for(float x = 0; x < width; x = x + space){
  line(x,y,x,y + random(-50,50));
}

