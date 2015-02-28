
float x = 110;
float y = 203;
float xspeed = 1.0;
float yspeed = 1.1;
float r = 32+.2*y;
      
void setup() {
  size (900,700);
  frameRate(30);
}
       
void draw(){
        
 
  x = x + -.01+xspeed+(.00099*y)-(.01*( cos(y)));
  y = y + -.01+yspeed-(.00091*x)+(.5/(cos(x)));
        
 
 
        
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
      
xspeed = Y*xspeed;
          
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
   rotate(.05*cos(.1*y));       
    
    
  strokeWeight(25);
   // stroke(0+y/2,200-x/2,60/(.5*y)/x);
  noStroke();
   fill(y/10+(300-(x/2)),200-x/4,60/(.5*y)+((x-100)/10));
    ellipse (x,y,5, 5);
    rotate (x*.01*(sin(y)));      
          
    r = constrain(10, 1, 100);
          
}
     
      
void keyPressed() {
  save("japey.tiff");
}

                
                
