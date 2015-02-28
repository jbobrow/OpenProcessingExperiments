
          
                float x = 450
;
 
float y = 360;
float xspeed = .00001;
float yspeed = .00001;
float r = 32+.2*y;
      
void setup() {
  size (900 ,700);
  frameRate(30);
}
       
void draw(){
        
  x = x  + -.001+xspeed+(.0001%y)+(12*( cos(y)));
  y = y + .01-yspeed-(.00001*x)+(4*(cos(x)));
        
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
      
xspeed = Y*xspeed;
          
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
          
    strokeWeight(10);
    noStroke();
   // stroke((300*(cos(y)*2)+(cos(x)*.3)/5),x/5,190-(y*.33)-(x*.5));
   fill(0);
   
   // fill((50*(11%(cos(y))*2)*(cos(x)*6)/5)*10,(x%5)*cos(y)*40,10%(y*10)+(x*.1));
    //fill(20*r+(y+2), x*1, y*1);
    rectMode(CENTER);
    rect (x,y,10,2*(5*cos(x)+cos(y)));
          
}
         
         
     
void keyPressed() {
  save("japey.tiff");
}

