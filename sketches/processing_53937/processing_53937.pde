
// Espirales 
// código por Santiago y Juan Pablo Cortés
// Basado en el sketch de  (c) David Balash 2011
// Attribution - Noncommerical - Share Alike


 // Declara las variables globales con las que se definen los patrones.
 
 
final int WIDTH = 1000;
final int HEIGHT = 1000;
final int OFFSET_WIDTH = 122;
final int OFFSET_HEIGHT = 75;
final int BACKGROUND_COLOR = 255;
final int FRAME_RATE = 10;
 float MAX_NUMBER_OF_ELEMENTS = 10;
 float ELEMENT_SIZE = 1;
 float STROKE_WEIGHT = 0.1;
final int DIRECTION_NONE = 0;
final int DIRECTION_RIGHT = 1;
final int DIRECTION_UP = 2;
final int DIRECTION_LEFT = 3;
final int DIRECTION_DOWN = 4;
float ix=0;
float iy=0;
int maxpal = 512;
int numpal = 0;
color[] goodcolor = new color[maxpal];
int Nesp= 1;
int Nesp1= 1;
int Nesp0= 1;
ArrayList direction = new ArrayList() ;
ArrayList previousPreviousFibonacciElement = new ArrayList();
ArrayList  previousFibonacciElement= new ArrayList();
int t=0;

// Inicia la produccion de la imágen    
     
void setup()
{
    size(WIDTH, HEIGHT);
    background(BACKGROUND_COLOR);
    strokeWeight(STROKE_WEIGHT);
    smooth();
    //Velocidad de Dibujo 
    frameRate(FRAME_RATE);
    // Toma el mapa de colores de un archivo GIF ( Viene incluido en el sketch )
    takecolor("a1.gif");
}
 
     // Dibuja un arco de la espiral de Fibonacci
void drawFibonacci(float inx,float  iny,int t)

{
  // Este ciclo es para ver la cantidad  de espirales que dibuja al mismo tiempo.
  for(int n=0;n<t;n++)
  {
    // Corre las espirales para que no queden una encima de otra
     translate(inx, iny);
// Primer frame que dibuja, inicializa los arcos
    if (frameCount == 1)
    {
      // Inicializa la clase Fibonacci Element, el elemento que usamos es un arco, estos elementos son las coordenadas y el número, esto es parte del sketch
      // de David Balash que dibujaba un espiral ( Fibonacci Spiral 2011 )
        previousPreviousFibonacciElement.add(n,new FibonacciElement(0, 0, 0));
        previousFibonacciElement.add(n,new FibonacciElement((width / 2) - OFFSET_WIDTH, (height / 2) - OFFSET_HEIGHT, 1));
      ((FibonacciElement)previousFibonacciElement.get(n)).show(DIRECTION_NONE);
        direction.add(DIRECTION_RIGHT);
    }
    else
    {
        FibonacciElement nextFibonacciElement;
      int N=(Integer)direction.get(n);
        switch (N)
        // Este switch va mirando hacia donde va el siguiente arco , hay 4 posibilidades y la quinta que es cero que es un error. (las posibilidades estan definidas arriba )
        {
          // Mira en que caso esta, dibuja y define las variables del siguente arco.
            case DIRECTION_RIGHT:
                nextFibonacciElement = new FibonacciElement(
                    ((FibonacciElement)previousFibonacciElement.get(n)).getX() + (((FibonacciElement)previousFibonacciElement.get(n)).getNumber() * ELEMENT_SIZE),
                    ((FibonacciElement)previousFibonacciElement.get(n)).getY() - (((FibonacciElement)previousPreviousFibonacciElement.get(n)).getNumber() * ELEMENT_SIZE),
                    ((FibonacciElement)previousPreviousFibonacciElement.get(n)).getNumber() + ((FibonacciElement)previousFibonacciElement.get(n)).getNumber());
                nextFibonacciElement.show(DIRECTION_RIGHT);
                previousPreviousFibonacciElement.add(n, previousFibonacciElement.get(n));
                previousFibonacciElement.add(n,nextFibonacciElement);
                direction.add(n,DIRECTION_UP);
            break;
            case DIRECTION_UP:
                nextFibonacciElement = new FibonacciElement(
                    ((FibonacciElement)previousFibonacciElement.get(n)).getX() - (((FibonacciElement)previousPreviousFibonacciElement.get(n)).getNumber() * ELEMENT_SIZE),
                    ((FibonacciElement)previousFibonacciElement.get(n)).getY() - ((((FibonacciElement)previousPreviousFibonacciElement.get(n)).getNumber() + ((FibonacciElement)previousFibonacciElement.get(n)).getNumber()) * ELEMENT_SIZE),
                    ((FibonacciElement)previousPreviousFibonacciElement.get(n)).getNumber() + ((FibonacciElement)previousFibonacciElement.get(n)).getNumber());
                nextFibonacciElement.show(DIRECTION_UP);
                previousPreviousFibonacciElement.add(n, previousFibonacciElement.get(n));
                previousFibonacciElement.add(n,nextFibonacciElement);
                direction.add(n,DIRECTION_LEFT);
            break;
            case DIRECTION_LEFT:
                nextFibonacciElement = new FibonacciElement(
                     ((FibonacciElement)previousFibonacciElement.get(n)).getX() - ((((FibonacciElement)previousFibonacciElement.get(n)).getNumber() +  ((FibonacciElement)previousFibonacciElement.get(n)).getNumber()) * ELEMENT_SIZE),
                     ((FibonacciElement)previousFibonacciElement.get(n)).getY(),
                    ((FibonacciElement)previousFibonacciElement.get(n)).getNumber() +  ((FibonacciElement)previousFibonacciElement.get(n)).getNumber());
                nextFibonacciElement.show(DIRECTION_LEFT);
                   previousPreviousFibonacciElement.add(n, previousFibonacciElement.get(n));
                previousFibonacciElement.add(n,nextFibonacciElement);
                direction.add(n,DIRECTION_DOWN);
            break;
            case DIRECTION_DOWN:
                nextFibonacciElement = new FibonacciElement(
                     ((FibonacciElement)previousFibonacciElement.get(n)).getX(),
                     ((FibonacciElement)previousFibonacciElement.get(n)).getY() + ( ((FibonacciElement)previousFibonacciElement.get(n)).getNumber() * ELEMENT_SIZE),
                    ((FibonacciElement)previousFibonacciElement.get(n)).getNumber() +  ((FibonacciElement)previousFibonacciElement.get(n)).getNumber());
                nextFibonacciElement.show(DIRECTION_DOWN);
                   previousPreviousFibonacciElement.add(n, previousFibonacciElement.get(n));
                previousFibonacciElement.add(n,nextFibonacciElement);
                direction.add(n,DIRECTION_RIGHT);
            break;
        }
    }
  }
}
 
 // Aca dibuja los espirales
 void draw()
{  
  //  Es el que dice cuantos arcos hace
    if (frameCount > MAX_NUMBER_OF_ELEMENTS)
    {
      // si ya los dibujo todos vuelve a resetear el frame count y las variables

        frameCount=0;
// estos X y Y son los que hacen que queden separados y se muevan de forma paralela
        ix=random(10)-5;
        iy=random(10)-5;
        // Que tan grande es el circulo que dibuja
               ELEMENT_SIZE = random(1)+0.5;
               // La cantidad de arcos que dibuja
        MAX_NUMBER_OF_ELEMENTS= random(5)+8;
        // Que tantos pinta
        STROKE_WEIGHT= random(0.24);
        // calcula el numero de espirales siguiendo la serie de fibonacci
        // El nesp va subiendo con la serie de fibonacci, tengo tres valores, el primero se calcula sumando los otros dos y luego se guarda la suma y el mayor de los dos numeros
        // El menor se borra y luego se repite el ciclo que avanza con la serie de fibonacci, las dimensiones de la espiral están descritas por la serie, ( La espiral de fibonacci
        // Se construye uniendo cuadrados cuyo lado incrementa con la serie de fibonacci ( uniendo los arcos inscritos ) bajo esta premisa funciona todo el código.
       Nesp=Nesp0+Nesp1;
      Nesp1=Nesp0;
       Nesp0=Nesp;
       if (Nesp> 200)
       {
         Nesp=1;
       Nesp0=1;
       Nesp1=1;
     }
       // Abre espacio en los vectores para  los nuevos espirales
       for(int h=0;h<(Nesp-direction.size());h++)
      {
        direction.add(0);
        previousFibonacciElement.add(new FibonacciElement(0, 0, 0));
        previousPreviousFibonacciElement.add(new FibonacciElement(0, 0, 0));
      }
      
    }
    else
    {
      // Si todavia no ha terminado de dibujar dibuja el siguiente arco
        drawFibonacci(ix,iy,Nesp);
        
    }
}
 // cuando presiona el click del mouse cambia el color de la linea a blanco
 
