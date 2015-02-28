
int diameter = 50;
int xdistance = diameter/2;
int ydistance = diameter/2;
int speed = 5;
int xdirection = 1;
int ydirection = 1;

void setup() {
  size(606, 600);
  background(50);
  fill(255, 100, 100);
  float r = random(200);
}

void draw() {

  //randomizes color of ball and rect fill(5 +random(200), 5 + random(200), 5 + random(200));
  background(9, 25);
  rectMode(CENTER);
  rect(mouseX, height - 100, 100, 20);//the thing you hit the ball with 


  strokeWeight(0);
  ellipse(xdistance, ydistance, diameter/2, diameter/2);//THIS IS THE BALL
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;
  if (ydistance > height - diameter/2 || ydistance < 0 + diameter/2 ) {
    //did i hit the top                || did i hit the bottom

    ydirection = -ydirection;// the thing that makes you go back down or up
  }

  else if (ydistance == height-120 && mouseX- 50 < xdistance && xdistance < mouseX+90) {
    //else function: if the ball is equal to the height -120, AND mousex-50 is less than xdistance AND xdistance is less than mouseX+90
    
    ydirection = -ydirection;
    //then bounce back up or down
    fill(random(255), random(255), random(255));
    //change dem kuhluhs everytime we touch i swear i can fly dont you feel my heart beat fast i want this to last
  }

  if (xdistance > width - diameter/2 || xdistance < 0 + diameter/2 ) {
    //did i hit the right side         || did i hit the left side

    xdirection = -xdirection;//the thing that makes you go left or right
  }
}
