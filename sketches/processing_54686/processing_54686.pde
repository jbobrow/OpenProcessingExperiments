
int x = 20;
float b = 400;
PFont myfont;

void setup(){
  size(600,400);
  background(255,255,255);
  myfont = loadFont("Cochin-92.vlw");

}

void draw(){
  fill(165,22,0,100);
  ellipse(300,300,b,b);
  
  fill(0,0,0);

  textFont(myfont);
  textSize(20);
  text("coffee bagels muffins",215,b);
  
}

void mousePressed(){
  b = b - 10;
}

