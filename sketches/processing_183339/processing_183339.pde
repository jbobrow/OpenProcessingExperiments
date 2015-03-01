

// initial position//

float circle_x_t = 0;
float circle_y_t = 0;
float circle_x_b = 400;
float circle_y_b = 400;

//how much to move//
float move_x = 0.9;
float move_y = 0.9;

void setup(){
  
  size(400,400);
  stroke(#FAE36F);
  strokeWeight(3);
}

void draw(){
  background(#D111C8);
  ellipse(circle_x_t,circle_y_t,40,40);
  circle_x_t = circle_x_t+ move_x;
  circle_y_t = circle_y_t+ move_y;
  
  
  ellipse(circle_x_b,circle_y_b,40,40);
  circle_x_b = circle_x_b - move_x;
  circle_y_b = circle_y_b - move_y;
  
  if(circle_x_t > width){
    circle_x_t=0;
    println("too far right");
  }
   if(circle_y_t > height){
    circle_y_t=0;
    println("too far down");
   }

     if(circle_x_b < 0){
    circle_x_b=400;
    println("too far left");
  }
   if(circle_y_b < 0){
    circle_y_b=400;
    println("too far up");
}
}
