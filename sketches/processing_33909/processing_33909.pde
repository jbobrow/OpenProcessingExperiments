
/*

Daniela Gill
08-13-11
lelagillny@mac.com
copyright 2011
Bootcamp/ Bouncing 50 balls  

*/

//first I have to create and int to declare how many balls...
int num_balls = 50;

//coordinates
float centerX [] = new float [num_balls];
float centerY [] = new float [num_balls];
//speed
float speedX [] = new float [num_balls];
float speedY [] = new float [num_balls];

 
 
void setup() {
  size(500, 500);
  for (int i = 0; i < num_balls; i++) {
    centerX[i] = random(15, 490);
    centerY[i] = random(15, 490);
 
    speedX[i] = random(15);
    speedY[i] = random(15);
  }
}
 
void draw() {
  background(#000066);
 
  for (int i = 0; i < num_balls; i++) {
    //now the ball's movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
 
    if (centerX [i] >= 490) {
      speedX [i] = speedX[i] * -1;
     
    }
    if (centerX [i] <=15) {
      speedX [i] = speedX[i] * -1;
     
    } 
    if (centerY [i] >= 490) {
      speedY [i] = speedY[i] * -1;
     
    }
    if (centerY [i] <=15) {
      speedY [i] = speedY[i] * -1;
     
    }
 
    noStroke();
    fill(#FF00FF);
    ellipse(centerX [i], centerY[i], 25, 25);
  }
}

