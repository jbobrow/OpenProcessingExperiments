
int circle_x_a=100;
int circle_y_a=100;
int circle_radius=12;
int circle_x_a_speed=5;
int circle_y_a_speed=4;

int circle_x_b=120;
int circle_y_b=120;
int circle_x_b_speed=1;
int circle_y_b_speed=2;

int circle_x_c=200;
int circle_y_c=200;
int circle_x_c_speed=3;
int circle_y_c_speed=4;

void setup(){
size(500, 500);
background(11, 72, 107);

}
  
void draw (){
  noStroke();
   
 
  fill(random(255), random(255), random(255));
  ellipse(random(width), random(height), 20, 20);
  
    //Circle_A
  fill(168, 218, 168);
  ellipse(circle_x_a, circle_y_a, circle_radius*2, circle_radius*2);


  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON X
  circle_x_a=circle_x_a+circle_x_a_speed;
  if ((circle_x_a>=width - circle_radius) || (circle_x_a<=0 +circle_radius)) {
    circle_x_a_speed = circle_x_a_speed*-1;
  }

  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON Y
  circle_y_a=circle_y_a+circle_y_a_speed;
  if ((circle_y_a>=height - circle_radius) || (circle_y_a<=0 +circle_radius)) {
    circle_y_a_speed = circle_y_a_speed*-1;
  }

  //Circle_b
  fill(121, 189, 154);
  ellipse(circle_x_b, circle_y_b, circle_radius*2, circle_radius*2);

    /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON X
    circle_x_b=circle_x_b+circle_x_b_speed;
  if ((circle_x_b>=width - circle_radius) || (circle_x_b<=0 +circle_radius)) {
    circle_x_b_speed = circle_x_b_speed*-1;
  }

  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON Y
  circle_y_b=circle_y_b+circle_y_b_speed;
  if ((circle_y_b>=height - circle_radius) || (circle_y_b<=0 +circle_radius)) {
    circle_y_b_speed = circle_y_b_speed*-1;
  }
  
  //Circle_c
  fill(59, 134, 134);
  ellipse(circle_x_c, circle_y_c, circle_radius*2, circle_radius*2);

    /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON X
    circle_x_c=circle_x_c+circle_x_c_speed;
  if ((circle_x_c>=width - circle_radius) || (circle_x_c<=0 +circle_radius)) {
    circle_x_c_speed = circle_x_c_speed*-1;
  }

  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  /////  MOVE ON Y
  circle_y_c=circle_y_c+circle_y_c_speed;
  if ((circle_y_c>=height - circle_radius) || (circle_y_c<=0 +circle_radius)) {
    circle_y_c_speed = circle_y_c_speed*-1;
  }
}
