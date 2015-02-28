

float x = 100;

float y = 500;
float xspeed = .2;
float yspeed = .2;
float r = 32+.2*y;
     
void setup() {
  size (900 ,700);
  frameRate(30);
}
      
void draw(){
       
  x = x + -.01+xspeed+(.0001*y)+(1*( cos(y)));
  y = y + .01-yspeed-(.000009*x)+(.1*(cos(x)));
       
  if ((x > width) || (x < 01 )) {
    xspeed = -xspeed;
  }
     
xspeed = Y*xspeed;
         
    if (( y > height) || (y < 1)) {
      yspeed = - yspeed ;
    }
         
    strokeWeight(5);
    stroke((300*(cos(y)*2)-(cos(x)*.3)/5),x/5,190-(y*.33)-(x*.5));
    fill((300*(cos(y)*2)-(cos(x)*.3)/5),x/5,190-(y*.33)-(x*.5));
    //fill(20*r+(y+2), x*1, y*1);
    rectMode(CENTER);
    rect (x,y,20-((cos(y)*100)), 100+((cos(x)*100)));
         
}
        
        
    
void keyPressed() {
  save("japey.tiff");
}      
