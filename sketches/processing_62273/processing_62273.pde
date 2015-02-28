
size(600,300);

smooth();

float space = 1;
float y = height;

stroke(0,75);

for(float x = 0; x < width; x = x + space){
  float y2 = y - random(100,250);
  float x2 = x + random(-45,45);
  line(x,y,x2,y2);
  ellipse(x2,y2,5,5);
}

