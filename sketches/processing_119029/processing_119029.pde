
//Declarem el tamany de les boles
int sz=20;
//Declarem la quantitat de boles
int numBoles=100;


//Declarem les variables
float[] x = new float[numBoles];
float[] y = new float[numBoles];
float[] velocitatX = new float[numBoles];
float[] velocitatY = new float[numBoles];


void setup()
{
  size(300,300);

  //Inicialitzem la x, la y, la velocitat x i la velocitat y
  for(int i=0; i<numBoles; i++)
  {
    //Inicialitzem x i y que començin en el centre de la pantalla
    x[i]=width/2;
    y[i]=height/2;
    
    //Inicialitzem que les velocitats siguin aleatories entre 1 i 8
    velocitatX[i]=random(1,8);
    velocitatY[i]=random(1,8);
  }
}

void draw()
{
  background(0);

  //Actualitzem les variables
  for(int i=0; i<numBoles; i++)
  {
    //Definim la relació entre les posicions i les velocitats
    x[i]+=velocitatX[i];
    y[i]+=velocitatY[i];
  
   //Actualitzem l'eix X
   if((x[i]<0)||(x[i]>width))
   {
     velocitatX[i]=-velocitatX[i];
   }
  
   //Acutalitxem l'eix Y
   if((y[i]<0)||(y[i]>height))
   {
     velocitatY[i]=-velocitatY[i];
   }
  }
  
  for(int i=0; i<numBoles; i++)
  {
    //Dibuixem la ellipse
    ellipse(x[i],y[i],20,20);
    //Li diem que no dibuixi el contorn
    noStroke();
  
  }  
  
}
