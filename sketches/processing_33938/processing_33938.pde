
int w = 7;
float h = mouseY;


void setup(){
  frameRate(10);
  size(700,400);
  background(255);
  fill(44,79,127,random(255));
  noStroke();
  
}
  
  void draw(){
  
 background(255);
 
  strokeWeight(1);
  line(0,200,700,200);
  
  
  
 /*int xpos = 0;
  while(xpos < width){
   //h = (noise(xpos/70.0)-0.5)*200;
   //h = sin(xpos/100.0)*100;
   h = barheightX,barheightY;
   rect(xpos,height/2,w,h);
   xpos = xpos + w;
  */
   
   }
   
   void mouseMoved(){
  
  
     
     int xpos = 0;
  while(xpos < width){
   //h = (noise(xpos/70.0)-0.5)*200;
   //h = sin(xpos/100.0)*100;
   h = random(-100,100);
   rect(xpos,height/2,w,h);
   xpos = xpos + w;
   
   }
   
 
 }

