
int i;
char arreglo[] = {'J', 'O', 'S', 'E','L','U', 'I','S'};
int aleatorios[] = new int[10];
float pu =150;
void setup()
{
  size(400, 400);  
  fill(255, 255, 255);  
  frameRate(50);
}
void draw()
{
    background(100,200,210);
    textFont(createFont("SansSerif",20));  
   
    for(i=0;i<10;i++)
      aleatorios[i] = (int)random(0,100);
    pu-=1;
    if(pu<=0)
    {
      textAlign(CENTER);
      text("JOSE   LUIS",width/2, height/2);
    }
    else
    {
      for(i=0;i<=4;i++)
        text(arreglo[i],pu*cos(pu)+200+aleatorios[i],pu*sin(pu)+200+aleatorios[i+1]);
    }
  
}


