
float a=0.1;
 
void setup(){
  size(200,200);
  colorMode(HSB, 360,100,100);
  //noLoop();
}
 
void draw(){
  background(0);
  noStroke();
  for(int x=100; x<200; x=x+60) {
  fill(100,150,150);
  float y=cos(x+frameCount)*100;
  rect(0,200,30,y); 
  float y=sin(x+frameCount)*150;
  rect(35,200,30,y); 
  float y=cos(x+frameCount)*130;
  rect(70,200,30,y); 
  float y=sin(x+frameCount)*50;
  rect(105,200,30,y); 
  float y=cos(x+frameCount)*70;
  rect(140,200,30,y); 
  float y=sin(x+frameCount)*110;
  rect(175,200,30,y);
 
 }
 
}
