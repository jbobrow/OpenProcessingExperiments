
//ckchan@andrew.cmu.edu
//Chrsitopher Chan
//Code written on 25 OCT 2012
//Homework Assignment 9

int i, sum, x, avg;
int [] arrayOfInts = new int [15];

void setup ()
{
  size (400, 400);
  background (#DDDDDD);
  smooth ();
  textSize (40);
  textAlign (CENTER);
  
  i=0;
  sum = 0;

  for (int i=0; i < arrayOfInts.length; i++)
  {
    //arrayOfInts[i]= int (random (0, 10));
    arrayOfInts[i] = i*2+i;
  }

  for (int i=0; i < arrayOfInts.length; i++)
  {
    sum  += arrayOfInts [i];
  }

  avg = sum/arrayOfInts.length;

  for (int i=0; i < arrayOfInts.length; i++)
  {
    if (arrayOfInts [i]> avg)
    {
      x += arrayOfInts [i];
    }
  }
}

void draw ()
{
  arrayLength ();
  arraySum ();
  arrayAvg();
  arrayAboveAvg();
}

void arrayLength()
{
  int l = arrayOfInts.length;
  text ("LNGTH:" + l, width/2, 125);
}

void arraySum()
{
  text ("∑:" + sum, width/2, 175);
}

void arrayAvg()
{
  text ("AVG:" + avg, width/2, 225);
}

void arrayAboveAvg()
{
  text ("∑(AVG<):" + x, width/2, 275);
}


