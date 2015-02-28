
// http://www.biopus.com.ar/emiliano/tutorial_programacion/random/index.html
PImage imagen1;  // tipo PImage para cargar imágenes
PImage imagen2;
PImage imagen3;
PImage imagen4;
PImage imagen5;
//----------------------------------------------
void setup()
{
size(600, 600);   
imagen1 = loadImage("ejercicio1.jpg"); //carga un jpg que tomo como base
imagen2 = loadImage("ejercicio2.jpg");
imagen3 = loadImage("ejercicio3.jpg");
imagen4 = loadImage("ejercicio4.jpg");
imagen5 = loadImage("ejercicio5.jpg");
background(255);  //fondo blanco
fill(255, 255);
image(imagen3, 0, 0); //imprime la imagen 
rect(0, 0, width, height);// para que la imagen no se vea
}
//----------------------------------------------
void draw()
{
  float des = int(random(50));  //determina el nivel de desenfoque 
  color este;  //declara la variable este de tipo color
  int x = int(random(400));  //toma una posición horizontal al azar del tamaño de la imagen
  int y = int(random(400));  //toma una posición vertical al azar
  este = imagen3.get(x, y); //toma el color del pixel elegido
  fill(red(este), green(este), blue(este), 100); //usa ese color como relleno dándoles cierta transparencia
  stroke(este); //usa ese color de contorno
  float lado = random(2, 15);  //elige el tamaño del cuadrado para pintar el pixel
  int a = int(random(1, 5));
//distintas fotos para los cuadrados 
  switch(a)
  { 
    case 1:image(imagen1, x*1.5, y*1.5, lado, lado); //imprime la imagen del mismo tamaño que los cuadrados
           break;
    case 2:image(imagen2, x*1.5, y*1.5, lado, lado); //imprime la imagen del mismo tamaño que los cuadrados        
           break;
    case 3:image(imagen3, x*1.5, y*1.5, lado, lado); //imprime la imagen del mismo tamaño que los cuadrados   
           break;
    case 4:image(imagen4, x*1.5, y*1.5, lado, lado); //imprime la imagen del mismo tamaño que los cuadrados  
           break;
    case 5:image(imagen5, x*1.5, y*1.5, lado, lado); //imprime la imagen del mismo tamaño que los cuadrados
           break;
   };
 rect(x*1.5, y*1.5, lado, lado); //pinta el cuadrado del color del pixel   
}
//----------------------------------------------
void mousePressed()
{
background(255);  //fondo blanco
fill(255, 255);
image(imagen3, 0, 0); //imprime la imagen 
rect(0, 0, width, height);// para que la imagen no se vea
}


