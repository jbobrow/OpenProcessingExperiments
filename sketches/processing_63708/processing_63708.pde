
//3B: face and mouse assign


void setup()
{
  size(600,600);
  smooth();

}
void draw()
{
  background(35);
   
  //float mx = 50 + mouseX/50;
   
  float mx = map(mouseX, 0, width, 5,50);
  float zx = map(mouseX, 0, width, -1,62);
  float bx = map(mouseX, 2, width, 412,400);
  float fx = map(mouseX, 0, width, 15,1);


 
background(255);
 
 int faceWidth = 350;
 int faceHeight = 350;
 
 int eyeWidth = 90;
 int eyeHeight = 90;
 
 int mouthXpos = 25;
 
 int noseWidth = 150;
 int noseHeight = 150;
 
 int nostrilWidth = 4;
 int nostrilHeight = 4;
 
 // outline
stroke(0);
noFill();
strokeWeight(1);
  ellipse(300, 300, mx, mx);
 
 // eyes outline
stroke(0);
ellipse(200, 170, eyeWidth,eyeHeight);
fill(0);
 ellipse(200, 180, mx,mx);
  fill (250);
    ellipse(400, 170, eyeWidth,eyeHeight);
    fill(0);
    fill(0);
    ellipse(400, 180, mx,mx);
 


  //nose
    fill(0);
  ellipse(300, 340, noseHeight, noseWidth);
  fill(250);
    ellipse (285,402, nostrilHeight+4,nostrilWidth+4);
    ellipse (318,402, nostrilHeight+4,nostrilWidth+4);


  
  ellipse (200,380, 15,15);
  
  stroke(0);
line(250,460,  280, bx);
line(350,460,  320, bx);

strokeWeight(0);
stroke(250);
bezier(280,480,
       280,460,
       290,460,
       300, 460);
       
  //mouth
  fill(0);
  ellipse(300,450,40,zx);
  
  //unibrow
  fill(0);
rect(205,110, 188,fx);

}



