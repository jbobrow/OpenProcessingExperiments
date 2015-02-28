
int window_width = 640;
int window_height = 480;

void setup()
{
  smooth();
  size(640,480);
  noStroke();
}

float currX = (window_width/2.0);
float currY = (window_height/2.0);
float easing = 0.075;

float currX2 = (window_width/2.0);
float currY2 = (window_height/2.0);

int r = 114;
int g = 142;
int b = 206;

float eyeradius = 55;
float pupildiameter = 30;
float irisdiameter = 60;
int eye_offset = 100;

float upY=190;

void draw()
{
  background(200);

  float xcenter = (width/2);
  float ycenter = (height/2);




  float centerdist = dist(mouseX, mouseY, xcenter, ycenter);


  float distconstrained = constrain(centerdist, 0, eyeradius-20);

  float theta=0;
  if(mouseX < xcenter)
  {
    theta = PI + atan((mouseY - ycenter)/(mouseX - xcenter));
  }
  else
  {
    theta = atan((mouseY - ycenter)/(mouseX - xcenter));
  }

  float y = distconstrained*sin(theta)+ycenter;
  float x = distconstrained*cos(theta)+xcenter;


  /***********easing*************/
  float targetX= x;
  float targetY= y;
  float dx = targetX-currX;
  float dy = targetY-currY;

  currX += dx * 0.07;
  currY += dy * 0.07;

  /***********easing*************/


  pupil_size();


  float limitY = constrain(currY, 227, 262);
  for(int i = 0; i < 10; i++)
  {
    fill(180+(5*i));
    ellipse(xcenter-eye_offset, limitY, (2*eyeradius+30)-(5*i),(2*eyeradius+30)-(5*i));
    ellipse(xcenter+eye_offset, limitY, (2*eyeradius+30)-(5*i),(2*eyeradius+30)-(5*i));
  }




  eye_color();
  fill(r,g,b);


  ellipse(currX-eye_offset, currY, irisdiameter,irisdiameter);
  ellipse(currX+eye_offset, currY, irisdiameter,irisdiameter);
  fill(0);
  ellipse(currX-eye_offset, currY, pupildiameter,pupildiameter);
  ellipse(currX+eye_offset, currY, pupildiameter,pupildiameter);



  /***********easing*************/
  float targetX2= x;
  float targetY2= y;
  float dx2 = targetX2-currX2;
  float dy2 = targetY2-currY2;


  currX2 += dx2 * 0.01;
  currY2 += dy2 * 0.01;
  /***********easing*************/

  //reflection 
  //  draw_reflection();
  for(int i = 0; i<10; i++)
  {
    fill(255,150-(15*i));
    ellipse(width - currX2 - eye_offset - 30, height-currY2- 10, 2+(2*i),2+(2*i));
    ellipse(width - currX2 + eye_offset - 30, height-currY2 -10, 2+(2*i),2+(2*i));
  }


  //left eye
  fill(200);
  beginShape();
  vertex(285,210);
  vertex(320,210);
  vertex(320,332);
  vertex(100,332);
  vertex(100,157);
  vertex(320,157);
  vertex(284,244);
  bezierVertex(268,215, 251,207, 220,211);
  bezierVertex(189,215, 161,231, 157,235);
  bezierVertex(152,239, 160,259, 174,267);
  bezierVertex(188,274, 248,284, 264,271);
  bezierVertex(280,258, 284,244, 284,244);
  endShape(CLOSE);

  //right eye
  fill(200);
  beginShape();
  vertex(width-285,210);
  vertex(width-320,210);
  vertex(width-320,332);
  vertex(width-100,332);
  vertex(width-100,157);
  vertex(width-320,157);
  vertex(width-284,244);
  bezierVertex(width-268,215, width-251,207, width-220,211);
  bezierVertex(width-189,215, width-161,231, width-157,235);
  bezierVertex(width-152,239, width-160,259, width-174,267);
  bezierVertex(width-188,274, width-248,284, width-264,271);
  bezierVertex(width-280,258, width-284,244, width-284,244);
  endShape(CLOSE);



  //eyebrows
  if(mousePressed)
  {
  }

  else if(!mousePressed)
  {
    if(mouseY < 195)
    {
      if(upY > 175)
      {
      upY-=0.25;
      }
    }
    else if(mouseY >= 195 && mouseY < 280)
    {
      if(upY < 190)
      {
        upY+=0.25;
      }
      else if(upY > 190)
      {
        upY-=0.25;
      }
    }
    else if(mouseY >= 280)
    {
      if(upY <205)
      {
        upY+=0.25;
      }
    }
  }

  fill(80);
  beginShape();
  vertex(487,190);
  bezierVertex(458,upY-20, 389,upY-18, 362,upY-6);
  bezierVertex(334,upY+7, 338,upY+19, 387,upY+4);
  bezierVertex(427,upY-9, 451,upY+7, 487,190);
  endShape(CLOSE);

  fill(80);
  beginShape();
  vertex(width-487,190);
  bezierVertex(width-458,upY-20, width-389,upY-18, width-362,upY-6);
  bezierVertex(width-334,upY+7, width-338,upY+19, width-387,upY+4);
  bezierVertex(width-427,upY-9, width-451,upY+7, width-487,190);
  endShape(CLOSE);
}

void eye_color()
{
  if (mousePressed)
  {
    if(r >88)
    {
      r-=0.2;
    }
  }
  else
  {
    if(r <138)
    {
      r+=5;
    }
  }
}

void pupil_size()
{
  if(mousePressed)
  {
    if(pupildiameter < 40)
    {
      pupildiameter+=0.2;
    }
  }
  else {
    if(pupildiameter > 30)
    {
      pupildiameter--;
    }
  }
}









