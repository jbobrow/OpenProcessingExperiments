
//Homework 9

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA

//notes

//global variables / arrays
int [] numbahz = {3, 19, 47, 121, 189, 210, 270, 306, 347, 379};



void setup ()  {
  size (400,400);
  smooth ();
  textAlign (CENTER);
  textSize (18);
  background (0,0,0);
}


void draw ()  {

  text ("LENGTH", width/2, height*.1);
  text (numbahz.length , width/2, height*.15);
  text ("SUM", width/2, height*.3);
  text ( sumNumbahz(), width/2, height*.35);
  text ("AVERAGE", width/2, height*.5);
  text ( averageNumbahz(), width/2, height*.55);
  text ("SUM OF VALUES GREATER THAN AVERAGE", width/2, height*.7);
  text (sumOverAverage (), width/2, height*.75);
}


int sumOverAverage ()  {
  int sum = 0;
  
  for ( int b = 0; b < numbahz.length; b = b+1)  {
    if (numbahz[b] > averageNumbahz() )  {
      sum = sum + numbahz[b] ;
    }
  }
  return sum;
}


float averageNumbahz ()  {
  float sum = 0;
  for ( int b = 0; b < numbahz.length; b = b+1)  { //what does b++ mean D:
    sum = sum + numbahz[b];
  }
  return sum/numbahz.length;
}


int sumNumbahz ( )  {
  int sum = 0;
  for ( int b = 0 ; b < numbahz.length ; b = b+1)  {
    sum = sum + numbahz[b];
  }
  return sum;
}

