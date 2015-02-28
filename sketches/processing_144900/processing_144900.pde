
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Your Name
 // ID: Your ID number
 float G = 100;
 float R = 0;
 
 
 float speed = 0;
 float gravity = 0.1;
 
float c1 = #FAED7D;
float c2 = #CCA63D;
float c3 = #5F00FF;
float c1a = #FAED7D;
float c2b = #CCA63D;
float c3c = #5F00FF;
int x = 2;
int y = 6;
int xspeed = 7;
int yspeed = 10;
void setup() {
  colorMode(RGB, 0);
  size(600,600);
  smooth();
}
void draw() {
  //background(600);
  fill( #5F00FF);
  stroke( #5F00FF);
  ellipse(x, y, 50, 50);
  stroke(#FF007F);
  ellipse(x, y, 70, 70);
  
  G = G + speed;
  
  speed = speed + gravity;
  if (y> height){
    speed = speed * -0.95;
  }
 
  // Add the current speed to the x location.
  x = x + xspeed ;
  y = y + yspeed  ;
  
  if ((x > width-30) || (x < 0)) {
    xspeed = xspeed * -1;
  }
   if ((y > height-20) || (y < 0)) {
    yspeed = yspeed * -1;
    
  }
  
 
 
translate(width/2, height/2);
rotate(yspeed/7.0);
 rotate(xspeed/5.0);
  stroke(#B5B2FF);
  strokeWeight(7);
 
  fill(c2, #B2EBF4, c1, 0);
  quad(x,y,width-x,0,0,height-y,width-x,height-y);
  fill(#FFB2F5);
  quad(x,y,0,height-y,width-x,0,x,y);
  fill(#FFE08C);
}
 
 
