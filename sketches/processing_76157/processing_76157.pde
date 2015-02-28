
//Kevin Hyun khyun
//copyright 2012

int [ ] value = {
  8, 41, 91, 10, 2, 60, 180, 210, 340, 76
};
int sum, avg, greaterAvg;


void setup()
{
  size(400, 400);
  textSize(15);
}

void draw()
{
  back();
  getLength();
  getSum();
  getAvg();
  getGreaterAvg();
}


void getLength()
{
  text("Length : " + value.length, 10, 30);
}

void getSum()
{
  sum=0;
  for ( int i = 0 ; i < value.length ; i++)
  {
    sum += value[i];
  }

  text("Sum : " + sum, 10, 50);
}

void getAvg()
{
  avg = sum/value.length;
  text("Average : " + avg, 10, 70);
}

void getGreaterAvg()
{
  greaterAvg = 0;
  for ( int i = 0 ; i < value.length ; i++)
  {
    if (value[i] > avg)
    {
      greaterAvg += value[i];
    }
  }
  text("Sum of values greater than average : " + greaterAvg, 10, 90);
}



void back()
{
  background (100,100,100);
}


