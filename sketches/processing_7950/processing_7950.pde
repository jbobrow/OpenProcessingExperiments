
PImage moon;
PImage grass;
PImage sunmoon;
PImage moonsun;
PImage dino;
PImage dino2;
PImage dino3;


void setup () {
  moon= loadImage ("moon.png");
  grass= loadImage ("Grass.png");
  sunmoon= loadImage ("sunmoon.png");
  moonsun= loadImage ("moonsun.png");
  dino= loadImage ("Dino.png");
  dino2= loadImage ("Dino2.png");
  dino3= loadImage ("Dino3.png");
  size (640,480);
  background (0);
  frameRate (30);
  smooth ();
}

void draw() {
  // background colors in relation to mouseX
  background ((-127*(cos (PI/640*mouseX))+127),(-70  *(cos (PI/640*mouseX))+70),(-115 *(cos (PI/9000*mouseX-24))+115));
  fill (255,255,150);
  noTint();
  pushMatrix();
  translate (320,480);
  // rotation of image based on mouseX
  rotate (radians(9*mouseX/32));
  image (moonsun, -600,-480);
  popMatrix();
  fill (0);
  tint ((-127*(cos (PI/640*mouseX))+127),(-70  *(cos (PI/640*mouseX))+70),(-115 *(cos (PI/9000*mouseX-24))+115));
  image (grass,0,0);
  
  
    if (mouseX >= 290) {
    if (mouseX <= 350){
      pushMatrix ();
      dino3 (990,470,0.45);
      popMatrix();
    }
  }
  
  
  if (mouseX >= 351) {
    if (mouseX <= 420){
      pushMatrix ();
      dino3 (860,410,0.5);
      popMatrix();
    }
  }
  
  if (mouseX>=421){
    if (mouseX<=480) {
      pushMatrix();
      dino2 (580,300,0.65);
      popMatrix();
    }
  }
  
    if (mouseX>=481){
    if (mouseX<=540) {
      pushMatrix();
      dino2 (410,220,0.8);
      popMatrix();
    }
  }
  
  
  if (mouseX>= 541) {
    scale (1.1);
    image (dino, 210,140);
  }
}

void dino3 (int x, int y, float z) {
  scale (z);
  image (dino3, x,y);
}

void dino2 (int x, int y, float z) {
  scale (z);
  image (dino2, x,y);
}

