
void setup(){
  size(360,200);
 colorMode(HSB);

}
void draw(){
  background(0);
  for(int x=0; x<750; x=x+10){
  float y=sin(radians(x+frameCount)*18)*170+140;
    fill(0,0,255);
    ellipse(x,0,x,y);
  }
  println(frameCount);
}



        
