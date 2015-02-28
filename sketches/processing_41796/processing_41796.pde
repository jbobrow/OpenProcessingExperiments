

//FIRST LINE//

float firstx[] = new float[12];
float firsty[] = new float[12];

float firstdisplace[] = new float[12];
float firstsize = 2;


//SECOND LINE//

float secondx[] = new float[12];
float secondy[] = new float[12];

float seconddisplace[] = new float[12];
float secondsize = 4;

//THIRD LINE//

float thirdx[] = new float[12];
float thirdy[] = new float[12];

float thirddisplace[] = new float[12];
float thirdsize = 6;

//FOURTH LINE//

float fourthx[] = new float[8];
float fourthy[] = new float[8];

float fourthdisplace[] = new float[8];
float fourthsize = 8;

//FIFTH LINE//

float fifthx[] = new float[12];
float fifthy[] = new float[12];

float fifthdisplace[] = new float[12];
float fifthsize = 10;

//SIXTH LINE//

float sixthx[] = new float[12];
float sixthy[] = new float[12];

float sixthdisplace[] = new float[12];
float sixthsize = 12;

//SEVENTH LINE//

float seventhx[] = new float[12];
float seventhy[] = new float[12];

float seventhdisplace[] = new float[12];
float seventhsize = 14;

//EIGHTH LINE//

float eighthx[] = new float[12];
float eighthy[] = new float[12];

float eighthdisplace[] = new float[12];
float eighthsize = 16;


void setup()
{
  background(255);
  size(700,400);
  fill(0);
  smooth();
  stroke(0,0,0,100);


//FIRST LINE//
  int i = 0;
  while(i < 5) {
    firstx[i] = 100; // position of x string
    firsty[i] = i*30+20;
    firstdisplace[i] = 0;
    i=i+1;
  }
  
  //SECOND LINE//
    int j = 0;
  while(j < 6) {
    secondx[j] = 150; // position of x string
    secondy[j] = j*30+20;
    seconddisplace[j] = 0;
    j=j+1;
  }
  //THIRD LINE//
      int k = 0;
  while(k < 7) {
    thirdx[k] = 200; // position of x string
    thirdy[k] = k*30+20;
    thirddisplace[k] = 0;
    k=k+1;
  }
  
  //FOURTH LINE//
 
       int l = 0;
  while(l < 8) {
    fourthx[l] = 250; // position of x string
    fourthy[l] = l*30+20;
    fourthdisplace[l] = 0;
    l=l+1; 
  }
  
    //FIFTH LINE//
 
       int m = 0;
  while(m < 9) {
    fifthx[m] = 300; // position of x string
    fifthy[m] = m*30+20;
    fifthdisplace[m] = 0;
    m=m+1; 
  }
  
  //SIXTH LINE//
      
         int n = 0;
  while(n < 10) {
    sixthx[n] = 350; // position of x string
    sixthy[n] = n*30+20;
    sixthdisplace[n] = 0;
    n=n+1; 
  }
    //SEVENTH LINE//
      
         int o = 0;
  while(o < 11) {
    seventhx[o] = 400; // position of x string
    seventhy[o] = o*30+20;
    seventhdisplace[o] = 0;
    o=o+1; 
  }
  
      //EIGHTH LINE//
      
         int p = 0;
  while(p < 12) {
    eighthx[p] = 450; // position of x string
    eighthy[p] = p*30+20;
    eighthdisplace[p] = 0;
    p=p+1; 
  }
}

