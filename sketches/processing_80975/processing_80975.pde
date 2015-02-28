
int i;
char arreglo[] = {'l', 'E', 'S', 'L','I','E'};
int aleatorios[] = new int[10];
float x =150;
void setup()
{
  size(300, 250); 
  fill(5,5,5); 
  frameRate(10);
}
void draw()
{
    background(106,90,142);
    textFont(createFont("Bauhaus93-48",30)); 
    
    for(i=0;i<4;i++)
      aleatorios[i] = (int)random(0,100);
    x-=1;
    if(x<=0)
    {
      textAlign(CENTER);
      text("LESLIE",width/2, height/2);
    }
    else
    {
      for(i=0;i<=10;i++)
        text(arreglo[i],x*cos(x)+200+aleatorios[i],x*sin(x)+200+aleatorios[i+1]);
    }
   
}


