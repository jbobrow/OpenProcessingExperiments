
int c = 0;
int y = 700;
void setup(){
  size(700,700);
  colorMode(HSB);
  background(0);
  frameRate(-1);
}
void draw(){    
  stroke(frameCount%(255),255,255);
  fill(frameCount%(255),255,255);
  for(float x=0; x>-400; x=x-35){
  ellipse((250-x)*cos(frameCount)+350,(250-x)*sin(frameCount)+350, 5, 5);
  }
  stroke(frameCount%(70)+200,255,255);
  fill(frameCount%(70)+200,255,255);
  for(float x=0; x<200; x=x+random(100)){
   ellipse((200-x)*cos(frameCount)+350,(200-x)*sin(frameCount)+350, 5, 5);
}
}
