
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: PARK Hyebin
 // ID: 201420081
 float G = 100;
 float R = 0;
 
 float speed = 0;
 float gravity = 0.1;
 
float c1 = #FAED7D;
float c2 = #CCA63D;
float c3 = 0;
float c1a = #FAED7D;
float c2b = #CCA63D;
float c3c = 0;

int x = 2;
int y = 6;
int z = 7;
int xspeed = 5;
int yspeed = 3;
int zspeed = 7;
void setup() {
  colorMode(RGB, 600);
  size(600,600);
  smooth();
}
 
void draw() {
  background(600);
  fill(#D1B2ff);
  stroke(#8041D9);
  rectMode(CENTER);
  rect(x, y, 50, 50);
  
  G = G + speed;
  
  speed = speed + gravity;
  if (y> height){
    speed = speed * -0.95;
  }
 
  x = x + xspeed ;
  y = y + yspeed  ;
  
  if ((x > width-30) || (x < 0)) {
    xspeed = xspeed * -1;
  }
   if ((y > height-20) || (y < 0)) {
    yspeed = yspeed * -1;
    
  }
  if ((z> width-50) || (z <0)) {
    zspeed = zspeed * -2;
  }
 
 
translate(width/2, height/2);
  stroke(#B5B2FF);
  strokeWeight(7);
 
  fill(c2, #B2EBF4, c1, 0);
  quad(x,y,width-x,0,0,height-y,width-x,height-y);
  fill(#FFB2F5);
  quad(x,y,0,height-y,width-x,0,x,y);
  fill(#FFE08C);
  quad(x, y,0, height-x, width-y, height-y, width-x, 0); 
  fill(#B2EBF4);
  quad(height-y, width-x, height-x, width-y, 0, 0, x, y);
  fill(x, #FAED7D, y, c2);
  quad(x, width-x, width-y,0, 0, height-x, height-y, y); 
}
 
 

