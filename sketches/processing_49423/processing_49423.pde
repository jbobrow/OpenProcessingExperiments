
float x = 1;
float y = 1;
boolean cir = false;
boolean cle = false;

void setup () {
  
  size (400, 400);
  smooth (); 
  ellipseMode (CENTER);
    
}

void draw () {
 
  noStroke ();
  background (110, 150, 200);
  fill (random(150), random(30), random(255));
  ellipse (x, y, 50, 50);
    
  if (cir) {
   
   x++; 
    
  } else { 
   
   x--;
    
  }
  
  if (cle) {
    
   y+= random(5, 10);
   
  } else {
     
   y-= 5;
   
  }   
  
  if (x > width - 25) {
    
    cir = false;
    
  } else if (x < 25) {
    
    cir = true;
    
  }
  
  if (y > height - 25) {
    
    cle = false;
    
  } else if (y < 25) {
    
    cle = true;
    
  }
  
  
}
