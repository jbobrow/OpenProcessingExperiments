
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = .2;
float r = 32+.2*y;
    
void setup() {
  size (700 ,500);
  frameRate(30);
}
     
void draw(){
      
  x = x + .01*xspeed+(.001*y)-(HALF_PI/(cos(y)));
  y = y + .01/yspeed+(.001*x)+(.1*(cos(x)));
      
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
    ellipse (x,y,25 , 30);
        
}
       
       
   
void keyPressed() {
  save("japey.tiff");
}
 


                
                
