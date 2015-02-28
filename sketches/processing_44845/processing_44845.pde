
PImage img;
PFont font;
float y1=10;
float y2=-50;
float y3= 0;


void setup(){
  size(700,450);
  img=loadImage("ice.jpg");
  background(0);
  font = loadFont("CooperBlackMS-100.vlw");
  textFont(font);
  frameRate(50);
}

void draw(){
  background(255);
  image(img,0,0);


  //i going down
  fill(#F0BC00, 100);
  text("i", 270, y1);
  y1 += 2;
  if (y1 > 300){
    y1 = - 10;
  }
  
  //c going down
    {
  fill(#ffffff, 100);
  text("c", 280, (y2-100));
  y2 += 2.0;
  if (y2 > 400){
    y2 = - 30;
  }
  
  //e going down
   {
  fill(#3DA08D, 100);
  text("e", 330, y2);
  y2 += 1.3;
  if (y2 > 300){
    y2 = - 20;
  }
  
  //i going down
     {
  fill(#D63F4B, 120);
  text("i", 255, y3-120);
  y3 += 1.7;
  if (y3 > 400){
    y3 = - 20;
  }}
  
  //c going down
    {
  fill(#ffffff, 120);
  text("c", 250, y3);
  y3 += 1.2;
  if (y3 > 400){
    y3 = - 20;
  }}
  
  //e going down
    {
  fill(#71A548, 120);
  text("e", 320, (y3-160));
  y3 += 1.5;
  if (y3 > 450){
    y3 = - 40;
  }}
  
  }}}

