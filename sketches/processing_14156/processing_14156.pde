
float x=0;
float y=0;
void setup() {
  size(400,600);
  colorMode(HSB,255,255,100);
}
void draw() {
stroke(random(100),random(0),random(100));
background(0);
for(int y=0; y<400; y=y+1) {
  float x=sin(radians(y+frameCount)*10)*400+250;
  line(y,x,y,y);
  
 }
 x=x+10;
 //print(frameCount);
}
      
                
