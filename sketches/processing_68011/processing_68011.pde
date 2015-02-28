
//Actividad 3: el círculo rojo se mueve y se detiene cuando este en su posición original
 
 void setup()
{
  size(400,400);
  noFill();
  smooth();
  strokeWeight(5);
}
 
void draw ()
{
   
  background(255,255,255);
   
  stroke(0,0,255);
  ellipse(60,80,60,60);//AZUL
   
  stroke(255,255,0);
  ellipse(100,110,60,60);//AMARILLO
  
  stroke(0,0,0);
  ellipse(140,80,60,60);//NEGRO
   
  stroke(0,255,0);
  ellipse(180,110,60,60);//VERDE
   
  float x=int(random(30,300));
   
  float y=int(random(20,200));
  stroke(255,0,0);
       if((x!=220)&&(y!=80))
       {
         ellipse(x,y,60,60);
       }
       else
       {
         ellipse(220,80,60,60);//ROJO
         noLoop();
       }
}
