
float x;
float xspeed;
float y;
float yspeed;
int x1;
PFont UPC;
PFont Font2;
PImage Scuba;

void setup(){
  size(500,500);
  x1=0;
  UPC = loadFont("LilyUPCItalic-48.vlw");
  Font2 = loadFont("LilyUPCBold-24.vlw");
  x=50;
  xspeed=random(10);
  y=350;
  yspeed=random(10);
  Scuba = loadImage("Scuba Diver.jpg");
}
  void draw(){
  background(255,0,0);
  tint(255,0,0,100);
  image(Scuba,150,250);
  tint(255,0,0,100);
  image(Scuba,250,200,100,100);
  tint(255,0,0,100);
  image(Scuba,400,200,50,50);
  fill(0);
  textFont(UPC);
  textSize(130);
  text("Scuba",x,150);
  x=x+xspeed;
  y=y+yspeed;
  if(x>=290){
    xspeed= xspeed*-1;}
  if(x<+0){
    xspeed= xspeed*-1;}  
  fill(255);
  textFont(Font2);
  text("It's a funny word.",mouseX+15,mouseY+14);
}

