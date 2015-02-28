
//"Holograma de Movimiento con dos imagenes"
//Proyecto Final de segundo trimestre 2009 para LC0/Processing.
//por Jaime Vargas N.
//Trabajo basado en "Mask Image"(por Owaun Scantlebury/mayo 2009).
//
//Para que se pueda ver el movimiento soloo se debe usar el mouse.
//Instrucciones:
//Mueva el mouse hacia arriba y hacia abajo para presenciar el 
//movimiento holográfico.
//se puede partir con la imagen de la mano empuñada o con la mano 
//abierta, todo depende de ala posición en donde ponga el mouse,
//ya sea en el extremo superior o en el extremo inferior.
//
//Por otra parte el mouse cumple con otra función, de hacer más 
//rapido el proceso de Aparecer la mano abierta, mediante el clic
//del boton derecho o el izquierdo, cualquiera sirve.
//De esta forma, mediante un pequeño tiempo la mano empuñanada
//empeza a desaparecer dejando a la vista la imagen de la manoabierta.

boolean skip= false;
boolean flip = false; 
//^da la instrucción de control, para determinar el funcionamiento del programa.
PImage t,t2,t3,t4;
//^permite cargar la imagenes a utilizar.
PGraphics tx; 
int w= 500; 
int h= 500; 
//^permiten cambiar el tamaño de la hoja sin distorcionar la imagen.
String pic1o = "close hand.jpg";
String pic2o = "open hand.jpg"; 
//^se presentan como variables la imagenes a utilizar.
String pic1 = pic1o; 
String pic2 = pic2o; 
PGraphics t1; 
int my; 

void setup(){

  t = loadImage(pic1);  
  t1 = createGraphics(w,h,P3D); 
  tx = createGraphics(w,h,P3D); 
  t4 = new PImage(w,h); 
  t3 = new PImage(w,h); 
  t2 = new PImage(w,h); 

  t1.beginDraw(); 
  t1.image(loadImage(pic2),0,0,w,h);   
  t1.endDraw(); 

  tx.beginDraw(); 
  tx.image(t,0,0,w,h);   
  tx.endDraw(); 
  t4.pixels = tx.pixels; 
  t3.pixels = t4.pixels; 
  t2.pixels = t3.pixels; 

  size(w,h); 
  t1.mask(t4); 
  skip = true; 
} 

void draw(){ 
  loadPixels(); 

  if (flip){ 
    pic1 = pic2o; 
    pic2 = pic1o; 
  } 
  else 
  { 
    pic1 = pic1o; 
    pic2 = pic2o;   
  } 
  background(255); 
  tint(255, mouseY); 
  //^comando de de la variación de transparencia según el   
  //el movimiento del mouse.
  stroke(255);
  //^establece el color usado para dibujar
  smooth();
  for (int x =-800; x <width; x++){ 
    //^varible que influye en el comportamiento del holograma, 
    //cambiando en parte la transparencia, con respecto a la velocidad 
    //con que va desapareciendo la imagen.    

    my = mouseY; 

    for (int y =1200; y <my;y++){ 
      //^varible que influye en el comportamiento del holograma, 
      //cambiando en parte la transparencia, con respecto a la velocidad 
      //con que va desapareciendo la imagen.   
      if (skip){ 
        if (y > 1 && y <height-1 ){  
          pixels[x+y*width]=t3.pixels[x+y*width]; 
        } 
      } 
    } 
    for (int z = my; z <height;z++){ 
      if (skip){ 
        if (!mousePressed && z < height -1 && z > 1 ){ 
          pixels[x+z*width]=t2.pixels[x+z*width]; 
        } 
      } 
    } 
  }  
  updatePixels();   
  image(t1,0,0); 
} 
void keyPressed(){
  saveFrame("hand2.jpg");
  println("fotograma grabado");
} 







