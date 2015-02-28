
Planet planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8, planet9;

void setup() {
  size(600, 600);
  smooth();
  noCursor();
  planet8 = new Planet(width/2, height/2, 0.153, 50);
  planet1 = new Planet(width/2, height/2, 0.0744, 100);
  planet2 = new Planet(width/2, height/2, 0.0487, 120);
  planet3 = new Planet(width/2, height/2, 0.01234, 150);
  planet4 = new Planet(width/2, height/2, 0.00774, 200);
  planet5 = new Planet(width/2, height/2, 0.004090, 230);
  planet6 = new Planet(width/2, height/2, 0.001163, 250);
  planet7 = new Planet(width/2, height/2, 0.000724, 270);
  planet9 = new Planet(width/2, height/2, 0.000109, 300);
}

void draw() {
  background(0);
  fill(212, 245, 2);
  ellipse(width/2, height/2, 50, 50);
  noFill();
  stroke(255,50);
  ellipse(300,300,100,100);
  ellipse(300,300,200,200);
  ellipse(300,300,250,240);
  ellipse(300,300,300,300);
  ellipse(300,300,400,400);
  ellipse(300,300,460,460);
  ellipse(300,300,500,500);
  ellipse(300,300,540,540);
  ellipse(300,300,600,600);

  planet1.move();
  planet1.display();

  planet2.move();
  planet2.display();

  planet3.move();
  planet3.display();

  planet4.move();
  planet4.display();

  planet5.move();
  planet5.display();

  planet6.move();
  planet6.display();

  planet7.move();
  planet7.display();

  planet8.move();
  planet8.display();

  planet9.move();
  planet9.display();
}
class Planet {
  float x, y;
  float ang;
  float amove;
  float r;
  color c;

  Planet(float nx, float ny, float nang, float nr) {
    x = nx;
    y = ny;
    ang = 0.0;
    amove = nang;
    r = nr;
    c = color(random(255), random(255), random(255));
  }

  void move() {
    x = cos(ang) * r + width/2;
    y = sin(ang) * r + height/2;
    ang += amove;
  }

  void display() {
    fill(c);
    stroke(0);
    ellipse(x, y, 30, 30);
  }
}

