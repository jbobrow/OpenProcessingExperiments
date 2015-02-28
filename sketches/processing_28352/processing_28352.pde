
int C = 0;
int M = 300;
int G = 0;
int j;


void setup() 
{
  size (600,600);
  smooth();
 }


void draw() 
{
  


  M = M + 50;
  C = C + 1;
  G = G +1 ;
  stroke (0);
  ellipse (C,50,50,50);
  ellipse (C,100,50,50);
  ellipse (C,150,50,50);
  ellipse (C,200,50,50);
  ellipse (C,250,50,50);
  ellipse (C,300,50,50);  
  ellipse (G,300,50,50);
   ellipse (C,350,50,50);
    ellipse (C,400,50,50);
     ellipse (C,450,50,50); 
      ellipse (C,500,50,50);
       ellipse (C,550,50,50);
  if ( C > 650) { C = -50;}
  if (C < 200) { fill (0,200,0);}
  else if ( C > 200 ) { fill (255);}
  if ( C > 450 ) { fill (255,0,0);}
  
  

}

