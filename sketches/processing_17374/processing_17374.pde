

float centerX;
float centerY;
float step=4; 
PImage prova;
float[][] cX = new float[12][12]; 
float[][] cY = new float[12][12]; 
int[] k = new int[12];  // vector d'indexos per al sorteig.

PImage b;


void setup() {
  size(600, 400); 
  initK(12);  // la funcio initK fa el sorteig.
  // Transforma 0,1,2,3,4,5,... 11  en  (p.ex.)  5,0,2,1,11,7,6 ...


   
 loadPixels();


 
 prova = loadImage("Totxo 60x30 pixels.jpg");
 b = loadImage("cel.jpg");
 
 for(int i=0; i<12; i++)
 {
   for(int j=0; j<12; j=j+2)
   {
     cX[i][j]=i*55;
   //  cY[i][j]=-32*k[i];   
   cY[i][j]=-28*12*j-28*k[i];  
   }
   for(int j=1; j<12; j=j+2)
   {
     cX[i][j]=i*55-30;
   //  cY[i][j]=-32*k[i];
   cY[i][j]=-28*12*j-28*k[i];
     
   }   
   
 }
 // DIONIS - FI - inicialitzem els vectors cX i cY
 
}


void draw() 



{
  

background(b);


for(int j=0; j<10; j++)  // 10 filades
{

for(int i=0; i<12; i++)
 {
     
     if(cY[i][j]<height-28*j-28)  // si no ha arribat a l'altura, baixa mes
     {
      cY[i][j]=cY[i][j]+step;
     }
     
     centerX=cX[i][j];
     centerY=cY[i][j]; 
     image(prova,centerX,centerY);   
   
 }
 
} 
 

}


void initK(int M)  // funcio sorteig
{ 
 int N, kAux;
 int CICLES = 3; 
 for(int i=0; i<M; i++)
 {
   k[i]=i;
 }
 
 for(int n=0; n<CICLES; n++)
 {
 for(int i=0; i<M; i++)
 {
   N=round(random(0,M-2));
   kAux=k[N];
   
   for(int j=N; j<M-1; j++)
   {
    k[j]=k[j+1];     
   }
   k[M-1]=kAux;
 }
 }
 
 
 
 
  for(int j=0; j<M; j++)
  {
   println(k[j]);
 }
 
}

void mouseClicked()  
{
 
  prova = loadImage("Totxoblancnegre.jpg");
  for(int i=0; i<12; i++)
 {
   for(int j=0; j<12; j=j+2)
   {
     cX[i][j]=i*55;
   //  cY[i][j]=-32*k[i];   
   cY[i][j]=-28*12*j-28*k[i];  
   }
   for(int j=1; j<12; j=j+2)
   {
     cX[i][j]=i*55-30;
   //  cY[i][j]=-32*k[i];
   cY[i][j]=-28*12*j-28*k[i];
     
   }   
 }
 // DIONIS - FI - inicialitzem els vectors cX i cY
 
}




