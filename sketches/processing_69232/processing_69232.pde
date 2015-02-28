
int i;
char arreglo[] = {'F', 'C', 'O', 'J','A','V', 'I','E','R'};
int aleatorios[] = new int[10];
float pu =150;
void setup()
{
  size(400, 400);  
  fill(206, 211, 62);  
}
void draw()
{
    background(211,62,89);
    textFont(createFont("SansSerif",20));  
    
    for(i=0;i<10;i++)
      aleatorios[i] = (int)random(0,80);
    pu-=1;
    if(pu<=0)
    {
      textAlign(LEFT);
      text("Francisco  Javier",width/2, height/2);
    }
    else
    {
      for(i=0;i<=5;i++)
        text(arreglo[i],pu*cos(pu)+200+aleatorios[i],pu*sin(pu)+200+aleatorios[i+1]);
    }
   
}

