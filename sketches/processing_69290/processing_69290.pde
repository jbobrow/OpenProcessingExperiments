
int i;
char nombre[] = {'J','O','S','U','E'};
int aleatorio[] = new int[20];
float letra =300;
void setup()
{
  size(800,200); 
  fill(#FFD700); 
  frameRate(150);
}
void draw()
{
    background(#4169E1);
    textFont(createFont("CatholicSchoolGirlsIntlBB-.vlw",50)); 
    for(i=0;i<5;i++)
      aleatorio[i] = (int)random(-800,300);
    letra-=1;
    if(letra<=0)
    {
      textAlign(CENTER);
      text("J", 250, 100);
    }
    else
{
  for(i=0;i<=0;i++)
        text(nombre[0],(letra)+360+aleatorio[0],(letra)+200+aleatorio[i+1]);
}
  if(letra<=1)
    {
      textAlign(CENTER);
      text("O", 280, 100);
    }
    else
    {
    for(i=0;i<=1;i++)
        text(nombre[1],(letra)+320+aleatorio[1],(letra)+180+aleatorio[i+1]);
}
    if(letra<=2)
    {
    textAlign(CENTER);
      text("S", 310, 100);
    }
    else
    {
    for(i=0;i<=2;i++)
        text(nombre[2],(letra)+280+aleatorio[2],(letra)+160+aleatorio[i+1]);
   }
    if(letra<=3)
    {
      textAlign(CENTER);
      text("U", 340, 100);
    }
    else{
  for(i=0;i<=3;i++)
        text(nombre[3], (letra)+220+aleatorio[3],(letra)+140+aleatorio[i+1]);
  }
    if(letra<=4)
    {
      textAlign(CENTER);
      text("E", 370, 100);
    }
    else
    {   
      for(i=0;i<=4;i++)
        text(nombre[4],(letra)+180+aleatorio[4],(letra)+120+aleatorio[i+1]);
    }
     
}


