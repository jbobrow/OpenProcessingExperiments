
int[][] valores = new int[4][4];

color c1;
//////////////////////////////////////////////////////////////////////
void limpa()
{
  int i, j;
  for(j=0;j<4;j++)
    for(i=0;i<4;i++)
      valores[i][j] = 1; 
}

//////////////////////////////////////////////////////////////////////
void setup()
{
  int i, j; 
  size(200,200);
  smooth();
  frameRate(30);
  limpa();
}
//////////////////////////////////////////////////////////////////////
int dec2bcd(int dec)
{
  return(   ( (dec/10)<<4 ) + (dec%10)  );

}
//////////////////////////////////////////////////////////////////////
void mostra()
{
  int i, j;

  for(j=0;j<height;j+=height/4)
    for(i=0;i<width;i+=width/4)
    {
      switch(valores[i/50][j/50])
      {
      case 0:
        c1 = color(0,0,0);   
        break;
      case 1:
        c1 = color(255,0,0);   
        break;
      case 2:
        c1 = color(0,255,0);   
        break;      
      case 3:
        c1 = color(255,255,0);   
        break; 
      default:  
        c1 = color(0,0,0);   
        break; 
      }  

      fill(c1);

      stroke(128);
      ellipse(width/8+i,height/8+j, width/4-4, height/4-4);
    } 
}
//////////////////////////////////////////////////////////////////////
void draw()
{
  background(0);
  
  mostra();

  binario( dec2bcd(hour())/16, dec2bcd(hour())&15, dec2bcd(minute())/16, dec2bcd(minute())&15 );

}

//////////////////////////////////////////////////////////////////////
void binario(int a, int b, int c, int d)
{
  int i, j, k;

  int[] bin = new int[4];

  bin[0] = a;
  bin[1] = b;
  bin[2] = c;
  bin[3] = d;
  limpa();
  for(j=0;j<4;j++)
  {

    for(i=1, k=3;i<=8;i*=2,k--)
    {
      if((bin[j] & i)==i)
        valores[k][j] = 2;
    }  

  }   

}













