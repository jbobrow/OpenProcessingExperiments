
int circle_x = 210;
int circle_y = 300;
int circle_radius = 30;
int circle_x_speed = 2;
int circle_y_speed = 2;
PImage myPrettyPicture;
void setup() {
  size(400, 600);
  myPrettyPicture = loadImage("cute cat.jpg");
};
void draw() {
  background(140, 40, 200);
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  ////MOVE ON X
  circle_x = circle_x + circle_x_speed;
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) { //move other way
    // || means OR
    circle_x_speed = circle_x_speed * -1; //make speed negative
  };
  ////MOVE ON Y
  circle_y = circle_y + circle_y_speed;
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
    circle_y_speed = circle_y_speed * -1;
    //circle_y_speed *= -1;
  }
  image(myPrettyPicture,20,20, 200,300);
};


