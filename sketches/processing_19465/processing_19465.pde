
PFont fontA;


void setup(){
  fontA = loadFont("Cracked-48.vlw");
  size(250,250);
  background(255);
  fill(0,102);
  smooth();
  noStroke();
}

void draw(){

  fill(mouseX,mouseY,random(30,200),80);//colour will chnage depending on mouse position
  text("N",mouseX,mouseY);//when mouse moves letters appear
  text("  2",mouseX,mouseY);
  text("    K",mouseX,mouseY);
  text("      3",mouseX,mouseY);
  text("        V",mouseX,mouseY);
  text("          4",mouseX,mouseY);
 

 if(mousePressed){//if mouse clicked background will turn black and start drawing again
  background(0);
  text("N",mouseX,mouseY);//when mouse moves letters appear
  text("  2",mouseX,mouseY);
  text("    K",mouseX,mouseY);
  text("      3",mouseX,mouseY);
  text("        V",mouseX,mouseY);
  text("          4",mouseX,mouseY);
}
}


