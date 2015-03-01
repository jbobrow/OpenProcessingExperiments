
float x;
float y;
float movimientoalas;
PImage foto;
float cae;

void setup () {
  size (1200, 700);
  x = mouseX + random (-100, 100);
  y = mouseY + random (-100, 100);
  
  foto = loadImage ("Fondo.jpg");
}


void draw () {

  image (foto, 0,0);

  y = y + random (20);
  movimientoalas = y - random (5, 25);
  cae = y;

  fill (189,250,213);
  ellipse (x-40, movimientoalas, 60, 30);
  ellipse (x+40, movimientoalas, 60, 30);
  ellipse (x, cae, 80, 80);
  ellipse (x, y-40, 60, 60);
  //Pico
  fill (255,203,106);
  ellipse (x, y-30, 25, 20);
  line (x-10, y-37, x, y-20);
  line (x, y-20, x+10, y-37);
  //Ojos
  fill (255);
  ellipse (x-12, y-50, 20,12);
  ellipse (x+12, y-50, 20,12);
  fill (0);
  ellipse (x-12, y-50, 10, 10);
  ellipse (x+12, y-50, 10, 10);
}

void mouseDragged () {

  x = pmouseX;
  y = pmouseY;



 /*
 La idea era que al caer sobre la rama, la caida se detuviera y
 el pajaro se quedara inmovil, con el pico abierto y los ojos cerrados
 y se volviera de color rojo. No se como asignar las variables para
 que se pare, ya que hay asignada una suma de valores random en el
 descenso, y no se como cancelar esa suma en un condicional.
 
 if (cae >= 600){ //funciona pero mal, lo detecta
  cae = 600; //sigue cayendo
  //y =600; //funciona mal, cae una vez y se queda bajo permantemente
 fill (255,85,85); //no va
  stroke (160,2,2);
  //Pico
  fill (193,0,0);
  ellipse (x, y-30, 25, 20);
  line (x-10, y-37, x, y-20);
  line (x, y-20, x+10, y-37);
  //Ojos
  fill (255,85,85);
  ellipse (x-12, y-50, 20,12);
  ellipse (x+12, y-50, 20,12);
  ellipse (x-12, y-50, 10, 10);
  ellipse (x+12, y-50, 10, 10);
 }*/
}

 
 



