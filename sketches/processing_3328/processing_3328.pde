
void setup(){ 
  size(500,400); 
   colorMode(RGB, 360,100,100);  
     background(#FFFFFF);
  smooth(); 

} 
void draw (){ 

   int m= millis()/10;
   noFill();
 float x= random (height^2); 
float y= random(width^2); 
 strokeWeight(3);
stroke(x,y,56,150); 
  ellipse(x,y, second(), second()); 
  
 stroke(#FFFFFF);
  strokeWeight(1);
  ellipse(x,y,m,m);
  ellipse(x,y,second(),second());
} 





