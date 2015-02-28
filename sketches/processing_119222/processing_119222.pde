
int quantesboles = 100;
int diferentscolors = 100;

//introdueixes float per declarar la x,y,velocitatX i velocitatY perquÃ¨ es reprodueixi a totes les boles//
float [] x = new float[quantesboles];
float [] y = new float[quantesboles];
float [] velocitatX = new float[quantesboles]; 
float [] velocitatY = new float[quantesboles];

float [] radi = new float[quantesboles];
color [] colorboles = new color[diferentscolors]; 
 
void setup()
{
  size(600,600);
  
  noStroke();
  
   
  //Faig un for per la variable i que primer es = 0 i metres la i sigui mÃ©s petit que quantesboles vas sumant +1. La mateixa variable i l'he de reproduir per totes les x,y,velocitatX i velocitaY perque la funciÃ³ la fagin totes les boles//
  for (int i=0 ; i<quantesboles; i++)
  {
  
  radi[i] = (random(5,25));
  colorboles[i] = color(random(0,255),random(0,255),random(0,255));
  
  x[i] = random(0,width);
  y[i] = random(0,height);
  velocitatX[i] = (random(2,6));
  velocitatY[i] = (random(2,6));
}
}
 
void draw(){
  //background(80);
  
   
  fill(80,80,80,50);
  rect(0,0,width,height);
   
  for (int i=0 ; i<quantesboles; i++)
  {
  x[i] += velocitatX[i];
  y[i] += velocitatY[i];
   
  fill(colorboles[i]);
  ellipse(x[i],y[i],radi[i],radi[i]);
   
  if((x[i]<0+radi[i]/2)||(x[i]>width-radi[i]/2))
  {
    velocitatX[i] = -velocitatX[i];
  }
   
  if((y[i]<0+radi[i]/2)||(y[i]>height-radi[i]/2))
  {
    velocitatY[i] = -velocitatY[i];
  }

}
}
