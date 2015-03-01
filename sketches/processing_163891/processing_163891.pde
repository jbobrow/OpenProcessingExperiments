

//DEGRADADO

//Instrucciones:
//1. Mover mouse de arriba a abajo (Eje Y) para cambiar el color del degradado (Valor del tono de Green).
//2. Mover mouse de derecha a izquierda (Eje X) para cambiar el color del degradado (Valor del tono de Red).
void setup() 
{
size (400, 400);
smooth();
noStroke();
frameRate(60);
}
void draw() 
{
background (255);
for(int i=0; i<30; i++)
{
  float x=map (i, 0, 29, 0, width); //posición de x
  float y=map (i, 0, 29, 0, 15); //ancho de las rayas
  float z=map (i, 0, 29, 255, 0); //esta variable indica el color y tenemos que para la raya número 0 el valor será de 255 y para la raya 29 el valor será de 0. Y el uso de mouseX hace que al desplazar por el eje X varie el color del degradado (solo del tono Red)
  fill (mouseX/2+z,mouseY/2+z,z+30); //al escoger modificar de la combinación RGB solo Green y Blue con z, en las diferentes columnas desde 0 a 29 tendran diferentes valores desde el 255 hasta el 0. Y el uso de mouseY hace que al desplazar por el eje Y varie el color del degradado (solo del tono Green)
  rect (x, 0, y, height);
}
} 

//*MouseX y MouseY partidos entre 1/2 para graduar el color de forma más suave.
