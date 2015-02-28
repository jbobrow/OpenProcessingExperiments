
//Rebecca Low
//September 28, 2012
//Creative Computing_A_Norskov
//Assignment 3/4


int circle_x = 200;
int circle_y = 200;
int circle_radius = 40;
int circle_x_speed = 2;
int circle_y_speed = 5;
Boolean move_circle = false;

int circle_0_x = 100;
int circle_0_y = 100;
int circle_0_radius = 60;
int circle_0_x_speed = 6;
int circle_0_y_speed = 10;

int circle_1_x = 180;
int circle_1_y = 180;
int circle_1_radius = 75;
int circle_1_x_speed = 1;
int circle_1_y_speed = 3;






void setup() {
  size(300, 500);
}

void draw() {
  background(240, 242, 137);
//  if((mousePressed ==true) && (mouseX < 100)){
  if(mousePressed == true) {  //if I click mouse, check to see
  //change the value of move_circle
   if(move_circle == true) {
     move_circle = false;     // set
   } else {
     move_circle = true;
   }
}

//  if(keyPressed ==true) {
//  };
  
  
  if(move_circle == true) {      //if mouseX is less than 100 (or on the left side of the screen), it will draw the circles
    //move the circle:
  circle_x = circle_x + circle_x_speed;
  circle_y = circle_y + circle_y_speed;
  
  circle_0_x = circle_0_x + circle_0_x_speed;
  circle_0_y = circle_0_y + circle_0_y_speed;
  
  circle_1_x = circle_1_x + circle_1_x_speed;
  circle_1_y = circle_1_y + circle_1_y_speed;
};
  
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  ellipse(circle_0_x, circle_0_y, circle_0_radius*2, circle_0_radius*2);
  ellipse(circle_1_x, circle_1_y, circle_1_radius*2, circle_1_radius*2);


 if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {
    //change direction
    circle_x_speed = -circle_x_speed;
 };
 
  if ((circle_0_x + circle_0_radius > width) || (circle_0_x - circle_0_radius < 0)) {
    //change direction
    circle_0_x_speed = -circle_0_x_speed;
 };
 
   if ((circle_1_x + circle_1_radius > width) || (circle_1_x - circle_1_radius < 0)) {
    //change direction
    circle_1_x_speed = -circle_1_x_speed;
 };
 
 if((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
   circle_y_speed = -circle_y_speed;
 };
 
  if((circle_0_y + circle_0_radius > height) || (circle_0_y - circle_0_radius < 0)) {
   circle_0_y_speed = -circle_0_y_speed;
 };
 
   if((circle_1_y + circle_1_radius > height) || (circle_1_y - circle_1_radius < 0)) {
   circle_1_y_speed = -circle_1_y_speed;
 };
 
  if (circle_y - circle_radius < 0) {    //move to top edge of screen
 };
 
   if (circle_0_y - circle_0_radius < 0) {
 };
 
    if (circle_1_y - circle_1_radius < 0) {
 };
 
   if (circle_y + circle_radius > height) {   //move to bottom edge of screen
     circle_y = height-circle_radius;
   };
   
      if (circle_0_y + circle_0_radius > height) { 
     circle_0_y = height-circle_0_radius;
   };
 
       if (circle_1_y + circle_1_radius > height) { 
     circle_1_y = height-circle_1_radius;
   };
 
//   if (circle moves to right side of screen turn blue, circle moves to left side of screen turn red, circle moves
  // to bottom of screen turn yellow, circle moves to top of screen turn green)
   
   if(circle_x + circle_radius > width) {
     background(247, 214, 20);
     fill(57, 180, 255, 100);
   };
   
   if(circle_1_x + circle_1_radius > width) {
     background(42, 20, 247);
     fill(247, 20, 237);
   };
   
   if(circle_x - circle_radius < 0) {
     background(27, 245, 105);
     fill(180, 13, 13, 205);
   };
   
   if(circle_1_x + circle_1_radius > width) {
     background(247, 20, 237);
     fill(42, 20, 247);
   };
   
   if(circle_y + circle_radius > height) {
     background(57, 180, 255);
     fill(247, 214, 20, 175);
   };
   
   if(circle_1_x + circle_1_radius > width) {
     background(255, 124, 0);
     fill(27, 147, 90);
   };
   
   if(circle_y - circle_radius < 0) {
     background(180, 13, 13);
     fill(27, 245, 105, 210);
   };
   
   if(circle_1_x + circle_1_radius > width) {
     background(27, 147, 90);
     fill(255, 124, 0);
};
};


