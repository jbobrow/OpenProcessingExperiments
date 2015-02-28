
//Your particle class.
class Circle {

  // Variables to hold the location of the circle.
  float x_loc;
  float y_loc;

  // Where the circle is travaling to
  float target_x;
  float target_y;
  //How fast can your circle go
  float max_speed= random(3,9);

  //Holds the current speed of you circle.
  float speed_x;
  float speed_y;

  //How quicly is your circle accelerating
  float acceleration=.15;

  //What is the size of your circle
  float radius=1;

  //Called to create a circle object
  Circle() {
    x_loc = random(0,width); 
    y_loc = random(0,height);
    mouseX = width/2;
    mouseY = height/2;
  }
  
  void set_target(float x,float y){
      target_x = x;
      target_y = y;
  }

  // The math function of your circle.
  // Where the magic happens.
  void math() {
    
    // Movement in the x and y direction is independent of each other but also will happen exactly the same way.
    // Since the math is the same you can pick one direction make that work and copy it over to the next direction.
    // Half the work half the problems.
    math_x();
    math_y();
  }
  //Movement in the x direction.
  void math_x() {
    //Set where the circle should be moving towards.

    //If the cricle is to the left of the Mouse
    if(x_loc < target_x) {
      //increase your speed to the right
      speed_x = speed_x + acceleration;
    }
    else {
      //If the circle is to the right of the mouse increase speed to the left.
      speed_x = speed_x - acceleration;
    }  
    //Is the speed higher then the circle can travel?
    if(abs(speed_x) > max_speed) {
      // It is moving to quickly! Well which way is it moving to quickly?
      if(speed_x <0) {
        // Is it moving to quickly to the left well then set it to the max speed and keep it moving in that direction.
        speed_x = max_speed*-1;
      }
      else {
        // Is it moving to quickly to the right well then set it to the max speed in that direction.
        speed_x = max_speed;
      }
    }
    //Move the cicle in the X direction
    x_loc = x_loc + speed_x;
  }

  //Movement in the y direction.
  void math_y() {
    //All of this logic is exactly the same as moving in the x direction
    if(y_loc < target_y) {
      speed_y = speed_y + acceleration;
    }
    else {
      speed_y = speed_y - acceleration;
    }
    if(abs(speed_y) > max_speed) {
      if(speed_y <0) {
        speed_y = max_speed*-1;
      }
      else {
        speed_y = max_speed;
      }
    }
    y_loc = y_loc + speed_y;
  }


//Method to draw your circle. Yup thats it that easy.
//Thank Processing.
  void render() { 
    rect(x_loc,y_loc,radius,radius);
  }
}