void draw()
{
  background(255);

//FIRST LINE//
  int i = 0;
  while(i < 5) {
    

    if(dist(mouseX,mouseY,firstx[i],firsty[i]) < 25) {
      float xdist = (firstx[i] - mouseX)/5;
      firstx[i] = firstx[i] + xdist;
      firstdisplace[i] = firstdisplace[i] + xdist;
    }

    firstx[i] = firstx[i] - (firstdisplace[i]/20);  
    firstdisplace[i] = firstdisplace[i] - (firstdisplace[i]/20);

    ellipse(firstx[i],firsty[i],firstsize,firstsize);

    if(i > 0) {
      line(firstx[i], firsty[i], firstx[i-1], firsty[i-1]);
    }

    i=i+1;
    
  }

  //SECOND LINE//
    int j = 0;
  while(j < 6) {

    if(dist(mouseX,mouseY,secondx[j],secondy[j]) < 25) {
      float xdist = (secondx[j] - mouseX)/5;
      secondx[j] = secondx[j] + xdist;
      seconddisplace[j] = seconddisplace[j] + xdist;
    }

    secondx[j] = secondx[j] - (seconddisplace[j]/20);  
    seconddisplace[j] = seconddisplace[j] - (seconddisplace[j]/20);

    ellipse(secondx[j],secondy[j],secondsize,secondsize);

    if(j > 0) {
      line(secondx[j], secondy[j], secondx[j-1], secondy[j-1]);
    }

    j=j+1;
  }

  
 
 //THIRD LINE//
    int k = 0;
  while(k < 7) {

    if(dist(mouseX,mouseY,thirdx[k],thirdy[k]) < 25) {
      float xdist = (thirdx[k] - mouseX)/5;
      thirdx[k] = thirdx[k] + xdist;
      thirddisplace[k] = thirddisplace[k] + xdist;
    }

    thirdx[k] = thirdx[k] - (thirddisplace[k]/20);  
    thirddisplace[k] = thirddisplace[k] - (thirddisplace[k]/20);

    ellipse(thirdx[k],thirdy[k],thirdsize,thirdsize);

    if(k > 0) {
      line(thirdx[k], thirdy[k], thirdx[k-1], thirdy[k-1]);
    }

    k=k+1;
  }
 
 //FOURTH LINE//
 
   int l = 0;
  while(l < 8) {

    if(dist(mouseX,mouseY,fourthx[l],fourthy[l]) < 25) {
      float xdist = (fourthx[l] - mouseX)/5;
      fourthx[l] = fourthx[l] + xdist;
      fourthdisplace[l] = fourthdisplace[l] + xdist;
    }

    fourthx[l] = fourthx[l] - (fourthdisplace[l]/20);  
    fourthdisplace[l] = fourthdisplace[l] - (fourthdisplace[l]/20);

    ellipse(fourthx[l],fourthy[l],fourthsize,fourthsize);

    if(l > 0) {
      line(fourthx[l], fourthy[l], fourthx[l-1], fourthy[l-1]);
    }

l=l+1;
  }
  //FIFTH LINE//
 
   int m = 0;
  while(m < 9) {

    if(dist(mouseX,mouseY,fifthx[m],fifthy[m]) < 25) {
      float xdist = (fifthx[m] - mouseX)/5;
      fifthx[m] = fifthx[m] + xdist;
      fifthdisplace[m] = fifthdisplace[m] + xdist;
    }

    fifthx[m] = fifthx[m] - (fifthdisplace[m]/20);  
    fifthdisplace[m] = fifthdisplace[m] - (fifthdisplace[m]/20);

    ellipse(fifthx[m],fifthy[m],fifthsize,fifthsize);

    if(m > 0) {
      line(fifthx[m], fifthy[m], fifthx[m-1], fifthy[m-1]);
    }

m=m+1;
  }
  
  //SIXTH LINE//
  
   
   int n = 0;
  while(n < 10) {

    if(dist(mouseX,mouseY,sixthx[n],sixthy[n]) < 25) {
      float xdist = (sixthx[n] - mouseX)/5;
      sixthx[n] = sixthx[n] + xdist;
      sixthdisplace[n] = sixthdisplace[n] + xdist;
    }

    sixthx[n] = sixthx[n] - (sixthdisplace[n]/20);  
    sixthdisplace[n] = sixthdisplace[n] - (sixthdisplace[n]/20);

    ellipse(sixthx[n],sixthy[n],sixthsize,sixthsize);

    if(n > 0) {
      line(sixthx[n], sixthy[n], sixthx[n-1], sixthy[n-1]);
    }

n=n+1;
  }
  
    //SEVENTH LINE//
  
   
   int o = 0;
  while(o < 11) {

    if(dist(mouseX,mouseY,seventhx[o],seventhy[o]) < 25) {
      float xdist = (seventhx[o] - mouseX)/5;
      seventhx[o] = seventhx[o] + xdist;
      seventhdisplace[o] = seventhdisplace[o] + xdist;
    }

    seventhx[o] = seventhx[o] - (seventhdisplace[o]/20);  
    seventhdisplace[o] = seventhdisplace[o] - (seventhdisplace[o]/20);

    ellipse(seventhx[o],seventhy[o],seventhsize,seventhsize);

    if(o > 0) {
      line(seventhx[o], seventhy[o], seventhx[o-1], seventhy[o-1]);
    }

o=o+1;
  }
 
     //EIGHTH LINE//
  
   
   int p = 0;
  while(p < 12) {

    if(dist(mouseX,mouseY,eighthx[p],eighthy[p]) < 25) {
      float xdist = (eighthx[p] - mouseX)/5;
      eighthx[p] = eighthx[p] + xdist;
      eighthdisplace[p] = eighthdisplace[p] + xdist;
    }

    eighthx[p] = eighthx[p] - (eighthdisplace[p]/20);  
    eighthdisplace[p] = eighthdisplace[p] - (eighthdisplace[p]/20);

    ellipse(eighthx[p],eighthy[p],eighthsize,eighthsize);

    if(p > 0) {
      line(eighthx[p], eighthy[p], eighthx[p-1], eighthy[p-1]);
    }

p=p+1;
  }
}


