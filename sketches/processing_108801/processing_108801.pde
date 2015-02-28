
//Annie Ranttila, aranttil
//CMU Computing for the Arts with Processing, Fall 2013
//confetti party!

float x,y,wd,ht;

void setup()
{
  background(200,200,0,20);
  size(400,400);
  x=height*.5;
  y=height*.6;
  wd=width*.35;
  ht=height*.43;
  noStroke();
  frameRate(20);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

//random confetti
void draw()
{
  //fill(col1);
  //rect(0,0,width, height);
  fill( color(random(255), random(255), random(255)));
  rotate(radians(random(60)));
  rect(mouseX,mouseY,20, 20);
  x=x+1;
}

//press key to draw circular confetti
void keyPressed()
{
  frameRate(2);
  fill( color(random(255), random(255), random(255)));
  ellipse(mouseX+random(30),mouseY+random(30),20, 20);
  x=x+1;
}

//drag mouse to draw irregular confetti
void mouseDragged()
{
  fill( color(random(255), random(255), random(255)));
  rotate(radians(random(60)));
  rect(mouseX,mouseY,random(60), random(60));
  x=x+1;
}

//click mouse to clear screen
void mouseClicked()
{
background (200,200,0,20);
}





