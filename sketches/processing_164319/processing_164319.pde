
float  circleSize; 
int circlePositionX;
int circlePositionY;
int circleSpeed;
int circleDirection;
int circle2PositionX;
int circle2PositionY;
int circle2Direction;
int circle3Speed;
int circle3PositionX;
int circle3PositionY;
int circle3Direction;
int value;

void setup () { 
  size (600, 600);
  circleSize = random(5, 100);
  circleSpeed = 5;
  circlePositionX = 0;
  circlePositionY = 0;
  circle2PositionX = 600;
  circle2PositionY = 600;
  circle2Direction = -1; 
  circleDirection = 1;
  circle3Speed = 5;
  value = 0;
}

void draw() {
  background (255);
  
  fill(random(0, 255), random (0, 255), random (0, 255), 25);
  rect (100, 100, 400, 400);

  noStroke();
  smooth(); 

  if (keyPressed == true) {
        fill (0, 0, 0, 50);
  } else {
    fill (random(0, 255), random (0, 255), random (0, 255), 50);
    circle (); 
  }

    circle2 ();


    circle3();
  }
  

  void keyPressed() {
    if (keyPressed== true) {
      circleDirection = -circleDirection;
      circle2Direction = -circle2Direction;
    }
  }

  void circle () { 

    circlePositionX += circleSpeed * circleDirection;
    circlePositionY += circleSpeed * circleDirection;

    if ((circlePositionX > width || circlePositionY > height)) {
      circleDirection = -circleDirection;
    }
    ellipse (circlePositionX, circlePositionY, 50, 50);


    if ((circlePositionX < 0) || (circlePositionY < 0)) {
      circleDirection = -circleDirection;
    }
    ellipse (circlePositionX, circlePositionY, 50, 50);


    ellipse (circlePositionX, circlePositionY/2, circleSize*2, circleSize*2);
    ellipse (circlePositionX/2, circlePositionY, circleSize*2, circleSize*2);
    ellipse (circlePositionX, circlePositionY/4, circleSize*3, circleSize*3);
    ellipse (circlePositionX/4, circlePositionY, circleSize*3, circleSize*3);
    ellipse (circlePositionX, circlePositionY/8, circleSize*4, circleSize*4);
    ellipse (circlePositionX/8, circlePositionY, circleSize*4, circleSize*4);
    ellipse (circlePositionX, circlePositionY/32, circleSize*5, circleSize*5);
    ellipse (circlePositionX/32, circlePositionY, circleSize*5, circleSize*5);
  }

  void circle2 () { 

    circle2PositionX += circleSpeed * circle2Direction;
    circle2PositionY += circleSpeed * circle2Direction;

    if ((circle2PositionX < 0) || (circle2PositionY < 0)) {
      circle2Direction = -circle2Direction;
    }
    ellipse (circle2PositionX, circle2PositionY, 50, 50);

    if ((circle2PositionX > width) || (circle2PositionY >  height)) {
      circle2Direction = -circle2Direction;
    }
    ellipse (circle2PositionX, circle2PositionY, 50, 50);

    ellipse (circle2PositionX, circle2PositionY/2, circleSize*2, circleSize*2);
    ellipse (circle2PositionX/2, circle2PositionY, circleSize*2, circleSize*2);
    ellipse (circle2PositionX, circle2PositionY/4, circleSize*3, circleSize*3);
    ellipse (circle2PositionX/4, circle2PositionY, circleSize*3, circleSize*3);
    ellipse (circle2PositionX, circle2PositionY/8, circleSize*4, circleSize*4);
    ellipse (circle2PositionX/8, circle2PositionY, circleSize*4, circleSize*4);
    ellipse (circle2PositionX, circle2PositionY/32, circleSize*5, circleSize*5);
    ellipse (circle2PositionX/32, circle2PositionY, circleSize*5, circleSize*5);
  }

  void circle3 () { 

    circle3PositionX += circle3Speed * circle3Direction;
    circle3PositionY += circle3Speed * circle3Direction;
    float x1 = map(mouseX, 0, width, 250, 350);
    if (mousePressed == true) {
      fill(random(0, 50), 0, random (0, 50), 50);
    } else {
      fill(255);
    }
    ellipse (x1+(random(0, 100)), mouseY-10, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+10, 100, 100);
    ellipse (x1+(random(0, 100)), mouseY-20, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+30, 100, 100);
    ellipse (x1+(random(0, 100)), mouseY-40, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+50, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY-50, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+50, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY-50, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+60, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+50, 100, 100);
    ellipse (x1+(random(0, 100)), mouseY-10, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY-10, 100, 100);
    ellipse (x1+(random(0, 100)), mouseY-100, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+80, 100, 100);
    ellipse (x1+(random(0, 100)), mouseY-70, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+70, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY-50, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+90, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY-90, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+100, 100, 100);
    ellipse (x1-(random(0, 100)), mouseY+25, 100, 100);

    fill(0);
    float x2 = map(mouseY, 0, width, 250, 350);
    ellipse (x2-(random(0, 100)), mouseX-10, 50, 50);
    ellipse (x2+(random(0, 100)), mouseX+10, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-20, 50, 50);
    ellipse (x2+(random(0, 100)), mouseX+30, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-40, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+50, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-50, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+50, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-50, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+60, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+50, 50, 50);
    ellipse (x2+(random(0, 100)), mouseX-10, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-10, 50, 50);
    ellipse (x2+(random(0, 100)), mouseX-100, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+80, 50, 50);
    ellipse (x2+(random(0, 100)), mouseX-70, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+70, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-50, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+90, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX-90, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+100, 50, 50);
    ellipse (x2-(random(0, 100)), mouseX+25, 50, 50);
  }


/*Questions that arised from 

What do you declare outside the draw function? Is it only functions? What is the proper set up of your code? 

How to control Bezier lines

What is a class and how do we use them?

How do we use Push Matrix and Pop Matrix?

Can you nest if statements? ie. Could I say “if blah blah happened and then if blah blah happened” 

How do you make changes to a function once you call it? For example, what if I want to have 50 ellipse moving at the same time, but all from different x values? Instead of rewriting the ellipse code 50 times, can I write it once and then just change the x values? 

What are PVectors?

Can we go over for loops? what is the difference between a for loop and a while loop? 

How did they get gravity to work? */
