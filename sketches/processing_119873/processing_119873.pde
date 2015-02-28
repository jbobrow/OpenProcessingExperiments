
int numboles = 100;

int n=0;

float [] x = new float[numboles];
 
float [] y = new float[numboles];
 
float [] velocitatx = new float[numboles];
 
float [] velocitaty = new float[numboles];

float radi;
 
void setup()
{
  size (600,600);
    for (n=0 ; n<numboles; n++)
 {
  x[n] = width/2;
  y[n]= height/2;
  velocitatx[n] = (random (3,5));
  velocitaty[n] = (random(3,5));
  radi = 20;
 }    
  noStroke();
  smooth();
  
}
 
void draw()
{
background(255);
 // bola();
  movbola();
}

void movbola()
{
  for (n=0 ; n<numboles; n++){
    
 x[n]+=velocitatx[n];
 y[n]+=velocitaty[n];
 if ((x[n]>width-radi/2) || (x[n]<radi/2))
  {
  velocitatx[n]=-velocitatx[n];
  }
 if ((y[n]>height-radi/2)||(y[n]<radi/2))
  {
  velocitaty[n]=-velocitaty[n];
  }
     fill (0);
  ellipse (x[n], y[n], radi, radi);
}
}


