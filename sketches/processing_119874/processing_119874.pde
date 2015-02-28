
int numboles = (random (100,200));

int n=0;

float [] x = new float[numboles]; 
float [] y = new float[numboles];
float [] velocitatx = new float[numboles];
float [] velocitaty = new float[numboles];
float [] radi = new float [numboles];
float [] red = new float [numboles];
float [] green = new float [numboles];
float [] blue = new float [numboles];

 
void setup()
{
  size (600,600);
    for (n=0 ; n<numboles; n++)
 {
  x[n] =random (0+radi[n],width-radi[n]);
  y[n]= random (0+radi[n],height-radi[n]);
  velocitatx[n] = (random (3,5));
  velocitaty[n] = (random(3,5));
  
  red [n] = random(0,40);
  green [n] = random(0,225);
  blue [n] = random(0,230);

    radi [n] = random (10,40);
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
 if ((x[n]>width-radi[n]/2) || (x[n]<radi[n]/2))
  {
  velocitatx[n]=-velocitatx[n];
  }
 if ((y[n]>height-radi[n]/2)||(y[n]<radi[n]/2))
  {
  velocitaty[n]=-velocitaty[n];
  }
  fill(red[n],green[n],blue[n]);
  ellipse (x[n], y[n], radi[n], radi[n]);
}
}


