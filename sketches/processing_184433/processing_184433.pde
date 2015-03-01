
int x=320 ;
int y=240;
void setup(){
  background (255,255,0);
  size(640,480);
  println("setup done");
  frameRate(1);
}

void draw(){
  noStroke();
  rectMode(CENTER);
   
   fill(0,255,0);
  rect(320,240,100,100);
  fill(255,255,255);
  //rect(
  rect(320-30,240,10,10);
  rect(320+30,240,10,10);
  
}
