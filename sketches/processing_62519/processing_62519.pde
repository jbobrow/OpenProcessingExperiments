
size(300, 300);
smooth();
background(0);

for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    point(x,y);
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(200);
  
    strokeWeight(10);
    stroke(r,g,b,a);
  }
}


