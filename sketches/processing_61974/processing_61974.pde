

float b1y;
float b2y;
float b3y;
float b4y;
float b5y;
float b6y;
float b7y;

void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

  b1y=height;
  b2y=height+50;
  b3y=height+80;
  b4y=height+100;
  b5y= height+ 190;
  b6y= height + 150;
  b7y= height+20;
} 




void draw() 
{ 
  background(255, 255, 255);

  image( loadImage("swimmer.jpg"), width/4, frameCount);

  if (frameCount>150)
  {
    for (int i = 1;i<=25;i++)
    {

      b1y = b1y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 50+i*random(-50, 50), b1y + i*100, 10, 10);

      b2y = b2y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 350+i*random(-50, 50), b2y + i*100, 10, 10);

      b3y = b3y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 150+i*random(-50, 50), b3y + i*100, 10, 10);

      b4y = b4y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 100+i*random(-50, 50), b4y + i*100, 10, 10);

      b5y = b5y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 220+i*random(-50, 50), b5y + i*100, 10, 10);

      b6y = b6y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 370+i*random(-50, 50), b6y + i*100, 10, 10);

      b7y = b7y-1;
      fill ( 0, 200, 200, 90);
      ellipse ( 200+i*random(-50, 50), b7y + i*100, 10, 10);
    }
  }


  noStroke ();
  fill ( 0, 200, 255, 50);
  rect ( 0, 390, width, 400);
}


