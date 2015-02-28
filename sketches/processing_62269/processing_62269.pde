
size(600,300);

float space = 10;
float y = height / 2;

for(float x = 0; x < width; x = x + space){
  line(x,y + random(-150,150),x,y + random(-50,50));
}


