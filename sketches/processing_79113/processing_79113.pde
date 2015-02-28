
/*Code created by Anne Marie Hood for YSDN Interactivity 2 for Exercise 3b*/
/*Subway train arrival*/

PImage img0;
PFont font;
int x1= 510;
int x2= 510;
int x3= 510;


void setup (){
  size (520,400);
  smooth();
  img0 = loadImage ("next.jpg");
  font= loadFont ("Monospaced.plain-38.vlw");
}
  
void draw (){
  image (img0,-350,-180);
  
  textFont (font);
  fill(255,0,0,random(150,245));
  text("3 Minutes", x1,212);
  x1 -=1;
  if (x1<-220) {
    text("2 Minutes", x2, 212);
      x2 -= 1;
      if (x2<-220){
        text("1 Minute", x3, 212);
        x3 -= 1;
        if (x3<-220){
          x3=-300;}
    }
  }
  fill (#07080b);
  noStroke();
  beginShape();
  vertex (-2,160);
  vertex (53,160);
  vertex (47,242);
  vertex (-2,242);
  endShape (CLOSE);
  
  fill (#12111a);
  beginShape();
  vertex (476,158);
  vertex (524,158);
  vertex (524,242);
  vertex (476,242);
  endShape (CLOSE);
}


