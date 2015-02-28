
//my game
//initial ball postion
float circle_x = 300;
float circle_y = 10;
//ball velocity
float move_x = 2;
float move_y = 2;
float ball_size = 20;
//a variable for animating ocean waves
float time = 0;

int bounce_bar_width = 50;
int bounce_bar_height =5;

int score = 0;

void setup(){
  size(400, 400);
  
}
void draw(){
  background(180, 180, 250);
  textSize(20);
  text("Score: " + score, 20, 25);
  float x = 0;
  while(x < width){
    //stroke(0, 0, random(100, 140));//uncomment to get vertical lines
    stroke(0, 0, 120);
    line(x, 200 + 50 * noise(x/100, time), x, height);
    x += 1;
  }
  time += 0.02;
  
  //constrain boat to screen on the water
  float boat_x = constrain(mouseX, 0, width);
  float boat_y = constrain(mouseY, height/2, height-bounce_bar_width);
  
  stroke(255);
  strokeWeight(7);
  fill(240);
  //draw the boat
  arc(boat_x-5, boat_y, 50, 35, 0, PI);
  triangle(boat_x-20, boat_y-5, boat_x, boat_y-60, boat_x+20, boat_y-5);
  
  ellipseMode(CENTER_RADIUS);
  ellipse(circle_x, circle_y, ball_size, ball_size);
  
  noStroke(); 
  rectMode(CENTER_RADIUS);
  fill(250, 0 ,0);
  rect(boat_x, boat_y, bounce_bar_width, bounce_bar_height);
  
  //add ball velocity to ball position
  circle_x = circle_x + move_x;  
  circle_y += move_y;
  
  //bounce ball off the right wall
  if(circle_x > width){
  circle_x = width;
  move_x = -move_x;
 } 
 if(circle_x < 0){
   circle_x = 0;
   move_x = -move_x;
 }
 if(circle_y < 0){
   circle_y = 0;
   move_y = 2;
 }
 if (circle_y > height){
   circle_y = 0;
 }//increment score if ball hits boat's bounce bar
if(circle_x > boat_x -bounce_bar_width - ball_size
   && circle_x < boat_x + bounce_bar_width + ball_size
   && circle_y > boat_y - bounce_bar_height - ball_size
   && circle_y < boat_y + bounce_bar_height + ball_size)
   {
     move_y = - move_y;
     score += 1;
   }
}


