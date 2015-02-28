
//HaoYun Mei_hmei
//Copyright_Hao-Yun Mei_Carnegie Mellon University

// Instructions
 //When mouse is pressed, the background color will change and image will reset
 //when key is pressed, the ellipse color will change and also add a bigger ellipse

float x,y,diam, wd, easingCoefficient;

void setup()
{
  size(400,400);
 
  x = width/2;
  y = height/2;
  diam = width/10;
  //easingCoefficient = 0.1;
  
  smooth();
  background(255,20);
}

void draw()
{
  
  ellipse(mouseX,mouseY,diam,diam);

  line(mouseX, mouseY, x, y);
  
  
 //if (keyPressed) saveFrame("hw4.jpg");
  
}

void mousePressed()
{
  background( random(255), random(255), random(255));
  
}
void keyPressed()
{
  fill(random(255),random(255),random(255));
  ellipse(mouseX, mouseY, diam*2,diam*2);
}



