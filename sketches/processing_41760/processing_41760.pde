
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer Sound1;
AudioPlayer Sound2;
AudioPlayer Sound3;
AudioPlayer Sound4;
AudioPlayer Sound5;
AudioPlayer Sound6;
AudioPlayer Sound7;
AudioPlayer Sound8;

//FIRST LINE//

float firstx[] = new float[12];
float firsty[] = new float[12];

float firstdisplace[] = new float[12];
float firstsize = 1;


//SECOND LINE//

float secondx[] = new float[12];
float secondy[] = new float[12];

float seconddisplace[] = new float[12];
float secondsize = 5;

//THIRD LINE//

float thirdx[] = new float[12];
float thirdy[] = new float[12];

float thirddisplace[] = new float[12];
float thirdsize = 10;

//FOURTH LINE//

float fourthx[] = new float[12];
float fourthy[] = new float[12];

float fourthdisplace[] = new float[12];
float fourthsize = 15;

//FIFTH LINE//

float fifthx[] = new float[12];
float fifthy[] = new float[12];

float fifthdisplace[] = new float[12];
float fifthsize = 20;

//SIXTH LINE//

float sixthx[] = new float[12];
float sixthy[] = new float[12];

float sixthdisplace[] = new float[12];
float sixthsize = 25;


void setup()
{
  background(0);
  size(700,400);
  fill(255,255,255,150);
  smooth();
  stroke(255,255,255,50);
  
    m = new Minim(this);
Sound1 = m.loadFile("Sound1.wav");
Sound2 = m.loadFile("Sound2.wav");
Sound3 = m.loadFile("Sound3.wav");
Sound4 = m.loadFile("Sound4.wav");
Sound5 = m.loadFile("Sound5.wav");
Sound6 = m.loadFile("Sound6.wav");

  

//FIRST LINE//
  int i = 0;
  while(i < 12) {
    firstx[i] = 100; // position of x string
    firsty[i] = i*30+30;
    firstdisplace[i] = 0;
    i=i+1;
  }
  
  //SECOND LINE//
    int j = 0;
  while(j < 12) {
    secondx[j] = 200; // position of x string
    secondy[j] = j*30+30;
    seconddisplace[j] = 0;
    j=j+1;
  }
  //THIRD LINE//
      int k = 0;
  while(k < 12) {
    thirdx[k] = 300; // position of x string
    thirdy[k] = k*30+30;
    thirddisplace[k] = 0;
    k=k+1;
  }
  
  //FOURTH LINE//
 
       int l = 0;
  while(l < 12) {
    fourthx[l] = 400; // position of x string
    fourthy[l] = l*30+30;
    fourthdisplace[l] = 0;
    l=l+1; 
  }
  
    //FIFTH LINE//
 
       int m = 0;
  while(m < 12) {
    fifthx[m] = 500; // position of x string
    fifthy[m] = m*30+30;
    fifthdisplace[m] = 0;
    m=m+1; 
  }
  
  //SIXTH LINE//
      
         int n = 0;
  while(n < 12) {
    sixthx[n] = 600; // position of x string
    sixthy[n] = n*30+30;
    sixthdisplace[n] = 0;
    n=n+1; 
  }

}

void draw()
{
  background(0);

//FIRST LINE//
  int i = 0;
  while(i < 12) {
    
      if (dist(mouseX, mouseY, firstx[i], firsty[i]) < 50) {
     Sound1.play();
     Sound1.loop(0);
      }
    

    if(dist(mouseX,mouseY,firstx[i],firsty[i]) < 50) {
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
  while(j < 12) {
    
        
    if (dist(mouseX, mouseY, secondx[j], secondy[j]) < 50) {
     Sound2.play();
     Sound2.loop(0);
      }

    if(dist(mouseX,mouseY,secondx[j],secondy[j]) < 50) {
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
  while(k < 12) {
    
      if (dist(mouseX, mouseY, thirdx[k], thirdy[k]) < 50) {
     Sound3.play();
     Sound3.loop(0);
      }

    if(dist(mouseX,mouseY,thirdx[k],thirdy[k]) < 50) {
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
  while(l < 12) {
    
     
      if (dist(mouseX, mouseY, fourthx[l], fourthy[l]) < 50) {
     Sound4.play();
     Sound4.loop(0);
      }

    if(dist(mouseX,mouseY,fourthx[l],fourthy[l]) < 50) {
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
  while(m < 12) {
    
       if (dist(mouseX, mouseY, fifthx[m], fifthy[m]) < 50) {
     Sound5.play();
     Sound5.loop(0);
      }

    if(dist(mouseX,mouseY,fifthx[m],fifthy[m]) < 50) {
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
  while(n < 12) {
          
    if (dist(mouseX, mouseY, sixthx[n], sixthy[n]) < 50) {
     Sound6.play();
     Sound6.loop(0);
      }

    if(dist(mouseX,mouseY,sixthx[n],sixthy[n]) < 50) {
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
}

void stop()
{
Sound1.close();
Sound2.close();
Sound3.close();
Sound4.close();
Sound5.close();
Sound6.close();
super.stop();
}

