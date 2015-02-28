
/* Carvajal Santos Christian Uziel
    Nombre Aleatorio */

int i;
char nombre[] = {'U','Z','I','E','L'};
int aleatorio[] = new int[20];
float letra =100;
void setup()
{
  size(500, 500);  
  fill(#FFFFFF);  
  frameRate(50);
}
void draw()
{
    background(#747EB7);
    textFont(createFont("TraditionalArabic-48.vlw",50));  
    for(i=0;i<5;i++)
      aleatorio[i] = (int)random(-500,500);
    letra-=1;
    if(letra<=0)
    {
      textAlign(CENTER);
      text("U", 170, 250);
    }
    else 
{
  for(i=0;i<=0;i++)
        text(nombre[0],(letra)+360+aleatorio[0],(letra)+200+aleatorio[i+1]);
}
  if(letra<=1)
    {
      textAlign(CENTER);
      text("Z", 210, 250);
    }
    else 
    {
    for(i=0;i<=1;i++)
        text(nombre[1],(letra)+320+aleatorio[1],(letra)+180+aleatorio[i+1]);
}
    if(letra<=2)
    {
    textAlign(CENTER);
      text("I", 250, 250);
    }
    else 
    {
    for(i=0;i<=2;i++)
        text(nombre[2],(letra)+280+aleatorio[2],(letra)+160+aleatorio[i+1]);
   } 
    if(letra<=3)
    {
      textAlign(CENTER);
      text("E", 290, 250);
    }
    else{
  for(i=0;i<=3;i++)
        text(nombre[3], (letra)+220+aleatorio[3],(letra)+140+aleatorio[i+1]); 
  } 
    if(letra<=4)
    {
      textAlign(CENTER);
      text("L", 330, 250);
    }
    else 
    {
//     
      for(i=0;i<=4;i++)
        text(nombre[4],(letra)+180+aleatorio[4],(letra)+120+aleatorio[i+1]);
    }
    
}






