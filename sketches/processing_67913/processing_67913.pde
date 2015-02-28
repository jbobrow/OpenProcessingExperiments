
// * Pagmac Jorge Salgado Mendoza * //
float grados_i=0;
float grados_f =0;
float x,y =0;
float incremento = 0.01;
int control = 0;
void setup()
{
  //noFill(); 
  size(800, 600);
  smooth();
}
void draw()
{
  background(0);
  if(grados_f > 6)
       grados_f=0;
  if(x+50 > 800-50)
       y=50;
  fill(0,0,255);
  arc(50+y,50,100, 100, grados_i, grados_f);        
  x += incremento * 100;
  grados_f += incremento *10;
  
  
  control++;
  if(control > 10)
  {
    fill(255,255,0);
    arc(200+x,200,100, 100, grados_i, TWO_PI-0.01);
    fill(255,0,0);
    arc(350+x,225,50, 50, grados_i, TWO_PI-0.01);
    fill(0,255,0);
    arc(450+x,235,25, 25, grados_i, TWO_PI-0.01);
    if(control > 30)
      control = 0;
    
  }
  else
  {
    fill(255,255,0);
    arc(200+x,200,100, 100, QUARTER_PI, PI + HALF_PI + QUARTER_PI);
    fill(255,0,0);
    arc(350+x,225,50, 50, QUARTER_PI, PI + HALF_PI + QUARTER_PI);
    fill(0,255,0);    
    arc(450+x,235,25, 25,QUARTER_PI, PI + HALF_PI + QUARTER_PI);
  }
  if(200+x > 750)
    x=0;
}

//ARCO
//x,y,diametrodiametroy,angulo inicial, angulo final

