
int [] awesomeArray = {50,100,150,200,250};
int [] goFastArray = {3,-5,2,-5,3};


void setup()
{
  size(300,300);
  background(0);
}

void border()
{
  fill(255,0,0);
  if (mouseX > 280 || mouseX < 20 || mouseY > 280)
  {
    balls();
  }
}

void balls()
{
  background(255,255,0);
  ellipse(50, awesomeArray[0], 30, 30);
  ellipse(awesomeArray[1], 100, 30, 30);
  ellipse(150, awesomeArray[2], 30, 30);
  ellipse(awesomeArray[2], 200, 30, 30);
  ellipse(250, awesomeArray[4], 30, 30);
  awesomeArray[0] = awesomeArray[0] + goFastArray[0];
  awesomeArray[1] = awesomeArray[1] + goFastArray[1];
  awesomeArray[2] = awesomeArray[2] + goFastArray[2];
  awesomeArray[3] = awesomeArray[3] + goFastArray[3];
  awesomeArray[4] = awesomeArray[4] + goFastArray[4];
  if (awesomeArray[0] > 280 || awesomeArray[0] < 0)
  goFastArray[0] = goFastArray[0] * -1;
  if (awesomeArray[1] > 280 || awesomeArray[1] < 0)
  goFastArray[1] = goFastArray[1] * -1;
  if (awesomeArray[2] > 280 || awesomeArray[2] < 0)
  goFastArray[2] = goFastArray[2] * -1;
  if (awesomeArray[3] > 280 || awesomeArray[3] < 0)
  goFastArray[3] = goFastArray[3] * -1;
  if (awesomeArray[4] > 280 || awesomeArray[4] < 0)
  goFastArray[4] = goFastArray[4] * -1;
}
   

void draw()
{
  border();
}
