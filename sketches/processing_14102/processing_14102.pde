
void setup() {
  size(360,200);
  colorMode(HSB);
}
void draw() {
  background(0);
  for( int x=0; x<360; x=x+10) {
    float y=sin(radians(x+frameCount)*2)*40+mouseY;;
    stroke (100);
    line(x,0,x,y); 
    strokeWeight(4);
    
    //
    for( int a=360; a>0; a=a-10) {
    float b=cos(radians(a+frameCount)*2)*40+100;
    line(a,200,a,b); 
    
    stroke(HSB,random(100,250),200,200);
    }
  }
}
           
                
