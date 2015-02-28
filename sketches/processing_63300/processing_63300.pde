
size(400, 400);

float space = 5;

background(255);
smooth();

for (float y = 0; y < height; y = y + random(0,50)) {
  for (float x = 0; x < width; x = x + random(0,50)) {
    strokeWeight(5);
    stroke(0);
    
    float bx= x;
    
    if (random(5) < 10) {
      bx = bx - 30;
    }
    else {
      bx = bx + 5;
    }

    ellipse(x, y,random(0,20),random(0,20));
 
  }
}


//saveFrame("3.3b.png");


