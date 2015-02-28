
float x = 0;
void setup() {
  size(400, 400);
  background(100,255);
  //background(0,0,random(255));
  noStroke();
}

void draw() {
   while (x < width) {
     
    float y = 0;
    while (y < height) {
      fill(random(0,255));
      rect(x, y, 40, 35);
      ellipse(x,y,10,10);
      stroke(220,255);
      line(x,y,10,10);
      y= y + 40;
    }

  x = x + 40;
  }
}

