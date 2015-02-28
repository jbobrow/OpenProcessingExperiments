
int s;
int lastSecond;
int lastMinute;

int numCircle = 0;

void setup()
{
  size(600, 600);
  background(255, 111, 111); 
}
 
//this function is called 60 times per second
void draw()
{

  s = second();
  noStroke();
 
 if(minute() != lastMinute)
 {
 lastMinute = minute();
 numCircle++;
 
 if(numCircle >= 6)
   numCircle = 0;
 
 }
 
  //if the second was updated then do something once
 if (s != lastSecond)
 
  {

if(numCircle == 1)
{
  ellipse(300, 300, s*10-5, s*10-5);
  fill(201,182,2);
}

if(numCircle == 2)
{
  ellipse(300, 300, s*10-15, s*10-15);
  fill(253, 234, 255);
}

if(numCircle == 3)
{
  ellipse(300, 300, s*10-25, s*10-25);
  fill(196,220,240);
}

if(numCircle ==4)
{
  ellipse(300, 300, s*10-35, s*10-35);
  fill(255,148, 8);
}

if(numCircle == 5)
{
  ellipse(300, 300, s*10-45, s*10-45);
  fill(250, 238, 0);
}

  {



  }

  }
  
  }
