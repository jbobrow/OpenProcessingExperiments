
int x;
int y;
int diameter;
color center;
color rings;
int speedX;
int speedY;
boolean inCircle;
 
void setup() {
  size(400,400);
  x=width/2;
  y=height/2;
  diameter = 50;
  center = color(255,255,0);
  rings = color(255,127,0);
  speedX = 3;
  speedY = 2;
  smooth();
}
 
void draw() {
  background(0,0,20);
  //renderCircle(mouseX,mouseY);
  renderCircle(x,y);
  moveCircle();
  
  inCircle = inMainCircle(mouseX, mouseY);
  
  if (inCircle==true){
    center = color(255,255,0);
  
  }else {
   center = color(0);
  
  }
}
 
//not in draw loop
//these are functions 
void renderCircle(int _x, int _y){
  noStroke();
  fill(center);
  ellipse(_x,_y,diameter,diameter);
  noFill();
  stroke(rings);
  strokeWeight(4);
  for (int i = 0; i < 4; i++) {
    ellipse(_x,_y,diameter + 8 + i*12, diameter + 8 + i*12);
  }
  }
  
void moveCircle(){
  x = x+speedX;
  y = y+speedY;
  
  if (x> width){
    speedX = -speedX;
  }
  
  if (x < 0){
    speedX = -speedX;
  } 
  
  if (y < height){
    speedY = -speedY;
  }
  
  if (y > 0){
    speedY = -speedY;
  }
}

boolean inMainCircle(int _x,int _y){
  if (dist(_x,_y, x,y) <diameter/2) return true;
  else return false;
}



