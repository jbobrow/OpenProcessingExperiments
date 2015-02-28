
int a=70;

void setup()
{
  smooth();
  size(400, 400);
}

void draw() {
  noStroke();

  fill(242, 250, 187, 10);
  rect(0, 0, width, height);

 // stroke(242, 250, 187);
 // randomSeed (a);

  for (int x = 0; x<= 400; x = x + 100) { 
    for (int y = 0; y<= 400; y = y + 100) {
      if (dist(x, y, mouseX, mouseY) <=35) {
        fill(139, 216, 242, 20);
        if (mousePressed) {
          float r = map(a, 0, 200, 0, 255);
          fill(r, r*0.8, r/2);
          ellipse(x, y, a, a);
          a=a+1;
        }
      }
      else {
        fill(250, 187, 187, 20);
      }
      ellipse(x, y, 70, 70);
    }
  }
}

				
