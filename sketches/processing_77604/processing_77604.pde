
//Robert Wohlforth - rwohlfor
//Homework 10
//Copyright Pittsburgh 2012

//Press 1, 2 or 3 to select which array to add to.
//Click anywhere in the window to add an x-coordinate to 
//the selected array.

int[] array1 = new int [0];
int[] array2 = new int [0];
int[] array3 = new int [0];
int activeArray = 1;

void setup()
{size(400,400);
background(0);
textAlign(CENTER,CENTER);
}

void draw()
{
  background(0);
  text("Press 1, 2 or 3 to select which array to add to." +
  "\nClick anywhere in the window to add an x-coordinate to \nthe selected array." +
  "\n\nLength of first array: " + array1.length + 
  "\nLength of second array: " + array2.length +
  "\nLength of third array: " + array3.length +
  "\n\nSum of first array: " + ArraySum(array1) +
  "\nSum of second array: " + ArraySum(array2) +
  "\nSum of third array: " + ArraySum(array3)+
  "\n\nAverage of first array: " + ArrayAverage(array1)+
  "\nAverage of second array: " + ArrayAverage(array2)+
  "\nAverage of third array:" + ArrayAverage(array3)+
  "\n\nSum of values above average in first array: " + AboveAverage(array1)+
  "\nSum of values above average in second array: " + AboveAverage(array2)+
  "\nSum of values above average in third array: " + AboveAverage(array3),
  width/2, height/2);
}

void keyReleased ()
{if (key == '1')
{activeArray = 1;
}
if (key == '2')
{activeArray = 2;
}
if (key == '3')
{activeArray = 3;
}
}

void mouseReleased ()
{if(activeArray == 1)
{array1 = append(array1, mouseX);
}
if(activeArray == 2)
{array2 = append(array2, mouseX);
}
if(activeArray == 3)
{array3 = append(array3, mouseX);
}
}

int ArraySum (int[] arrayName)
{
  int sum=0;
  for (int i = 0; i < arrayName.length; i++)
  {sum = sum + arrayName[i];
  }
  return sum;
}

int ArrayAverage (int[] arrayName)
{if (arrayName.length > 0)
  {return ArraySum(arrayName)/arrayName.length;
  }
  else
  {return 0;
  }
}

int AboveAverage (int[] arrayName)
{int sum=0;
  for (int i = 0; i < arrayName.length; i++)
  {if (arrayName[i] > ArrayAverage(arrayName))
  {sum = sum + arrayName[i];
  }
  }
  return sum;
}



