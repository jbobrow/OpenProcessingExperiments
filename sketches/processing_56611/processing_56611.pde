
//HW#10-Arrays
//Joshua Chang
//jmc1 Copyright 2012

int[] Thing1={1,2,3,4,5,6,7,8,9,10};
int[] Thing2={11,12,13,14,15,16,17,18,19,20};
int[] Thing3={21,22,23,24,25,26,27,28,29,30};

void setup()
{
size(400,400);  
textSize(18);
textAlign(CENTER);
background(0);
smooth();
}

void draw()
{
fill(random(255),random(255),random(255));
Text();
//saveFrame ("HW10_ArraysTwo.jpg");
}

void Text()
{
  //Array Lengths
text("First Array Length: "+Thing1.length, width/2, 30);
text("Second Array Length: "+Thing2.length, width/2, 60);
text("Third Array Length: "+Thing3.length, width/2, 90);
//Array Sums
text("First Array Sum: "+ArraySums(Thing1), width/2, 130);
text("Second Array Sum: "+ArraySums(Thing2), width/2, 160);
text("Third Array Sum: "+ArraySums(Thing3), width/2, 190);
//Array Averages
text("First Array Average: "+ArrayAverages(Thing1), width/2, 230);
text("Second Array Average: "+ArrayAverages(Thing2), width/2, 260);
text("Third Array Average: "+ArrayAverages(Thing3), width/2, 290);
//Array Large Sums
text("First Array Large Sums: "+ArrayLargeSums(Thing1), width/2, 330);
text("Second Array Large Sums: "+ArrayLargeSums(Thing2), width/2, 360);
text("Third Array Large Sums: "+ArrayLargeSums(Thing3), width/2, 390);
}
//-----------------------------------------------------------------------
float ArraySums(int [] Dud)//<---Don't Understand, (Ask Nolan?)
{
  int sum=0;
  for(int i=0; i<Dud.length;i++)
  {
    sum += Dud[i];
  }
  return sum;
}
//---------------------------------------
float ArrayAverages(int [] Dud)
{
   float average =0;
   average = ArraySums(Dud)/Dud.length;
   return average;
}
//----------------------------------------
float ArrayLargeSums(int[] Dud)
{
 float largeSum =0;
 for(int i=0;i<Dud.length;i++)
 {
if ( Dud[i]>=ArrayAverages(Dud))
{
 largeSum +=Dud[i];
}
}
return largeSum;
}
//----------------------------------------

