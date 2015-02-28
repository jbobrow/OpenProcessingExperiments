
PFont font;

void setup() {
  size(250,250);
  background(0);
  smooth();
  font = loadFont("EdwardianScriptITC-200.vlw");
}

void draw() {
  textFont(font,200);
  fill(random(100),0,0); 
  translate(125,125);
  rotate(radians(random(900)));
  text("n0r",0,0);
  translate(250,0);
  rotate(radians(random(900)));
  fill(random(60),0,random(60));
  for(
int i=5; i<250; i+=20)
  {
    text("1a0",i,50);
  }
}


