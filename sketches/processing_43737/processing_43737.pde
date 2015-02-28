
float x = 199;
float y = 199;
float xspeed = 1.01;
float yspeed = 1;
float r = 32+.2*y;
    
void setup() {
  size (700 ,500);
  frameRate(30);
}
     
void draw(){
      
  x = x + xspeed+y*(HALF_PI*(cos(y)));
  y = y + yspeed;
      
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
    
xspeed = Y*xspeed;
        
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
        
    strokeWeight(25);
    stroke(90+y/2,100+x/2*(y/799),200-(x*.5)+(y*.33));
    noFill();
    //fill(20*r+(y+2), x*1, y*1);
    rect (x,y,25 , 30);
        
}
       
       
   
void keyPressed() {
  save("japey.tiff");
}
 
