
void setup(){
  size(500,500);
  background(255);
  smooth();
noFill();
}
void draw(){
 for( int i=0;i<500;i+=10){
   float begin=radians(i);
   float end=begin+HALF_PI;
   stroke(240,200,40,cos(i)*10);
   arc(250,250,mouseX,mouseY,begin,end);

}
}


