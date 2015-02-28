
float x = -0;
float y = 0;
float xspeed = 1.1;
float yspeed = 1.1;
float r = 32+.2*y;
    
void setup() {
  size (500,600);
  frameRate(30);
}
     
void draw(){
      
  x = x + xspeed+((y*.001)-(x*.0009));
  y = y + yspeed;
      
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
    
xspeed = Y*xspeed;
        
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
        
    strokeWeight(25);
    stroke(0+y/2,100+x/2*(y/799),255-(.5*x));
    fill(20*r+(y+2), x*1, y*1);
    ellipse (x,y,50, 100);
        
    r = constrain(10, 1, 100);
        
}
       
       
   
void keyPressed() {
  save("japey.tiff");
}
 
                
                
