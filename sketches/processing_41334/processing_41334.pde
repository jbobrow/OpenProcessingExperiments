
PImage ima;
PFont myfont;

void setup(){
  size(600,600);
  ima = loadImage("happy.jpg");
  myfont = loadFont("AkzidenzGroteskBE-XBdCn-60.vlw");
}


void draw(){
  image(ima,-100,0);
  
  fill(255,0,255);
  textFont(myfont);
  textSize(150);
  text("hello",mouseX,mouseY);
}

