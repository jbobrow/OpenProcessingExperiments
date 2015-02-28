
PImage foto; //estamos declarando variable de tipo imagen img puede ser cualquier cosa, un arbol, etc.
PImage foto1;

void setup (){
  size (800, 600);
  background (0);

  foto= loadImage ("DSC07229.JPG");
 // foto1= loadImage ("roy1.jpg");
}

void draw (){
  for (int x=0; x<=width; x= x+60)
    for (int y=0; y<=width; y=y+60)
    //image (foto, x,y, 80, 60);
      image (foto, x,y, 50, 40);
// image (foto, 0,0, 800, 600);// o tambien asi image (foto, 0,0)
//image (foto, 0,0, mouseX, 600);
//image (foto, mouseX, mouseX, mouseY, mouseX);
//image (foto1, 310, 0, 300, 600);// (foto1 es el parametro, 0, 0 es la posicion, 300, 600 es el tamaño)

//tint (64, 116, 53);//  tint debe ir arriba de imagen para que noLoop funcione para poner un filtro de color, el ultimo valor del parentesis es la transparencia)
//tint (36, 19, 237, 900);
 //image (foto, 0,0, 800, 600);
//noLoop ();

}

