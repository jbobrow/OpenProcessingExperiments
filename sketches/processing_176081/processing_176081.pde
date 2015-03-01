
//first I have to create and int to declare how many balls...
int num_balls = 50;
int num_balls2 = 10;
int num_balls3 = 50;
float bcolor;
 
//coordinates
float centerX [] = new float [num_balls];
float centerY [] = new float [num_balls];
//speed
float speedX [] = new float [num_balls];
float speedY [] = new float [num_balls];
 
  
  
void setup() {
  size(500, 500);
  smooth();
   
  for (int i = 0; i < num_balls; i++) {
    centerX[i] = random(15, 490);
    centerY[i] = random(25, 490);
  
    speedX[i] = random(15);
    speedY[i] = random(15);
  }
   
   for (int i = 0; i < num_balls2; i++) {
    centerX[i] = random(05, 490);
    centerY[i] = random(8, 490);
  
    speedX[i] = random(05);
    speedY[i] = random(05);
  }
}
  
void draw() {
  //HSB (hue, saturation, and brightness) COLOR mode
  colorMode(HSB, 359, 99, 99);
  background(bcolor, 88, 93);
  bcolor ();
 
 //series of ball #1
  for (int i = 0; i < num_balls; i++) {
    //now the ball's movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
  
    if (centerX [i] >= 700) {
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
    fill(#030303);
    ellipse(centerX [i], centerY[i], 70, 70);
  }
   
  //series of ball #2
    for (int i = 0; i < num_balls2; i++) {
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
    fill(#E887F7);
    ellipse(centerX [i], centerY[i], 20, 20);
  }
   
  //series of ball #3
      for (int i = 0; i < num_balls3; i++) {
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
    fill(#0300FF);
    rect(centerX [i], centerY[i], 25, 25);
  }
}
 
//mousePressed and everything stops, and then its starts to move again
void mousePressed() {
 noLoop();
}
 
void mouseMoved() {
  loop();
}
 
//to make the colors of the background change
void bcolor() {
  if (bcolor > 359) {
    bcolor = 0;
  }
  if (bcolor >= 0) {
    bcolor += 5;
  }
}
