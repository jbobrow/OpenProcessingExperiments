
int x=320 ;//  center x-position
int y=240;//center y-position

void setup(){
  background (255,255,0);
  size(640,480);
  println("setup done");
  frameRate(30);
}

void draw(){
  x=mouseX;
  y=mouseY;
  background(255,255,0);
  println("start to draw");

  rectMode(CENTER);
   
   fill(0,255,0);
  rect(x,y,100,100);
  fill(255,255,255);
  rect(x-30,y,10,10);
  rect(x+30,y,10,10);

  
}
