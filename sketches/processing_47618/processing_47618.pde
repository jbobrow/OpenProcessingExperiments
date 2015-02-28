
// Maria José Neira
// Objetivo
// Mostrar distintos fondos en formato .jpg los que se puede cambiar con la interacción 
// a travès de las teclas a,b,c. Sobre el fondo se muestra imagen en formato .gif en diferentes 
// colores.  se podrìa hacer efectos ....sobre fondo y imgen gif, tabmbièn mover la imagen sobre el 
// fondo (no se alcazo por tiempo).


void setup() 
{
  size(1024, 768);
  noStroke();
  background(255);
  fill(0, 102, 153, 204);
  
  PImage f;
  PImage b;
  f = loadImage("Fondo1.jpg");
  b = loadImage("Figura1.gif");

   background(f);
  /*image(f, 0, 0);*/ 
  image(b, 470, 360); 

  smooth();
 /* noLoop();*/	
}

// Click on the window to give it focus
// and press the 'B' key
PImage b;
PImage f;
int vb = 1;

  /*vb=1;*/

void draw() 
{
  if (keyPressed) {
    
     switch(key) {
      case 'A': 
        f = loadImage("Fondo1.jpg");
               background(f); 
        break;
      case  'a': 
        f = loadImage("Fondo1.jpg");
               background(f); 
        break;
      case 'B': 
        f = loadImage("Fondo2.jpg");
               background(f); 
        break;
      case 'b': 
        f = loadImage("Fondo2.jpg");
               background(f); 
        break;
      case 'C': 
        f = loadImage("Fondo3.jpg");
               background(f); 
        break;
      case 'c': 
        f = loadImage("Fondo3.jpg");
                    background(f);
        break;
      case 'X': 
        b = loadImage("Figura1.gif");
              image(b,470,360);
        break;
      case 'x': 
        b = loadImage("Figura1.gif");
              image(b,470,360);
              vb=1;
        break;
      case 'Y': 
        b = loadImage("Figura1.gif");
              image(b,470,360);
              vb=1;
        break;
      case 'y': 
        b = loadImage("Figura2.gif");
              image(b,470,360);
              vb=2;
        break;
      case 'Z': 
        b = loadImage("Figura3.gif");
              image(b,470,360);
              vb=3;
        break;
      case 'z': 
        b = loadImage("Figura3.gif");
              image(b,470,360);
              vb=3;
        break;

      default:             // Default executes if the case labels
        break;

     }
  
/* 156 x 338

/*     s = loadShape("Figura1.svg");  
    shape(s, 200, 200, 500, 500); 
 mousePressed();  // Move the shape 10 pixels right each time the mouse is pressed
  s.translate(10, 0);*/
/*     switch(vb) {
/*      case 1: 
         image(b,0,0);
/*        f = loadImage("Fondo1.jpg");
               background(f); 
        break;
      case  'a': 
*/
/* image(b,0,0);*/
  
}

     switch(vb) {
      case 1: 
         b = loadImage("Figura1.gif");
         image(b,470,360);
         break;
      case  2: 
         b = loadImage("Figura2.gif");
         image(b,470,360);
         break;
      case 3:
         b = loadImage("Figura3.gif");
         image(b,470,360);
         break;
      default:             // Default executes if the case labels
        break;
    
     }
}
  



  
  



/*
color pink = color(255, 102, 204);
loadPixels();
for (int i = 0; i < (width*height/2)-width/2; i++) {
  pixels[i] = pink;
}
updatePixels();
*/