void mousePressed()
{
   
    frameCount = 0;
    if(t==1)
    {
    stroke(0);
    t=0;
    }
    else
    {
    stroke(255);
    t=1;
    }
    loop();
}
 
 //  define la clase fibonacci y los metodos para llamar las características
class FibonacciElement
{
    float x;
    float y;
    float number;
 
 
    FibonacciElement(float x, float y, float number)
    {
        this.x = x;
        this.y = y;
        this.number = number;
    }
 
 
    float getX()
    {
        return x;  
    }
     
     
    float getY()
    {
        return y;
    }
     
     
    float getNumber()
    {
        return number;
    }
 // dibuja el arco, define el fill, el stroke weight ( linea ) mira en que direccion lo dibuja y lo dibuja.
 
    void show(int direction)
    {
      
        fill(somecolor(), 1);
        strokeWeight(STROKE_WEIGHT);
     // ellipse(x, y, number * ELEMENT_SIZE, number * ELEMENT_SIZE);
         
        strokeWeight(STROKE_WEIGHT);
        switch (direction)
        {
            case DIRECTION_RIGHT:
                arc(x, y,
                    2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE,
                    0, HALF_PI);
            break;
            case DIRECTION_UP:
                arc(x, y + (number * ELEMENT_SIZE),
                    2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE,
                    PI + HALF_PI, TWO_PI);
            break;
            case DIRECTION_LEFT:
                arc(x + (number * ELEMENT_SIZE), y + (number * ELEMENT_SIZE),
                    2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE,
                    PI, PI + HALF_PI);
            break;
            case DIRECTION_DOWN:
                arc(x + (number * ELEMENT_SIZE), y,
                    2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE,
                    HALF_PI, PI);
            break;
            default:
                // NO_DIRECTION
            break;
        }
         
    }
    // Aca  coge el color
}
color somecolor() {

  return goodcolor[int(random(numpal))];
}

void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b,0,0);

  for (int x=0;x<b.width;x++){
    for (int y=0;y<b.height;y++) {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // Añade los colores a la paleta con la que se rellenan los espirales
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        } else {
          break;
        }
      }
      if (random(10000)<100) {
        if (numpal<maxpal) {
          // Añade blanco y negro a la plaeta
          if (random(100)<50) {
            goodcolor[numpal] = #FFFFFF;
            print("w");
          } else {
            goodcolor[numpal] = #000000;
            print("b");
          }
          numpal++;
        }
      }
    }
  }
   background(BACKGROUND_COLOR);

}



// Santiago y Juan Pablo Cortés
// 2012











