
float posX, posY, velX, velY;
int sz = 20;
//creamos un objeto PFONT
PFont lletra;
int totalRebotes = 0;

void setup() {
  size(300, 200);
  posX = width/2;
  posY = height/2;
  velX = random(8, 15);
  velY = random(8, 15);
  /*
Cargamos una tipografÃ­a que prÃ©viamente habremos creado 
   utilizando el menÃº tools-->create font.
   Si no utilizamos ArialMT-48 habrÃ¡ que cambiar aquÃ­ el nombre
   */
  lletra = loadFont("ArialMT-48.vlw");
  //y preparamos (como con fill y stroke) la tipo con que 
  //escribiremos el prÃ³ximo texto
  textFont(lletra);
}

void draw() {
  background(255);
  //actualizamos posiciones
  posX = posX+velX;
  posY = posY+velY;
  //dibujo
  stroke(255,0,0);
  fill(255);
  ellipse(posX, posY, totalRebotes, totalRebotes);
  //comprobamos posiciÃ³n X
  if ((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebotes ++;
  } 
  //comprobamos posiciÃ³n Y
  if ((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebotes ++;
  } 
  fill(100,0,0);
  //y finalmente, escribimos
  text (totalRebotes, 15, height-15);
}


