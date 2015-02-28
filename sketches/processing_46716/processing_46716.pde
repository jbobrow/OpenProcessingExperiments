
float x = 600;
float y = 100;
float xspeed = 1;
float yspeed = 1.1;
float r = 32+.2*y;
      
void setup() {
  size (900,700);
  frameRate(30);
}
       
void draw(){
        
 
  x = x + -.01+xspeed+(.00099*y)-(.01*( 2/cos(y)));
  y = y + -.01+yspeed-(.00091*x)+(.01*(cos(x)));
        
 
 
        
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
      
xspeed = Y*xspeed;
          
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
   rotate(.05*cos(.08*y)); 
  rotate (-.04*cos(.08*x));   
    noStroke();
    //strokeWeight(25);
    //stroke(0+y/2,200-x/2,60/(.5*y)/x);
   fill(0+y/2,200-x/2,(y*100)-((.005*cos(x))*5000000));
    ellipse (x,y,5, 5);
          
    r = constrain(10, 1, 100);
          
}
     
      
void keyPressed() {
  save("japey.tiff");
}
                
                
