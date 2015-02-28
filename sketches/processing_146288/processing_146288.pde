

ArrayList <Bola> listaBolas;
int numBolas;

void setup() {
  size(800, 600);
  numBolas = 100;
  listaBolas = new ArrayList();

  cursor(CROSS);
  for (int i = 0; i < numBolas; i++) {
    Bola b = new Bola(); 
    listaBolas.add(b);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < numBolas; i++) {
    Bola b = listaBolas.get(i);
    if (mousePressed) {
      b.attractToMouse();
    } 
    b.drawMe();
    b.mover(); 
    float dist_ref=1000;
    float myX= -1;
    float myY= -1;
    for (int j = 0; j < numBolas; j++) {
      Bola b2 = listaBolas.get(j);
      float d = dist(b.pos.x, b.pos.y, b2.pos.x, b2.pos.y);
      if (d < dist_ref && d !=0) {
        dist_ref=d;
        myX=b2.pos.x;
        myY=b2.pos.y;
      }
    }
    strokeCap(ROUND);
    strokeWeight(3);
    stroke(255);
    line(b.pos.x, b.pos.y, myX, myY);
  }
}
void mouseReleased() {
  for (int j = 0; j < numBolas; j++) {
    Bola b2 = listaBolas.get(j);
    b2.goToPerlin = true;
  }
}

class Bola {

  PVector pos;
  PVector vel;
  PVector acc;
  //PVector incremento;
  float ruidoX;
  float ruidoY;
  int size;
  float xoff;
  float yoff;
  float incrementoX;
  float incrementoY;
  float myMass;
  boolean goToPerlin;

  public Bola() {
    pos = new PVector(width/2, random(30, 60));
    vel = new PVector(random(2, 3), random(2, 3));
    acc = new PVector(0, 0);
    ruidoX = random(0.0004, 0.002 );
    ruidoY = random(0.0003, 0.005);
    size = 15;
    incrementoX = random(0.0005, 0.0059);
    incrementoY = random(0.0005, 0.0059);
    xoff = random(10);
    yoff = random(10);
    myMass = 1;
    goToPerlin = false;
  }


  void drawMe() {
    stroke(255);
    noFill();
    ellipse(pos.x, pos.y, size, size);
  }
  void mover() {
    xoff += incrementoX;
    yoff += incrementoY;

    if (!goToPerlin) {
      if (!mousePressed) {
        pos=new PVector(noise(xoff)*width, noise(yoff)*height);
      }
    }
    else {
      attractToPerlin();
    }

    vel.add(acc);
    vel.limit(10);

    pos.add(vel);

    if (pos.x > width-(size/2) || pos.x < size/2)
      vel.x *= -1;
    if (pos.y > height-(size/2) || pos.y < size/2)
      vel.y *= -1;

    acc.mult(0);
  }


  void addForce(PVector _f) {
    PVector f = PVector.div(_f, myMass);
    acc.add(f);//.add(f);
  }

  void attractToMouse() {
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector dis = PVector.sub(mouseVector, pos);
    //    dis.normalize();
    //    dis.mult(0.9);
    dis.div(50);
    addForce(dis);
  }

  void attractToPerlin() {
    PVector puntoBack = new PVector(noise(xoff)*width, noise(yoff)*height); 
    PVector dis = PVector.sub(puntoBack, pos);
    dis.div(5);
    addForce(dis);

    float distancia = puntoBack.dist(pos);
    if (distancia < 6) {
      goToPerlin = false;
    }
    println(dis);
  }
}



