
size(400, 400);

float space =  5;

background(255);
smooth();

for (float y = 0; y < height; y = y + random(0,2)) {
  for (float x = 0; x < width; x = x + random(0,50)) {
    strokeWeight(5);
    stroke(0);
    point(x, y);
 
  }
}


//saveFrame("3.2.png");


