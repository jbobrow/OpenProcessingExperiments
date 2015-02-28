
int x=25;
int y=50;
int xspeed = 3;
int yspeed = 2;
 
 
    void setup () {
   
  size (400,400);
 
   
  smooth ();
}
 
 
    void draw () {
     background (255);
     noStroke();
  ellipse (x,y,10,10);
 fill (0);
 stroke(0);
  strokeWeight(10);
 line(0,0,0,height/3);
 line(0,height-height/3,0,height);
 line(0,0,width,0);
 line(width,0,width,height/3);
 line(width,height-height/3,width,height);
 line(0,height,width,height);
 
  

   
 
   
  x += xspeed;
  y += yspeed;
   
 if (x>width-5) {
    
   xspeed = -xspeed;
 }
    
  else if (x<5) {
     
    xspeed = -xspeed;
     
  }
   
  if (y<5) {
     
    yspeed = -yspeed;
     
  }
   
  else if (y>height-5) {
     
    yspeed = -yspeed;
     
  }
    
    
}
