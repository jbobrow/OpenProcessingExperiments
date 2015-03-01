
PImage dave;
float a=-200;
float b=-150;
int x = 15;
 
void setup(){
   
  size(1000,1000);
  dave = loadImage("dave.JPG");
  background(255,255,255);
  frameRate(120);
   
}
void keyPressed() {
  if (keyCode == UP){
    x = x+2;
  } else if (keyCode == DOWN) {
    x = x-2;
  }
}
  
 void draw(){
   translate(width/2, height/2);
   rotate(a);
   a=a+0.5;

   
   noStroke();
   image(dave,b,0,x,x);
   b=b+0.5;
   
   
    
 }

