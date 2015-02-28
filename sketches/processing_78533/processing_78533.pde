
//Auriel Rickard
//Creative computing A
//October 19, 2012
//Bouncing ball and small boucing balls

float circle_x = 100;
float circle_y = 181;
float circle_radius = 50;
float circle_x_speed = .25;
float circle_y_speed = .5;
Boolean move_circle_2 = false;

float circle_xx = 300;
float circle_yy = 230;
float circle_radius_2 = 50;
float circle_xx_speed = .25;
float circle_yy_speed = .5;
Boolean move_circle = false;

float[] circle_x_array = new float[5];
float[] circle_y_array = new float[5];
float small_circle_radius = 10;
float[] small_circle_x_speed_array = new float [5];
float[] small_circle_y_speed_array = new float [5];

float[] circle_x_array_2 = new float[5];
float[] circle_y_array_2 = new float[5];
float small_circle_radius_2 = 10;
float[] small_circle_x_speed_array_2 = new float [5];
float[] small_circle_y_speed_array_2 = new float [5];



void setup() {
  size(800,500);
  smooth();
  
  circle_x_array[0] = 1;
  circle_x_array[1] = 3;
  circle_x_array[2] = 5;
  circle_x_array[3] = 7;
  circle_x_array[4] = 9;
  circle_y_array[0] = 11;
  circle_y_array[1] = 13;
  circle_y_array[2] = 15;
  circle_y_array[3] = 17;
  circle_y_array[4] = 19;
  small_circle_x_speed_array[0] = 3;
  small_circle_x_speed_array[1] = 4;
  small_circle_x_speed_array[2] = 5;
  small_circle_x_speed_array[3] = 1;
  small_circle_x_speed_array[4] = 2;
  small_circle_y_speed_array[0] = 3;
  small_circle_y_speed_array[1] = 4;
  small_circle_y_speed_array[2] = 5;
  small_circle_y_speed_array[3] = 1;
  small_circle_y_speed_array[4] = 2;
  
  
  circle_x_array_2[0] = 19;
  circle_x_array_2[1] = 17;
  circle_x_array_2[2] = 15;
  circle_x_array_2[3] = 13;
  circle_x_array_2[4] = 11;
  circle_y_array_2[0] = 9;
  circle_y_array_2[1] = 7;
  circle_y_array_2[2] = 5;
  circle_y_array_2[3] = 3;
  circle_y_array_2[4] = 1;
  small_circle_x_speed_array_2[0] = 5;
  small_circle_x_speed_array_2[1] = 1;
  small_circle_x_speed_array_2[2] = 2;
  small_circle_x_speed_array_2[3] = 3;
  small_circle_x_speed_array_2[4] = 4;
  small_circle_y_speed_array_2[0] = 5;
  small_circle_y_speed_array_2[1] = 1;
  small_circle_y_speed_array_2[2] = 2;
  small_circle_y_speed_array_2[3] = 3;
  small_circle_y_speed_array_2[4] = 4;
  
}


 //MotherShip_1
