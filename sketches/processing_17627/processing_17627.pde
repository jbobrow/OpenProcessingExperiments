

float centrex;
float centrey;
float centrexx;
float centreyy;
float passt;
float t;
float passtt;
float tt;
float vermell;
float verd;
float blau;
float vermell2;
float verd2;
float blau2;
int impacte=0;  // Nomes te a veure amb el color


void setup()   
{ 
smooth();
  size(900, 600); 
  background(200,200,255);
  fill(150, 150, 150);
  passt=0.01;
  passtt=0;
  vermell=255;
 verd=0;
blau=0; 
vermell2=150;
verd2=150;
blau2=150;

// frameRate(10);

 }
 
 void draw()  
{
  
  impacte=0;
  if (centreyy<400) //El problema és aqui. No sabem perquè la 
                    //segona bola que es mou no fa cas al limit
                    //de la "y" que li hem establert
  {
   passtt=-passtt;
   
//   println(passtt);
  }
  
  if (centrey<400) 
  {
   passt=-passt;
  // println("passt = " + passt);
  }

  if (centrexx<620)
  {
   tt = tt - passtt;  // CORRECCIO
   passtt=0;
   passt= -0.01;
   
   vermell=255;
   verd=0;
   blau=0;
   vermell2=150;
   verd2=150;
   blau2=150;
   impacte=1;
   
  }

  if (centrex>300)
  {    
   t = t - passt; // CORRECCIO
   passt=0;
   passtt=0.01;
   vermell=150;
   verd=150;
   blau=150;
   vermell2=255;
   verd2=0;
   blau2=0;
   impacte=1;
  }

  tt=tt+passtt;
 // println(passtt);
  t=t+passt; 
  
 // println(t);
  background(200,200,255);  
  centrex=300*sin(t)+300;
  centrey=300*cos(t)+150;
  centrexx=300*sin(tt)+620;
  centreyy=300*cos(tt)+150;
  noStroke();
  fill(vermell, verd, blau);
  ellipse(centrex, centrey, 80, 80);
  fill(vermell2, verd2, blau2);
  ellipse(centrexx, centreyy, 80, 80);
  fill(150,150,150);
  if(impacte==1){fill(255,0,0);}
  ellipse(380, 450, 80, 80);
  ellipse(460, 450, 80, 80);
  ellipse(540, 450, 80, 80);

  stroke(4);
 line(centrex, centrey, 300, 150);
 line(centrexx, centreyy, 620, 150);
 line(380,450,380,150);
 line(460,450,460,150);
 line(540,450,540,150);

}

