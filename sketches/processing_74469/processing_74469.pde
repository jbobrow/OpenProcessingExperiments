
// Homework #10, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// yvonnehidle@gmail.com


/*
Hi! I think return functions would make this cleaner... I need to figure those out!
*/


/* 
Specification 1:
Declare three arrays of int an initialize then to different lengths. The arrays
must be at least 10 elements long.
*/
int[]numbersList1;
int[]numbersList2;
int[]numbersList3;

// Name of the lists
String nameList1;
String nameList2;
String nameList3;

// Other global variables
int sum;
int sum2;
int average;

// Just a background
PImage bg;

//========================================//
void setup()
{
// General parameters
size(800,400);
smooth();
bg = loadImage("bg.png");
  
// Three lists of numbers
numbersList1 = new int [int( random(10,15) )];
numbersList2 = new int [int( random(12,20) )];
numbersList3 = new int [int( random(15,18) )];

// Assign the lists random numbers
startArray(numbersList1);
startArray(numbersList2);
startArray(numbersList3);

// Name of the lists
nameList1 = "list one: ";
nameList2 = "list two: ";
nameList3 = "list three: ";
}
//========================================//


//========================================//
void startArray(int [] anyArray)
{
  
for (int i=0; i<anyArray.length; i++)
{
  anyArray[i] = int(random(10,90));
}

}
//========================================//


//========================================//
void draw()
{
  background(bg);
  textSize(15);
  noStroke();
  fill(0);

/*
Specification 2:
Display the length of each array sing the text() function.
*/
showLength(nameList1, numbersList1, 20);
showLength(nameList2, numbersList2, 40);
showLength(nameList3, numbersList3, 60);

/*
Show all numbers in the array using the text( ) fucntion.
*/
showNumbers(nameList1, numbersList1, 100);
showNumbers(nameList2, numbersList2, 120);
showNumbers(nameList3, numbersList3, 140);

/*
Specification 3:
Define one function to compute the sum of an array of int. Use this
function to compute and return the sum of each array by calling the function three
times. Each call will have a different array argument. Display these values.
*/
computeSum(nameList1, numbersList1, 180);
computeSum(nameList2, numbersList2, 200);
computeSum(nameList3, numbersList3, 220);

/*
Specification 4:
Define one function to compute the average of the values in an array of int.
Use this function to compute and return the average of the values in each array by
calling the function three times. Each call will have a different array argument.
Display these values.
*/
computeAverage(nameList1,numbersList1,260);
computeAverage(nameList2,numbersList2,280);
computeAverage(nameList3,numbersList3,300);


/*
Specification 5:
Define one function to compute the sum of the values in an array of int that
are greater than the average of the values in the array. Use this function to
compute and return the sum of values greater than the average of the values in the
array by calling the function three times. Each call will have a different array
argument. Display these values.
*/
computeAverage2(nameList1,numbersList1,340);
computeAverage2(nameList2,numbersList2,360);
computeAverage2(nameList3,numbersList3,380);

}
//========================================//


//========================================//
void computeAverage2(String anyName, int [] anyList, int textY)
{

// compute the sum of the list
sum=0;
for(int i=0; i<anyList.length; i++)
{
  sum=sum+anyList[i];
}

// compute the average of the list
average=sum/anyList.length;
   
// compute the average of the large numbers in the list
sum2=0;
for(int i=0; i<anyList.length; i++)
{
  if(anyList[i] > average)
  {
sum2=sum2+anyList[i];
  }
}
 
text("Sum of all values that are greater than the average in "+anyName+sum2,10,textY);
 
}
//========================================//


//========================================//
void computeAverage(String anyName, int [] anyList, int textY)
{

// compute the sum of the list
sum=0;
for(int i=0; i<anyList.length; i++)
{
  sum=sum+anyList[i];
}

// compute the average of the list
average=sum/anyList.length;
text("Average value in "+anyName+average,10,textY);
}
//========================================//


//========================================//
void computeSum(String anyName, int [] anyList, int textY)
{
 
sum=0;
  for(int i=0; i<anyList.length; i++)
{
  sum=sum+anyList[i];
}
text("Sum of the values in "+anyName+sum,10,textY);
 
}
//========================================//


//========================================//
void showNumbers(String anyName, int [] anyList, int textY)
{
   
text("Values in "+anyName, 10, textY);
int textX=155;
 
for(int i=0; i<anyList.length; i++)
{
  text(anyList[i],textX,textY);
  textX=textX+30;
}
 
}
//========================================//


//========================================//
void showLength(String anyName, int [] anyList, int textY)
{
  
text("Total numbers in "+anyName+anyList.length, 10, textY);
  
}
//========================================//


