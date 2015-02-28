
int circle_x = 500;
int circle_y = 500;
int circle_radius = 50; 
int circle_x_speed = 4;
int circle_y_speed = 4;
 
void setup() {
  size(800, 800);
};
void draw() {
  background(170, 30, 50); 
  fill(100,120,230);
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  //
  fill (130,220,90);
  ellipse(circle_x*1.5,circle_y*1.5,circle_radius/2,circle_radius/2);
  ellipse(circle_x*2,circle_y*2,circle_radius/2,circle_radius/2);
  ellipse(circle_x*2.5,circle_y*2.5,circle_radius/2,circle_radius/2);
  ellipse(circle_x*3,circle_y*3,circle_radius/2,circle_radius/2);
  ellipse(circle_x*3.5,circle_y*3.5,circle_radius/2,circle_radius/2);
  ellipse(circle_x*4,circle_y*4,circle_radius/2,circle_radius/2);
  ellipse(circle_x*4.5,circle_y*4.5,circle_radius/2,circle_radius/2);
  //
  ellipse(circle_x*0.9,circle_y*0.9,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.8,circle_y*0.8,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.7,circle_y*0.7,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.6,circle_y*0.6,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.5,circle_y*0.5,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.4,circle_y*0.4,circle_radius/2,circle_radius/2);
  ellipse(circle_x*0.3,circle_y*0.3,circle_radius/2,circle_radius/2);
  //
  
 ellipse(circle_x+90,circle_y,circle_radius/2,circle_radius/2);
 ellipse(circle_x+50,circle_y+50,circle_radius/2,circle_radius/2);
 ellipse(circle_x+10,circle_y+100.1,circle_radius/2,circle_radius/2);

  
  //
  circle_x = circle_x + circle_x_speed;
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {  //move other way
  //
    circle_x_speed = circle_x_speed * -1;    //
  };
  //

  circle_y = circle_y + circle_y_speed;// 
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
      //
    circle_y_speed = circle_y_speed * -1;
    //
  }
};