void MotherShip_1(float x, float y) {
  stroke(#16F5AC);
  fill(#16F5AC);
  ellipse(x, y-10, 40, 40);

  fill(#4D504F);
  ellipse(x, y, 100, 30);

  stroke(#16F5AC);
  line(x-50, y, x-45, y);
  line(x-40, y, x-35, y);
  line(x-30, y, x-25, y);
  line(x-20, y, x-15, y);
  line(x-10, y, x-5, y);
  line(x, y, x+5, y);
  line(x+10, y, x+15, y);
  line(x+20, y, x+25, y);
  line(x+30, y, x+35, y);
  line(x+40, y, x+45, y);
}

 //MotherShip_2
void MotherShip_2(float xx, float yy) {
  stroke(#F5C116);
  fill(#F5C116);
  ellipse(xx, yy-10, 40, 40);

  fill(#4D504F);
  ellipse(xx, yy, 100, 30);

  line(xx-50, yy, xx-45, yy);
  line(xx-40, yy, xx-35, yy);
  line(xx-30, yy, xx-25, yy);
  line(xx-20, yy, xx-15, yy);
  line(xx-10, yy, xx-5, yy);
  line(xx, yy, xx+5, yy);
  line(xx+10, yy, xx+15, yy);
  line(xx+20, yy, xx+25, yy);
  line(xx+30, yy, xx+35, yy);
  line(xx+40, yy, xx+45, yy);
}

//SmallShips_1
void SmallShips_1(float x, float y) {
 fill(255);
  stroke(#16F5AC);
  fill(#4D504F);
  triangle(x+10, y, x+20, y+30, x, y+30);
  fill(#FF2471);
  rect(x+3, y+30, 5, 8);
  rect(x+12, y+30, 5, 8);
}

//SmallShips_2
void SmallShips_2(float x, float y) {
  stroke(#F5C116);
  fill(#4D504F);
  triangle(x+10, y, x+20, y+30, x, y+30);
  fill(#FF2471);
  rect(x+3, y+30, 5, 8);
  rect(x+12, y+30, 5, 8);
}



void draw() {
  background(#332B64);

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
  fill(#FFFFFF);
  
  MotherShip_1(circle_x, circle_y);
  
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {
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
  
  if (move_circle_2 == true) {
    circle_xx = circle_xx + circle_xx_speed;
    circle_yy = circle_yy + circle_yy_speed;
  };
  
  fill(#FFFFFF);
  
  MotherShip_2(circle_xx, circle_yy);
  
  if ((circle_xx + circle_radius_2 > width) || (circle_xx - circle_radius_2 < 0)) {
    circle_xx_speed = -circle_xx_speed;

    if (circle_xx - circle_radius_2 < 0) {
      circle_xx = circle_radius_2;
    };
    if (circle_xx + circle_radius_2 > width) {
      circle_xx = width-circle_radius_2;
    };
  };

  if ( (circle_yy + circle_radius_2 > height) || (circle_yy - circle_radius_2 < 0) ) {
    circle_yy_speed = -circle_yy_speed;

    if (circle_yy - circle_radius_2 < 0) {
      circle_yy = circle_radius_2;
    };
    if (circle_yy + circle_radius_2 > height) {
      circle_yy = height-circle_radius_2;
    };
  };


  //SmallShips_1
  for (int i=0; i<circle_x_array.length; i++) {

    if (move_circle == true) { //circleCheck
      circle_x_array[i] = circle_x_array[i] + small_circle_x_speed_array[i];
      circle_y_array[i] = circle_y_array[i] + small_circle_y_speed_array[i];
      fill(#00FF00);
      
      SmallShips_1(circle_x_array[i], circle_y_array[i]);
      //small ships
      
      if ( (circle_x_array[i] + small_circle_radius > width) || (circle_x_array[i] - small_circle_radius < 0) ) {
        small_circle_x_speed_array[i] = -small_circle_x_speed_array[i];

        if (circle_x_array[i] - small_circle_radius < 0) {
          circle_x_array[i] = small_circle_radius;
        }//end if

        if (circle_x_array[i] + small_circle_radius > width) {
          circle_x_array[i] = width-small_circle_radius;
        }//end if
      }//end if

      if ( (circle_y_array[i] + small_circle_radius > height) || (circle_y_array[i] - small_circle_radius < 0) ) {
        small_circle_y_speed_array[i] = -small_circle_y_speed_array[i];
        if (circle_y_array[i] - small_circle_radius < 0) {
          circle_y_array[i] = small_circle_radius;
        }
        if (circle_y_array[i] + small_circle_radius > height) {
          circle_y_array[i] = height-small_circle_radius;
        }
      }
    }
  }
      //SmallShips_2
  for (int i=0; i<circle_x_array_2.length; i++) {

    if (move_circle == true) { //circleCheck
      circle_x_array_2[i] = circle_x_array_2[i] + small_circle_x_speed_array_2[i];
      circle_y_array_2[i] = circle_y_array_2[i] + small_circle_y_speed_array_2[i];
      fill(#00FF00);
      
      SmallShips_2(circle_x_array_2[i], circle_y_array_2[i]);
      //small ships
      
      if ( (circle_x_array_2[i] + small_circle_radius_2 > width) || (circle_x_array_2[i] - small_circle_radius_2 < 0) ) {
        small_circle_x_speed_array[i] = -small_circle_x_speed_array_2[i];

        if (circle_x_array_2[i] - small_circle_radius_2 < 0) {
          circle_x_array_2[i] = small_circle_radius_2;
        }//end if

        if (circle_x_array_2[i] + small_circle_radius_2 > width) {
          circle_x_array_2[i] = width-small_circle_radius_2;
        }//end if
      }//end if

      if ( (circle_y_array_2[i] + small_circle_radius_2 > height) || (circle_y_array_2[i] - small_circle_radius_2 < 0) ) {
        small_circle_y_speed_array_2[i] = -small_circle_y_speed_array_2[i];
        if (circle_y_array_2[i] - small_circle_radius_2 < 0) {
          circle_y_array_2[i] = small_circle_radius_2;
        }
        if (circle_y_array_2[i] + small_circle_radius_2 > height) {
          circle_y_array_2[i] = height-small_circle_radius_2;
        }
      }
    }//ends circleCheck
  }//ends for loop
}//ends draw
