
PImage imagen;//Declaracion de variable 

void setup()
{
  size(579,348);//Tamaño de pantalla
  imagen=loadImage("fondo.jpg");//Carga la imagen de fondo que esta en la carpeta data
}

void draw()
{
  image(imagen,0,0,imagen.width/2,imagen.height/2);
  //la funcion image es utilizada para visualizar la imagen 
  //puedes utilizar image(imagen,posx,posy) para utilizar la dimension original de la imagen
  //los parametros extra que vez en la funcino que yo utilize son para darle un tamaño especifico
  //imagen.width/2 escala la imagen a 50% o lo que es lo mismo lo divide entre dos
  if(mousePressed)
  {
    println(mouseX + "," + mouseY);
    //mousePressed lo utilizo para saber cuando se da un click con el raton
    //println solo lo utilizo para saber en que punto di el click
    //mouseX y mouseY me dan las coordenadas y el simbolo + es para concatemar cadenas
  }
}


