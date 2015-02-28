
// Math 4: Random
// Create a composition using a for structure and random() to make a different dense composition every time the program is run.

void setup() {
  size(800,600);
}

void draw() {
  background(255);
  
  float x = mouseX;
  float y = mouseY;

  noFill();
  for (int a = 50; a <= 800; a += 70) {
    for (int b = 50; b <= 800; b += 90) {
      float r = random(300,500);
      float c = norm(r,0,255);
      float colorX = norm(x,0,255);
      float colorY = norm(y,0,255);
      stroke(c);
      ellipse(r,r,a,b);
      stroke(x,c,y);
      line(r,0,r,height);
      line(0,r,width,r);
    }
  }
}


