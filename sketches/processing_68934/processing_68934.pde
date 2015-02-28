
int i;
char arreglo[] = {'J', 'O', 'R', 'G','E'};
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
    background(0, 0, 0); 
    textFont(createFont("SansSerif",20));   
    //Lllena el arreglo de numeros aleatorios
    for(i=0;i<10;i++)
      aleatorios[i] = (int)random(0,100);
    pu-=1; 
    if(pu<=0)
    {
      textAlign(CENTER);
      text("JORGE",width/2, height/2);
    }
    else
    {
      for(i=0;i<=4;i++) 
        text(arreglo[i],pu*cos(pu)+200+aleatorios[i],pu*sin(pu)+200+aleatorios[i+1]);
    }
    /*Pruebas
    text(arreglo[i],aleatorios[i*2],aleatorios[(i*2)+1]);
    point(i*cos(i)+200,i*sin(i)+200); --> i{0,150} step -0.01
    */
}

