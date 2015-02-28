
// the x position of the circle
int x = 0; 
// if true, the ellipse moves right, 
// if false, the ellipse moves left.
boolean movingRight = true;

void setup() { 
  size(400,400); 
  smooth(); 
}

void draw() { 
 
  // clear the background
  background(0);  
  
  // draw the ellipse 
  ellipse(x, height/2, 50,50); 
  
  // if movingRight then add 10 to x
  if(movingRight) {
    x+=10;
  } else {
    // otherwise subtract 10 from x
    x-=10;  
  }
  
  // if we're all the way over to the right, start moving to the left
  if(x>width-25) { 
    movingRight = false; 
  } else if(x<25) { 
    // and if we're all the way over the left, start moving to the right
    movingRight = true;      
  }
  
}

