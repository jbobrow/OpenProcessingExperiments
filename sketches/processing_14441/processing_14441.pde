
/**
 * Modification of the Atmosphere code to create a system which exhibits Emergence.
 * A new class, Modulator, has been added to simulate this.
 * Whenever a vapor passes through a modulator, it assumes its color properties.
 * Eventually, the system will generate a map of the randomly placed modulators.
 * However, since the nature of the vapors is to change color randomly when they
 * collide there is slight variation.
 * Also, if the modulators are sufficiently spaced out, a flux between them will occur
 * as the vapors move in different directions in and out of them.
 
 Press SPACE BAR to see where the modulators are. 
 Press 'c' or 'C' to clear the screen
 Click and or drag the mouse to make more vapors.
 
 The modulators colors are the average of all the vapors' Hue, Saturation, Brightness and Alpha.
 **/

PFont font;
Vapors vapors;
Modulators modulators;

void setup () {
size(600, 400);
  //size(screen.width, screen.height);
  smooth();


  colorMode(HSB, 1000);
  background(500, 0, 500);
  vapors = new Vapors((int)random(50, 100));
  modulators = new Modulators(vapors);


  font = loadFont("HelveticaNeue-48.vlw");
  textFont(font, 32);
}

void draw() {
  //ether();

  // background(0);
  if (vapors.sizeV()>600){
    vapors.clearV();
    
    vapors.addVapor(new Vapor(width/2, height/2, random(5,25)));
  }
  vapors.checkCollision();
  vapors.makeNewOrigin();
  modulators.display();
  modulators.ether();
  vapors.display();  
  modulators.vaporCollide();
  fill(0, 0, 0, 3);
  noStroke();
  rect(0, 0, width, height);





}
void keyPressed() {
  if (key==' ') {
    modulators.keyPressed();
  }
  if (key == 'c' || key == 'C'){
    vapors.clearV();    
    background(0);
    vapors.addVapor(new Vapor(width/2, height/2, random(5,25)));
    modulators.modC();
  }
}

void keyReleased() {
  if (key==' ') {
    modulators.keyReleased();
  }
  if (key=='c' || key=='C') {
    background(0,0);
    vapors.addVapor(new Vapor(width/2, height/2, random(5,25)));
    modulators.makeMods();
  }
}
void mouseClicked() {
  //save("inheritance.jpg");
    vapors.addVapor(new Vapor(mouseX, mouseY, random(5,25)));
  }
  void mouseDragged() {
    vapors.addVapor(new Vapor(width/2, height/2, random(5,25)));
  }
void ether() {
  int allH = 0, allS = 0, allB = 0, allA = 0, vapNum = vapors.sizeV();
  for (int i=0; i<vapNum; i++) {
    Vapor vapor = (Vapor) vapors.getV(i);
    allH+=vapor.h;
    allS+=vapor.s;
    allB+=vapor.b;
    allA+=vapor.a;
  }
  int aveH=allH/vapNum, aveS=allS/vapNum, aveB=allB/vapNum, aveA=allA/vapNum;
  allH=0;
  allS=0;
  allB=0; 
  allA=0;
  //noStroke();
  fill(aveH, aveS, aveB, 100);
  rect(0, 0, width, height);
}












