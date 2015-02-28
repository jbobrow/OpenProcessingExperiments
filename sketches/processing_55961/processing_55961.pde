
float vy, vx, x, y, frictiony, frictionx, gravity;
boolean hit;
int mode, random;

void setup(){
  background(125, 200, 250);
  size(1650,300);
  vy=2;
  vx=2;
  x=0;
  y=150;
  frictiony=-.8;
  frictionx= 1;
  gravity=.04; 
  hit=false;
  mode=0;
}

void draw()
  
  //justin ponczek helped me with the collision
  //gate1 top
  {
  if (rectCircleIntersect(350, 0, 15, 60, x, y, 10) == true){
    println("fail");
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate1 bottom
  if (rectCircleIntersect(350, 150, 15, 300, x, y, 10) == true){
    println("fail");
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate2 top
  if (rectCircleIntersect(500, 0, 15, 110, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate2 bottom
  if (rectCircleIntersect(500, 170, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate3 top
  if (rectCircleIntersect(600, 0, 15, 160, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate3 bottom
  if (rectCircleIntersect(600, 210, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate3.1 top
  if (rectCircleIntersect(700, 0, 15, 140, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate3.1 bottom
  if (rectCircleIntersect(700, 180, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate4 top
  if (rectCircleIntersect(825, 0, 15, 135, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate4 bottom
  if (rectCircleIntersect(825, 190, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate5 top
  if (rectCircleIntersect(950, 0, 15, 80, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate5 bottom
  if (rectCircleIntersect(950, 140, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate6 top
  if (rectCircleIntersect(1050, 0, 15, 100, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate6 bottom
  if (rectCircleIntersect(1050, 150, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate7 top
  if (rectCircleIntersect(1175, 0, 15, 85, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate7 bottom
  if (rectCircleIntersect(1175, 120, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate8 top
  if (rectCircleIntersect(1210, 0, 15, 90, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate8 bottom
  if (rectCircleIntersect(1210, 130, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate9 top
  if (rectCircleIntersect(1375, 0, 15, 80, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate9 bottom
  if (rectCircleIntersect(1375, 130, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate10 top
  if (rectCircleIntersect(1450, 0, 15, 80, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  //gate10 bottom
  if (rectCircleIntersect(1450, 120, 15, 300, x, y, 10) == true){
    x=0;
    y=height/2; 
    hit=true; 
  }
  
  PFont font;
    font = loadFont("Univers-CondensedBold-48.vlw"); 
    textFont(font);
    fill(255);
    textSize(12);
    text("Mouse Click to navigate to the end", 75, 150); 
    
  fill(125, 200, 250, 25);
  rect(0,0,width,height); 
  fill(100);
  //gate 1
  rect(350, 0, 15, 60);
  rect(350, 150, 15, 300);
  //gate 2
  rect(500, 0, 15, 110);
  rect(500, 170, 15, 300);
  //gate 3
  rect(600, 0, 15, 160);
  rect(600, 210, 15, 300);
  //gate 3.1
  rect(700, 0, 15, 140);
  rect(700, 180, 15, 300);
  //gate 4
  rect(825, 0, 15, 135);
  rect(825, 190, 15, 300);
  //gate 5
  rect(950, 0, 15, 80);
  rect(950, 140, 15, 300);
  //gate 6
  rect(1050, 0, 15, 100);
  rect(1050, 150, 15, 300);
  //gate 7
  rect(1175, 0, 15, 85);
  rect(1175, 120, 15, 300);
  //gate 8
  rect(1210, 0, 15, 90);
  rect(1210, 130, 15, 300);
  //gate 9
  rect(1375, 0, 15, 80);
  rect(1375, 130, 15, 300);
  //gate 10
  rect(1450, 0, 15, 80);
  rect(1450, 120, 15, 300); 
  
  vy+=gravity;
  vx*=frictionx;
  x+=vx;
  y+=vy;
  
  if (y<0) {
    x=0;
    y=height/2;
  }
  
  if(y>height){
    y=height;
    vy*=frictiony;
  }
  if(x>width && !hit){
    mode=1;
  }
  
  if (x>width && hit) {
    x=0;
    y=height/2;
  }
  
  if (mode == 1){
    //PFont font;
    font = loadFont("Univers-CondensedBold-48.vlw"); 
    textFont(font);
    fill(255);
    textSize(100);
    text("Victory!", 625, 175); 
    //fill(0);
    //rect(0,0,width,height);
  }
  //so you can hit, start over, and still complete the game
  if (x < 50 && hit){
    hit = false;
  }
  
  //ball
   noStroke();
   smooth();
   fill(0, 255, 40);
   ellipse(x,y,20,20);  
}

//reverse gravity
void mouseReleased(){
  vy-= 1.75;
}

//justin ponczek helped me with this. 
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

float circleDistanceX = abs(cx - rx - rw/2);
float circleDistanceY = abs(cy - ry - rh/2);

if (circleDistanceX > (rw/2 + cr)) { return false; }
if (circleDistanceY > (rh/2 + cr)) { return false; }
if (circleDistanceX <= rw/2) { return true; }
if (circleDistanceY <= rh/2) { return true; }

float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
return cornerDistance <= pow(cr, 2);
}

//boolean rectRectIntersect(float left, float top, float right, float bottom,
//float otherLeft, float otherTop, float otherRight, float otherBottom) {
//return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
//}

