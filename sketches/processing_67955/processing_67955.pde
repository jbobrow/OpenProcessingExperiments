
//René Hernandez
float z=0;
float w =0;
float i,j =0;
float incremento = 0.01;
int n = 0;
void setup()
{
  noFill(); 
  size(800, 500);
  smooth();
}
void draw()
{
  background(0);
  if(w > 6)
       w=0;
  if(i+50 > 600-50)
       j=50;        
  i += incremento * 100;
  w += incremento * 15;
  
  
    n++;
  if(n >= 8)
  {
    fill(0);
    arc(350+i,225,50, 50, z, TWO_PI);
    //fill(0,255,0);
   // arc(450+i,235,, 25, z, TWO_PI);
    n = 0;
  }
  else
  {
 fill(255,255,0);
    arc(200+i,200,100, 100, QUARTER_PI, PI + HALF_PI + QUARTER_PI);
    fill(255,255,0);    
    arc(450+i,235,100, 100,QUARTER_PI, PI + HALF_PI + QUARTER_PI);
   
  }
}

