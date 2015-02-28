
int x=25;
int y=50;
int xspeed = 3;
int yspeed = 2;


    void setup () {
  
  size (400,400);
  
  smooth ();
}


    void draw () {
  
  background (0,255,255);
 fill (random (255),random (255), random (255));
  
  ellipse (x,y,50,50);
  
  x += xspeed;
  y += yspeed;
  
 if (x>width-25) {
   
   xspeed = -xspeed;
 }
   
  else if (x<25) {
    
    xspeed = -xspeed;
    
  }
  
  if (y<25) {
    
    yspeed = -yspeed;
    
  } 
  
  else if (y>height-25) {
    
    yspeed = -yspeed;
    
  }
   
   
}

