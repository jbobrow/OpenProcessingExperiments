
formax a, b, c;

float x;
float y;
float d;
float w;

void setup() {
  //frameRate(15);
  size (621, 803);
  background(255);
  a = new formax (0, 0, 255, 0, 255);
  b = new formax (0, -100, 255, 100, 255);
  c = new formax (0, -200, 200, 0, 255);
}

void draw() {
  pushMatrix();
  noFill();
  x=random(0, width);
  y=random(0, height);
  d=random(10, 100);
  w=random(1, 7);
  strokeWeight(w);
  stroke(255);
  ellipse(x, y, d, d);
  popMatrix();
  //background(255,10);
  a.update();
  a.display();

  b.update();
  b.display();

  c.update();
  c.display();

  //saveFrame();
}

// AHORA VIENE LA CLASE

class formax {
  float xpos;
  float ypos;
  //float clr;
  float xoff;
  float c1;
  float c2;
  float c3;
  float rot;

  formax (float x, float y, int ca, int cb, int cd) {
    xpos = x;
    ypos = y;
    c1=ca;
    c2=cb;
    c3=cd;
  }

  void update() {
    xoff = xoff+0.1;
    xpos = noise(xoff);
    ypos = ypos+7;
    c1 = c1 -0.5;
    c3 = c3 -0.5;
    rot = rot+0.1;

    if (ypos > height-500) {
      ypos*=-1;
      xpos*=-1;
    }
  }

  void display() {
    pushMatrix();
    strokeWeight(1);
    fill (c1,c2,c3,255);
    translate(width/2, height/2);
    rotate(rot);
    scale(2.5);
    stroke(255);
    beginShape();
    vertex(30+xpos, 30+ypos);
    vertex(35+xpos, 25+ypos);
    vertex(45+xpos, 35+ypos);//medio
    vertex(55+xpos, 25+ypos);
    vertex(60+xpos, 30+ypos);
    vertex(50+xpos, 40+ypos);//medio
    vertex(60+xpos, 50+ypos);
    vertex(55+xpos, 55+ypos);
    vertex(45+xpos, 45+ypos);//medio
    vertex(35+xpos, 55+ypos);
    vertex(30+xpos, 50+ypos);
    vertex(40+xpos, 40+ypos);//medio
    endShape(CLOSE);
    popMatrix();
  }
}
