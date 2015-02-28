

void setup()
{
  size(300,300);//tamaño ventana
  //background(255,150,10);//color de fondo
  smooth();//suavizado del trazo
  noCursor();//que no aparezca el cursor
}

void draw()
{
  background(255,150,10);
 
 rebicho (mouseX,mouseY);//llamamos a la funcion rebicho
 pajarita (mouseX,mouseY);//
  
}

void mouseMoved()//si se mueve el raton, se veran las elipses pequeñas de los ojo
 {
   strokeWeight (2);
   ellipse (mouseX+20, mouseY-20,3,3); //la posicion y el tamaño de la elipse
   ellipse (mouseX-20, mouseY-20,3,3);
   
 }

void rebicho (int x_, int y_)//funcion donde se dibuja el muñeco
{
  strokeWeight (2);//ancho de la linea del contorno de la elipse
  fill (255,190);//rellena de color carne la elipse
  ellipse (x_, y_, 80,80);
  strokeWeight (5);
  fill (255);
  ellipse (x_+20, y_-20,25,25);
  ellipse (x_-20, y_-20,25,25);
}

void pajarita (int x_, int y_)//funcion donde se dibuja la pajarita
{
  fill (0);
  beginShape ();
  vertex(mouseX-30,mouseY+20);
  vertex(mouseX-30,mouseY+70);
  vertex(mouseX,mouseY+50);
  vertex(mouseX+30,mouseY+70);
  vertex(mouseX+30,mouseY+20);
  vertex(mouseX,mouseY+45);
  endShape();
  
  
}






                
