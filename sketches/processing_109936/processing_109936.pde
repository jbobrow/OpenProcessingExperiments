
PImage heart;
PImage lungs;
PImage bg;

ArrayList oxyleft;
ArrayList oxyright;

void setup() {
  size(692,804);
  heart = loadImage("heart.png");
  lungs = loadImage("lungs.png");
  bg = loadImage("organsBG.png");
  
  oxyleft = new ArrayList();
  oxyright = new ArrayList();
  
  smooth();
}

void draw() {
  background(0);
  image(bg, 0,0);
  
  for(int i = 0; i < hour(); i++) {
    oxyleft.add(new Oxy(56,288, 171,407));
  }
  
  for(int i = 0; i < minute(); i++) {
    oxyright.add(new Oxy(424,630, 160,430));
  }
  
  //beats once per second
  float x = millis()/1000.0;
  float c01 = cos(2*x);
  float c02 = cos(1+5*x);
  float c03 = 1+((c01+c02)/6);
  
  float heartPulse = pow(c03,5.0);
  
  float heartH = map(heartPulse, 0, 3,  320,345);
  
  image(heart, 200, 130, 279, heartH);
  
  for(int i = 0; i < hour(); i++) {
    Oxy l = (Oxy) oxyleft.get(i);
    
    l.run(288,56, 407,171);
    l.display();
  }
  
  for(int i = 0; i < minute(); i++) {
    Oxy l = (Oxy) oxyright.get(i);
    
    l.run(630,424, 430,160);
    l.display();
  }
  
  image(lungs,0,0);
  
}

//oxygen molecules
class Oxy {
  float posX;
  float posY;
  float size;
  float xspeed;
  float yspeed;
  
  Oxy(float loX, float hiX, float loY, float hiY) {
    posX = random(loX,hiX);
    posY = random(loY,hiY);
    xspeed = random(-1,1);
    yspeed = random(-2,0);
  
  }
  
  void run(float hiX, float loX, float hiY, float loY) {
    posX = posX + xspeed;
    
    if(hiX < posX || posX < loX) {
      xspeed *= -1;
    }
    
    posY = posY + yspeed;
    
    if(hiY < posY || posY < loY) {
      yspeed *= -1;
    }
  }
  
  void display() {
    noStroke();
    fill(#b10c0c, 220);
    ellipse(posX, posY, 5,5);
    
  }
  
}

