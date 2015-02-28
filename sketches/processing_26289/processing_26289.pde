
PFont bauhaus;
PFont desdemona;
PImage boats;

void setup(){
  size(345,500);
  
  bauhaus = loadFont("Bauhaus93-35.vlw");
  desdemona = loadFont("Desdemona-20.vlw");
  boats = loadImage("boats.gif");
}

void draw(){
  background(0,75,250);
  
  tint(255,255,255,100);
  image(boats,0,0);

  fill(5,25,255);
  textFont(bauhaus);
  textSize(30);
  text("kinetic swaying waves",mouseX,mouseY);
  
  
  fill(255,255,255);
  textFont(desdemona);
  textSize(30);
  text("static ocean floors",10,490);
}

