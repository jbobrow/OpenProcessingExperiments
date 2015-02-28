
//========================================//
// Homework #10, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// yvonnehidle@gmail.com
//========================================//

/* 
Specification 1:
Declare three arrays of int an initialize then to different lengths. The arrays
must be at least 10 elements long.
*/
int[]numbersList1;
int[]numbersList2;
int[]numbersList3;

// Global arrays
final int max = 35;
int[]sum;
int[]avg;
int[]sumLarge;

// Name of the lists
String nameList1;
String nameList2;
String nameList3;

// Just a background
PImage bg;


//========================================//
// SETUP
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
// DRAW LOOP
//========================================//
void draw()
{
  background(bg);
  textSize(15);
  noStroke();
  fill(0);

displayNumbers();

noLoop();
}
//========================================//


//========================================//
// TURN THE NUMBERS INTO TEXT
//========================================//
void displayNumbers()
{

// Numbers List 1
showLength(nameList1, numbersList1, 20);
showNumbers(nameList1, numbersList1, 100);

sum = computeSum(numbersList1,0);
text("Sum of the values in "+nameList1+sum[0],10,180);

avg = computeAverage(numbersList1,0);
text("Average value in "+nameList1+avg[0],10,260);

sumLarge = computeSumLarge(numbersList1, 0);
text("Sum of all values that are greater than the average in "+nameList1+sumLarge[0],10,340);


// Numbers List 2
showLength(nameList2, numbersList2, 40);
showNumbers(nameList2, numbersList2, 120);

sum = computeSum(numbersList2, 1);
text("Sum of the values in "+nameList2+sum[1],10,200);

avg = computeAverage(numbersList2, 1);
text("Average value in "+nameList2+avg[1],10,280);

sumLarge = computeSumLarge(numbersList2, 1);
text("Sum of all values that are greater than the average in "+nameList2+sumLarge[1],10,360);


// Numbers List 3
showLength(nameList3, numbersList3, 60);
showNumbers(nameList3, numbersList3, 140);

sum = computeSum(numbersList3, 2);
text("Sum of the values in "+nameList3+sum[2],10,220);

avg = computeAverage(numbersList3, 2);
text("Average value in "+nameList3+avg[2],10,300);

sumLarge = computeSumLarge(numbersList3, 2);
text("Sum of all values that are greater than the average in "+nameList3+sumLarge[2],10,380);

}
//========================================//


//========================================//
// SUM OF ALL VALUES GREATER THAN AVERAGE
//========================================//
int[] computeSumLarge(int [] anyList, int num)
{
int[]tempSumLarge = new int[max];
for(int i=0; i<anyList.length; i++)
{  
  if(anyList[i] > avg[num])
  {
    tempSumLarge[num]=tempSumLarge[num]+anyList[i];
  }
}
return tempSumLarge;
}
//========================================//


//========================================//
// COMPUTE AVERAGE OF ARRAYS
//========================================//
int[] computeAverage(int [] anyList, int num)
{
int[]tempAvg = new int[max];
for(int i=0; i<anyList.length; i++)
{  
  tempAvg[num]=sum[num]/anyList.length;
}
return tempAvg;
}
//========================================//


//========================================//
// COMPUTE SUMS IN ARRAYS
//========================================//
int[] computeSum(int [] anyList, int num)
{
int[]tempSum = new int[max];
for(int i=0; i<anyList.length; i++)
{
  tempSum[num]=tempSum[num]+anyList[i];
}
return tempSum;
}
//========================================//


//========================================//
// SHOW NUMBERS IN ARRAYS
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
// SHOW LENGTH OF ARRAYS
//========================================//
void showLength(String anyName, int [] anyList, int textY)
{
text("Total numbers in "+anyName+anyList.length, 10, textY); 
}
//========================================//


//========================================//
// GIVE LISTS THEIR NUMBERS
//========================================//
void startArray(int [] anyArray)
{
  
for (int i=0; i<anyArray.length; i++)
{
  anyArray[i] = int(random(10,90));
}

}
//========================================//


