
//practica "2" Cruz Martinez Julia Yesika
float a=0;
float b =0;
float x,y =0;
float incremento = 0.02;
int pagmac = 0;
void setup()
{
  //noFill(); 
  size(800, 500);
  smooth();
}
void draw()
{
  background(0);
  if(b > 5)
       b=0;
  if(x+50 > 800-50)
       y=50;        
  x += incremento * 100;
  b += incremento *20;
  
  
 pagmac++;
  if(pagmac >= 5)
  {
    fill(0);
    arc(350+x,225,50, 50, a, TWO_PI);
    fill(0,255,0);
    arc(450+x,235,25, 25, a, TWO_PI);
    pagmac = 0;
  }
  else
  {
    fill(255,0,255);
    arc(350+x,225,100, 100, QUARTER_PI, PI + HALF_PI + QUARTER_PI);
    fill(255,255,0);    
    arc(450+x,235,25, 25,QUARTER_PI, PI + HALF_PI + QUARTER_PI);
    fill(255,255,255);    
    arc(550+x,236,15, 15,QUARTER_PI, PI + HALF_PI + QUARTER_PI);
  }
}

