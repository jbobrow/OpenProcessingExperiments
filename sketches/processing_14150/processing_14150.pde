
float x=0;
float y=0;
void setup() {
  size(360,500);
  colorMode(HSB,255,100,100);
}
void draw() {
stroke(random(0),random(150),random(255));
background(0);
for(int x=0; x<250; x=x+1) {
  float y=sin(radians(x+frameCount)*2)*250+250;
  line(x,y,y,x);
 
 }
 x=x+10;
 //print(frameCount);
}
