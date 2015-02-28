
int quantesboles = 100;

//introdueixes float per declarar la x,y,velocitatX i velocitatY perquè es reprodueixi a totes les boles//
float [] x = new float[quantesboles];

float [] y = new float[quantesboles];

float [] velocitatX = new float[quantesboles];

float [] velocitatY = new float[quantesboles];


void setup()
{
  size(500,500);
  
  //Faig un for per la variable i que primer es = 0 i metres la i sigui més petit que quantesboles vas sumant +1. La mateixa variable i l'he de reproduir per totes les x,y,velocitatX i velocitaY perque la funció la fagin totes les boles//
  for (int i=0 ; i<quantesboles; i++)
  {
  x[i] = width/2;
  y[i] = height/2;
  velocitatX[i] = (random(2,6));
  velocitatY[i] = (random(2,6));
}
}

void draw(){
  background(80);
  noStroke();
  
  //la mateixa variable i
  for (int i=0 ; i<quantesboles; i++)
  {
  x[i] += velocitatX[i];
  y[i] += velocitatY[i];
  
  
  ellipse(x[i],y[i],20,20);
  if((x[i]<10)||(x[i]>width-10))
  {
    velocitatX[i] = -velocitatX[i];
  } 
  
  if((y[i]<10)||(y[i]>height-10))
  {
    velocitatY[i] = -velocitatY[i];
  } 
}
}
