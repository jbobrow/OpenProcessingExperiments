
PFont font;
float y1=10;
float y2=-50;
float y3= 0;

void setup(){
  size(250,250);
  background(0);
  font = loadFont("CooperBlackMS-100.vlw");
  textFont(font);
  frameRate(50);
  
}

void draw(){

  background(#E0E0E0);  
  //m going down
  fill(#F0BC00, 100);
  text("m", 20, y1);
  y1 += 2;
  if (y1 > 300){
    y1 = - 10;
  }
  
  //1 going down
    {
  fill(#ffffff, 100);
  text("1", 50, (y2-100));
  y2 += 2.0;
  if (y2 > 450){
    y2 = - 30;
  }
  
  //x going down
   {
  fill(#3DA08D, 100);
  text("x", 80, y2);
  y2 += 1.3;
  if (y2 > 300){
    y2 = - 20;
  }
  
  //second 1 going down
     {
  fill(#D63F4B, 120);
  text("1", 120, y3-120);
  y3 += 1.7;
  if (y3 > 400){
    y3 = - 20;
  }}
  
  //z going down
    {
  fill(#ffffff, 120);
  text("z", 140, y3);
  y3 += 1.2;
  if (y3 > 400){
    y3 = - 20;
  }}
  
  //7 going down
    {
  fill(#71A548, 120);
  text("7", 165, (y3-160));
  y3 += 1.5;
  if (y3 > 450){
    y3 = - 40;
  }}
  
  }}}

