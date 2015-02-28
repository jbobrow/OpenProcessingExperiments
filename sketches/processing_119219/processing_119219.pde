
//Declarem la quantitat de boles
int numBoles=100;
int colorDiferent=100;
int Diametre=100;
 
 
//Declarem les variables
float[] x = new float[numBoles];
float[] y = new float[numBoles];
float[] velocitatX = new float[numBoles];
float[] velocitatY = new float[numBoles];
color[] colorBoles = new color[colorDiferent];
float[] sz = new float[Diametre];
 
 
void setup()
{
  size(400,400);
 
  //Inicialitzem la x, la y, la velocitat x i la velocitat y
  for(int i=0; i<numBoles; i++)
  {
    //Inicialitzem x i y que començin cada una en un lloc diferent
    x[i]=random(0,width-1)-(sz[i]/2);
    y[i]=random(0, height-1)-(sz[i]/2);
     
    //Inicialitzem que les velocitats siguin aleatories entre 1 i 3
    velocitatX[i]=random(1,3);
    velocitatY[i]=random(1,3);
    
    //Inicialitzem que el color sigui diferent per a cada bola
    colorBoles[i]=color(random(255),random(255),random(255));
    
    //Inicialitzem que el diametre sigui diferent entre 10 i 20
    sz[i]=random(10,20);
  }
  

}
 
void draw()
{
  //background(255);
  
  //Pintem la pantalla amb transparencia de color blanc
  fill(255,255,255,50);
  //Fas un rectangle de tota la pantalla de color negre 
  rect(0,0,width,height);
 
  //Actualitzem les variables
  for(int i=0; i<numBoles; i++)
  {
    //Definim la relació entre les posicions i les velocitats
    x[i]+=velocitatX[i];
    y[i]+=velocitatY[i];
   
   //Actualitzem l'eix X
   if((x[i]<0+sz[i])||(x[i]>width-sz[i]))
   {
     velocitatX[i]=-velocitatX[i];
   }
   
   //Acutalitxem l'eix Y
   if((y[i]<0+sz[i])||(y[i]>height-sz[i]))
   {
     velocitatY[i]=-velocitatY[i];
   }
  }
   
  for(int i=0; i<numBoles; i++)
  {
    //Dibuixem la ellipse
    ellipse(x[i],y[i],sz[i],sz[i]);
    //Li diem que no dibuixi el contorn
    noStroke();
    //Li diem que pinti la bola
    fill(colorBoles[i]);
   
  } 
   
   
}
