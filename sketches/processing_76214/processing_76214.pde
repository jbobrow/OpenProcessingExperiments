
//Robert Wohlforth - rwohlfor
//Homework 9
//Copyright Pittsburgh 2012

//Click anywhere on the screen to add an x-value to the array.

int[] xValue = new int [0];

void setup ()
{background (255);
  size (400,400);
fill (0);
textAlign (CENTER);
}

void draw ()
{background (255);
printText();
}

void printText()
{text ("Click anywhere to add to the array:\n Array Length: " + xValue.length 
+ "\n Array Sum: " + arraySum() 
+ "\n Array Average: " + arrayAverage() 
+ "\n Sum of Values Above Average: " + arrayAboveAverage (), width/2, height/2);
}

void mouseReleased()
{xValue = append (xValue, int(mouseX));
}

int arraySum ()
{
  int Sum = 0;
  int n = 0;
  while (n <= xValue.length - 1)
  {Sum = Sum + xValue[n];
  n++;
  }
  return Sum;
}

float arrayAverage ()
{
  if (xValue.length > 0)
 {return arraySum () / xValue.length;
 }
 else
 {return 0;
 }
}

int arrayAboveAverage ()
{
  int sum = 0;
  int n = 0;
  while (n <= xValue.length - 1)
  {if (xValue[n] > arrayAverage())
  {sum = sum + xValue[n];
  }
  n++;
  }
  return sum;
}





