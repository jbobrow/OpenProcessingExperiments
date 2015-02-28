
PFont fontA;
 
 
void setup(){
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  size(800,600);
  background(0);
  fill(0,102);
  smooth();
  noStroke();
  noCursor();
}
 
void draw(){
 
  fill(mouseX,mouseY,random(30,200),80);//colour will chnage depending on mouse position
  text("KIERU 01",mouseX,mouseY);//when mouse moves letters appear
 
 
 if(mousePressed){//if mouse clicked background will turn black and start drawing again
  background(0);
  text("KIERU 01",mouseX,mouseY);//when mouse moves letters appear
 
}
}

