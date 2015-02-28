
//Irene Hwang
//Creative Computing A: Distance to Circle
//Sep 21, 2012
float circle_x = 20;
float circle_y = 25;
float circle_a = 30;
float circle_b= 50;
float x = 0;
float circle_radius = 50;
float circle_radius1 = 30;
float circle_radius2 = 60;
float circle_x_speed = 2;
float circle_y_speed = 6;
float circle_a_speed = 4;
float circle_b_speed = 6;
float speed = 20;
Boolean move_circle = true;
 

void setup() {
  size(700, 540);
}
 
void draw() {
stroke(random(30),random(30),random(50));
    fill(78, 132, 239, 50);
  rect(mouseX + 20, mouseY + 70, 100, 100);
  fill (random(240), 137, 15, 30);
  ellipse (mouseX+13, mouseY-19, 100, 100);

 // background(200);
 // if (mousePressed == true) {
  //  if (move_circle == true) {
  //    move_circle = false;
  //  } else {
  //    move_circle = true;
 //   };
//  };
  if (move_circle == true) {
   circle_x = circle_x + circle_x_speed;
   circle_y = circle_y + circle_y_speed;
    circle_a = circle_a + circle_a_speed;
    circle_b = circle_b + circle_b_speed;
    x = x + speed;





 
 noStroke();
  fill( random(200), 62 , random (200), 85 );
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  fill(random(100), random(100), random(200), 85);
  ellipse(circle_a, circle_b, circle_radius1*2, circle_radius1*2);
  fill(random(40), random(40), random(40), 70);
  ellipse(x,100,32,32);



  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  };
   };
   
     if ( (circle_a + circle_radius1 > width) || (circle_a - circle_radius1 < 0) ) {
    circle_a_speed = -circle_a_speed;
     
    if (circle_a - circle_radius1 < 0) {
      circle_a = circle_radius1;
    };
    if (circle_a + circle_radius1 > width) {
      circle_a = width-circle_radius1;
    };
  };
   
 
if ( (circle_b + circle_radius1 > height) || (circle_b - circle_radius1 < 0) ) {
    circle_b_speed = -circle_b_speed;
 
    if (circle_b - circle_radius1 < 0) {
      circle_b = circle_radius1;
    };
    if (circle_b + circle_radius1 > height) {
      circle_b = height-circle_radius1;
    };
  };

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

};

