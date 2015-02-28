
void setup(){
  size(200,200);
   colorMode(HSB,232,152,168)
}

void draw(){
  background(255);
  for(int x=0;x<200;x=x+5){
    float y=sin(radians(x+frameCount)*5)*50+100;
    line(x,5,x,y);
 }
 println(frameCount);
}    
                                                                                
