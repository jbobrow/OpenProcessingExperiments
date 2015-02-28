
size(800,300);
smooth();
background(0);

float space = 10;
 
strokeWeight(random(3,30));
stroke(255); 
 
for (float y = 0; y <= height; y = y + random(0,50) + space) {
  for (float x = 0; x <= width; x = x + random(7,14) + space) {
    point(x,y);
  }
}


