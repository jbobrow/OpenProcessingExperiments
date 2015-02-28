
int circle_x=30;
int circle_y=40;
int circle_radius=30;
int circle_x_speed = 2;
int circle_y_speed = 2;

void setup() {
  size(300, 500);
}

void draw () {
  background(200,30,150);
  noStroke();
  fill(50,60,120);
  circle_x = circle_x + circle_x_speed;
  circle_y += circle_x_speed;
  //or circle_y=circle_y+circle_y_speed;
  //if it reaches an edge change direction
  //if circle_x reaches width
  if (circle_x>width - circle_radius || circle_x<0 + circle_radius) {
    //or if ((circle_x + circle_radius > width) || (circle_X - circle_radius <0)) {
    //change direction
    circle_x_speed = -circle_x_speed;
    // or circle_speed=circle_speed*-1;
  };
  //if (circle_x<0) {
  //  circle_speed=-circle_speed;
 // };
  //draw ellipse that you will move
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
    fill(150,240,203);
    rect(50,40,50,70);
  fill(random(255),random(255),random(255));
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
  ellipse (random(width), random(height), 40, 40);
   ellipse (random(width), random(height), 40, 40);
    ellipse (random(width), random(height), 40, 40);
     ellipse (random(width), random(height), 40, 40);
     ellipse (random(width), random(height), 40, 40);
     ellipse (random(width), random(height), 40, 40);
     ellipse (random(width), random(height), 40, 40);
     ellipse (random(width), random(height), 40, 40);
  fill(255,244,107);
  rect(200,320,80,90);
  fill(0,159,0);
  rect(40,420,100,40);
    fill(255,118,0);
  rect(90,190,95,30);
}
