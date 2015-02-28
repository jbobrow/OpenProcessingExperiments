
PImage fi, se, th, fo;

void setup() {
  background(200);
  size(650, 180);
  imageMode(CENTER);
  fi = loadImage("1.jpeg"); 
  se = loadImage("2.jpeg");
  th = loadImage("3.jpeg");
  fo = loadImage("4.jpeg");
}

void draw() {
  noTint();
  image(fi, 85, height/2);
  image(th, 405, height/2);
  image(fo, 565, height/2);  

  float fiDist= dist(mouseX, mouseY, 85, height/2);
  float seDist= dist(mouseX, mouseY, 245, height/2);
  float thDist= dist(mouseX, mouseY, 405, height/2);
  float foDist= dist(mouseX, mouseY, 565, height/2);


  // resize :) 
  if ( fiDist < 85 && mousePressed) {
    fi.resize(0, 150-mouseX/10);
  } 

  // change tint values randomly 
  if ( seDist < 85 && mousePressed) {
    tint(255-random(255), 255-random(255), 255-random(255));
    se.filter(POSTERIZE, 7);
  }
  
  image(se, 245, height/2);
  
  // apply the erode filter
  if ( thDist < 85 && mousePressed) {
    th.filter(ERODE);
  } 

  // apply the blur filter
  if ( foDist < 85 && mousePressed) {
    fo.filter(BLUR);
  }

}


