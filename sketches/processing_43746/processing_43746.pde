
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 1;
float r = 32+.2*y;
    
void setup() {
  size (700 ,500);
  frameRate(30);
}
     
void draw(){
      
  x = x + -.01+xspeed+(.001*y)+(.3/( cos(y)));
  y = y + .01-yspeed-(.001*x)+(.1*(cos(x)));
      
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
    
xspeed = Y*xspeed;
        
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
        
    strokeWeight(25);
    stroke((90+y)/2,100-x/2,200-(x*.5)+(y*.33));
    noFill();
    //fill(20*r+(y+2), x*1, y*1);
    rect (x,y,1 , 20);
        
}
       
       
   
void keyPressed() {
  save("japey.tiff");
}
 
