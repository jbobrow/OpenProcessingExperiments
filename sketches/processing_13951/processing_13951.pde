
//PROJECT 3: COLLAGE
//KIRA SULER
//OCT. 21st, 2010

PImage lazersdie;
PImage lazersdo;
PImage villian;
PImage punch;
PImage woman;
PImage dancer;
PImage stereo;
PImage shield;
PImage punchr;
PImage sky;

float x, y, z;
int s;

PFont type;



void setup(){
  size(640,480);
  smooth();

  
  lazersdie = loadImage("lazers_never_die.png");
  lazersdo = loadImage("lazers_do.png");
  villian = loadImage("villian.png");
  punch = loadImage("punch.png");
  woman = loadImage("woman.png");
  dancer = loadImage("dancer.png");
  stereo = loadImage("stereo.png");
  shield = loadImage("shield.png");
  punchr = loadImage("punch_r.png");
  sky = loadImage("sky.png");
  
  type = loadFont("HoboStd-90.vlw");
  
  noLoop();
  imageMode(CENTER);
}

void draw(){
    s= second();
    float mappedS = map(s,0,60,0,255);
 
  background(0);
  fill(mappedS);

  
  image(sky,310,200);
  
  textFont(type);
  text("HOLD DE LINE", 20, 100);
//  tint(153,77,145);
//  image(shield, 335,250,800,800);
//  noTint();
 
//  tint(10,158,153);
//  image(lazersdo, 400,100,750,500);
//  noTint();


  //PURPLE SUIT MEN
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 300,300);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 600,600);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 900,900);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 1200,1200);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 1500,1500);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 1900,1900);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 00,900);
//  popMatrix();
//  
//  pushMatrix();
//  y = random(height);
//  scale(1.0);
//  translate(0, y);
//  image(dancer, 2100,2100);
//  popMatrix();

  //PILES OF VILLAINS
  for(int i=10; i>=height/2; i+=10){
    for(int j=10; j<width/2; j+=10){
      scale(0.6);
      image(villian, j,i);
  }
}
  

  //PHONE PUNCH
  pushMatrix();
  y = random(height);
  translate(90, y);
  scale(0.5);
  image(punch, 0, 100);
  popMatrix();
  
  pushMatrix();
  y = random(height);
  translate(90, y);
  scale(0.5);
  image(punchr, 930, 100);
  popMatrix();
  
  //LINE OF WOMEN
  pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 0, 1350);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 300, 1350);
  popMatrix();
  
    pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 100, 1350);
  popMatrix();
 
  pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 600, 1350);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 800, 1350);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 1100, 1350);
  popMatrix();
  
    pushMatrix();
  x = random(width);
  translate(x, 0);
  scale(0.3);
  image(woman, 1500, 1350);
  popMatrix();
  
  
  //CENTER
  pushMatrix();
  scale(1.0);
  image(stereo, 330, 300);
  popMatrix();
  
  
  
//  pushMatrix();
//  for(int i=10; i>=height/2; i+=10){
//    for(int j=10; j<width/2; j+=10){
//      image(villian, 10,10);
//    }
//  }
//  popMatrix();
  
  
  
  
  
  
  
  
  
  
  

}

void keyPressed() {
  if (key == ' ') {
    redraw();
    if (key == 'c') {
      pushMatrix();
      x = random(width/2);
      y = random(height/2);
//      z = random(-HALF_PI, HALF_PI);
      translate(x, y);
//      rotate (z);
      image(lazersdo, 0, 0);
      popMatrix();
 
    }
  }
 
}

