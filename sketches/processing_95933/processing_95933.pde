
float bluemanX;
float blumanY;
boolean button = false;
int x = 250;
int y = 290;
int w = 30;
int h = 25;

float eyeR;
float eyeG;
float eyeB;

void setup()
{
size(500,500);

smooth();
}

void draw()
{
  if ( button)
  {
    background(0,0,255);   //draws a white background
  }
  else
  {
    background(0,255,0); // draws a green background
  }
  

{
 
  ellipseMode(CENTER);
 rectMode(CENTER);
 
  stroke(0);
 fill(22,0,0);             //fills the bosy with blue
 ellipse(250,320,150,220);  // draws the body
 
 
 stroke(0);
 fill(200);                 // fills the rectangle with grey
 rect(250,250,50,150);      //draws the tie
 

 stroke(0);
 fill(255,0,0);             //fill the head with red
 ellipse(250,200,100,100);  //draws the head
 
 eyeR = random(255);
 eyeG = random(255);
 eyeB = random(255);
 stroke(0);
 fill(eyeR,eyeG,eyeB);
 fill(eyeR,eyeB,eyeB);
 ellipse(220,200,30,40);    // draws the left eye
 ellipse(280,200,30,40);    //draws the right eye
 fill(255,eyeG,0);
 ellipse(250,230,40,10);    //draws the mouth
 fill(0);
 ellipse(220,200,20,20);    //draws right pupil
 fill(0);
 ellipse(280,200,20,20);    //draws right pupil
 fill(0);
 ellipse(290,470,20,10);   //draws right foot
 fill(0);
 ellipse(210,470,20,10);   //draws left foot
 fill(0);
 ellipse(120,180,10,10);   //draws right hand
 fill(0);
 ellipse(380,180,10,10);   //draws right hand
 
 stroke(0);
 line(120,180,190,260);    //draws left arm
 line(380,180,310,260);    //draws right arm
 line(220,420,220,470);    //draws left leg
 line(280,420,280,470);    //draws right leg
}
 fill(0,0,225);
 // draws the blue the small blue square(button)
 rect(x,y,w,h);
 
}
void mousePressed()
  {
  if(mouseX > x && mouseX< x + w && mouseY > y && mouseY < y + h)
  {
    button = !button;
  }
  }

