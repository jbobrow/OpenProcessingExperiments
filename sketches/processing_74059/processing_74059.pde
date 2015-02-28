
Particle[] p = new Particle[100];


void setup() {
  size(600, 600); 

  noStroke();
  for (int i=0;i<p.length;i++) {
    p[i] = new Particle(mouseX, mouseY);
  }
}

void draw() {
  //  background(0);
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  if (mousePressed) {
    point(mouseX, mouseY);
    for (int i=0;i<p.length;i++) {
      p[i] = new Particle(mouseX, mouseY);
    }
  }

  for (int i=0;i<p.length;i++) {
    p[i].render();
  }
}

class Particle {

  float xPos=0;
  float yPos=0;
  float a=0;
  float g=0;
  float m=0;


  int counter=0;

  public Particle(float x, float y) {
    xPos = x;
    yPos = y;
    a = random(360);
    m=random(2);
    counter=0;
  }

  public void render() {
    counter++;

    if (counter > 100) {
      xPos += m*cos(radians(a));
      yPos += m*sin(radians(a));
      yPos += g;
      g+=0.04;
    }
    else {
      yPos-=5;
    }
    fill(random(255), random(255), random(255) );
    ellipse(xPos, yPos, random(5, 10), random(5, 10));
  }
}


