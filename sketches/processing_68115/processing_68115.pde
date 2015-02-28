
//Aros olimpicos
void setup()
{ 
  size(300,150);//para que el rango de random sea menor
  //y encuentre su posicion dentro del recuadro
}
void draw()
{
  int ejex=int(random(300));//para el rango de random en x
  int ejey=int(random(150));//para el rango de random en y
  background(255);
  smooth();
  noFill();//sin relleno
  strokeWeight(2.5);
  stroke(0,0,255);//azul
  ellipse(120,50,45,45);
  stroke(255,255,0);//amarillo
  ellipse(130,80,45,45);
  stroke(0,0,0);//negro
  ellipse(150,50,45,45);
  stroke(0,255,0);//verde
  ellipse(160,80,45,45);
  stroke(255,0,0); //rojo
  if((ejex!=180)&&(ejey!=50))
  {
    ellipse(ejex,ejey,45,45);     
  }
  else
  {
    ellipse(180,50,45,45);
    noLoop();
   } 
}
