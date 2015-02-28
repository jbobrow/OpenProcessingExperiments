
float s; 
PFont font;

void setup(){
  
  size(400,400);
  smooth();
  noStroke();
  font = loadFont("3dumb-48.vlw");
  
 
}

void draw(){
  
background(255);
fill(255,0,0);


textFont(font);
text((hour()+":" + minute()+":" + second()),10,40);

s  = map(second(), 0, 60 ,0,TWO_PI);

arc(150,150,100,100,0, PI/2+s);

noFill();
stroke(100);
strokeWeight(2);
arc(150,150,150,150,0, QUARTER_PI+s);



}

