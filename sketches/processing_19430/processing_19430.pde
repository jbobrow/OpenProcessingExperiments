
PFont font;
 
void setup() {
  size(250,250);
  background(0);
  smooth();
  font = loadFont("Cracked-100.vlw");
}
 
void draw() {
  textFont(font,200);
  fill(random(600),900,900);
  translate(50,25);
  rotate(radians(random(900)));
  text("L4N 0L3",0,0);
  translate(250,0);
  rotate(radians(random(300)));
  fill(random(100),0,random(100));
  for(
int i=5; i<250; i+=20)
  {
    text("1a0",i,50);
  }
}

