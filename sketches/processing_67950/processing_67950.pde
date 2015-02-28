
float ini=QUARTER_PI;
float fin=TWO_PI-QUARTER_PI;
float x=0.0;
int t=0;
void setup()
{  
  background(0);      //fondo
  size(500,500);      //tamaño
  //  noFill();       //sin relleno
  fill(255,250,0);    //relleno amarillo
  strokeWeight(1);    //grosor contorno 
  smooth();           //depurar contorno   
  stroke(255,255,0);  //amarillo  
  frameRate(9);      //9 veces por segundo la funcion draw()
}
void draw()
{
  background(0);    
  
  if(t==0)
     {
      ini=QUARTER_PI;
      fin=TWO_PI-QUARTER_PI;
      t=1;
     }
  else
     if(t==1)
         {
          ini=QUARTER_PI/2;
          fin=TWO_PI-(QUARTER_PI/2);
          t=2;
         }
     else
         {           
          ini=0;
          fin=TWO_PI;
          t=0;
         }           
      x = x + 3;
 //   arc(mouseX,mouseY,190,190,ini,fin);  //para moverlo con el mouse
      arc(x,250,190,190,ini,fin);
}

