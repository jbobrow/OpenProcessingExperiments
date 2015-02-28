
float x = 0;
float y = 0;
float xspeed = 1.1;
float yspeed = 4.1;
float r = 32+.2*y;
      
void setup() {
  size (900,500);
  frameRate(30);
}
       
void draw(){
        
 
  x = x + -.01+xspeed+(.0099*y)-(5/( cos(y)));
  y = y + .01+yspeed-(.00091*x)%(.01-(cos(x)));
        
 
 
        
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
      
xspeed = Y*xspeed;
          
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
          
    strokeWeight(5);
    stroke(cos(y/2)+90,(40-cos(-x*2)/2)+(y*.9)/5,60/(.5*y)/x);
    fill(20*r+(y+2), x*1, y*1);
    ellipse (x,y,50, 1);
          
    r = constrain(10, 1, 100);
          
}
         
         
     
void keyPressed() {
  save("japey.tiff");
}
         
                
