
float circle_x = 230.4;
float circle_y = 150.8;
float circle_speed_x = 2;
float circle_speed_y = 3;

float rect_x = 550;
float rect_y = 300;
float rect_speed_x = 1.35;
float rect_speed_y = 2.46;

float circle2_x = 100;
float circle2_y = 250.8;
float circle2_speed_x = 4.5;
float circle2_speed_y = 1.5;

float rect2_x = 350;
float rect2_y = 350;
float rect2_speed_x = 2.35;
float rect2_speed_y = 4.16;

float circle3_x = 600;
float circle3_y = 100;
float circle3_speed_x = 3.14;
float circle3_speed_y = 2.95;

//BACKGROUND FRAMES

float frame_x = 450;
float frame_y = 200;

float frame2_x = 300;
float frame2_y = 100;


void setup() {
  size(700, 400);
  //frameRate(3);
}

void draw() {
  background(0);//Background serves as back/edge black frame

  //BACKGROUND FRAMES

  //FRAME 1 (ring around center frame)
  fill(254);
  ellipse(width/2, height/2, frame_x, frame_y);
  //SHRINK CIRCLE FRAME Y
  if (frame_y >= height - 100) {
    frame_y -= 5;
  } 
  //EXPAND CIRCLE FRAME Y
  if (frame_y <= height - 200) {
    frame_y += 5;
  }
  //SHRINK CIRCLE FRAME X
  if (frame_x >= width - 150) {
    frame_x -= 5;
  }
  //EXPAND CIRCLE FRAME X
  if (frame_x <= width - 450) {
    frame_x += 5;
  }

  //FRAME 2
  fill(0);
  ellipse(width/2, height/2, frame2_x, frame2_y);
  //SHRINK CIRCLE FRAME Y
  if (frame2_y >= height - 200) {
    frame2_y -= 5;
  } 
  //EXPAND CIRCLE FRAME Y
  if (frame2_y <= height - 300) {
    frame2_y += 5;
  }
  //SHRINK CIRCLE FRAME X
  if (frame2_x >= width - 250) {
    frame2_x -= 5;
  }
  //EXPAND CIRCLE FRAME X
  if (frame2_x <= width - 550) {
    frame2_x += 5;
  }

  //MOVING SHAPES

  //BOUNCING CIRCLE
  circle_x -= circle_speed_x;
  circle_y -= circle_speed_y;
  fill(254);
  ellipse(circle_x, circle_y, mouseY/1.75, mouseX/2.75);
  //KEEP CIRCLE ON SCREEN
  if ((circle_y < 0) || (circle_y > height)) {
    circle_speed_y = -circle_speed_y;
    //CHANGE CIRCLE SPEED
    circle_speed_y *= 2;
  }
  if ((circle_x < 0) || (circle_x > width)) {
    circle_speed_x = -circle_speed_x;
    circle_speed_x *= 3;
  }
  //DECREASE SPEED
  if (abs(circle_speed_y) > 25) {
    circle_speed_y /= 5;
  }
  if (abs(circle_speed_x) > 29) {
    circle_speed_x = circle_speed_x / 2;
  }
  //CHANGE COLORS: RED, WHITE, BLUE
  if (27 < abs(circle_speed_x)) {
    fill(11, 11, 222);
  } 
  if ((10 < abs(circle_speed_x)) && (20 > abs(circle_speed_x))) {
    fill(222, 11, 11);
  }
  if ((0 < abs(circle_speed_x)) && (11 > abs(circle_speed_x))) {
    fill(250);
  }


  //BOUNCING RECTANGLE 
  rect_x -= rect_speed_x;
  rect_y -= rect_speed_y;
  rect(rect_x + 100, rect_y - 50, mouseY/2, mouseX/3);
  //if rect_y is negative bring the y coordinate back down
  if (rect_y < 0) {
    rect_speed_y = -rect_speed_y;
  }
  if (rect_x < 0) {
    rect_speed_x = -rect_speed_x;
  }
  //INCREASE X SPEED
  if (rect_x > width) {
    rect_speed_x = -rect_speed_x;
    rect_speed_x += 3;
  }
  //INCREASE Y SPEED
  if (rect_y > height) {
    rect_speed_y = -rect_speed_y;
    rect_speed_y = rect_speed_y * 2;
  }
  //BRING Y SPEED BACK DOWN
  if (rect_speed_y > 25) {
    rect_speed_y -= 20;
  }
  //BRING X SPEED BACK DOWN
  if (rect_speed_x > 28) {
    rect_speed_x = rect_speed_x / 2;
  }
  //FILL BLUE
  if (10 < abs(rect_speed_y) && 20 > abs(rect_speed_y)) {
    fill(11, 11, 222);
  }
  //FILL RED
  if (0 < abs(rect_speed_y) && 11 > abs(rect_speed_y)) {
    fill(222, 11, 11);
  }
  //FILL WHITE
  if (20 < abs(rect_speed_y)) {
    fill(254);
  } 

  //CIRCLE #2
  circle2_x -= circle2_speed_x;
  circle2_y -= circle2_speed_y;
  ellipse(circle2_x, circle2_y, mouseY/2, mouseX/3);
  //KEEP CIRCLE ON SCREEN
  if ((circle2_x < 0) || (circle2_x > width)) {
    circle2_speed_x = -circle2_speed_x;
  }

  if ((circle2_y > height) || (circle2_y < 0)) {
    circle2_speed_y = -circle2_speed_y;
    //CHANGE CIRCLE SPEED
    circle2_speed_y *= 3;
  }
  //BRING Y SPEED BACK DOWN
  if (abs(circle2_speed_y) > 40) {
    circle2_speed_y /= 8;
  }
  //INCREASE X SPEED
  if (circle2_x > width) {
    circle2_speed_x += 5;
  }
  //BRING X SPEED BACK DOWN
  if (abs(circle2_speed_x) > 29) {
    circle2_speed_x /= 3;
  }
  //CHANGE COLORS: RED, WHITE, BLUE
  //FILL WHITE
  if (27 < abs(circle2_speed_y)) {
    fill(254);
  } 
  //FILL RED
  if ((0 < abs(circle2_speed_y)) && (15 > abs(circle2_speed_y))) {
    fill(222, 11, 11);
  }
  //FILL BLUE
  if ((16 < abs(circle2_speed_y)) && (28 > abs(circle2_speed_y))) {
    fill(11, 11, 222);
  }

  //RECTANGLE #2
  rect2_x -= rect2_speed_x;
  rect2_y -= rect2_speed_y;
  rect(rect2_x - 100, rect2_y + 50, mouseX/1.5, mouseY/2.5);
  //BRING Y & X COORDINATES BACK ON SCREEN
  if (rect2_y < -50) {
    rect2_speed_y = -rect2_speed_y;
  }
  if (rect2_x < 100) {
    rect2_speed_x = -rect2_speed_x;
  }
  //INCREASE X SPEED
  if (rect2_x > width + 100) {
    rect2_speed_x = -rect2_speed_x;
    rect2_speed_x *= 1.4;
  }
  //INCREASE Y SPEED
  if (rect2_y > height - 50) {
    rect2_speed_y = -rect2_speed_y;
    rect2_speed_y += 2.5;
  }
  //BRING Y SPEED BACK DOWN
  if (rect2_speed_y > 20) {
    rect2_speed_y /= 6;
  }
  //BRING X SPEED BACK DOWN
  if (rect2_speed_x > 25) {
    rect2_speed_x -= 14;
  }
  //FILL BLUE
  if (8 > abs(rect2_speed_x)) {
    fill(11, 11, 222);
  }
  //FILL WHITE
  if (7 < abs(rect2_speed_x)) {
    fill(254, 254, 254);
  } 

  // CIRCLE #3
  circle3_x -= circle3_speed_x;
  circle3_y -= circle3_speed_y;
  ellipse(circle3_x, circle3_y, mouseY/2.5, mouseX/1.95);
  //KEEP CIRCLE ON SCREEN
  if ((circle3_y < 0) || (circle3_y > height)) {
    circle3_speed_y = -circle3_speed_y;
    //CHANGE CIRCLE SPEED
    circle3_speed_y *= 2.5;
  }
  if ((circle3_x < 0) || (circle3_x > width)) {
    circle3_speed_x = -circle3_speed_x;
    circle3_speed_x *= 3.5;
  }
  //DECREASE SPEED
  if (abs(circle3_speed_y) > 19) {
    circle3_speed_y /= 4;
  }
  if (abs(circle3_speed_x) > 22) {
    circle3_speed_x = circle3_speed_x / 1.75;
  }
  //CHANGE COLORS: RED, WHITE, BLUE
  if (20 < abs(circle3_speed_x)) {
    fill(11, 11, 222);
  }
  if (20 > abs(circle3_speed_x)) {
    fill(254);
  }
}

