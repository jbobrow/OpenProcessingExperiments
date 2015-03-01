
PImage img;      //Grass Background
PImage tree;       //Tree cursor
PFont font;

int mouseClicks = 1;

/* @pjs preload="Routetut.png"; */  
//Assignment 2: Drawing Program by Vincent Ong

void setup () {
  size(639,480);
  img = loadImage("Routetut.png");
  image (img, 0, 0);
  font = loadFont("Helvetica-Bold-48.vlw");
  tree = loadImage("tree.png");

 
}

void draw() {
  


  textFont(font, 20);
  text("CLICK TO PLANT A TREE", 200, 240);
  
   if (mousePressed) {
  image(tree,mouseX,mouseY,30,47);
  }
  
   
}




