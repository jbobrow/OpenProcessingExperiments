
int x;
PFont MonotypeCorsiva; 
PFont ReinerScript;
PImage marcjacobs;


void setup(){
  size (340,490);
  background(45,100,116);
  MonotypeCorsiva=loadFont("MonotypeCorsiva-48.vlw");
  ReinerScript=loadFont("ReinerScript-Regular-48.vlw");
  marcjacobs=loadImage("marcjacobs.jpg");
}
void draw(){
  tint (100, 150, 100);
  image (marcjacobs, 0, 0);
  fill(44, 59, 200);
  textFont(MonotypeCorsiva);
  fill (96,208,222);
  text("April 7, 2011",90,60);
  fill (190,10,200);
  textFont(ReinerScript);
  text("Fancy",259,450);
}



