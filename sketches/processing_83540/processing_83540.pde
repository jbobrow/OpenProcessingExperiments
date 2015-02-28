
//Richard May Copyright December 2012
//rwmay@andrew.cmu.edu

final int MAX = 13;

int[] X;
int[] Y;
int [] wd;
int [] r, g, b;
int [] lapCount;

color[] dotColor;

String [ ] allStrings;
int [ ]  speed;
String [ ] vehicle;


void setup()
{
  size(1600, 800);

  allStrings = loadStrings("data.txt");

  speed = new int[allStrings.length];
  vehicle = new String[allStrings.length];

  for ( int i = 0; i < allStrings.length; i++)
  {
    String [ ] temp = split(allStrings[i], ',') ;
    speed[i] = Integer.parseInt(temp[0]);
    vehicle[i] = temp[1];
  }



  X = new int [MAX];

  for (int i = 0; i < X.length; i++)
  {
    X[i]=0;
  }

  wd = new int [MAX];
  Y = new int [MAX];

  for (int i = 0; i < Y.length; i++)
  {
    Y[i]=(i*65)+20;
    //   (((width - (Y.length*wd[i]))/Y.length)
  }
  r = new int [MAX];
  g = new int [MAX];
  b = new int [MAX];
  lapCount = new int [MAX];
  X= initIntArray0(0);
  lapCount= initIntArray0(0);
  r= initIntArray0(255);
  g= initIntArray0(255);
  b= initIntArray0(255);
  wd= initIntArray0(12);
  //Y = initIntArrayY();

  noStroke( );
}

void draw()
{
  back();
  speedBar ();
  displayText ();
}

void displayText ()
{
  for (int i = 0; i < vehicle.length; i++)
  {
    pushStyle();
    fill (255);
    textSize (14);
    text (vehicle [i] + " " +lapCount[i], width/2, Y [i]);
    popStyle();
  }
}
void speedBar()
{ 
  for (int i=0; i<speed.length; i ++)
  {
    fill (r [i], g[i], b[i]);
    rect(X[i], Y[i], wd [i], 10);
    wd[i] += speed [i];

    if (wd[i] >= 1.02*width)
    {
      wd[i] = 0;
      lapCount [i]= lapCount [i] + 1;
      r[i]= r[i] - 20;
      if (r[i] <= 0)
      {
        r[i]=r[i]+20;
        g[i]=g[i]-20;
      }
      if (r[1] <= 0)
      {
        r [i]=255;
        g[i]=255;
        b[i]=255;
      }
    }
  }
}

void back()
{
  background(0);
  println (vehicle [9]);
}


int[] initIntArray0(int setNum)
{
  int[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, setNum);
  }
  return temp;
}
//int[] initIntArray(int low, int high)
//{
//  int[] temp = {
//  };
//  for (int i = 0; i<MAX; i++)
//  {
//    temp = append(temp, int(random(low, high)));
//  }
//  return temp;
//}
//


