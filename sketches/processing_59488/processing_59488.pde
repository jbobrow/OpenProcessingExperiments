
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

smallfish small[] = new smallfish[30];
middlefish medium[] = new middlefish[4];
bigfish big[] = new bigfish[1];

Seaweed weed[] = new Seaweed[15];

//--------------------------------------------------------------------------

void setup() {
  size(1000, 700, P3D);

  for (int i=0; i < small.length; i++) {
    small[i] = new smallfish(this);
  }
  for (int i=0; i< medium.length; i++) {
    medium[i] = new middlefish(this);
  }
  for (int i=0; i < big.length; i++) {
    big[i] = new bigfish(this);
  }

  for (int i=0; i < weed.length; i++) {
    weed[i] = new Seaweed();
  }
}

//--------------------------------------------------------------------------

void draw() {
  background(170, 242, 255);
  lights();
  noSmooth();

  smallest();
  middle();
  biggest();
  bounce();

  noLights();
  castle();

  for (int i=0; i < weed.length; i++) {
    smooth();
    weed[i].display();
  }
  noSmooth();
  //sand
  noStroke();
  fill(255, 226, 118);
  rect(0, 660, 1000, 70);
}

//--------------------------------------------------------------------------

void smallest() {
  fill(255);
  stroke(255);
  for (int i=0; i < small.length; i++) {
    pushMatrix();
    small[i].fin();
    small[i].movement();
    popMatrix();
  }
}

//--------------------------------------------------------------------------

void middle() {
  noStroke();
  for (int i=0; i< medium.length; i++) {
    pushMatrix();
    medium[i].tail();
    medium[i].fins();
    medium[i].eyes();
    medium[i].movement();
    popMatrix();
  }
}

//--------------------------------------------------------------------------

void biggest() {
  fill(41, 5, 255);
  stroke(255);
  for (int i=0; i < big.length; i++) {
    pushMatrix();
    big[i].tail();
    big[i].eyes();
    big[i].fins();
    big[i].movement();
    popMatrix();
  }
}

//--------------------------------------------------------------------------

void bounce() {
  //big hits small
  for (int i=0; i < big.length; i++) {
    for (int j=0; j< small.length; j++) {
      if ( intersects1(big[i], small[j]) ) {
        small[j].speedX *= -1;
        small[j].speedY *= -1;
        small[j].speedZ *= -1;
      }
    }
  }
  //big hits medium
  for (int i=0; i < big.length; i++) {
    for (int j=0; j < medium.length; j++) {
      if ( intersects2(big[i], medium[j]) ) {
        medium[j].speedX *= -1;
        medium[j].speedY *= -1;
        medium[j].speedZ *= -1;
      }
    }
  }
  //medium hits small
  for (int i=0; i < medium.length; i++) {
    for (int j=0; j < small.length; j++) {
      if ( intersects3(medium[i], small[j]) ) {
        small[j].speedX *= -1;
        small[j].speedY *= -1;
        small[j].speedZ *= -1;
      }
    }
  }
  //medium hits medium
  if (medium[0].intersects(medium[1])) {
    medium[1].speedX *= -1;
    medium[1].speedY *= -1;
    medium[1].speedZ *= -1;
  }
  if (medium[0].intersects(medium[2])) {
    medium[2].speedX *= -1;
    medium[2].speedY *= -1;
    medium[2].speedZ *= -1;
  }
  if (medium[0].intersects(medium[3])) {
    medium[3].speedX *= -1;
    medium[3].speedY *= -1;
    medium[3].speedZ *= -1;
  }
  if (medium[1].intersects(medium[2])) {
    medium[2].speedX *= -1;
    medium[2].speedY *= -1;
    medium[2].speedZ *= -1;
  }
  if (medium[1].intersects(medium[3])) {
    medium[3].speedX *= -1;
    medium[3].speedY *= -1;
    medium[3].speedZ *= -1;
  }
  if (medium[2].intersects(medium[3])) {
    medium[3].speedX *= -1;
    medium[3].speedY *= -1;
    medium[3].speedZ *= -1;
  }
}

//-------------------------------------------------------------------------

//big hits small
boolean intersects1(bigfish a, smallfish b) {
  float d = dist(a.x, a.y, a.z, b.x, b.y, b.z);
  if ( d < (a.y_rad + b.x_rad) ) return true;
  else return false;
}

//big hits medium
boolean intersects2(bigfish a, middlefish b) {
  float d = dist(a.x, a.y, a.z, b.x, b.y, b.z);
  if ( d < (a.y_rad + b.x_rad) ) return true;
  else return false;
}

//medium hits small
boolean intersects3(middlefish a, smallfish b) {
  float d = dist(a.x, a.y, a.z, b.x, b.y, b.z);
  if ( d < (a.x_rad + b.x_rad) ) return true;
  else return false;
}

