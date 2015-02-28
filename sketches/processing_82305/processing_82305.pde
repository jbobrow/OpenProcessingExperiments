
//Homework 10 (Redo)

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA





//notes
//Jim Roberts helped explain this homework to me. thanks!


//global variables / arrays
int [] numbArray1 = {3, 19, 47, 121, 189, 210, 270, 306, 347, 379};
int [] numbArray2 = {25, 50, 75, 100, 150, 200, 250, 275, 300, 325, 350, 375};
int [] numbArray3 = {5, 10, 20, 30, 50, 70, 110, 150, 230, 310, 390};





void setup ()  {
  size (400,400);
  smooth ();
  textAlign (CENTER);
  textSize (18);
  background (0,0,0);

  text ("LENGTHS", width/2, height*.05);
  text (numbArray1.length, width/2, height*.10);
  text (numbArray2.length, width/2, height*.15);
  text (numbArray3.length, width/2, height*.20);

  text ("SUMS", width/2, height*.30);
  text (computeSum (numbArray1), width/2, height*.35);
  text (computeSum (numbArray2), width/2, height*.40);
  text (computeSum (numbArray3), width/2, height*.45);

  text ("AVERAGES", width/2, height*.55);
  text (computeAvg ( numbArray1), width/2, height*.60);
  text (computeAvg ( numbArray2), width/2, height*.65);
  text (computeAvg ( numbArray3), width/2, height*.70);

  text ("SUMS OF VALUES GREATER THAN AVERAGE", width/2, height*.80);
  text (computeSumOverAvg (numbArray1), width/2, height*.85);  //should be 1512
  text (computeSumOverAvg (numbArray2), width/2, height*.90);  //should be 1080
  text (computeSumOverAvg (numbArray3), width/2, height*.95);  //should be 1875
}





int computeSumOverAvg (int [] insertArray)  {
  int sumOvrAvg = 0;
  float avg = computeAvg(insertArray);
  for ( int b = 0; b < insertArray.length; b = b+1)  { 
    if ( insertArray[b] > avg )  {
      sumOvrAvg = sumOvrAvg + insertArray[b] ;
    }
  }
  return sumOvrAvg;
}


float computeAvg (int [] insertArray)  {
  return (computeSum(insertArray)/insertArray.length);
}


int computeSum (int [] insertArray)  {
  int sum = 0;
  for ( int b = 0 ; b < insertArray.length ; b = b+1)  {
    sum = sum + insertArray[b];
  }
  return sum;
}


