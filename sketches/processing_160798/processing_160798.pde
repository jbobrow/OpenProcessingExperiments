
//I got a fever, and the only prescription is more variables!
int x=10; //x-coordinate of ellipse moving around sketch edge.
int y=10; //y-coordinate of ellipse moving around sketch edge.
int cx=100; //x-coordinate of bouncing ball
int cy=10; //y-coordinate of bouncing ball
int r=30; //radius of bouncing ball
int vx=2; //bouncing ball's direction on the x-axis
int vy=3; //bouncing ball's direction on the y-axis
 
int speed=1; //This is the default moving speed
 

int state=0; //Ellipse will change direction around sketch edge depending on position :)
 

void setup(){
size(500, 300);
smooth();
}
 
void draw(){
background(255);
 
noStroke();
 
fill(51,204,204);

ellipseMode(CENTER);
ellipse(cx, cy, r, r);
ellipse(cx+60, cy, r, r);
ellipse(cx+120, cy, r, r);
 
cy = cy + vy; //The bouncing ball on the y-axis will now move per its direction on said axis
 

if((cy>height)||(cy<0)){
  vy = vy * -1;
}

cx = cx + vx;
 
//Because of the below conditions, the ball bounces upon reaching the sketch edge! Yay!
if((cx+120>width)||(cx<0)){
  vx = vx * -1;
}
 
}


