
void setup() {
  size( 200,200);
}
void draw(){
  float b=0;
for(int a=0;a<360*8;a=a+3){
  point(100,100);
   ellipse(100+b*sin(radians(a+frameCount)),100+b*cos(radians(a+frameCount)),10,10);
b = b+0.2;
}

}
      
