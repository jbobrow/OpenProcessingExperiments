
Tenticle tenticle;

void setup() {
  tenticle = new Tenticle();
  size(800, 600);
}

void draw() {
  background(255);
  tenticle.update();
  tenticle.display();
}

class Tenticle {
  PVector[] spine;
  PVector speed;
  PVector accel;
  float topSpeed = 50;
  float subDist = 20;
  float stiffness = 1;

  Tenticle() {
    spine = new PVector[20];
    speed = new PVector(1, 1);
    accel = new PVector(0, .1);

    for (int i = 0; i < spine.length; i++) {
      if (i == 0) {
        spine[i] = new PVector(20, height/2);
      }
      else {
        spine[i] = new PVector(spine[i-1].x + 10, spine[i-1].y + 0);
      }
    }
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, spine[0]);

    //    dir.normalize();
    //    dir.mult(1);


    //
    speed.div(2);
    speed.add(dir);
    //speed.limit(topSpeed);
    spine[0].add(speed);
    
    spine[1].x = spine[0].x + 20;
    spine[1].y = spine[0].y;

    for (int i = 2; i < spine.length - 2; i++) {

      //if (spine[i].dist(spine[i-1]) > 10) {

    // PVector dir2 = PVector.sub(spine[i-1], spine[i]);
     
     PVector test = spine[i-1];
     //PVector dir3 = PVector.sub(dir2, spine[i]);
     PVector dir2B = PVector.sub(spine[i-2], spine[i-1]);
     dir2B.normalize();
     dir2B.mult(-20);
     dir2B.add(spine[i-1]);
     //dir2B.rotate(180);
     //float pAngle = PVector.angleBetween(dir2, spine[i]);
    // float newAngle = (PVector.angleBetween(spine[i], spine[i-1]) - PVector.angleBetween(spine[i-1], spine[i-2])) / 4;
     //dir2.rotate((PVector.angleBetween(spine[i], spine[i-1]) - PVector.angleBetween(spine[i-1], spine[i-2])) * stiffness);
      //dir2.rotate((PVector.angleBetween(spine[i], spine[i-1]) - PVector.angleBetween(spine[i-1], spine[i-2])) * stiffness);
      // PVector speed2 = new PVector(spine[i].x. spine[i].y);
      //println((PVector.angleBetween(spine[i-1], spine[i-2])) * stiffness);
      PVector dir2= PVector.sub(dir2B, spine[i]);
            //dir2.normalize();
            //dir2.mult(1);
     
      dir2.setMag(dir2.mag()/2);
      //dir2.setMag(dir2.mag() - (spine[i].dist(spine[i-1]) - 20));
      //      dir2.normalize();
      //      dir2.mult(.5);
      // dir2.mult(spine[i].dist(spine[i-1]) +   10);

      //PVector newPos = new PVector(dir2.x, dir2.y);
      //dir2.mult(-1);
       //dir2.setMag(dir2.mag()/4);
      //dir2.add(spine[i]);
     //test.add(dir2);
      spine[i].add(dir2);
   
      //speed.limit(topSpeed);
      //spine[i].add(speed);
       // }
    }
  }


  void display() {
    fill(255, 0, 0);
    ellipse(spine[0].x, spine[0].y, 10, 10);
    for (int i = 1; i< spine.length -1; i++) {
      fill(255);
      ellipse(spine[i].x, spine[i].y, 10, 10);
    }
  }
}

