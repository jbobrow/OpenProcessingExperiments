
PFont f;
int x = 200;
int y = 125;
int speed = 1;





void setup ()
{
  size (300,300);
  f= loadFont ("Helvetica-48.vlw");
}


void draw ()
{
 background(27,195,240);
 fill(255);
 rectMode (CENTER);
 noStroke();
 smooth();
 rect(75,150,100,100); 
 ellipse(225,150,100,200);
 textFont(f,15);
 text("Agent",50,80);
 text ("Environment",200,280);
 fill(255,0,0);
 text("sensors",200,130);
 text("actuators",30,180);
 text("PERCEPTION ACTION CYCLE",15,25);
 textFont(f,10);
 fill(252,128,3);
 text("control policy",30,160);
 move();
 bounce();
 display();
}

// A function to move the ball
void move() 
{ 
  // Change the x location by speed
  x = x + speed;
  
}

// A function to bounce the ball
void bounce() 
{
  // If weâ€™ve reached an edge, reverse speed
  if ((x > width-100 ) || (x < 75))
  {
    speed = speed * - 1;
  }
}

// A function to display the ball
void display() 
{
  noStroke();
  fill(0);
  rect(x,y,40,2); //sensor arrow
  triangle(x,y-5,x-20,y,x,y+5); //sensor arrow
  rect(x,y+50,40,2); //actuator arrow
  triangle(x+20,y+45,x+40,y+50,x+20,y+55);//actuator arrow
  
}

