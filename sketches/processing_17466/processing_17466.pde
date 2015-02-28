


float centerX0=10; 
float centerX1=80;
float centerX2=100;
float centerX3=200;
float centerX4=240;
float centerX5=280;
float centerX6=300;
float centerX7=350;
float centerX8=400;
float centerX9=50;
float centerX10=230;
float centerX11=320;
float centerX12=30;
float centerX13=150;
float centerX14=210;

float centerY0=10;
float centerY1=80;
float centerY2=100;
float centerY3=200;
float centerY4=240;
float centerY5=280;
float centerY6=300;
float centerY7=350;
float centerY8=400;
float centerY9=50;
float centerY10=230;
float centerY11=320;
float centerY12=30;
float centerY13=150;
float centerY14=210;

float step0=1;  
float step1=0.5; 
float step2=5; 
float step3=2;
float step4=1;
float step5=1;
float step6=4;
float step7=1;
float step8=5;
float step9=2;
float step10=1;
float step11=1;
float step12=4;
float step13=1;
float step14=5;

int value = 1;



void setup() 
{
  background(0); 
  size(400, 400); 
  smooth(); 
  
 }



void draw() 
{
  if (value==1)
  {
  background(0); 
  
  
  
stroke(255,0,0); //color linia vermell
  strokeWeight(20); 
  centerX0=centerX0+step0;  
  line(centerX0,0,centerX0,400); //linia vermella
  if (centerX0>width | centerX0<0)
  {
  step0=-step0;
  }

stroke(255,0,0); //color linia vermell
  strokeWeight(20);
  centerY0=centerY0+step0; 
  line(0,centerY0,400,centerY0); //linia vermella
  if (centerY0>width | centerY0<0)
  {
  step0=-step0;
  }



stroke(5,44,255); //color linia blau
  strokeWeight(20);  
  centerX1=centerX1+step1;  
  line(centerX1,0,centerX1,400);
  if (centerX1>width | centerX1<0) 
  {
  step1=-1*step1;  
  }
 
stroke(5,44,255); //color linia blau
  strokeWeight(20);  
  centerY1=centerY1+step1;  
  line(0,centerY1,400,centerY1);
  if (centerY1>width | centerY1<0) 
  {
  step1=-1*step1;
  }
 
 
 
stroke(255,255,0); //color linia groc
  strokeWeight(20);  
  centerX2=centerX2+step2;  
  line(centerX2,0,centerX2,400);
  if (centerX2>width | centerX2<0) 
  {
  step2=-1*step2;
  }
 
stroke(255,255,0); //color linia groc
  strokeWeight(20);  
  centerY2=centerY2+step2;  
  line(0,centerY2,400,centerY2);
  if (centerY2>width | centerY2<0) 
  {
  step2=-1*step2;
  }
 
 
 
stroke(255,0,0); //color linia vermell 2
  strokeWeight(10);  
  centerX3=centerX3+step3;  
  line(centerX3,0,centerX3,400);
  if (centerX3>width | centerX3<0) 
  {
  step3=-1*step3;
  }

stroke(255,0,0,100); //color linia vermell 2
  strokeWeight(10);  
  centerY3=centerY3+step3;  
  line(0,centerY3,400,centerY3);
  if (centerY3>width | centerY3<0) 
  {
  step3=-1*step3;
  }



stroke(255,250,0); //color linia groc 2
  strokeWeight(5);  
  centerX4=centerX4+step4;  
  line(centerX4,0,centerX4,400);
  if (centerX4>width | centerX4<0) 
  {
  step4=-1*step4;
  }
  
stroke(255,250,0,230); //color linia groc 2
  strokeWeight(5);  
  centerY4=centerY4+step4;  
  line(0,centerY4,400,centerY4);
  if (centerY4>width | centerY4<0) 
  {
  step4=-1*step4;
  }
  
  

stroke(0,0,255,150); //color linia blau 2
  strokeWeight(10);  
  centerX5=centerX5+step5;  
  line(centerX5,0,centerX5,400);
  if (centerX5>width | centerX5<0) 
  {
  step5=-1*step5;
  }

stroke(0,0,255,150); //color linia blau 2
  strokeWeight(10);  
  centerY5=centerY5+step5;  
  line(0,centerY5,400,centerY5);
  if (centerY5>width | centerY5<0) 
  {
  step5=-1*step5;
  }



stroke(0,0,255,135); //color linia blau 2
  strokeWeight(9);  
  centerX6=centerX6+step6;  
  line(centerX6,0,centerX6,400);
  if (centerX6>width | centerX6<0) 
  {
  step6=-1*step6;
  }

stroke(0,0,255,254); //color linia blau 2
  strokeWeight(9);  
  centerY6=centerY6+step6;  
  line(0,centerY6,400,centerY6);
  if (centerY6>width | centerY6<0) 
  {
  step6=-1*step6;
  }



stroke(250,255,0,200); //color blanc
  strokeWeight(10);  
  centerX7=centerX7+step7;  
  line(centerX7,0,centerX7,400);
  if (centerX7>width | centerX7<0) 
  {
  step7=-1*step7;
  }
 
stroke(250,255,0,200); //color blanc
  strokeWeight(10);  
  centerY7=centerY7+step7;  
  line(0,centerY7,400,centerY7);
  if (centerY7>width | centerY7<0) 
  {
  step7=-1*step7;
  } 
  

stroke(255,0,0,190); //color vermell 3
  strokeWeight(7);  
  centerX8=centerX8+step8;  
  line(centerX8,0,centerX8,400);
  if (centerX8>width | centerX8<0) 
  {
  step8=-1*step8;
  }

stroke(255,0,0,190); //color vermell 3
  strokeWeight(7);  
  centerY8=centerY8+step8;  
  line(0,centerY8,400,centerY8);
  if (centerY8>width | centerY8<0) 
  {
  step8=-1*step8;
  }



stroke(5,44,255,200); //color linia blau
  strokeWeight(20);  
  centerX9=centerX9+step9;  
  line(centerX9,0,centerX9,400);
  if (centerX9>width | centerX9<0) 
  {
  step9=-1*step9;
  }
  
stroke(5,44,255,200); //color linia blau
  strokeWeight(20);  
  centerY9=centerY9+step9;  
  line(0,centerY9,400,centerY9);
  if (centerY9>width | centerY9<0) 
  {
  step9=-1*step9;
  }
 

 
stroke(255,255,0,200); //color linia groc
  strokeWeight(20);  
  centerX10=centerX10+step10;  
  line(centerX10,0,centerX10,400);
  if (centerX10>width | centerX10<0) 
  {
  step10=-1*step10;
  }
  
stroke(255,255,0,200); //color linia groc
  strokeWeight(20);  
  centerY10=centerY10+step10;  
  line(0,centerY10,400,centerY10);
  if (centerY10>width | centerY10<0) 
  {
  step10=-1*step10;
  }
 
 
 
stroke(255,0,0,200); //color linia vermell 2
  strokeWeight(10);  
  centerX11=centerX11+step11;  
  line(centerX11,0,centerX11,400);
  if (centerX11>width | centerX11<0) 
  {
  step11=-1*step11;
  }
 
stroke(255,0,0,200); //color linia vermell 2
  strokeWeight(10);  
  centerY11=centerY11+step11;  
  line(0,centerY11,400,centerY11);
  if (centerY11>width | centerY11<0) 
  {
  step11=-1*step11;
  }



stroke(5,44,255,200); //color linia blau
  strokeWeight(20);  
  centerX12=centerX12+step12;  
  line(centerX12,0,centerX12,400);
  if (centerX12>width | centerX12<0) 
  {
  step12=-1*step12;
  }

stroke(5,44,255,200); //color linia blau
  strokeWeight(20);  
  centerY12=centerY12+step12;  
  line(0,centerY12,400,centerY12);
  if (centerY12>width | centerY12<0) 
  {
  step12=-1*step12;
  } 
 
 
 
stroke(255,255,0,200); //color linia groc
  strokeWeight(20);  
  centerX13=centerX13+step13;  
  line(centerX13,0,centerX13,400);
  if (centerX13>width | centerX13<0) 
  {
  step13=-1*step13;
  }
 
stroke(255,255,0,200); //color linia groc
  strokeWeight(20);  
  centerY13=centerY13+step13;  
  line(0,centerY13,400,centerY13);
  if (centerY13>width | centerY13<0) 
  {
  step13=-1*step13;
  } 
  
 
 
stroke(255,0,0,200); //color linia vermell 2
  strokeWeight(10);  
  centerX14=centerX14+step14;  
  line(centerX14,0,centerX14,400);
  if (centerX14>width | centerX14<0) 
  {
  step14=-1*step14;
  }

stroke(255,0,0,200); //color linia vermell 2
  strokeWeight(10);  
  centerY14=centerY14+step14;  
  line(0,centerY14,400,centerY14);
  if (centerY14>width | centerY14<0) 
  {
  step14=-1*step14;
  }


  
}
}



void mousePressed ()
{
  if (value==1)
  { value=0; }
  else { value=1; }
}



