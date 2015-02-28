
//Richard May Copyright December 2012
//rwmay@andrew.cmu.edu

final int MAX = 43;

int[] X;
int[] Y;
int [] wd;
int [] r, g, b;
int [] lapCount;
color[] dotColor;
String [ ] allStrings;
int [ ]  speed;
String [ ] vehicle;
int [ ] display;


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
  display = new int [5];
//  for (int i =0; i < display.length; i++)
//  {
//   display [i] = i; 
//  }

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
  println (display [0]);
  if (display [0] == 0);
  {
    menu ();
    back();
    phase1();
  if (display [0] == 1 && display[1] == 1);
  {
    back ();
    speedBar(1,10,12);
    displayText(1,10); 
  }
  if (display [0] == 1 && display [2] == 2);
  {
    //back ();
    speedBar(2,100,18);
    displayText(2,100);
  }
  if (display [0] == 1 && display [3] == 3);
  {
    speedBar (3,1000,11);
    displayText (3,1000);
  }
  if (display [0] == 1 && display [4] == 4);
  {
    
  }
  if (keyPressed == true)
  {
    for (int i = 0; i<display.length; i++)
    {
     display [i] = 0; 
    }
  }
  }
  
}

void phase1()
{
  pushStyle();
  background (0);
  fill (220,10,10,80);
  textSize(140);
  text ("SPEED", .5*width, .3*height);
  textSize(40);
  text ("10^1", width/8, .5*height);   
  text ("10^2", 3*width/8, .5*height);
  text ("10^3", 5*width/8, .5*height);
  text ("10^4", 7*width/8, .5*height);
  fill (220, 60, 60, 60);
  rectMode (CORNER);
  rect (0, 0, width/4, height);
  fill(220, 80, 80, 80);
  rect (width/4, 0, width/4, height);
  fill (220, 100, 100, 80);
  rect (width/2, 0, width/4, height);
  fill (220, 120, 120, 80);
  rect (3*width/4, 0, width/4, height);
  popStyle();
}

void menu ()
{
  if (mousePressed == true && mouseX <= width/4 && display [0] == 0)
  {
    display [0] = 1;
    display [1] = 1;
  }
  if (mousePressed == true && mouseX <= width/2 && mouseX >= width/4 && display [0] == 0)
  {
    display [0]= 1;
    display [2]=2;
  }
  if (mousePressed == true && mouseX >= width/2 && mouseX <= 3*width/4 && display [0] == 0)
  {
    display [0] = 1;
    display [3]=3;
  }
  if (mousePressed == true && mouseX >= 3*width/4 && display [0] == 0) 
  {
    display [0] = 1;
    display [4]=4;
  }
}


//for (int i = 0; i < Y.length; i++)
//  {
//    Y[i]=(i*65)+20;
//    //   (((width - (Y.length*wd[i]))/Y.length)
//  }
  
  
  
void displayText (int num, int factor)
{
  if (display [num] == num)
  {
  for (int i = 0; i < vehicle.length; i++)
  {
    if (speed [i] /factor<10 && speed [i]/factor >= 1)
    {
    pushStyle();
    fill (220,255,220,99);
    textSize (18);
    text (vehicle [i] + " " +lapCount[i], width/2, Y [i]);
    popStyle();
    }
  }
  }
}
void speedBar(int num,int factor,int L)
{ 
  if (display [num] == num)
  {
    int t = 0;
  for (int i=0; i<speed.length; i ++)
  {
    if (speed [i] /factor<10 && speed [i]/factor >= 1)
    {
     t = t +1;
    fill (210,210,210,70);
    Y[i] = ((speed [i]/factor)+(t*height/L))-25; 
    rect(X[i], Y[i], wd [i], 10);
    wd[i] += speed [i]/(factor/10);
  
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
  t=0;
  }
}

void back()
{
  if (display [1] == 1)
  {
  pushStyle ();
  fill (0,0,0,50);
  rect (0,0,width,height);
  println (vehicle [9]);
  popStyle ();
  }
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


