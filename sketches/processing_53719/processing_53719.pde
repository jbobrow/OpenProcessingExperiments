
int num=30;
Epos[] ep=new Epos[num];
Ecolor[] ec=new Ecolor[num];

void setup() {
  size(600, 400);
  background(255);
  noStroke();
  smooth();
  for (int i=0; i<num; i++) {
    ep[i]=new Epos(random(-150, 150), random(-150, 150), random(360), 
    random(0.05, 0.1), random(15), random(0.1, 1));
    ec[i]=new Ecolor(random(255), random(255), random(255));
  }
}

void draw() {
  fadeToWhite();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    ep[i].update();
    ep[i].display();
    ec[i].display();
  }
}

void fadeToWhite() {
  fill(255, 5);
  noStroke();
  rect(0, 0, width, height);
}

void mousePressed() {
  background(255);
  for (int i=0; i<num; i++) {
    ep[i]=new Epos(random(-150, 150), random(-150, 150), random(360), 
    random(0.05, 0.1), random(15), random(0.1, 1));
    ec[i]=new Ecolor(random(255), random(255), random(255));
  }
} 

class Epos {
  float X, Y;
  float angle;
  float amount;
  float es; 
  float esAmount;
  Epos(float nX, float nY, float nAng, float nAm, float nEs, float nEsAm) {
    X=nX;
    Y=nY;
    angle=nAng;
    amount=nAm;
    es=nEs;
    esAmount=nEsAm;
  }  

  void update() {
    angle+=amount;
    es+=esAmount;
    if (es>15 || es<0) {
      esAmount=-esAmount;
    }
  }

  void display() {
    rotate(radians(angle));
    ellipse(X, Y, es, es);
  }
}


class Ecolor {
  float R, G, B;
  Ecolor(float nR, float nG, float nB) {
    R=nR;
    G=nG;
    B=nB;
  }

  void display() {
    fill(R, G, B);
  }
}
                
                                                
