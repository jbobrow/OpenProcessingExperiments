
//Heidi Peterson
//Lick-Wilmerding High School, Building and Programming Intelligent Machines: Level 2: Block G
//March 2014
//Helped a lot by teacher Natalie Freed.
//Used Processing website for tutorials on different functions/operations, such as curveVertex(), abs(), scale(), translate(), rotate(), pushMatrix(), and popMatrix().
//Dalton Varney helped a lot, especially with the boolean function aspect of void flap().
//Interact with this program by creating new birds (choosing color and position) and making them perform different actions, including display, move, flap, hover, and hop (choosing different parameters to make each action unique). 
//I've included three specific examples of things one can do with the program: a flying bird, a hovering bird, and a hopping bird that reacts to the cursor.
//You can make the bird react and interact with their environments (such as my bird reacting to the mouse cursor) by writing your own code in the void draw section.

Bird sally;
Bird hamlet;
Bird erin;

void setup()
{
  size(1000, 700);
  background(255);
  sally = new Bird(225, height - 250, radians(0));
  hamlet = new Bird(400, height - 400, radians(0));
  erin = new Bird(300, height - 475, radians(0));
}

void draw()
{
  background(113, 210, 255); //Fills in sky

  noStroke();
  fill(90, 215, 35);
  rect(0, height - 50, width, 50); // Creates grass

  hamlet.display(.25, 210, 78, 245);
  hamlet.flap(4);
  hamlet.move(3);

  erin.display(.3, 170, 255, 70);
  erin.flap(2);
  erin.hover(2);

  sally.display(.5, 70, 155, 255);

  if (mouseX - sally.x == 300) {
    sally.hop(0, 0, 0); //If the mouse is 300 pixels away from the bird, then the bird stands
  }

  else if (mouseX >= sally.x && mouseX - sally.x < 300 && abs(mouseY - (sally.y + 100)) <= 165) {
    sally.hop(-3, 7, 50); //If the mouse is within 300 pixels of the bird, then the bird hops backwards
  }

  else {
    sally.hop(4, 5, 50); //Otherwise, the bird hops forward
  }
}

class Bird {
  boolean upflap =false;
  boolean uphover = false;
  float x;
  float y;
  float angle;
  float hopangle;

  Bird(float tempx, float tempy, float tempangle) {
    x = tempx;
    y = tempy;
    angle = tempangle;
  }

  void flap(float flapspeed) {
    if (upflap == false) {
      angle += radians(flapspeed);
    }
    else
    {
      angle -= radians(flapspeed);
    }
    if (angle >= radians(40)) {
      upflap = true;
    }
    if (angle <= radians(0)) {
      upflap = false;
    }
  }

  void move (float movespeed) {
    x += movespeed*random(1, 3);
    y -= movespeed*random(-1, 3);
    if (x >= width + 300 || y <= -300) { 
      x = random(-600, -300);
      y = height - 200; //If the bird reaches 300 pixels beyong the right side of the screen or 300 pixels above the top of the screen, then the bird resets at a point below and to the left of the screen
    }
  }

  void hop (float hopXspeed, float hopYspeed, float sinscale) {

    x += hopXspeed;
    if (x >= width + 300) {
      x = -300;
    }
    y = (height - 250) - sinscale*sin(hopangle);
    hopangle += radians(hopYspeed);
    if (hopangle >= radians(180)) {
      hopangle = 0;
    }
  }

  void  hover (float hoverspeed) {
    if (uphover == false) {
      y -= hoverspeed;
    }
    else
    {
      y += hoverspeed;
    }
    if (y <= height - 525) {
      uphover = true;
    }
    if (y >= height - 475) {
      uphover = false;
    }
  }


  void display(float birdscale, float birdRed, float birdGreen, float birdBlue) {
    pushMatrix();
    translate(x, y + 250*birdscale); //Allows for one to change the size of the bird without changing the size of its surroundings and x,y values
    scale(birdscale); //Change the size of the bird
    drawBird(0, 0, birdRed, birdGreen, birdBlue);
    drawWing(0 + 75, 0 - 25, angle, birdRed, birdGreen, birdBlue);
    popMatrix();
  }
}

