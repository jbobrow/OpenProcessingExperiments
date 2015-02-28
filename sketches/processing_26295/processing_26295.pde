
PFont cracked;
PFont copperplate;
PImage weasel;

void setup(){
  
  background(220);
  size(500,500);
  cracked = loadFont("Cracked-48.vlw");
  copperplate = loadFont("CopperplateGothic-Light-130.vlw");
  weasel = loadImage("weasel.png");
  
}

void draw(){
  
  noStroke();
  fill(220,60);
  rect(0,0,500,500);
  
 
 
  image(weasel,-40,150);
  
  fill(150+random(50));
  textFont(copperplate);
  text("Fear",90,120);

fill(0);
textFont(cracked);
text("weasels",mouseX+random(100)-random(100),mouseY+random(100)-random(100));





}

