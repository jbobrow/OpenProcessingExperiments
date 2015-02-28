
/*
Date: 2013-06-13
 Author: Oliver Roberts (oli@programmin.gs)
 Desciption: Prerendered Animation + Interactive Processing action (click + add items)
*/

ArrayList<El> eA;

void setup() {
  size(500, 500);
  eA = new ArrayList();
  for (int a = 0; a < 10; a++) {
    eA.add(new El());
  }
  frameRate(60);
  noCursor();
}

void draw() {
  background (0,0);
  for (int i = 0; i < eA.size(); i++) {
    El e =  eA.get(i);
    e.run();
    if (e.size.x <= 10) {
      eA.remove(e);
    }
  }
}

void mousePressed() {
  for (int a = 0; a < 100; a++) {
    eA.add(new El());
  }
}


class El {
  PVector l;
  PVector rv;
  PVector aC;
  PVector size;
  float angle = 0;
  float arv = 0;
  float aaC;

  color[] pT = {
    #FFFFFF, #FEEF0C, #1EE107, #EF0AF3
  };
  int randNum = int(random(0, pT.length));

  El() {
    l = new PVector(mouseX-50, mouseY-50);
    rv = new PVector(1.5, 0.5);
    aC = new PVector(random(-0.1, 0.1), random(-0.5, 0.05));
    float rS = random(20, 200);
    size = new PVector(rS, rS);
  }

  void update() {
    rv.add(aC);
    l.add(rv);
    aaC = aC.x / 20.0;
    arv += aaC;
    arv = constrain(arv, -0.1, 0.1);
    angle += arv;
    size.y -= 2.1;
    size.x -= 2.1;
  }
  void display() {
    noFill();
    stroke(255);
    pushMatrix();
    translate(l.x, l.y);
    rotate(angle);
    scale(0.2);
    rect(l.x, l.y, size.x, size.y);
    popMatrix();
  }

  void run() {
    update();
    display();
  }
}