void drawBird(float centerX, float centerY, float birdRed, float birdGreen, float birdBlue)
{

  strokeWeight(8);
  stroke(255, 224, 10);
  line(centerX - 25, centerY + 175, centerX - 25, centerY + 225);
  line(centerX - 25, centerY + 190, centerX - 50, centerY + 225);
  line(centerX - 25, centerY + 190, centerX, centerY + 225);
  line(centerX + 50, centerY + 150, centerX + 50, centerY + 225);
  line(centerX + 50, centerY + 190, centerX + 25, centerY + 225);
  line(centerX + 50, centerY + 190, centerX + 75, centerY + 225);

  strokeWeight(3);
  stroke(0);
  fill(255, 224, 10);
  triangle(centerX + 179, centerY - 70, centerX + 175, centerY - 125, centerX + 225, centerY - 100); //Beak
  line(centerX + 179, centerY - 100, centerX + 225, centerY - 100); //Beak Line

  fill(birdRed, birdGreen, birdBlue);
  beginShape(); //Bird Outline
  curveVertex(centerX - 225, centerY + 50); // the first control point
  curveVertex(centerX - 225, centerY + 50); // is also the start point of curve
  curveVertex(centerX - 200, centerY + 100);
  curveVertex(centerX - 150, centerY + 150);
  curveVertex(centerX - 50, centerY + 175);
  curveVertex(centerX + 50, centerY + 150);
  curveVertex(centerX + 113, centerY + 100);
  curveVertex(centerX + 127, centerY + 85);
  curveVertex(centerX + 147, centerY + 50);
  curveVertex(centerX + 175, centerY - 50);
  curveVertex(centerX + 179, centerY - 70);
  curveVertex(centerX + 179, centerY - 100);
  curveVertex(centerX + 175, centerY - 125);
  curveVertex(centerX + 160, centerY - 175);
  curveVertex(centerX + 125, centerY - 210);
  curveVertex(centerX + 75, centerY - 225);
  curveVertex(centerX + 25, centerY - 212.5);
  curveVertex(centerX - 5, centerY - 192);
  curveVertex(centerX - 13, centerY - 179);
  curveVertex(centerX - 25, centerY - 150);
  curveVertex(centerX - 35, centerY - 100);
  curveVertex(centerX - 50, centerY - 25);
  curveVertex(centerX - 75, centerY + 25);
  curveVertex(centerX - 125, centerY + 60);
  curveVertex(centerX - 175, centerY + 65);
  curveVertex(centerX - 225, centerY + 50); // the last point of curve
  curveVertex(centerX - 225, centerY + 50); // is also the last control point
  endShape();

  fill(255);
  ellipse(centerX + 112.5, centerY - 131.25, 50, 65);

  fill(0);
  ellipse(centerX + 125, centerY - 131.25, 25, 32.5);
}

void drawWing(float rpX, float rpY, float angle, float birdRed, float birdGreen, float birdBlue)
{
  strokeWeight(3);
  fill(birdRed, birdGreen, birdBlue);
  pushMatrix();
  translate(rpX, rpY);
  rotate(angle);
  beginShape(); //Bird Outline
  rpX = 0;
  rpY = 0;
  curveVertex(rpX, rpY); // the first control point
  curveVertex(rpX, rpY); // is also the start point of curve
  curveVertex(rpX - 50, rpY - 25);
  curveVertex(rpX - 100, rpY - 25);
  curveVertex(rpX - 150, rpY);
  curveVertex(rpX - 225, rpY + 75);
  curveVertex(rpX - 275, rpY + 175);
  curveVertex(rpX - 150, rpY + 175);
  curveVertex(rpX - 75, rpY + 150);
  curveVertex(rpX, rpY + 75);
  curveVertex(rpX, rpY); // the point of the curve
  curveVertex(rpX, rpY); // is also the last control point
  endShape();
  popMatrix();
}
