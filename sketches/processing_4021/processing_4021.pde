
/** <strong> "Universo distorsionado" </strong> 
 * Proyecto final de trimestre. LCO
 * 25/08/09
 * Realizado por Mónica Piña, alumna de primer año de diseño en la PUCV
 * Basado en ejemplo de tutorial del programa Processing
 * 
 * Sketch que contiene un movimiento continuo que envuelve de una
 * manera activa al observador, haciéndolo participe de la imagen 
 * y del efecto que da la sensación de estar flotando en el medio
 * del universo, mientras una especie de tunel gira constantemente
 * a nuestro alrededor.
 * El centro de la imagen va a representar el origen del movimiento,
 * éste origen será siempre constante, por otro lado la animación del
 * tunel va a ser calculada bajo los parámetros del ángulo y la distan-
 * cia, quienes serán los encargados de elaborar los pixeles correspon-
 * dientes en la textura.
 * Los colores se refieren a todo lo que es el espacio en sí mismo
 * con un fondo constante negro y en ciertas ocasiones la aparición
 * de destellos de luz en colores violetas que nos envolverán en 
 * este maravilloso universo.
 */

PGraphics tunel;
PImage espacio;


// pixeles que calculan el movimiento
int[][] distancia;
int[][] angulo;
int w, h;

void setup(){
  size(500,400);
  
  
  espacio=loadImage("universo.jpg"); //imagen usada para el video
  tunel= createGraphics(300, 200, P3D); //especificación del tamaño del grafico
  w = tunel.width;
  h = tunel.height;

  float ratio = 20;
  int angle;
  int depth;
  
  // cálculo para cada pixel
  distancia= new int[10 * w][2 * h];
  angulo= new int[10 * w][2 * h];

  for (int x = 0; x < w*2; x++)
  {
    for (int y = 0; y < h*2; y++)
    {
      depth = int(ratio * espacio.width 
                  / sqrt(float((x-w) * (x - w) + (y - h) * (y - h)))) ;
      angle = int(0.5 * espacio.height * atan2(float(y - h), 
                  float(w-h)) / PI) ;

      
      distancia[x][y] = depth ; // contiene para cada pixel el inverso de la distancia del centro de la pantalla 
      angulo[x][y] = angle ; // contiene el angulo de cada pixel de la pantalla
    }
  }   
}


void draw() {

  
  tunel.loadPixels();// para manipular los pixeles

  float tiempodesplazamiento = millis() / 1000.0; //velocidad del movimiento continuo

  //velocidades del zoom
  int shiftX = int(espacio.width * .2 * tiempodesplazamiento+100); 
  int shiftY = int(espacio.height * .15 * tiempodesplazamiento+100); 

  
  int shiftLookX = w / 2 + int(w / 10 * radians(tiempodesplazamiento));
  int shiftLookY = h / 2 + int(h / 10 * radians(tiempodesplazamiento * 1.0));

  for (int y = 0; y < h; y++)  {
    for (int x = 0; x < w; x++)      {
      
      
      int texture_x = constrain((distancia[x + shiftLookX][y + shiftLookY] 
                                 + shiftX) % espacio.height ,0, espacio.width);
      
      int texture_y = (angulo[x + shiftLookX][y + shiftLookY] 
                       + shiftY) % espacio.height;
      
      tunel.pixels[x+y*w] = espacio.pixels[texture_y 
                         *espacio.width + texture_x];

      
    }
  }

  tunel.updatePixels();
  

 
  image(tunel, 0, 0, width, height); // centrar la imagen
}



