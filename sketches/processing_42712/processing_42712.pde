
PImage ima1;
PImage ima2;
PFont Font1;
PFont Font2;

void setup(){
  size(720, 330);
  ima1= loadImage("Hole.png");
  ima2= loadImage("Run.png");
  
  Font1= loadFont("Apple-Chancery-48.vlw");
  Font2= loadFont("Palatino-Italic-48.vlw");
}

void draw(){
  
  image(ima1,0,0,720,330);
  tint(225,127);
  image(ima2,0,0,720,330);
  
  fill(255,255,255);
  textFont(Font1,50);
  text("EXIT",400,height/2);
  
  
  fill(255,255,255);
  textFont(Font2,23);
  text("Take A Rest",405,198);
 
  
  
   
  
}

