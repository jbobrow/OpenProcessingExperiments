
void setup() {
 
  size(500, 500);
  background(0); 
  
  stroke(0);
  
  smooth();
  
   
}
 

 
void draw() {
  translate (width/2,height/2);
 // rotate(mouseX/3.0);
   rotate(radians(second())*20);
 rectMode(CENTER);
  println (mouseX +"," + mouseY);
 triangle(-100,0,-100,-150,-150,-150);
  triangle(100,0,100,150,150,150);
  
}
  

