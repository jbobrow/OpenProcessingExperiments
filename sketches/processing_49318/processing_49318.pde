
class Ooki {

float headCenX;
float headCenY;
float headDiam;
color c;
color c2;
float speedX = 4.5;
float speedY = speedX/2;

boolean hit = false;

Ooki(float headCenX_, float headCenY_, float headDiam_, color c_, color c2_) {
  headCenX = headCenX_;
  headCenY = headCenY_;
  headDiam = headDiam_;
  c = c_;
  c2 = c2_;
}

void display(float headCenX_, float headCenY_) {
  headCenX = headCenX_;
  headCenY = headCenY_;
  
  //ear knobs & base
  noStroke();
  fill(c2);
  rect(headCenX,headCenY+(headDiam*.54),headDiam*.8,headDiam*.08);
  rect(headCenX,headCenY+(headDiam*.16),headDiam*1.15,headDiam*.16);
  //head  
  fill(c);
  arc(headCenX,headCenY,headDiam,headDiam,radians(180),radians(360));
  rectMode(CENTER);
  rect(headCenX,headCenY+(headDiam/4),headDiam,headDiam/2); 
  //eyes 
  fill(0);
  arc(headCenX+(headDiam*.3),headCenY+(headDiam*.3),headDiam*.14,headDiam*.14,radians(38),radians(360));
  arc(headCenX-(headDiam*.3),headCenY+(headDiam*.3),headDiam*.14,headDiam*.14,radians(38),radians(360));
  //hover ring
  noFill();
  strokeWeight(1);
  stroke(c2);
  ellipse(headCenX,(headCenY+headDiam*.66),headDiam*.6,headDiam*0.03);
  
  //if they collide  
  if(hit) {
  //shield
  fill(196,196,196,120);
  noStroke();
  ellipse(headCenX,headCenY+(headDiam*.05),100,100);
  //head  
  fill(255);
  arc(headCenX,headCenY,headDiam,headDiam,radians(180),radians(360));
  rectMode(CENTER);
  rect(headCenX,headCenY+(headDiam/4),headDiam,headDiam/2); 
  //eyes
  fill(0);
  rect(headCenX+(headDiam*.3),headCenY+(headDiam*.3),headDiam*.15,headDiam*.04);
  rect(headCenX-(headDiam*.3),headCenY+(headDiam*.3),headDiam*.15,headDiam*.04);
  }
}

void bounce() {
  headCenX = headCenX + speedX;
  if ((headCenX+(headDiam/2) > width) || (headCenX-(headDiam/2) < 0)) {
    speedX = speedX * -1;
  }
  headCenY = headCenY + speedY;
  if ((headCenY+(headDiam*.56) > height) || (headCenY-(headDiam/2) < 0)) {
    speedY = speedY * -1;
  }
}

void hitTest(Ooki mad) {
  float rad = (headDiam > mad.headDiam ? headDiam : mad.headDiam);
  
  if (dist(headCenX,headCenY,mad.headCenX,mad.headCenY) <= rad) {
    mad.hit = true;
    hit = true;
  } else {
    mad.hit = false;
    hit = false;
  }
}
}

