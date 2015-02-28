
PImage imagen;
 
void setup()
{
  imagen = loadImage("picis.jpg");//Carga la imagen deseada
  size(200,200);//tamaño de la pantalla
  background(0);//color de fondo
  smooth();// sirve para suavizar los bordes
  frameRate(30);//Velocidad de cuadros por segundo
}
 
void draw()
{
 
for(int i=0;i<200;i++){// para acelerar el proceso
  int x = int(random(imagen.width));//selecciona aleatoriamente un lugar en la imagen original
  int y = int(random(imagen.height));//selecciona aleatoriamente un lugar en la imagen original
  int loc = x + y*imagen.width;//Localiza un punto en la imagen
  float r = red(imagen.pixels[loc]);//Obtiene la candtidad de rojo en este punto
  float g = green(imagen.pixels[loc]);//Obtiene la candtidad de verde en este punto
  float b = blue(imagen.pixels[loc]);//Obtiene la candtidad de azul en este punto
  stroke(r,g,b,400);//Elegir color de la linea
  line(x,y,x+2,y-2);//Pinta una linea que ira dibujando aleatoriamente la misma imagen cargada en este caso la imagen de la piedra de acatlan
 }
}
 
void mousePressed(){// al dar click en la imagen se reinicia el proceso haciendo una llamada a la funcion setup
 background(0); // si presionas el mouse se reinicia
}

