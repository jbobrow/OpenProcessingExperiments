
PFont justSo, bored, candy;
PImage black, dripLight;

void setup(){
  size(800,500);
  background(255);
  smooth();
  frameRate(100);
  justSo = loadFont("ArialMT-24.vlw");
  bored = loadFont("ArialMT-48.vlw");
  candy = loadFont("ArialMT-18.vlw");
  black = loadImage("blackDrip.png");
  dripLight = loadImage("dripLight.png");

}

int yCreep = 0;
void draw(){
  image(dripLight, 0,0,800,yCreep*2);
  image(black,-10,0,810, -400 + yCreep*3);    
  fill(255);
  textFont(justSo);
  pushMatrix();
  translate(150,0);
  text("I am just so", 100, 200);
  text("by",270,240);
  text("thing.", 330, 240);
  text("I wish I could", 100, 260);
  text("meet you all", 100, 280);
  textFont(bored);
  text("BORED", 98, 240);
  text("every", 270 ,220);
  text("again.", 260, 280);
  popMatrix();
  textFont(candy);
  text("-Candy Darling", 600, 400);
  yCreep += 2;

  

  
}

