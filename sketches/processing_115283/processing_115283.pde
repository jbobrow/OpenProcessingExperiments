
/*
Jeff Guo
 "Swinging Daft Punk"
 Oct 11 2013
 All Rights Reserved
 */
PImage dpk;
PFont dax;
float i;

void setup() {
    dpk = loadImage("dpk.png");

  size(600, 600);
  smooth();
  dax = loadFont("DaxlinePro-Regular-30.vlw");
  textFont(dax, 30);
}

void draw() {
    image(dpk, 0, 0, 600,600);

  float zzc = abs(mouseY - 300);
  float skarea = map(zzc, 0, 300, 20, 2);
  float skspd = map(zzc, 0, 300, 1.0, 0.15);
  int x = mouseX-100;


  if (mousePressed == true) {

    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  else { 

    fill(255);
  }

  i = i+skspd;

  pushMatrix();
  
  translate(100+x, 325);
  rotate(sin(i)/skarea);
  translate(-x, 0);
  text("Harder Better Faster Stronger", 0, 0);

  popMatrix();
} 



