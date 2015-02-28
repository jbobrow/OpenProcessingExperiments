
// Summer Myung
// Creative Computing A : In Class Work 9/21

int circle_x = 50;
int circle_y = 20;
int circle_radius = 50;
int circle_x_speed = 8;
int circle_y_speed = 8;
Boolean move_circle = false;

int circle_a = 220;
int circle_b = 400;
int circle_radius2 = 10;
int circle_a_speed = 40;
int circle_b_speed = 20;


int circle_1 = 200;
int circle_2 = 300;
int circle_radius3 = 80;


int circle_3 = 1;
int circle_4 = 1;
int circle_radius4 = 10;
int circle_3_speed = 5;
int circle_4_speed = 0;


int circle_5 = 399;
int circle_6 = 599;
int circle_radius5 = 10;
int circle_5_speed = 5;
int circle_6_speed = 0;


void setup() {
  size (400, 600);
}


void draw () {

  fill(random (72), random(72), random(72), 20);
  rect (0, 0, width, height);

  fill(35, 232, 59, 25); 
  ellipse (mouseX + 20, mouseY + 70, 100, 100);
  fill (250, 137, 15, 30);
  ellipse (mouseX, mouseY, 100, 100);


  //if ( (mousePressed == true) && (mouseX <100) ) {
  if (mousePressed == true) { // if i press the mouse
    //change the calue of move_circle
    if ( move_circle == true) { //if the circle is moving
      move_circle = false; // stop the circle from moving
    }
    else { //else the circle isn't moving
      move_circle = true; //so move it
    };
  };

  if (move_circle == true) {
    circle_x = circle_x + circle_x_speed;
    circle_y = circle_y + circle_y_speed;
  };

  if (move_circle == true) {
    circle_a = circle_a + circle_a_speed;
    circle_b = circle_b + circle_b_speed;
  };

  if (move_circle == true) {
    circle_3 = circle_3 + circle_3_speed;
    circle_4 = circle_4 + circle_4_speed;
  };

  if (move_circle == true) {
    circle_5 = circle_5 + circle_5_speed;
    circle_6 = circle_6 + circle_6_speed;
  };

  //draw ellipse that you will move
  fill (random (108), random(116), random(143), 200) ;
  noStroke();
  ellipse (circle_x, circle_y, circle_radius*2, circle_radius*2);
  fill (random (108), random(116), random(143), 200) ;
  noStroke();
  ellipse (circle_a, circle_b, circle_radius2*2, circle_radius2*2);
  fill (random (46), random(23), random(118), 300) ;
  noStroke();
  ellipse (circle_1, circle_2, circle_radius3*2, circle_radius3*2);
  fill (random (254), random(250), random(255), 300) ;
  noStroke();
  ellipse (circle_3, circle_4, circle_radius4*2, circle_radius4*2);
  fill (random (254), random(250), random(255), 300) ;
  noStroke();
  ellipse (circle_5, circle_6, circle_radius5*2, circle_radius5*2);

  //circle_y = circle_y + circle_speed;
  // if it reaches an edge, change direction
  // if circle_x reaches width

  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    // change direction
    circle_x_speed = -circle_x_speed -11 ;
  };
  if (circle_x - circle_radius < 0) {
    circle_x = circle_radius;
  };
  if (circle_x + circle_radius > width) {
    circle_x = width - circle_radius;
  };

  // if te circle touches the top or bottom
  // change direction of movement
  if ( (circle_y + circle_radius > height) || circle_y < 0) {
    circle_y_speed = -circle_y_speed - 10 ;
    if (circle_y - circle_radius < 0) {
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) {
      circle_y = height - circle_radius;
    };




    if ( (circle_a + circle_radius2 > width) || (circle_a - circle_radius2 < 0) ) {
      // change direction
      circle_a_speed = -circle_a_speed;
    };
    if (circle_a - circle_radius2 < 0) {
      circle_a = circle_radius2;
    };
    if (circle_a + circle_radius2 > width) {
      circle_a = width - circle_radius + 30;
    };

    // if te circle touches the top or bottom
    // change direction of movement
    if ( (circle_b + circle_radius2 > height) || circle_b < 0) {
      circle_b_speed = -circle_b_speed - 10 ;
    };
    if (circle_b - circle_radius2 < 0) {
      circle_b = circle_radius2;
    };
    if (circle_b + circle_radius2 > height) {
      circle_b = height - circle_radius2;
    };



    if ( (circle_3 + circle_radius4 > width) || (circle_3 - circle_radius3 < 0) ) {
      // change direction
      circle_3_speed = -circle_3_speed;
    };
    if (circle_3 - circle_radius4 < 0) {
      circle_3 = circle_radius4;
    };
    if (circle_3 + circle_radius4 > width) {
      circle_3 = width - circle_radius4;
    };




    if ( (circle_5 + circle_radius5 > width) || (circle_5 - circle_radius5 < 0) ) {
      // change direction
      circle_5_speed = -circle_5_speed;
    };
    if (circle_5 - circle_radius5 < 0) {
      circle_5 = circle_radius5;
    };
    if (circle_5 + circle_radius5 > width) {
      circle_5 = width - circle_radius5;
    };
  };
};
