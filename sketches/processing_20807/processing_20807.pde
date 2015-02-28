
//very begining level
int crecida;
PImage imagen; //anuncio que voy a cargar una imagen

void setup()
{
  size(192,157);
  imagen = loadImage("primavera.jpg"); //carga la imagen como tal
  background(0);  
  image(imagen, 0, 0);
  smooth();
  noStroke();
  frameRate(50);
  crecida=0;
}
void draw() 
{
  image(imagen, 0, 0);
  // fija la flor en el central
  translate(width/2, height);
  //traslada en el eje y un pixel adicional en cada cuadro
  pushMatrix();
  translate (0,crecida);
  //rotación usando contador de cuadros
  rotate (radians(frameCount));
  // dibuja los petalos uno tras otro
  fill(255,0,0); // colorea en rojo rojo
  for (int i = 0; i < 5; i++)
  {
    ellipse(0, -10, 18, 18);
    rotate(radians(72));
  }
  // nucleo de la flor
  fill(255,255,0); // colorea en amarillo 
  ellipse(0, 0, 18, 18);
  popMatrix ();
     //flor 2
    pushMatrix();
  translate (-width/3,crecida);
  //rotación usando contador de cuadros
  rotate (radians(frameCount));
  // dibuja los petalos uno tras otro
  fill (250,0,250);
  //(150,0,150); // colorea en rosa 
  for (int i = 0; i < 5; i++)
  {
    ellipse(0, -10, 15, 15);
    rotate(radians(72));
  }
  // nucleo de la flor
  fill(250,250,0); // colorea en amarillo pollo
  ellipse(0, 0, 15, 15);
  popMatrix ();
     //flor 3
    pushMatrix();
  translate (width/3,crecida);
  //rotación usando contador de cuadros
  rotate (radians(frameCount));
  // dibuja los petalos uno tras otro
  fill(50,100,250); // colorea en azul
  for (int i = 0; i < 5; i++)
  {
    ellipse(0, -10, 15, 15);
    rotate(radians(72));
  }
  // nucleo de la flor
  fill(250,250,0); // colorea en amarillo pollo
  ellipse(0, 0, 15, 15);
  popMatrix ();
  // disminuye la crecida(altura) de la flor
  crecida--;
  if((height+crecida)==-30)
    crecida=0;
}


