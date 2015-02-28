
PFont myfont;
PImage myimage;

void setup(){
  size(500,500);
  myfont = loadFont("BirchStd-48.vlw");

}

void draw(){
  background(0);
  
  fill(19,255,255);
  textFont(myfont);
  text("testtesttesttesttesttesttesttesttesttesttesttest",mouseX,mouseY);
}

