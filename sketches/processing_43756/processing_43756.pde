
    
               float x = 50;
float y = 50;
float xspeed = .5;
float yspeed = .3;
float r = 32+.2*y;
    
void setup() {
  size (500 ,600);
  frameRate(30);
}
     
void draw(){
      
  x = x + -.01-xspeed+(.00099*y)-(.01*( cos(y)));
  y = y + -.01-yspeed%(.0091*x)+HALF_PI-(1*(cos(x)));
      
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
    
xspeed = Y*xspeed;
        
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
        
    strokeWeight(1);
    stroke(1);
    noFill();
    //fill(20*r+(y+2), x*1, y*1);
    rect (x,y,5, 5);
        
}
       
       
   
void keyPressed() {
  save("japey.tiff");
} 
