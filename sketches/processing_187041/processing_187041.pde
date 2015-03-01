
float circle_x = 550;
float circle_y=200;
float circle_speed_x= -5;
float circle_speed_y= -4;
boolean shapeState = false ; // 0 for circle , 1 for rect
void setup() {
  size(700, 400);
 
}
void draw() {
  background(0,204,204);
    circle_y = circle_y+circle_speed_y ;
  circle_x = circle_x+circle_speed_x ;
  if( shapeState == false )
    ellipse(circle_x, circle_y, 60, 60);
   else 
    rect(circle_x, circle_y, 60, 60);
  //if the circle goes off screen
  //put the circle on screen
  //if circle_y is negative
  if(circle_y<0){
    //shapeState = !shapeState;
    // if it is true make it false, or if it is false make it true
    if( shapeState == true )
    shapeState = false;
    else
    shapeState= true;
    fill(229,204,255);
    ellipse(circle_x, circle_y, 30, 30);
circle_speed_y=circle_speed_y*-1;}
//if circle_Y is off the bottom of the screen
//if circle_y is greater than the height
  if(circle_y>height){
    if( shapeState == true )
    shapeState = false;
    else
    shapeState= true;
    fill (204,229,255);
    rect(circle_x, circle_y, 60, 60);
    //bounce
circle_speed_y=circle_speed_y*-1;
}
//if circle_x is off the left side of teh screen
if(circle_x<0){
  if( shapeState == true )
    shapeState = false;
    else
    shapeState= true;
  fill (204,255,204);
  rect(circle_x, circle_y, 60, 60);
circle_speed_x=circle_speed_x*-1;}
//if circle_x if off the right side of teh screen
 if(circle_x>width){
   if( shapeState == true )
    shapeState = false;
    else
    shapeState= true;
   fill (255,204,204);
   ellipse(circle_x, circle_y, 80, 80);
    //bounce
circle_speed_x=circle_speed_x*-1;
}
}

