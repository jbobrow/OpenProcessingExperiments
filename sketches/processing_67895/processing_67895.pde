
//Hernández Cruz Yanahui
//Torres Torres Felipe Andrés

int a=400, b=400;
void setup()
{
  size(400,400);
  
  
}
void draw()
{
  int in1=260,in2=100;
  //int a=0, b=400;
  background(92,123,206);
  strokeWeight(5);
  noFill();
  
  // circulo AZUL
  stroke(0,0,255);
  ellipse(100,100,60,60);
  
 // circulo NEGRO
  stroke(0,0,0);
  ellipse(180,100,60,60);
  
 // circulo ROJO
  
   
  if(in1!=a && in2!=b)
   {
     a=(int)random(0,400);
     b=(int)random(0,400);

   }
  else
  { 
    a=in1;
    b=in2;
  }
  stroke(255,0,0);
  ellipse(a,b,60,60);
   
  // circulo AMARILLO
  
  stroke(255,255,0);
  ellipse(140,130,60,60);
  
  // circulo VERDE
  stroke(0,255,0);
  ellipse(220,130,60,60);
  
}



