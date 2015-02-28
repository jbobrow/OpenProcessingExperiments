
PImage nutellabackground;
PImage mand;
PImage pot;

float x, y;

boolean finished = false;
int richting;
int hit = 0;
int mis = 0;
int level = 0;

Cirkel mijnCirkel;
Cirkel mijnCirkel2;
Cirkel mijnCirkel3;

void setup() {
 mouseX = 200;
 richting = 7;
 nutellabackground = loadImage ("achtergrond.jpg");
 mand = loadImage ("mand.png");

  
  size(400,400);
  smooth();
  mijnCirkel = new Cirkel(80, 0, 0, 0, 2);
  mijnCirkel2 = new Cirkel(140, 0,0,0,3);
  mijnCirkel3 = new Cirkel(300, 0,0,0,4);
}

void draw() {
  background(255);
  drawNutellabackground();
  mijnCirkel.updateCirkel();
  mijnCirkel.testCirkel();
  mijnCirkel.tekenCirkel();
  mijnCirkel2.updateCirkel();
  mijnCirkel2.testCirkel();
  mijnCirkel2.tekenCirkel();
  mijnCirkel3.updateCirkel();
  mijnCirkel3.testCirkel();
  mijnCirkel3.tekenCirkel();
  drawMand();
  fill(255);
  text ("hit: " + hit, 15,25);
  text ("mis: " + mis, 15,50);
  text ("level: " +level, 320,25);
}

void drawNutellabackground () {
  image(nutellabackground, 0, 0);
}

void drawMand () {
  image(mand, mouseX-65,350);
}
 
void drawPot() {
  image(pot, x, y);


 if (y > height) {
   y = 0;
 }
 
 if (y == 0) {
   x = random(50,350);
   }
   y = y +richting;
 }
class Cirkel {
  float x;
  float y;
  int breedte;
  int hoogte;
  int snelheid;
  
  Cirkel (int tempX, int tempY, int tempBreedte, int tempHoogte, int tempSnelheid) {
    x= tempX;
    y = tempY;
    breedte = tempBreedte;
    hoogte = tempHoogte;
    snelheid = tempSnelheid;
    pot = loadImage ("nutella copy.png");
  }
  
  void updateCirkel () {
    y = y + snelheid;
  }
  
  void testCirkel () {
    if(y > width) {
      y = 0;
  }
    
    if(y > 265 && x > mouseX-115 && x < mouseX+45) {
    x = random(height);
    y = 0;
    hit += 1;
    }
  
    if (hit == 21){
      hit = 0;
      level += 1;
    }
    
    if (level >=1){
        y = y + snelheid * 0.2;
    }
        if (level >=2){
        y = y + snelheid * 0.2;
    }
        if (level >=3){
        y = y + snelheid * 0.2;
    }
        if (level >=4){
        y = y + snelheid * 0.2;
    }
        if (level >=5){
        y = y + snelheid * 0.2;
    }
    
    if (y == 400){
      y = 0;
      mis += 1;
    }
    
    if (mis == 21){
      background(0);
      y = 600;
      mouseX = 600;
      textAlign(CENTER);
      fill(255);
      text("You're a loser!", width/2, height/2);
    }
  }
  
  void tekenCirkel () {
    image(pot,x,y);
  }
}


