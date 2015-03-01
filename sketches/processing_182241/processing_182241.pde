
PImage dave;
float a=-200;
float b=-150;
 
void setup(){
   
  size(1000,1000);
  dave = loadImage("dave.JPG");
  background(255,255,255);
  frameRate(120);
   
}
 void draw(){
   translate(width/2, height/2);
   rotate(a);
   a=a+0.5;

   
   noStroke();
   float x = random(width);
   float y = random(height);
   color c = dave.get(int(x),int(y)); 
   image(dave,b,0,10,10);
   b=b+0.5;
   
   
    
 }

