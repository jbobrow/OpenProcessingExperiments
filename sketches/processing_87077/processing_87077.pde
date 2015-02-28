
// adam ben-dror | 810161656
// hw - 3 
// © 2013

float easingCoef, x, y, distX, distY, x1, y1, distX1, distY1 ;


void setup() 

{
  size(600,600);
  smooth (); 
  background (0 );
  x = width * .5;
  y = height * .5;
  x1 = width * .5;
  y1 = height * .5;
  easingCoef = .02; 

}


void draw() 

{
 
  
  x = x + (distX * easingCoef); 
  y = y + (distY * easingCoef);
   
  distX = mouseX - x;
  distY = mouseY - y;
  
  
  x1 = x1 + (distX1 * easingCoef); 
  y1 = y1 + (distY1 * easingCoef);
  
  distX1 = pmouseX - x1; 
  distY1 = pmouseY - y1;
  
    
  int wt = abs (mouseX - pmouseX);
  strokeWeight( 12 + wt*.9); 
  // stroke(mouseY +random(-30, 30), mouseX +random(-30,30), mouseY +random(-30, 30), 40); 
  stroke  (random(255), 250, random (255), 30);  
  
  line(x1+ random(-30, 30), y1 + random (-30,30), x + random (-30,30)  , y + random (-30,30) );
 
  
}

