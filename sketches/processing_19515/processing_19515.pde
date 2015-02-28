
void setup(){
  size(250,250);
  smooth();
  background(0);
  frameRate(40);
  
  PFont font;
  font = loadFont("AGaramondPro-Bold-75.vlw");
  textFont(font);
}

void draw(){
  fill(0,11);
  rect(0,0,width,height);
  fill(0,random(50,100),100,200);  //draw each letter slightly above the mouse's y-position
  text("N",-7,mouseY-random(-1,5));
  text("1",46,mouseY-random(-1,5));
  text("E",81,mouseY-random(-1,5));
  text("1",122,mouseY-random(-1,5));
  text("H",155,mouseY-random(-1,5));
  text("6",215,mouseY-random(-1,5));
}

