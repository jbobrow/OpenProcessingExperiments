
// adam ben-dror | 810161656
// hw - 3 
// ¬© 2013

//mouse click adds a random colored ellipse 
//"c" clears the screen 
//"v" creates horizontal lines
//"b" creates verticle lines 

float easingCoef, x, y, distX, distY, x1, y1, distX1, distY1, r, g, b ;


void setup() 

{
  size(600,600);
  smooth (); 
  background (0 );
  x = width * .5;
  y = height * .5;
  x1 = width * .5;
  y1 = height * .5;
  easingCoef = .07; 
  frameRate(30);
  
}


void draw() 

{
  
  r = random(0, 200) ;
  g = 250; 
  b = random (255);
  
 
  
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
  stroke  (r, g, b, 30);  
  
  line(x1+ random(-30, 30), y1 + random (-30,30), x + random (-30,30)  , y + random (-30,30) );
 
  
}

void mousePressed() {
  noStroke(); 
  fill(r, g, b, 39);
    ellipse (mouseX, mouseY, random(1, 79), random(1, 70) );
  
}


void keyPressed() {
   if (key == 'c')
  {
    background(0);
  }
     
  if (key == 'v')
  { 
    x = x - 250;
  }
  
  if (key == 'b')
  { 
    y = y - 250;
  }
  
  
}





