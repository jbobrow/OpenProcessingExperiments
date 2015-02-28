
PImage mono;
int x=10;
int c=50;
int v= 200;
void setup(){
   background(0);
  size(600,600);
  mono = loadImage ("mono-malo1.jpg");
}
    
  void draw(){
    if   (mousePressed) {
      float x= mouseY;
    float y= mouseX;
    image(mono,mouseX,mouseY,100,100);
      
    
    
  
}
 
 
else {
      
    
    float x= mouseY;
    float y= mouseX;
    smooth();
  background(0);
      
    noStroke();}
   
 
  }

