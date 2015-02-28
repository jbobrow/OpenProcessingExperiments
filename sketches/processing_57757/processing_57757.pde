
float transparencia =-0.0; //variable con decimal
void setup()
{
  size(600, 600);// tamaño canvas
  frameRate (5);//fotogramas por segundo 
  background(0);//color de fondo
  smooth();//borde suavizado de las figuras geometricas. 
}

void draw()
{
   transparencia = transparencia + 100;
   
   float n= noise (transparencia) * height;// nombre de la variable de transparencia 
  strokeWeight (150); // ancho de la transparencia que rodea los circulos
  stroke(random(255), random(255), random (255),10); // color de los circulos (emtre)
   fill(random(n), random(n), random(n));// color de las transparencias (entre)
  ellipse(random(600), random(600), 50,50);// espacio donde aparecen los circulos y su tamaño, orden al azar.
  
}
