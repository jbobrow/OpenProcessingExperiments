
float back=0;
float circle=0;
float circle1=425;
int i=0;
float ballx =1000;
float bally =500;
float movex=100;
float movey=40;
float ball2x = 100;
float ball2y = 400;
float move2x=-400;
float move2y=-8;
 
void setup() {
  size(500, 500);
}
 
void draw() {
  background(255, back, back);
  i=i+3;
  back= back+1;
  if (back>255) {
    back=0;
  }
  noStroke();
 
  if (i>10) {
    fill(random(256), random(256), random(256));
    i=0;
  }
  rect(circle, 25, 50, 50);
  ellipse(circle+35, 25, 50, 50);
  rect(circle, 60, 50, 50);
  ellipse(circle+35, 60, 50, 50);
  circle= circle+30;
  if (circle>425) {
    circle=0;
  }
 
  if (i>10) {
    fill(random(256), random(256), random(256));
    i=0;
  }
  ellipse(circle1, 110, 50, 50);
  rect(circle1-35, 110, 50, 50);
  rect(circle1, 145, 50, 50);
  ellipse(circle1-35, 145, 50, 50);
  circle1= circle1-10;
  if (circle1<0) {
    circle1=425;
  }
 
  if (i>10) {
    fill(random(256), random(256), random(256));
    i=0;
  }
  ellipse(circle, 195, 50, 50);
  ellipse(circle+35, 195, 50, 50);
  ellipse(circle, 230, 50, 50);
  ellipse(circle+35, 230, 50, 50);
  circle= circle+10;
  if (circle>425) {
    circle=0;
  }
 
  if (i>10) {
    fill(random(256), random(256), random(256));
    i=0;
  }
  ellipse(circle1, 280, 50, 50);
  ellipse(circle1-35, 280, 50, 50);
  ellipse(circle1, 315, 50, 50);
  ellipse(circle1-35, 315, 50, 50);
  circle1= circle1-10;
  if (circle1<0) {
    circle1=425;
  }
 
  if (i>10) {
    fill(random(256), random(256), random(256));
    i=0;
  }
  ellipse(circle, 365, 50, 50);
  ellipse(circle+35, 365, 50, 50);
  ellipse(circle, 400, 50, 50);
  ellipse(circle+35, 400, 50, 50);
  circle= circle+10;
  if (circle>425) {
    circle=0;
  }
 
 
  
  strokeWeight(4);
  stroke(0);
  fill(125);
   
  ellipse(ballx, bally, 125, 125);
  ellipse(ballx, bally, 100, 100);
  ellipse(ballx, bally, 75, 75);
  ellipse(ballx, bally, 50, 50);
  ellipse(ballx, bally, 25, 25);
  ellipse(ballx, bally, 1, 1);
  ballx = ballx +movex;
  bally = bally +movey;
 
  if (ballx > width) {
    ballx=width;
    movex = -movex;
  }
  if (bally > height) {
    bally=height;
    movey = -movey;
  }
  if (ballx < 0) {
    ballx= 0;
    movex = -movex;
  }
  if (bally < 0) {
    bally= 0;
    movey = -movey;
  }
 
  line(ball2x, ball2y, 125, 125);
  rect(ball2x, ball2y, 50, 50);
  ellipse(ball2x, ball2y, 75, 75);
  line(ball2x, ball2y, 50, 50);
  line(ball2x, ball2y, 100, 100);
  ellipse(ball2x, ball2y, 1, 1);
  ball2x = ball2x +move2x;
  ball2y = ball2y +move2y;
 
  if (ball2x > width) {
    ball2x=width;
    move2x = -move2x;
  }
  if (ball2y > height) {
    ball2y=height;
    move2y = -move2y;
  }
  if (ball2x < 0) {
    ball2x= 0;
    move2x = -move2x;
  }
  if (ball2y < 0) {
    ball2y= 0;
    move2y = -move2y;
  }
}



