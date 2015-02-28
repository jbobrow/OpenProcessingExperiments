
int y = 0; 
int speed = 1;
// a type of variable that can be decimals vs. int which are always whole numbers

void draw () {
  background (204); // clears the background
  // background (y * 2.5); // animating the background

  line (0,y,width,y); 

  //bounce the line in between the frames

  y= y + speed; 
  if ((y > height) || (y <  0)) {
    speed = speed * -1;
  }

  // using conditionals to loop animations
  //  if (y > height) {
  //   y = 0.0 ;
  //  }
  //
}

