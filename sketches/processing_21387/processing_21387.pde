
void setup(){
  PFont x;
  size(300,300);
  x=loadFont("BookmanOldStyle-Bold-10.vlw");
  textFont(x);
  fill(0);
}
void draw(){
int h=hour();
if (h<=5){
  background(255,0,0);
  text("Go back to sleep. It's too early.",65,150);
}
if (h>=21){
  background(255,0,0);
  text("Go to sleep. It's too late.",80,150);
}
if ((h>=6)&&(h<=20)){
  background(0,255,0);
  text("Perfect!  You're awake at just the right time!",30,150);
}
}


