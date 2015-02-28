
/* @pjs preload="bg.jpg, leaf.png, wood.jpg, wood2.jpg"; 
 */

float theta = radians(60);
float a= 3;
float b= 5;
float c= 7;
float ran;
float ran2;
float ran3;
PImage leaf;
PImage wood;
PImage bg;


void setup() {
  size(960, 648);
  bg = loadImage("bg.jpg");
  background(bg);
  leaf = loadImage("leaf.png");
  wood = loadImage("wood2.jpg");
  translate(width/2, height);
    ellipseMode(CENTER);
  strokeJoin(ROUND);
  split(150);
}

void split(float len) {
//  stroke(92-noise(c)*20, 40-noise(c)*20, 0-noise(c)*20);
//  strokeWeight(len/4);
//  line(0, 0, 0, -len*noise(a)*2);
noTint();
image(wood,0,0,len/4,-len*noise(a)*2);
  translate(0, -len*noise(a)*2);

  if (len > 6) { // no inf. loop
    a+=0.5;
    b+=0.2;
    c+= 0.3;
    
    pushMatrix();
    rotate(-theta*noise(b));
    split(len*.75);
    popMatrix();

    pushMatrix();
    rotate(theta*noise(c));
    split(len*.75);
    popMatrix();

    ran = 10*random(1);
    if (ran>3) {
      pushMatrix();
      rotate(theta*noise(b));
      split(len*.5);
      popMatrix();

      ran2 = 10*random(1);
      if (ran2>2) {
        pushMatrix();
        rotate(theta*noise(c));
        split(len*.5);
        popMatrix();
      }
    }
  } 
  else {
    noStroke();
    ran3 = 10*random(1);
    if (ran3>7.8) {
        pushMatrix();
    rotate(radians(270));
    tint(40, noise(a)*300, 40, 220);
    image(leaf, 0, 0, 10*noise(a)*2, 20*noise(a)*2);
    popMatrix();
    }
    if (ran3>9.7) {
      fill(noise(a)*230, 20, 20,200);
      ellipse(0, 0, 7, 7);
    }
  }
}



