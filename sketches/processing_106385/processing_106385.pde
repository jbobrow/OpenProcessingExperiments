
Particle[] p = new Particle[40];

void setup() {
  size(800, 600);
  for (int i=0;i<p.length;i++) {
    p[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(255);
  for (int i=0;i<p.length;i++) {
    p[i].advance();
  }
}

class Particle {
  float x= 0;
  float y= 0;

  float xChange=0;
  float yChange=0;
  color c;

  public Particle(float x, float y) {
    this.x=x;
    this.y=y;
    c = color(random(100,255),random(100,255),random(100,255),155);
  }
  public void advance() {
    fill(c);
    noStroke();
    ellipse(x, y, 20, 20);  

    stroke(c);
    noFill();
    ellipse(x,y,100,100);
    
    
    if (dist(mouseX, mouseY, x, y) < 50) {
      float xDist = mouseX-x;
      float yDist = mouseY-y;
      float maxA = 20;
      xChange = map(xDist, -100, 100, -maxA, maxA);
      yChange = map(yDist, -100, 100, -maxA, maxA);
      x+=xChange;
      y+=yChange;
    }
    else if (mousePressed) {

      float xDist = mouseX-x;
      float yDist = mouseY-y;
      float maxA = 30;
      xChange = map(xDist, -width, width, -maxA, maxA);
      yChange = map(yDist, -height, height, -maxA, maxA);
      x+=xChange;
      y+=yChange;
    }
    else {
      x+=random(-3, 3);
      y+=random(-3, 3);
    }

    if (x > width) {
      x=0;
    }
  }
}
