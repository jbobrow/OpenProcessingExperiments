
void setup() {

 
  size(360,200);
colorMode(HSB);
}
void draw() {
 background(0);
  for(int x=0; x<360;x=x+1) {
 float y=sin(radians(x+frameCount)*2)*50+150;
 fill(180,100,255);
 rect(x,0,x,y);
  
}

println (frameCount);

}
