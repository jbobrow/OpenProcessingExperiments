
PFont font;
int ypos;
int xpos;
float opac; 
int inc;
color col;
boolean el;
 
void setup(){
col = color(214,24,202);
font = loadFont("Serif-40.vlw");
size(375,280);
smooth();
textSize(60);
ypos = 70;
frameRate(150);
el = false; 
}
 
void draw(){
  background (0,255,1);
  if(el == true){ 
  el = false;
  }
  inc ++; 
  xpos = inc/12;
  opac = mouseY*2.5;
  if(mousePressed){ 
  inc = 0;
  el = true;
 
}
if(inc>800){
  inc = 0; 
}
 
else{ 
  fill(col, opac);
  text("m", 2*xpos, ypos);
  text("i", 3*xpos, ypos);
  text("c", 4*xpos, ypos);
  text("h", 5*xpos, ypos);
}
 
}
