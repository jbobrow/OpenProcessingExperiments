

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 8th, November, 2012
//*  email: akadir@sfu.ca
//*  A3_1. Using procedural programming, generate a vector (one-­‐dimensional
//*  array) that contains all the integers between [1:99] in random order and create
//*  an animation that visualizes a sorting algorithm while it orders them in
//*  increasing order.

// Inspired by Bubble-sort with Hungarian ("Csángó") folk dance , thanks to information from Jill.
// also inspired by http://www.sorting-algorithms.com/
// I used bubble saort in this code

// declare global variables 
// t  bigining point of array soarting 
// a  control drawing speed 
// count  length of the verticle line 

int t=0, a=0, count=100; 
int[] b=new int[count];

void setup() {  
  //circulation of array 
  for (int i=0; i<100; i++)// make it go through every level
  {

    Boolean valueAssigned = false; // declare a boolen expression

    while ( valueAssigned == false ) // loop through until a value has been assinged
    {

      Boolean alreadyExists = false;
      int  currentRandom = (int)random(0, 100); // generate numbers

      for (int j=0; j<i; j++)// go through all numbers has been assigned 
      {
        if ( currentRandom == b[j]) //check if it is exist already
        {
          alreadyExists = true;
        }
      }

      if ( alreadyExists == false) // if it doesnt exist, assign it
      {
        b[i] = currentRandom;

        println( b[i] );
        valueAssigned = true;
      }
    }//once it has been assigned, go to next level
  }


  size(250, 600);//size of canvas 
  background(255);    // color of background 
  paint(b);//draw array element
}
// use bubble soart to soart these random numbers
void draw() {
  a++;//control drawing speed 
  if (a % 20 == 0) {//assign speed for 20 
    t++;//array circulation begin with 0 
    if (t<b.length) {//before soarting 
      //apply soarting 
      for (int j = 0; j < b.length; j++) {
        //if the lement smaller that next one they replace position
        if (b[t] < b[j]) {
          background(255);
          int temp = 0;//temprary varuable
          //exchange two array value 
          temp = b[t];
          b[t] = b[j];
          b[j] = temp;
        }
      }
      paint(b);//call to draw
    }
  }
} 

//Draw 
void paint(int[] a) {//array express as line 
  for (int i=0;i<a.length;i++)//loop array  
    line(5, 5*i+30, a[i]+5, 5*i+30);//draw line
}



