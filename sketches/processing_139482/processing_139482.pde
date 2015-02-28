
//import twitter4j.*;
ArrayList<particula> subSistema;
ArrayList<particleSystem> sistemaParticulas;
String[] colors;
int numeroparticula = 50;
int count;
int interval;
void setup() {
  size (800, 600);
  smooth ();
  //background(#1982BB, 10);
  subSistema = new ArrayList<particula>();
  colors = new String[12];
  colors[0] = "FF792929";
  colors[1] = "FFB20A0A";
  colors[2] = "FFDB0000";
  colors[3] = "FFF48788";
  colors[4] = "FFE8BA4F";
  colors[5] = "FF63A624";
  colors[6] = "FF15A3A6";
  colors[7] = "FF84A322";
  colors[8] = "FF3A2357";
  colors[9] = "FFB31750";
  colors[10] = "FFD63872";

  sistemaParticulas = new ArrayList<particleSystem>();
  for (int i=0;i<10;i++) {
    sistemaParticulas.add(new particleSystem(int(random(40, 80))));
  }
  smooth();
}

void draw () {

  count++;


  for (int i = 0;i<sistemaParticulas.size();i++) {
    particleSystem subSisWriter = sistemaParticulas.get(i);
    subSisWriter.display();
    subSisWriter.update();
    for (int j=0;j<subSisWriter.conjuntos.size();j++) {

      particula partChild = subSisWriter.conjuntos.get(j);

      partChild.display();
      partChild.update(subSisWriter.position.x, subSisWriter.position.y);
 
    }
  }
  if (count % 300 == 0)
  {
    sistemaParticulas.add(new particleSystem(int(random(40, 80))));
  }

  noStroke();
  //fill(#1982BB, 10);
  fill(150, 10);
  rect(0, 0, width, height);
}


void writeLines() {

  particleSystem lineOne, lineTwo;

  for (int i = 0;i<sistemaParticulas.size();i++) {
    lineOne = sistemaParticulas.get(i);
    for (int j = 0;j<sistemaParticulas.size();j++)
    {
      lineTwo = sistemaParticulas.get(j);
      stroke(200, 10);
      strokeWeight(0.00001);
      line(lineOne.positionX, lineOne.positionY, lineTwo.positionX, lineTwo.positionY);
    }
  }
}
void mousePressed() {
  saveFrame("aaa.png");
}



class particleSystem {
  ArrayList<particula> conjuntos;
  String colorParticula;
  PVector position;
  float speedX, speedY;
  int positionX;
  int positionY;
  int already;
  float distance;
  particleSystem(int numParticulas) {

    colorParticula = colors[floor(random(0, 10))];
    already = 0;

    conjuntos = new ArrayList<particula>();
    speedX = random(-0.5, 0.5);
    speedY = random(-0.6, 0.6);
    positionX = floor(random(width/2-200, width/2+200));
    positionY = floor(random((height/2)-200, (height/2)+200));
    position = new PVector(positionX, positionY);



    for (int i=0; i<numParticulas; i++)
    {
      PVector init = new PVector(random(positionX-50, positionX+50), random(positionY-50, positionY+50));
      conjuntos.add(new particula(init, colorParticula));
    }
  }

  void update() {
    position.x += speedX;
    position.y += speedY;

    if (position.y >= height)
    {
      speedY *= -1;
    }
    if (position.y <= 0) {
      speedY *= -1;
    }
    if (position.x <= 0) {
      speedX *= -1;
    }
    if (position.x >= width) {
      speedX *= -1;
    }

    particleSystem lineOne, lineTwo;

    for (int i = 0;i<sistemaParticulas.size();i++) {
      lineOne = sistemaParticulas.get(i);
      distance = dist(lineOne.position.x, lineOne.position.y, position.x, position.y);

      if ((distance <=30)&&(distance != 0)) {
        
        if (lineOne.conjuntos.size()>0) { 
          int indx = floor(random(0, lineOne.conjuntos.size()));
          conjuntos.add(lineOne.conjuntos.get(indx));
          lineOne.conjuntos.remove(indx);
        }
      }
    }
  }

  void display() {

    fill(unhex(colorParticula), 100);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, 4, 4);
  }
}

class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float life;
  String colorParticula;
  int already;
  float distance;
  float initialX;
  float initialY;

  particula (PVector initial, String _colorParticula) {
    position = initial.get();
    initialX = initial.x;
    initialY = initial.y;

    velocity = new PVector(random(-1, 1), random(-1, 1));
    if (interval==0) {
      acceleration = new PVector(0, 0.003);
      interval = 1;
    }
    else {
      acceleration = new PVector(0.003, 0);
      interval = 0;
    }
    colorParticula = _colorParticula;
    life = 200;
    already = 0;
  }
  void update(float x, float y) {


    float xx = position.x + (random(x-120, x+120) - position.x)*(0.008);
    float yy = position.y + (random(y-120, y+120) - position.y)*(0.008);

    position.set(xx, yy, 0);
   
  }

  void display() {
    fill(unhex(colorParticula));
    noStroke();
    ellipseMode(CENTER);
    ellipse(position.x, position.y, 1, 1);
  }
}

