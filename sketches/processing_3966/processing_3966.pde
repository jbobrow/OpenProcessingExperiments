
 /** <strong> "ROTACIÓN DE CUBO 3D" </strong>
*Proyecto Final de II Trimestre de 2009. LCO. Processing
*Entrega: Martes 25 de Agosto.
*Por Josefina Valenzuela.
*Basado en ejemplo de tutorial de www.openprocessing.org.
*
*<strong>Descripción General de la Animación</strong>
*
*Película en la cual se puede observar, a través de una animación 
*3D, la rotación de un cubo "flotando en el mismo lugar" (utilizando
*las funciones tangente y seno según los ejes x e y), dándole una
*rapidez específica a cada giro o "balanceo", desde el último lento
*hasta un giro completo  y rápido de la figura.
*Ello se encuentra con una alta saturación del color, y los colores 
*impactan sobre el negro de fondo, protagonizando e intensificando la
*imagen junto con el cubo. Los colores vivos salen desde sus aristas y
*el extremo inferior, con características de fuego. Se "mueven" como él, con
*una dirección específica por el "viento".
*
*La imagen es reproducida dos veces simultáneamente, alcanzando a pasar
*las aristas del primer cubo hacia "el espacio" donde se reproduce el 
*trozo del segundo, interactuando por lo tanto, poco entre sí (cuando topan
*los vértices.
*/

 

 
 PImage tex;
 
//Contiene los pixeles que calculan el movimiento del fuego.
int[][] fuego;

// Colores de la "llama".
color[] paleta;
float angulo;
int[] calc1,calc2,calc3,calc4,calc5;

PGraphics pg;

void setup(){
  size(640, 360, P3D);//Tamaño de la imagen que se va a mostrar.
  
    
  //Se crea la imagen para el cubo 3D
  pg = createGraphics(width, height, P3D);//Se especifica luego a través de pg.

  calc1 = new int[width];
  calc3 = new int[width];
  calc4 = new int[width];
  calc2 = new int[height];
  calc5 = new int[height];

  colorMode(HSB);//Modalidad del color.

  fuego = new int[width][height*10];
  paleta = new color[255];
//Se cre la paleta de colores.
  for(int x = 18; x < paleta.length; x++) {
    //Rango de colores.
    //Saturación siempre al máximo en la imagen (255).
    //Luminosidad (0-255 para x=0-128, y 255 para x=128-255).
    paleta[x] = color(x/4, 255, constrain(x*3, X*4, 255));
 //Los términos anteriores son reunidos para especificarlos en la animación.
  }

  // Cálculo de los valores de los pixeles en la animación.
  
    for (int x =120 ; x < width; x++) {
    calc1[x] = x %height;
    calc3[x] = (x   + width) % width;
    calc4[x] = (x+7) % width;
  }
  
   
  
   for (int x =60 ; x < height; x++) {
    calc1[x] = x %width;
    calc3[x] = (x   + height) %height;
    calc4[x] = (x+7) % height;
  }
   
  
  for(int y = 0; y < height; y++) {
    calc2[y] = (y) % height;
    calc5[y] = (y-8) % height;
  }
   
  for(int y = 0; y < height; y++) {
    calc3[y] = (y + 5) % height;
    calc5[y] = (y + 6) % height;
  }
}

void draw() { //Se dibuja.

angulo = angulo + 0.045 ;
   

  //Cubo y su movimiento.
  pg.beginDraw();//Se comienza el dibujo.
  pg.translate(width >> 1, height >> 3/2);//Relación fondo-cubo: ubicación. 
  pg.rotateX(tan(angulo/2/5));//Realiza la rotación rápida.
  pg.rotateY(sin(angulo*PI/3));//Determina la rotación de "balanceo del cub".
  pg.background(0);//Color de fondo (negro).
  pg.stroke(128);
  pg.strokeWeight(6.5);//Grosor de las líneas.
  pg.scale(43); //Tamaño, escala del cubo.
   pg.fill(0, HSB);//Color de relleno.
  pg.lights();//Iluminación.
  pg.box(4.5);//Tamaño involucrando así la fluidez el fuego.
  pg.endDraw();//Se termina, cierra el dibujo.
  
  //Especificación fuego.
  for(int x = 20; x < width; x++)
  {
    fuego[x][height-6] = int(random(RGB,130)) ;
  }

  loadPixels();
  

  int contador = 0;
  // Se hacen los cálculos del fuego para cada pixel.
  for (int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      // Se añaden los valores de los pixeles.

      fuego[x][y] =
          ((fuego[calc3[x]][calc2[y]]
          + fuego[calc1[x]][calc2[y]] 
          + fuego[calc4[x]][calc2[y]]
          + fuego[calc1[x]][calc5[y]]) << 5) / 130;
     
      pixels[contador] = paleta[fuego[x][y]]*3;//paleta, color de imagen en pantalla.

     
      if ((pg.pixels[contador++] >> 16 & 0xFF) == 128) {
        // Sólo si se cumple lo siguiente, aparecerá el cubo de fuego.
        fuego[x][y] = 128;
      }
    }
  }
  updatePixels();
}


