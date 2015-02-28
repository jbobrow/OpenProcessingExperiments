

Pigeon pigeon;

  boolean exist = false;
  boolean hasSwatted = false;
  int dryland = 345;

  PImage b1;
  PImage b2;
  PImage f1;
  PImage f2;
  PImage w1;
  PImage w2;
  PImage w3;
  PImage p1;

void setup() {
  size(550,530);
  smooth();
  frameRate(12);
  
  b1 = loadImage ("bench1.png"); 
  b2 = loadImage ("bench2.png");
  f1 = loadImage ("fly1.png");
  f2 = loadImage ("fly2.png");
  w1 = loadImage ("walk1.png");
  w2 = loadImage ("walk2.png");
  w3 = loadImage ("walk3.png");
  p1 = loadImage ("walk1.png");

pigeon = new Pigeon (0,-130,5,0,0,0,0,0,0);

}

void draw() {
  
background(200);

benchMan ();


if (exist) {
  pigeon.begin();
  }
  
  
}

void benchMan() {
 if (mousePressed){
   image(b2,10,5);
 }
  else {
    image(b1,10,5); 
  
  }
}

void mousePressed () {
  exist=true;
}

class Pigeon {
  //variables
  int posx,posy,speed,walk,flap,brain,mouseSpeed,mouseswat1,mouseswat2;

  
Pigeon (int tempposx, int tempposy, int tempspeed, int tempwalk, int tempflap, int tempbrain, int tempmouseSpeed, int tempmouseswat1, int tempmouseswat2 ) {
  posx = tempposx;
  posy = tempposy;
  speed = tempspeed;
  walk = tempwalk;
  flap = tempflap;
  brain = tempbrain;
  mouseSpeed = tempmouseSpeed;
  mouseswat1 = tempmouseswat1;
  mouseswat2 = tempmouseswat2;
}
void begin () {
  brain = (int(random(0, 13)));
  int mouseSpeed = int(abs(mouseX - pmouseX));
  int mouseswat1 = (mouseX + 35);
  int mouseswat2 = (mouseX - 35);
  println(posy + "  " +dryland);
  
  if (posy <= dryland) {
   flyIn();
 }
 
 else if (posy >= dryland && brain <=10 && !hasSwatted) {
 pigeonWalk();
 }
 
 else if ((posy >= dryland) && (mouseSpeed>21) && (posx > mouseswat2 && posx < mouseswat1)) {
   hasSwatted = true;
 }
 
 if (hasSwatted) {
   pigeonSwat();
 }
 
 if (posx > width) {
  posx=-90;
 posy = -130;
 exist = false;
hasSwatted = false; 
 }
}


void flyIn() {
  posx = posx+1;
  posy = posy+5;
  flap = flap+1;
  if (flap > 11) {
    flap = 0;
  }
  else if (flap > 5) {
  image (f1, posx, posy);
  }
else if (flap >= 0) {
  image (f2, posx, posy);
}

 else if (posy >= dryland) {
   posy= 380;
  boolean exist = false;
  } 
}


void pigeonWalk() {
  posx = (posx+speed);
  int posy = dryland;
  
  pushMatrix();
 scale(-1.0, 1.0);
/*mage(w1,-w1.width,0);
 image(w2,-w2.width,0);
 image(w3,-w3.width,0);
 image(p1,-p1.width,0);*/
  popMatrix();
  
  walk = walk + 1;
  if (walk >= 5) {
   walk = 0;
  }
  
  else if (walk > 3) {
  image (w3, posx, posy);
  }
  
  else if (walk > 1) {
  image (w2, posx, posy);
  }
  
  else if (walk >= 0) {
  image (w1, posx, posy);
  }
  if ((posx > width) || (posx < 0)) {
speed = speed * -1;


  }
}

void pigeonSwat () {
  posx=posx+6;
  posy=posy-10;
  flap = flap+1;
   
  if (flap > 11) {
    flap = 0;
  }
  else if (flap > 5) {
  image (f1, posx, posy);
  }
else if (flap >= 0) {
  image (f2, posx, posy);
}
}

void pigeonPeck () {
  flap = flap+1;
  if (flap > 11) {
    flap = 0;
  }
  else if (flap > 8) {
  image (w1, posx, posy);
  }
  else if (flap > 5) {
  image (p1, posx, posy);
  }
else if (flap >= 0) {
  image (w1, posx, posy);
  }
}
}


