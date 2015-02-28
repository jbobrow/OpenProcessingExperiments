
PFont font;
int x=0;
int y=300;

void setup () {
  
  size (600,600);
  background(#FFE603);
  smooth();
  fill(0);
   
}

void draw() {
  background(#FFE603);
  stroke(9);
  font=loadFont ("HiraKakuStd-W8-48.vlw");
  textFont(font);
  
  text("I can do it!", x,y);
  
  x=x+3;
   
}

