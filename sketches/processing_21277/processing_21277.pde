
//very begining level
PImage imagen; //anuncia que voy a cargar una imagen 
void setup()
{
  size(192,157);
  imagen = loadImage("montevideo.png"); //carga la imagen como tal
  background(0);  
  image(imagen, 0, 0);
  smooth();
  noStroke();
  frameRate(15);
}
void draw() 
{
  image(imagen, 0, 0);
  // fija el punto cetral
  translate(width-20, height/6);
  //rotación usando contador de cuadros
  rotate (radians(frameCount));
  // dibuja los rayos solares
  stroke(250,150,20); // anaranjado
  strokeWeight(3);
  for (int i = 0; i < 10; i++) {
    line(60,0,-60,0);
    rotate(radians(72));
    // nucleo sol
    fill(250,250,0); // amarillo 
    ellipse(0, 0, 50, 50);
  }
}


