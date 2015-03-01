
float circle_x = 200;
float circle_y = 50;

float move_x = +1;
float move_y = -1;

float circle_x1 = 100;
float circle_y1= 30;

float move_x1 = +2;
float move_y1 = -2;

void setup() {
  size(400, 400);

}
void draw() {
    background(#B4B2F5);
    
noFill();
colorMode(HSB);

strokeWeight(random(3,10));
stroke (random(255), 200, 255);
float rainbow_size = random (300, 370);
  ellipse (200, 375, rainbow_size, rainbow_size);



 // stroke(#D60DFF);
 stroke (random(255), 200, 255);

  strokeWeight(3);
  fill (#FFB2FE);
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  
  if (circle_x > width) { circle_x = width; 
    println("too far right");
    move_x = -move_x;
}
  if (circle_y > height) {circle_y = height;
     println("too far bottom");
     move_y = -move_y;
  }
  
  if (circle_x < 0) {circle_x = 0;
      println("too far left");
      move_x = -move_x;
  }
  
  if (circle_y < 0) {
    circle_y= 0;
    println("too far top");
    move_y = -move_y;
  }   
    
    fill (#74F4FA);
  ellipse(circle_x1,circle_y1, 75, 75);
  circle_x1 = circle_x1 + move_x1;
  circle_y1 = circle_y1 + move_y1;

 
  if (circle_x1 > width) { circle_x1 = width; 
    println("too far right");
    move_x1 = -move_x1;
}
  if (circle_y1 > height) {circle_y1 = height;
     println("too far bottom");
     move_y1 = -move_y1;
  }
  
  if (circle_x1 < 0) {circle_x1 = 0;
      println("too far left");
      move_x1 = -move_x1;
  }
  
  if (circle_y1 < 0) {
    circle_y1= 0;
    println("too far top");
    move_y1 = -move_y1;
  }

  }
