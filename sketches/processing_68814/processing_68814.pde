
void setup(){
 size(500,500); 
 background(255,191,221);
 smooth();
 frameRate(10);
 
 }
 
 void draw(){
 noStroke();
 fill(random(180,255),0,random(0,50));
 float x = random(10,70);
 ellipse(random(0,width),random(0,height),x,x);
 }
