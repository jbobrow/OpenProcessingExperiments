
PVector mouse;
PVector des;
PVector shootDes;
float speed = 3;
Killer killer;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  killer = new Killer();
  des=new PVector(width/2, height/2);
  shootDes = new PVector(width/2, height/2);
}

void draw() {
  background(255);
  mouse = new PVector(mouseX, mouseY);
  killer.move();
  killer.face();
  killer.fire();
  killer.drawthis();
  println(shootDes);
}

void mousePressed() {
  if (mouseButton == RIGHT) des.set(mouseX, mouseY);
}


class Killer {
  PVector loc;
  PVector v;
  PVector a;
  PVector f;
  PVector shoot; 
  PVector shootV; 

  Killer() {
    loc = new PVector(width/2, height/2);
    v = new PVector(width/2, height/2);
    f = new PVector(mouseX, mouseY);
    shoot = new PVector(0, 0);
  }

  void move() {
    if (PVector.dist(des, loc)<=2) v.setMag(0);
    else {
      v = PVector.sub(des, loc);
      v.setMag(speed);
    }
    loc.add(v);
  }

  void face() {
    f = PVector.sub(mouse, loc);
    f.setMag(15);
  }

  void fire() {
    if(keyPressed == true){
      shootDes.set(mouseX, mouseY);
    }  
    shootV = PVector.sub(shootDes, loc);
      shootV.setMag(10);
      shoot.add(shootV);
  }

  void drawthis() {

    noFill();
    stroke(0);
    ellipse(loc.x, loc.y, 20, 20);
    pushMatrix();
    translate(loc.x, loc.y);
    line(0, 0, f.x, f.y);
    fill(255, 0, 0);
    ellipse(shoot.x, shoot.y, 5, 5);
    popMatrix();
  }
}



