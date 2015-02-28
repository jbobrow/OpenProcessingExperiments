
  PImage smiley1;
  PImage smiley2;
  PImage colores;
  
  float palX; //posicion X paleta de herramientas
  float palY; // posicion Y paleta de herramientas
  
 float palGrX; //posicion X paleta de grosores
 float palGrY; //posicion X paleta de grosores
  
 float palColX; // posicion X de la paleta de colores
 float palColY;  // posicion Y de la paleta de colores
   
 
  
  int clickRegion ; //tipo de region donde se hace click de herramientas
  int clickRegionGr; // tipo de region donde se hace click de GROSOR
  int clickRegionCol; // tipo de region donde se hace click de color
  
  
  boolean areaDibujo = false ;
  boolean areaColor=false;
  boolean borrar = false;
  boolean  comandoActivo= false;

  
  int inicioX; // inicio x de los comandos
  int inicioY; // inicio y de los comandos
  int finalX; // final x de los comandos
  int finalY; // final y de los comandos
  int nroClick = 0 ; //
  
  int colorOriginalGr= 255;
  int colorSeleccionGr = 150;

color ColorSelec = color(230,120,200);
color ColorMouseOver= color(230,120,200);


void setup () {
  
  size (600,600) ;
  smooth ();
  background (255); //fondo blanco
  smiley1 = loadImage("smiley1.png"); //carga imagen1
  smiley2 = loadImage("smiley2.png"); //carga imagen2
  colores = loadImage("colores.png"); //carga imagen2
  
  
}

void draw() {
  
  if (borrar == true){
    background(255);
  }
  
  borrar = false;
  rectMode (CORNER);
 
////////////////////////////////////////////////////
/// Inicializacion de posiciones de las paletas ////
////////////////////////////////////////////////////


  palX=50; // variable x de la instancia paleta
  palY=50; // variable y de la instancia paleta
  
  
  palGrX=50; //posicion X paleta de grosores
  palGrY=120; //posicion X paleta de grosores

  palColX = 320; //posicion X paleta de colores
  palColY =50;  //posicion X paleta de colores
  
////////////////////////////////////////////////////
/// Constructures e instancias de paletas////// ////
////////////////////////////////////////////////////
  
  
  PaletaHerr miPaletaHerr = new PaletaHerr (palX,palY); //constructor de paleta de herramientas
  PaletaGros miPaletaGros = new PaletaGros (palGrX,palGrY); // constructor de paleta de grosores
  PaletaColor miPaletaColor = new PaletaColor (palColX,palColY);// constructor de paleta de colores
 
 
  Forma miForma = new Forma (inicioX,inicioY, finalX, finalY); // constructor de detectores de click y herramientas
  
  miPaletaHerr.dibujar (); //instancia
  miPaletaGros.dibujar(); //instancia de paleta de grosores
  miPaletaColor.dibujar(); //instancia de paleta de colores
  
  

  
  
//deteccion de area de dibujo evitando la paleta
 
  if   ( ((mouseX>palX) && (mouseX<palX+260) && (mouseY>palY) && (mouseY<palY+60))   || ((mouseX>palGrX)&& (mouseX<palGrX+260) && (mouseY>palGrY) && (mouseY<palGrY+60))|| (areaColor==true) )
  
  { 
    areaDibujo = true; // area de dibujo bajo la paleta, hay que evitarla
  }else{
    areaDibujo = false; //area de dibujo bajo la paleta
  }

 

//cada tipo de dibujo segun region de click

switch (clickRegion) { 

  
case 1  : //boton 1
  miForma.Linea(); // instancia de forma
  
  break;
  
  case  2 : // boton 2 DIBUJO LIBRE
  strokeWeight (2);
miForma.Alzada();
  
  break;
  
  case 3: //boton 3 RECTANGULO BLANCO
  strokeWeight (1);
  fill (255);
  miForma.Rectangulo();
  break;
  
  case 4: //boton 4 RECTANGULO DE COLOR
  
  strokeWeight (1);
  fill (ColorSelec);
  miForma.Rectangulo();
  break;
  
  case 5: //boton 5 TRIANGULO BLANCO
  
  strokeWeight (1);
  fill (255);
  miForma.Triangulo();
  break;
  
  case 6: //boton 6 TRIANGULO DE COLORES
  
  strokeWeight (1);
  fill (ColorSelec);
  miForma.Triangulo();
  break;
  
  case 7: //boton 7 CIRCULO BLANCO
  ellipseMode (CORNER);
  strokeWeight (1);
  fill (255);
  miForma.Circulo();
  break;
  
  case 8: //boton 7 CIRCULO COLORIDO
  
  ellipseMode (CORNER);
  strokeWeight (1);
  fill (ColorSelec);
  miForma.Circulo();
  break;
  
  case 9 : //boton 9 IMAGEN 1
  
  miForma.Imagenes1();
  break; 
  
  case 10 : //boton 10 IMAGEN 2
  miForma.Imagenes2();
  break; 
  
  
  case 11: //boton 11 BORRAR PANTALLA
  //borrar = true; //fondo blanco
  fill (255);
 miForma.Borrar();
  break;
  
  case 99:
 // miPaleta.Mover();
  miPaletaHerr.dibujar();
  break;
  
  } //fin del switch
  
} //fin del loop draw
 


///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


void redibujar() { //funcion que graba la pantalla a medida que se van dibujando
       //----------------------------------------------------------------------------------------------------------------------------------
       //al hacer el primer click saca una foto a los pixel de la pantalla
    loadPixels();
      for (int y=0; y<height;y++){
      for(int x=0;x<width;x++){
      int loc=x+y*width;
        
      float r= red(pixels[loc]);
      float g= green(pixels[loc]);
      float b= blue(pixels[loc]);
      pixels[loc]=color(r,g,b); }}
   
        //----------------------------------------------------------------------------------------------------------------------------------   
}


/////////////////////////////////
///////////////////////////////////
///////////////////////////////////


void actualizar (){ //pone en pantalla la captura de pixels tomada con REDIBUJAR
updatePixels ();
}
void mouseReleased (){ //que pasa si hago click
if (areaDibujo==false){
   if (nroClick ==2) {
   nroClick =1;
      }else{
      nroClick= nroClick+ 1;
    }

}else{
  nroClick =1;
}
}
//////////////////////////////////////////////
/////////////////////////////////////////////
//////////////////////////////////////////////////



  