void mousePressed () { 
  if ((frame2_x <= width - 250) &&
    (frame2_y <= height - 200) &&
    (frame_x <= width - 150) &&
    (frame_y <= height - 100)) {
    frame_y += 15;
    frame_x += 15;
    frame2_y += 15;
    frame2_x += 15;
  }
  if ((frame2_x >= 450) || (frame_x >= 550)) {
    frame_x = 450;
    frame_y = 200;
    frame2_x = 300;
    frame2_y = 100;
  }

  //ATTEMPT AT FOR STATEMENT (Didn't work, but wanted a 
  //click to grow the centered circle frames until they reached a
  //certain size, and then have them go back down to normal
  //with another click
  /*for (((float frame_x = 450) && 
   (float frame_y = 200) &&
   (float frame2_x = 300) &&
   (float frame2_y = 100)); ((frame2_x <= width - 250) &&
   (frame2_y <= height - 200) &&
   (frame_x <= width - 150) &&
   (frame_y <= height - 100)); 
   ((frame_y += 5) &&
   (frame_x += 5) &&
   (frame2_y += 5) &&
   (frame2_x += 5))) {
   fill(254); 
   ellipse(width/2, height/2, frame_x, frame_y); 
   ellipse(width/2, height/2, frame2_x, frame2_y); 
   */
   noLoop();
}

void mouseReleased () { 
  loop();
}

/*Bouncing shapes everywhere, chaos; slow and fast, 
 changing colors all red white and blue
 growing, shrinking rectangle in middle; frame around 
 outside of screen (3 recs, layered)
 mousing interactivity: click to shake things up
 */
