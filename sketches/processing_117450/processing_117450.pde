
float x = 0;
float y = 0;
float xspeed = 5;
float yspeed = 2;
void setup(){
  frameRate(500);
  size(600,600);
  noStroke();
  background(255);

}
void draw(){
 ballShape();
 move();
 check();
 Save();
}
void ballShape(){
  fill(125,(.5*(cos(2*PI*y/height)+.5)*255),(0.5*(cos(2*PI*x/width))+.05)*255);
  ellipse(x,y,5,5);
}
void move(){
  x= x + xspeed;
  y= y + yspeed;
}
void check(){
  if(x>width || x<0){
  xspeed=xspeed * -1;  
  }
  if(y>width || y<0){
   yspeed=yspeed* -1; 
  }
}
void Save(){
if(mousePressed == true){
saveFrame("PrettyColorsMindbend########.png");
}
}


