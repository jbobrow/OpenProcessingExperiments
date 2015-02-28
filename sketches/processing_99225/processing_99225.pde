
color weiss = color(255);
color orange = color(210, 113, 19,30);
color lila = color(122, 61, 76,30);
color gruen = color(69, 100, 43,30);
color blau = color(43, 80, 90,30);
 
 
void setup(){
size(800,400);
background(weiss);
smooth();
}
 
 
void draw(){
  noFill();
  smooth();
  stroke(1);
  stroke(orange);
  ellipse(0,0,mouseX*2,mouseY*2);// (x,y,breite,höhe)
  stroke(lila);
  ellipse(width,height,mouseX*2,mouseY); 
  stroke(gruen);
  ellipse(0,height,mouseX*2,mouseY*2);
  stroke(blau);
  ellipse(width,0,mouseX*2,mouseY*2);
}

