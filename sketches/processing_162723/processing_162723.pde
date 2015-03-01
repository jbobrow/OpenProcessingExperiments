

int x = 150;
int y = 0;
 
int speed = 5; 
 
int state = 0; 
 
void setup() { //placing the square was my first problem on Test Question 3)
  size(400,400);
  fill (234,134,34); // ORANGE
  strokeWeight(3); 
  rectMode(CORNER); 
  rect(0, 0, 200, 200); // relearned how to position my rectangle where I wanted it 
}


 
void draw() {

 
 
  noStroke(); 
  fill(255); 
  ellipse(x,y,20,20); 
 
  if (state == 0) { // this makes the white cirlce path move down initially (which i got on the test)
    x = x - speed;
    if (x < 0) {
      x = 0;
      state = 1;
    }
  } else if (state == 1) {
    y = y + speed;
    if (y > height-10) { 
      y = height-10;
      state = 2; 
    } 
  } else if (state == 2) {
    x = x + speed;
    if (x > width) { // THIS is where i messed up on my code. I had done X < 0 because i had been looking at the first if statement for X
      x = width-10;
      state = 3;
    }
  } else if (state == 3) { //Also had to change my original state=0 to state=3 so it would continue upwards rather than stopping like before)
    y = y - speed; 
    if (y < 0) { 
      y = 0;
      state=0; //This has to be 0 not 1 in order for it to return to the original spot
    }
  }
}


