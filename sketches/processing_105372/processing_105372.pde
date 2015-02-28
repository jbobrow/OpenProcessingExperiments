
void setup() {
  size(600, 600);
}

float ballx = 300;
float bally = 300;
float ay = 25;
float ax = -4;
float times =1;



void draw() {


  background(255, 255, 255);

  ellipse(ballx, bally, 20, 20);                       //ball
  fill(random(255), random(255), random(255));


  bally = bally + ay;                                // original speed in y axis
  if ( bally+ay >= 595 || bally+ay<=5) {             // bounce when reach the top & bottom
    ay = -ay;
  } 
  if (ay!= 0 || bally<595) {                         //add a force of direction down 
    ay=ay+1;
  }

  // println(bally);
  // println(ay);



  if (int(ballx) <= 5 || int(ballx) >= 595) {      //the times of the ball reaching the left wall and the right wall changes the direction of ball changes
    times=times+1;
  }

  if (times/2==int(times/2)) {
    ballx=ballx-ax;
  }
  else {
    ballx=ballx+ax;
  }
  if (ax>0) {                                     //the direction of force in x axis changes everytimes the ball reaches the left wall and right wall
    ax=ax-0.002;
  }
  if (ax<0) {
    ax=ax+0.002;
  }

  //    println(ax);
  //    println(ballx);
}







