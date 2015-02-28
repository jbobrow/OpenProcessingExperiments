
void setup(){
 size(500,500);
 background(0,0,0);
 smooth();
n=10000
for(int i = 0; i < n; i++) {
 draw()
 }
 frameRate(100);  
 }
  
 void draw(){
 noStroke();
 fill(random(180,255),0,random(0,50));
 float size = 4;
n=100
for(int i = 0; i < n; i++) {
 ellipse(random(0,width),random(0,height), size, size);
 }
 }
