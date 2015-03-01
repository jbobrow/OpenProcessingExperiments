
/*
 * Program: Zoog Evolution 3
 * Description: Zoog rises from his ass. Zoog will drop and
 * bounce like a ball. Press any key to drop Zoog a again.
 *
 * Author(s): Alex Lay
 * Date: 2015 Jan. 26
 *
 * Sources: Daniel Shiffman, one from my previous programs
 * 
 */

float zoogX = 500/6;
float zoogY = 41;
float speedY = 10;
float rg = 0;

void setup() {
  size(500, 500); //Window size
  background(255); //White background
  smooth(); // Enables anti-aliasing to smooth pixels
  strokeWeight(1);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
}

void draw() {
  background(255);
  //rand_gen();
  zoog_multi();
  zoog_restart();
  //println("ZoogY = " + zoogY);
  freeze();
}


void zoog_multi() {
  for(float m = 0; m < 5; m = m + 1) {
    float xx = 500/6 * m;
    zoog(xx);
  }
}

//Makes One Zoog
void zoog(float xx) {
  zoog_body(xx);
  zoog_head(xx);
  zoog_eyes(xx);
  zoog_arms(xx);
  zoog_legs(xx);
  zoog_fall();
  //zoog_talk();
}

//Zoog's Body
void zoog_body(float xxx) {
  stroke(0);
  fill(150);
  rect(zoogX + xxx, zoogY, 20, 100);
}
//Zoog's Head
void zoog_head(float xxx) {
  fill(255);
  ellipse(zoogX + xxx, zoogY - 30, 60, 60);
}
//Zoog's Eyes
void zoog_eyes(float xxx) {
  fill(zoogX, 0, zoogY);
  ellipse(zoogX - 16 + rg + xxx, zoogY - 30, 16, 32);
  ellipse(zoogX + 16 + rg + xxx, zoogY - 30, 16, 32);
}
//Zoog's legs
void zoog_legs(float xxx) {
  stroke(0);
  line(zoogX - 10 + xxx, zoogY + 50, 
  zoogX - 20 + xxx, zoogY + 60); // Left Leg
  line(zoogX + 10 + xxx, zoogY + 50, 
  zoogX + 20 + xxx, zoogY + 60); //Right leg
}

//Zoog's Arms
void zoog_arms(float xxx) {
  for (float i = 0; i < 6; i = i + 1) { 
    line(zoogX - 10 + xxx, zoogY + (7 * i), //Draws Zoog's left arms
    zoogX - 30 + xxx, zoogY + (7 * i)); 
    line(zoogX + 10 + xxx, zoogY + (7 * i), //Draws Zoog's right arms
    zoogX + 30 + xxx, zoogY + (7 * i));
  }
}

//Zoog Rises
void zoog_fall() {
  if (zoogY > 450 || zoogY < 40) {
    speedY = speedY * -.95;
  } 
  zoogY = constrain(zoogY + speedY, 39, 451);
}

//Press any key for Zoog to Restart
void zoog_restart() {
  if (keyPressed) {
    zoogY = 31;
    speedY = 10;
  }
}

/*
void rand_gen() {
 rg = random(-20, 20);
 }
 */


void zoog_talk() {
  if (mousePressed) {
    println("Take me to your leader, scrub.");
  }
}

//Gets annoying if he moves too much. Click to freeze
//him :).
void freeze() {
  if (mousePressed) {
    noLoop();
  }
}

