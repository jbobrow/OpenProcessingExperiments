


int cont=0;

float E0x,E0y,C0x,C0y,A0,AC0,R0;  // Extrem 0, Centre 0, Angle 0, Angle aCumulat 0, Radi 0

float E1x,E1y,C1x,C1y,A1,AC1,R1;  // idem, pero els del nou arc

 

void setup() 
{
  
  smooth(); // suavitza linies 
  size(400,400); 
    //colorMode(RGB,255,255,255); //canviar fon
//  noStroke();


  background(70); //color pantalla en gris
 noFill();
;

  ellipseMode(RADIUS);
  frameRate(3);
  
  C1x=200;
  C1y=200;
  A1=PI/2;
  AC1=PI/2;
  R1=50;
  E1x=250;
  E1y=200;
  
  
  // arc(C0x,C0y,R0,R0,0,A0);
  
}

void draw() 
{
 colorMode(RGB, random(0,255),random(0,255),random(0,255));
colorMode(RGB, random(0,255),random(0,255),random(0,255));
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(random(0,255), random(0,255), random(0,255));
   // point(i, j);
  }
}

  strokeWeight(6); // canvia el gruix del traç
  //if(cont==1)
  {
    
    memo();  // desa variables 1 a variables 0
    
    nextPar();  // sorteja A1 i R1
    
   // AC1=AC0+A1;  // nou angle acumulat
    
    if(A0*A1>0){AC1=AC0+A1;}
    if(A0*A1<0){AC0=AC0+PI;  AC1=AC0+A1;}
    
    if(A0*A1<0)  // cas canvi de signe
    {
      C1x = E0x + (E0x-C0x)*(R1/R0);
      C1y = E0y + (E0y-C0y)*(R1/R0);
      if(C1x + R1*cos(AC1)<width && C1x + R1*cos(AC1)>0) {E1x = C1x + R1*cos(AC1);}
 
      if(C1y + R1*sin(AC1)<width && C1y + R1*sin(AC1)>0) {E1y = C1y + R1*sin(AC1);}
      
      
      if(AC0<AC1){arc(C1x,C1y,R1,R1,AC0,AC1);}
      if(AC0>AC1){arc(C1x,C1y,R1,R1,AC1,AC0);}
      //ellipse(E1x,E1y,5,5);
      //ellipse(C1x,C1y,10,10);
      
    }
    
     if(A0*A1>0)  // cas igual signe
    {
      C1x = E0x + (C0x-E0x)*(R1/R0);
      C1y = E0y + (C0y-E0y)*(R1/R0);
      if(C1x + R1*cos(AC1)<width && C1x + R1*cos(AC1)>0){E1x = C1x + R1*cos(AC1);}
      
      if(C1y + R1*sin(AC1)<width && C1y + R1*sin(AC1)>0){E1y = C1y + R1*sin(AC1);}
    
      if(AC0<AC1){arc(C1x,C1y,R1,R1,AC0,AC1);}
      if(AC0>AC1){arc(C1x,C1y,R1,R1,AC1,AC0);}
       //ellipse(E1x,E1y,5,5);
       //ellipse(C1x,C1y,10,10);
    }
    
    
  }
 // cont=0;
}

void mouseClicked() 
{
 cont=1; 
 
}

void nextPar()
{
  A1=round(random(-2,2))*PI/2;
  if(A1==0){A1=PI/2;} // no volem cap angle 0
  R1= round(random(3,5))*10;
 // R1=50;
  println(2*A1/PI);
//  println(R1);
 float aux=1;
  
}

void memo() // copiem l'estat actual a l'anterior
{   
  E0x=E1x;
  E0y=E1y;
  C0x=C1x;
  C0y=C1y;
  A0=A1;
  AC0=AC1;
  R0=R1;  
}

