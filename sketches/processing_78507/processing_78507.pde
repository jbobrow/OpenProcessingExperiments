
float ball_y = 350;
float rect_y=150;
float rect_y_speed=2;
float ball_y_speed=2.5;
float bar_y=225;

void setup() {
  size(500, 700);
  background(0);
};

void draw() {
  background(0);

  ball_y = ball_y + ball_y_speed;
  fill(255, 255, 255);
  smooth();
  noStroke();
  ellipse(247, ball_y, 62, 62);
  fill(127, 47, 82);
  noStroke();
  rect(140, 1, 55, 700);//left red box
  fill(127, 47, 82);
  noStroke();
  rect(300, 1, 55, 700);//right red box 
  
   if ((ball_y > rect_y) || (ball_y < bar_y)) {
   
  }; 

  //add in gravity
  ball_y_speed = ball_y_speed + .02;


  rect_y= rect_y + rect_y_speed;
  if ((rect_y > height-225) || (rect_y < 0)) {
    rect_y_speed = -rect_y_speed;
  }; 
  strokeWeight(10);
  stroke(233, 160, 92);
  fill(120, 181, 166);
  rect(140, rect_y, 55, bar_y);//left green box
  strokeWeight(10);
  stroke(233, 160, 92);
  fill(120, 181, 166);
  rect(300, rect_y, 55, bar_y);//right green box
};

void keyPressed() {
  if (keyCode == DOWN) {
    //ball_y = ball_y + 10;
    ball_y_speed=ball_y_speed+1;
  }
  if (keyCode == UP) {
    //ball_y = ball_y - 10;
    ball_y_speed=ball_y_speed-1;
  }
}
