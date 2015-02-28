
void setup(){
  size(360,200);
}

void draw(){
  background(255);
  colorMode(HSB);
  for(int x=2;x<360;x=x+10){
    float y=sin(radians(x+frameCount)*2)*15+55;
    line(x,15,x,y);
 }
 println(frameCount);
}
