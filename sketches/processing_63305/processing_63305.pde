
size(400, 400);

float space =  5;

background(255);
smooth();

for (float y = 0; y < height; y = y + random(0,50)) {
  for (float x = 0; x < width; x = x + random(0,50)) {
   noStroke();
    fill(random(255),random(255),random(255));
    ellipse(x, y,10,10);
 
  }
}


//saveFrame("3.2.png");


