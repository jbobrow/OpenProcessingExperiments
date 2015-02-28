
                float x = 0;
float y = 0;
float xspeed = 1.2;
float yspeed = 1.2;
float r = 32+.2*y;
  
void setup() {
  size (500, 500);
  frameRate(30);
}
   
void draw(){
    
  x = x + xspeed+(x*.01)-(y*.01);
  y = y + yspeed;
    
  if ((x > width) || (x < 01 )) {
    xspeed = xspeed * -1;
  }
  
xspeed = Y*xspeed;
      
    if (( y > height) || (y < 1)) {
      yspeed = yspeed *-1;
    }
      
    strokeWeight(1);
    stroke(0+y/2,0+x/2,60/(.5*y)*x);
    fill(20*r+(y+2), x*1, y*1);
    rect (x,y,100, 100);
      
    r = constrain(10, 1, 100);
      
}
     
     
 
void keyPressed() {
  save("japey.jpg");
}
                
                
