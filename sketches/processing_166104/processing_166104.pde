
void setup(){
  size(500,500);
  background(255);
  noFill();
  smooth();
}
void draw(){
 for( int i=0;i<500;i++){
   float begin=radians(i);
   float end=begin+HALF_PI;
   arc(250,250,mouseX,mouseY,begin,end);

}
}


