
//Tomas de Camino
//Use llamadas recursivas para crear fractal
//slight variations Francisco Montero Rojas: Leviatan
 
float iniSize, angle;
void setup()
{
  size(700, 675);
  iniSize = 50;
  background(0);
  smooth();
}
  
void draw()
{
  background(50);
  fill(255,200);
  angle = radians((mouseX / (float) width) * 90);
  translate(width/2, height-300);
  ellipse (0,0,iniSize,iniSize);
  recursiveRectLeftUp(iniSize);
  recursiveRectRightUp(iniSize); //incluido
  recursiveRectLeftDown(iniSize); //incluido
  recursiveRectRightDown(iniSize); //incluido
}

 
  
void recursiveRectLeftUp(float s)//first: original modificado
{
  float newSide = (s*sqrt(3))/2;//constante de proporcionalidad, NO CAMBIAR, ya es dada
  if (newSide > 2)
  {
    pushMatrix();//para rotar solo el nuevo cuadrado, sino la figura rota como una unidad
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    rect(0, 0, newSide, -newSide*20); //incluido
    translate(0, -newSide); //incluido
    recursiveRectLeftUp(newSide); //incluido
    popMatrix();
  }
}


  
void recursiveRectRightUp(float s)//second: a partir de este punto son modificaciones
{
  float newSide = (s*sqrt(3))/2;//constante de proporcionalidad, NO CAMBIAR, ya es dada
  if (newSide > 2)
  {
    pushMatrix();//para rotar solo el nuevo cuadrado, sino la figura rota como una unidad
    rotate(+angle);
    ellipse(0, 0, newSide, +newSide);
    rect(0, 0, newSide, -newSide/20);
    translate(0, -newSide);
    recursiveRectRightUp(newSide);
    popMatrix();
  }
}

void recursiveRectLeftDown(float s)//third
{
  float newSide = (s*sqrt(3))/2;//constante de proporcionalidad, NO CAMBIAR, ya es dada
  if (newSide > 2)
  {
    pushMatrix();//para rotar solo el nuevo cuadrado, sino la figura rota como una unidad
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    ellipse(15, 15, newSide, -newSide);
    ellipse(35, 35, newSide, -newSide);
    translate(0, +newSide);
    recursiveRectLeftDown(newSide);
    popMatrix();
  }
}


  
void recursiveRectRightDown(float s)//fourth
{
  float newSide = (s*sqrt(3))/2;//constante de proporcionalidad, NO CAMBIAR, ya es dada
  if (newSide > 2)
  {
    pushMatrix();//para rotar solo el nuevo cuadrado, sino la figura rota como una unidad
    rotate(+angle);
    ellipse(0, 0, newSide, +newSide);
    line(0, 0, newSide, -newSide*10);
    translate(0, +newSide);
    recursiveRectRightDown(newSide);
    popMatrix();
  }
}
