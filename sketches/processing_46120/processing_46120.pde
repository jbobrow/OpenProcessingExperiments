
 float x = 450;
float y = 360;
float xspeed = .00001;
float yspeed = .00001;
       
void setup() {
  size (900 ,700);
  frameRate(30);
}
        
void draw(){
 drawscribe(4, .1*y, 0,.0001);
 drawscribe(.5, 8, 255, .01001); 
}
          
void drawscribe(float doodle, float diddle, int jangle, float fiddle){
 x = x  + -.001+xspeed+(.0001%y)+(diddle*( cos(y)));
  y = y + .01-yspeed-(fiddle*x)+(doodle*(cos(x)));
         
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
   fill(jangle);
    
   // fill((50*(11%(cos(y))*2)*(cos(x)*6)/5)*10,(x%5)*cos(y)*40,10%(y*10)+(x*.1));
    //fill(20*r+(y+2), x*1, y*1);
    rectMode(CENTER);
    rect (x,y,10,2*(5*cos(x)+cos(y)));
}  
          
      
void keyPressed() {
  save("japey.tiff");
}
                
                
