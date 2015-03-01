
//Paula Buffone
//Sistemas Interactivos en el arte
//Prof. Diego Alberti
/*Ej Clase 5: dibujar un rectángulo a modo de botón 
que cambie de color cuando el mouse se pose sobre él*/


//Configuración
void setup()
{
  //tamaño de ventana
size (300,300);
}

void draw()
{
  //color de fondo
  background (0); 
  //Según la posición del mouse
  if
  (mouseX >=125&& mouseX <=175 &&mouseY>=125&&mouseY<=175)
  //el rectángulo será rojo
  {rect(125,125,50,50);
  fill(255,0,0);
  noStroke();
  }
  else
  //o blanco
  {rect(125,125,50,50);
  fill(255);
  noStroke();
  }
}

