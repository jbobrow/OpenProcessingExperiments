
//variables globales

ArrayList<Particule> tableauP = new ArrayList();

float gravite = 0.01;
float nbreP = 100;

class Particule {
  float posX, posY, vx, vy;
  color c;
  float lifeTime = .1;
  float rad = random(-200,200);

  Particule(float posX, float posY, float vx, float vy, color c) {
    this.posX = posX;
    this.posY = posY;
    this.vx = vx;
    this.vy = vy;
    this.c = c;
  }

  void display() {
    lifeTime -=2;
    fill(c, lifeTime-1);
    rad-=random(0,1);
    ellipse(posX, posY, rad, rad);
  }
  void update() {
    vx +=0 ;
    vy += gravite;

    posX += vx;
    posY += vy;
  }
}

void setup() {

  size(500,600, P2D);
  background(255);
  noStroke();
  colorMode(HSB);
}
void draw() {
  fill(10, 10);
  rect(0, 0, width, height);
  for (Particule p:tableauP) {
    p.update();
    p.display();
  }
}
void mousePressed() {
  for ( int i = 0; i<nbreP;i++) {
    float rayon = random(0,2);
    float repartition = random(0, TWO_PI);
    tableauP.add(new Particule(mouseX, mouseY, rayon*tan(repartition), rayon*cos(repartition), color(random(0, 255), 255, 250, 3)));
  }
}


