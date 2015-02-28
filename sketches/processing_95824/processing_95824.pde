
int N = 25;
Rebota[] r1 = new Rebota[N];


//------------------------
void setup() {
  size(900, 600);
  background(90, 200, 70);

  for (int i=0; i<N; i++) {
    r1[i] = new Rebota();
    r1[i].vel.x = random(-3, 3);
    r1[i].vel.y = random(-3, 3);
    r1[i].c = color((1+i)*10, 90, 227-((1+i)*7.5), 30);
  }
}

//------------------------
void draw() {
  
  colorMode(HSB,360,100,100,100);
  noStroke();
  fill(int(frameCount/36)%360, 200, 70, 4);
  rect(0, 0, width, height);
  //colorMode(RGB);
  for (int i=0; i<N; i++) {
    r1[i].dibuja();
    r1[i].actualiza();
    if ( i%2 == 0 && i>1 ) {
      stroke(127, (1+i)*7.5, 220, 10);
      line(r1[i-1].pos.x, r1[i-1].pos.y, r1[i].pos.x, r1[i].pos.y);
    }
    if ( i%4 == 0 && i>3 ) {
      fill(250-((1+i)*10), (1+i)*8.0, 220, 3);
      beginShape();
      vertex(r1[i].pos.x, r1[i].pos.y);
      bezierVertex(r1[i-1].pos.x, r1[i-1].pos.y, r1[i-2].pos.x, r1[i-2].pos.y, r1[i-3].pos.x, r1[i-3].pos.y);
      endShape();
    }
  }
}

class Rebota {

  PVector pos;
  PVector vel;
  PVector grav; 
  PVector viento;
  PVector raton;
  //PVector gato;

  color c;
  float diam;
  float dist; 

  Rebota() {

    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    grav = new PVector(0, 0.05);
    viento = new PVector(0.0, 0.0);
    raton = new PVector(mouseX, mouseY);
    //gato = new PVector(0, 0);
    dist = 0;


    c = color(210, 127, 80);
    diam = 5;
  }

  void dibuja() {

    fill(c);
    ellipse(pos.x, pos.y, diam, diam);
  }

  void actualiza() {

    raton.set(mouseX, mouseY, 0);
    raton.sub(pos);
    dist = raton.mag();

    raton.normalize();
    raton.mult(0.25);

    if (dist < 200 && dist > 30) {
      vel.add(raton);
    }

    vel.add(grav);
    vel.add(viento);
    vel.mult(0.997);
    pos.add(vel);
    fronteras();
  }

  void fronteras() {
    //--- x ---
    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1.0;
    }
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1.0;
    }

    //--- y ---
    if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -1.0;
    }
    if (pos.y > height) {
      pos.y = height;
      vel.y *=-0.90;
    }
  }
};



