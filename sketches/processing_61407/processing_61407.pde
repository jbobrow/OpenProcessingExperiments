
size(400, 400);
smooth();
background(255);
stroke(0);
strokeWeight(15);

float space = width/11;

for(
  float x = width/11;
  x <= 10*width/11;
  x = x + space
  ){
    for (
    float y =width/11;
    y <= 10*height/11;
    y = y + space
    ){
    
    point(x,y);
    }
  }

