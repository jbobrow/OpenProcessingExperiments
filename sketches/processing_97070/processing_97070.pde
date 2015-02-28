
//MªLuisa Espinós 2ºGEDI
//Informática

//Guardamos algunas medidas
int posX, posY, velX, velY;
int sz = 200;
int se=180;
int st=50;
int sk=125;

//Configuramos datos generales
void setup(){
  size(600,600);
  smooth ();
  posX = width;
  posY = height;
  velX = int(random(1,9));
  velY = int(random(1,7));
}

//Insertamos el fondo y elementos sobre el
void draw(){
  background(125,201,247);
  
  //sol, especificamos con que condiciones queremos que el sol cambie de color

  if (mousePressed == true) {
    fill(mouseX,mouseY,mouseX,mouseY);
  } else {
    fill(255,223,41);
  }
  ellipse(100,100,150,150);


//nubes, insertamos el resto del fondo
fill(255);
ellipse(300,100,90,40);
ellipse(330,120,90,40);
ellipse(330,90,90,40);
ellipse(380,120,90,40);
ellipse(380,80,90,40);
ellipse(410,100,90,40);

ellipse(100,220,90,40);
ellipse(130,240,90,40);
ellipse(130,210,90,40);
ellipse(180,240,90,40);
ellipse(180,200,90,40);
ellipse(210,220,90,40);

ellipse(390,180,90,40);
ellipse(420,200,90,40);
ellipse(420,170,90,40);
ellipse(470,200,90,40);
ellipse(470,160,90,40);
ellipse(490,180,90,40);

ellipse(600,90,90,40);
ellipse(630,110,90,40);
ellipse(630,80,90,40);

  noStroke();
  
  //actualitzamos las posiciones
  posX = posX+velX;
  posY = posY+velY;
  
  //Dibujamos los elementos que estaran en movimiento
  //cuerpo
  fill(114,170,43);
  ellipse(posX,posY,sz,sz/2);
  ellipse(posX,posY-50,se,se/2);
  ellipse(posX+50,posY+40,sk/2,st);
  ellipse(posX-50,posY+40,sk/2,st);
    
  //ojos 
     fill(255);
  ellipse(posX-20,posY-80,st,st);
    ellipse(posX+20,posY-80,st,st);
    fill(0);
    ellipse(posX+15,posY-80,st/4,st/3);
    ellipse(posX-15,posY-80,st/4,st/3);
    
    
    //nariz
    fill(242,152,158);
    ellipse(posX,posY-35,st,st/2);
     fill(114,170,43);
    ellipse(posX-9,posY-30,st/6,st/9);
  
    //boca
    fill(163,232,75);
    ellipse(posX,posY+10,se,se/5);
  
  //comprovamos la posición X, para que el dibujo no salga de la ventana
  if((posX-100<0)||(posX>width)){
    velX = -velX;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
  if((posY-110<0)||(posY>height)){
    velY = -velY;
  } 
}
// Al intentar que el dibujo no salga de la ventana deja configurar los extremos horizontal derecho y vertical superior pero el izquiero y el inferior al ser restrinjidos bloquean el movimiento.



