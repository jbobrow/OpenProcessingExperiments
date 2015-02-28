
size(1200, 800);
background(255);


int numRects = 800;
float maxWidth = 8;
float maxAlpha = 130;
float minAlpha = 20;
//float x = 0;
float xxx = 0;
float yyy= 0 ;

for (int i=0; i<numRects; i++) {
  float vertOffset = random(120);
  float x = random(width) - 100;
  float y = random(height) - 66;
  float w = (x+y) / 5;
  float h = w;
  float xx = x + w/2;
  float yy = y + h/2;
  if (xxx != 0) {
  stroke(55);
  strokeWeight(.5);
  line(xx, yy, xxx, yyy);
  noStroke();
  }
  xxx = xx;
  yyy = yy;

  
  float r = random(100, 255);
  float g = random(minAlpha+40, maxAlpha-20);
  float b = random(20);
  float a = random(minAlpha+40, maxAlpha * (x+y)/600);
  fill(r, g, b, a);
  noStroke();
  rect(x, y, w, h);
}



