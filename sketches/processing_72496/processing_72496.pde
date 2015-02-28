
//Auriel Rickard
//Creative computing A
//September 28th - Bouncing Ball 

float circle_x = 100;
float circle_y = 181;
float circle_radius = 50;
float circle_x_speed = 7;
float circle_y_speed = 13;
Boolean move_circle = false;

float circle_x_2 = 200;
float circle_y_2 = 150;
float circle_radius_2 = 75;
float circle_x_speed_2 = 5;
float circle_y_speed_2 = 8;
Boolean move_circle_2 = false;

float circle_x_3 = 200;
float circle_y_3 = 150;
float circle_radius_3 = 100;
float circle_x_speed_3 = 2;
float circle_y_speed_3 = 5;
Boolean move_circle_3 = false;

void setup() {
  size(1000, 300);
  smooth();
}

void draw() {
  background(200);


  if (mousePressed == true) {
    if (move_circle_3 == true) {
      move_circle_3
        = false;
    } 
    else {
      move_circle_3 = true;
    };
  };

  if (move_circle_3 == true) {
    circle_x_3 = circle_x_3 + circle_x_speed_3;
    circle_y_3 = circle_y_3 + circle_y_speed_3;
  };

  fill(#0E74ED);
  ellipse(circle_x_3, circle_y_3, circle_radius_3*2, circle_radius_3*2);

  if ( (circle_x_3 + circle_radius_3 > width) || (circle_x_3 - circle_radius_3 < 0) ) {
    circle_x_speed_3 = -circle_x_speed_3;

    if (circle_x_3 - circle_radius_3 < 0) {
      circle_x_3 = circle_radius_3;
    };
    if (circle_x_3 + circle_radius_3 > width) {
      circle_x_3 = width-circle_radius_3;
    };
  };

  if ( (circle_y_3 + circle_radius_3 > height) || (circle_y_3 - circle_radius_3 < 0) ) {
    circle_y_speed_3 = -circle_y_speed_3;

    if (circle_y_3 - circle_radius_3 < 0) {
      circle_y_3 = circle_radius_3;
    };
    if (circle_y_3 + circle_radius_3 > height) {
      circle_y_3 = height-circle_radius_3;
    };
  };

  if (mousePressed == true) {
    if (move_circle == true) {
      move_circle = false;
    } 
    else {
      move_circle = true;
    };
  };

  if (move_circle == true) {
    circle_x = circle_x + circle_x_speed;
    circle_y = circle_y + circle_y_speed;
  };
  fill(#EDBD0E);
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);

  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    circle_x_speed = -circle_x_speed;

    if (circle_x - circle_radius < 0) {
      circle_x = circle_radius;
    };
    if (circle_x + circle_radius > width) {
      circle_x = width-circle_radius;
    };
  };

  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed;

    if (circle_y - circle_radius < 0) {
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) {
      circle_y = height-circle_radius;
    };
  };

  if (mousePressed == true) {
    if (move_circle_2 == true) {
      move_circle_2 = false;
    } 
    else {
      move_circle_2 = true;
    };
  };

  if (move_circle_2 == true) {
    circle_x_2 = circle_x_2 + circle_x_speed_2;
    circle_y_2 = circle_y_2 + circle_y_speed_2;
  };

  fill(#E33030);
  ellipse(circle_x_2, circle_y_2, circle_radius_2*2, circle_radius_2*2);

  if ( (circle_x_2 + circle_radius_2 > width) || (circle_x_2 - circle_radius_2 < 0) ) {
    circle_x_speed_2 = -circle_x_speed_2;

    if (circle_x_2 - circle_radius_2 < 0) {
      circle_x_2 = circle_radius_2;
    };
    if (circle_x_2 + circle_radius_2 > width) {
      circle_x_2 = width-circle_radius_2;
    };
  };

  if ( (circle_y_2 + circle_radius_2 > height) || (circle_y_2 - circle_radius_2 < 0) ) {
    circle_y_speed_2 = -circle_y_speed_2;

    if (circle_y_2 - circle_radius_2 < 0) {
      circle_y_2 = circle_radius_2;
    };
    if (circle_y_2 + circle_radius_2 > height) {
      circle_y_2 = height-circle_radius_2;
    };
  };
};

