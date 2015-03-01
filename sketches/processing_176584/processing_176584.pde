
/* @pjs preload="Dunbarton.png", "Bow.png", "Dice.png", "Mace.png", "Pistols.png", "Sword.png", "Wand.png"; */

double shield = 136;
double bow = 1888;
double wand = 637;
double sword = 145;
double gun = 26;
double mace = 1.1;
double dice = 1670;
double hours = shield + bow + wand + sword + gun + mace + dice;
PImage mabi;
PImage arrow;
PImage roll;
PImage swing;
PImage bullet;
PImage slash;
PImage magic;
Defend rookr = new Defend();

void setup(){
  size(650, 650);
  mabi = loadImage("Dunbarton.png") ;
  arrow = loadImage("Bow.png") ;
  roll = loadImage("Dice.png") ;
  swing = loadImage("Mace.png") ;
  bullet = loadImage("Pistols.png") ;
  slash = loadImage("Sword.png") ;
  magic = loadImage("Wand.png") ;
}

void draw(){
  background(0);
  image(mabi, 0, 0, width, height);
  
  pushMatrix();
  scale(.3);
  translate(400, 700);
  rookr.makeShield();
  popMatrix();
  
  pushMatrix();
  image(arrow, 150, 30, 250, 250);
  popMatrix();
  
  pushMatrix();
  image(swing, 270, 490, 20, 20);
  popMatrix();
  
  pushMatrix();
  image(bullet, 400, 490, 30, 30);
  popMatrix();
  
  pushMatrix();
  image(slash, 470, 320, 100, 100);
  popMatrix();
  
  pushMatrix();
  image(magic, 250, 280, 220, 220);
  popMatrix();
  
  pushMatrix();
  fill(255);
  rect(400, 50, 210, 210);
  fill(0);
  ellipse(505, 155, 45, 45);
  popMatrix();
  
  fill(255);
  text("Rookr: " + shield + " hours", 140, 290);
  text("Enilla: " + wand + " hours", 300, 310);
  text("Knuckleman: " + sword + " hours", 470, 310);
  text("Engel: " + gun + " hours", 365, 470);
  text("Psychotic: " + mace + " hours", 210, 480);
  text("Syndicator: " + dice + " hours", 450, 35);
  text("Mikoyo: " + bow + " hours", 200, 35);
}
class Defend{
  
  void edge(){
    beginShape();
    vertex(100, 100);
    vertex(325, 60);
    vertex(550, 100);
    vertex(490, 360);
    vertex(325, 550);
    vertex(160, 360);
    endShape();
  }
  
  void makeShield(){
    pushMatrix();
    scale(.6);
    translate(0, 500);
    fill(205);
    this.edge();
    fill(0, 0, 45);
    pushMatrix();
    scale(.9);
    translate(36, 33);
    this.edge();
    popMatrix();
    pushMatrix();
    translate(0, -20);
    this.rook();
    popMatrix();
    popMatrix();
  }
  
  void rook(){
    fill(255);
    rect(255, 350, 140, 40);
    rect(265, 185, 24, 25);
    rect(313, 185, 24, 25);
    rect(361, 185, 24, 25);
    rect(265, 200, 120, 40);
    quad(265, 350, 385, 350, 365, 240, 285, 240);
  }
  
  
}


