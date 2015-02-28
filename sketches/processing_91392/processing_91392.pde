
class estrella

{
  float posx;
  float posy;
  int velx;
  int vely;
  color relleno;
  
  //   Metodos constructores
  // como crear una nueva estrella
  
  estrella()
  {
   posx = random(0, width);
   posy = random(0, height);
   velx = 3;
   vely = 3;
   relleno = color(255,255,0);
   
  }

  void pintar()
 {
  stroke(0);
  fill(relleno);

  beginShape();
  vertex(posx, posy - 20);
  vertex(posx + 20, posy -20);
  vertex(posx + 30, posy -40);
  vertex(posx + 40,posy - 20);
  vertex(posx + 60,posy - 20);
  vertex(posx + 47,posy - 2);
  vertex(posx + 55,posy + 20);
  vertex(posx + 30,posy + 10);
  vertex(posx + 8,posy + 21);
  vertex(posx + 10,posy - 3);
  endShape(CLOSE);
  
  fill(0);
  ellipse(posx + 25, posy - 10, 3, 15);
  ellipse(posx+35, posy - 10, 3, 15);
  }

 void mover()
 {
  posx = posx + velx;
  posy = posy + vely;
  
  
  if(posx > width)
  {
  velx = -3;
  }
  
  if(posx < 0)
  {
  velx = 3;
  }
  if(posy > height)
  {
  vely = -3;
  }
  if(posy < 0)
  {
  vely = 3;
  }
 }
}

class Tortuga 
{
  //--------------------------------------------------------------
  // Atributos
  //--------------------------------------------------------------

  float x;
  float y;
  float vel;

  //--------------------------------------------------------------
  // Método Constructor
  //--------------------------------------------------------------

  /**
   * Método construtor de la clase
   * Inicializa los atributos del objeto
   */
  Tortuga()
  {
    y=random (height);
    x=random (width);
    vel=0.5;
  }

  //--------------------------------------------------------------
  // Métodos
  //--------------------------------------------------------------

  /**
   * Dibuja la tortuga en su posición X y Y
   */
  void dibujame ()
  {
    smooth();

    //TORTUGA
    //Caparazón
    fill (80,115,24); 
    noStroke();   
    arc(x, y, 80, 80, TWO_PI-PI, TWO_PI);
    fill (229,192,23);
    rect (x-32,y-22,15,15);
    rect (x+18,y-22,15,15);
    rect (x-15,y-33,30,30);

    //Cabeza
    fill (0,255,0);
    arc(x+50, y, 20, 20, TWO_PI-PI, TWO_PI);

    //Ojo
    stroke(80,115,24);
    strokeWeight(2);
    line (x+48,y-5,x+51,y-8);

    //Patas
    noStroke();
    triangle (x+30,y,x+40,y,x+30,y+10);
    triangle (x-30,y,x-40,y,x-40,y+10);

    //CUERDA
    beginShape();
    noFill();
    stroke (255);
    strokeWeight(2);
    vertex(x+30, y+10);
    bezierVertex(x+20,y+50, x-10, y+100, x-100, height-10);
    endShape();

    //CARACOL
    //Caparazón
    fill (255,0,0);
    strokeWeight(1);
    stroke(255);
    ellipse (x-130, height-28, 40,40);
    ellipse (x-130, height-28, 30,30);
    ellipse (x-130, height-28, 20,20);
    ellipse (x-130, height- 28, 10,10);

    //Ruedas
    noStroke();
    fill(0);
    ellipse (x-115, height-5, 5,5);
    ellipse (x-145, height-5, 5,5);

    //Cuerpo
    fill(100);
    noStroke ();
    beginShape();
    vertex(x-100, height-10);
    bezierVertex(x-130,height-15, x-130, height-15, x-160, height-10);
    bezierVertex(x-160, height-10, x-130, height, x-100, height-10);
    endShape();

    //Ojos
    noFill();
    stroke (0);
    strokeWeight(1);
    line (x-108, height-12, x-101, height-20);
    line (x-108, height-12, x-108, height-20);
    ellipse(x-101, height-20,2,2);
    ellipse(x-108, height-20,2,2);
  }
  
  /**
   * Método que hace que la tortuga nade
   */
  void nadar( )
  {
    //Cambio de la posición
    x=x+vel;

    // Cambio de posición de la tortuga si sale de la ventana
    if ((x-100)>=width)
    {
      x=0;
      y=random (height);
    }
  }
}

class Rana


{
  
  PImage s;
  float posx;
  float posy;
  float vely;
  
 Rana()
  
  {
  s = loadImage("sapo.png");
  posx = random(0, width);
  posy = random (300, 600);
  vely = 5;
  }

void dibujame() 
  {
    image(s, posx, posy, 240, 250);
  }

void moverme()

{
   posy = posy + vely;
  
  if (posy < 200)
  {
    vely = 5;
  }
  if (posy > 300)
  {
    vely = -5;
  }
}
}

class Pelota

{

float x;
  float y;
  float vel;
  PImage s;
  int counter = 0;
  int velocidad = 1;
  int centroX, centroY;
  float rotacion;
  float posx;
float posy;



  //--------------------------------------------------------------
  // Método Constructor
  //--------------------------------------------------------------

  /**
   * Método construtor de la clase
   * Inicializa los atributos del objeto
   */
  Pelota()
  {
    y=random (height);
    x=random (width);
    
    vel=0.5;
  }

  //--------------------------------------------------------------
  // Métodos
  //--------------------------------------------------------------

  /**
   * Dibuja la tortuga en su posición X y Y
   */
  void dibujame ()
  {
    smooth();
    s = loadImage("pelotita.png");
     translate(posx, posy);
   rotacion = (rotacion+0.03) % 2;
   rotate(PI*rotacion);
    counter = counter + 5;
    image(s, x, y, 100, 100);
  }
  
  void miRotateX(float r)
  {
    
  }

  /**
   * Método que hace que la tortuga nade
   */
  void nadar( )
  {
    //Cambio de la posición
    x=x+vel;

    // Cambio de posición de la tortuga si sale de la ventana
    if ((x-200)>=width)
    {
      x=-100;
      y=random (height);
    }
  }
}

class Caballito 
{
  //--------------------------------------------------------------
  // Atributos
  //--------------------------------------------------------------

  // TODO: Declarar el atributo posición en x (tipo float)
  float x;

  // TODO: Declarar el atributo posición en y (tipo float)
  float y;

  // TODO: Declarar el atributo velocidad (tipo float)
  float velo;

  // TODO: Declarar el atributo aceleración (tipo float)
  float acel;
  // Tamaño del caballito
  float tamano;

  //--------------------------------------------------------------
  // Método Constructor
  //--------------------------------------------------------------

  /**
   * Método construtor de la clase
   * Inicializa los atributos del objeto
   */
  Caballito ()
  {
    // TODO: Inicializar la posición y en un valor aleatorio dentro de la composición
      
    y = random(0, height);
    
    // TODO: Inicializar la posición x en un valor aleatorio dentro de la composición
    x = random(0, width);
    // TODO: Inicializar la velocidad en -0.5
    velo = -0.5;

    // TODO: Inicializar la aceleración en -0.02
    acel = -0.02;
    
    tamano=random(1,3);
  }

  //--------------------------------------------------------------
  // Métodos
  //--------------------------------------------------------------

  /**
   * Dibuja el caballito en su posición X y Y
   */
  void dibujame()
  {
    //cabecita
    strokeCap(ROUND);
    fill (245,234,140);
    noStroke();
    triangle (x-(25*tamano),y, x,y-(15*tamano), x,y);

    //cuerpo
    stroke (151,117,92);
    strokeWeight (3.3*tamano);
    line (x, y, x+(10*tamano),y+(30*tamano));

    //correa
    strokeCap(SQUARE);
    stroke (242,81,49);
    strokeWeight (2.5*tamano);
    line (x-(15*tamano), y,x-(18*tamano), y-(4*tamano));
    line (x-(1*tamano),y-(11*tamano),x-(5*tamano),y-(14*tamano));
    line (x-(15*tamano), y,x,y-(10*tamano));

    //ojo
    smooth();
    fill (0);
    noStroke();
    ellipse (x-(10*tamano),y-(7*tamano),(1.5*tamano),(1.5*tamano));

    //aleta
    fill (245,234,140, 150);
    noStroke();
    triangle (x+(3*tamano),y+(8*tamano), x+(5*tamano),y+(2*tamano), x+(9*tamano), y+(11*tamano));

    //crin
    strokeCap(SQUARE);
    stroke (193,164,52);
    strokeWeight (2*tamano);
    line (x,y,x, y-(15*tamano));
  }

  /**
   * Modifica la posición del caballito
   */
  void nadar()
  {
    // TODO: Sumarle a la posición en x la velocidad
     x = x + velo;

    // TODO: Sumarle a la velocidad, la aceleración.
    
    velo = velo + acel;

    //TODO: Cuando el caballito salga de la ventana, reiniciar la posición en x en width y la
    //      velocidad en -0.5.
    

  if(x <= -100)
  {
  x = width + 100;  
  velo = 0.5;
  }
 
  }
  }

class Burbuja 
{  
  //--------------------------------------------------------------
  // Atributos
  //--------------------------------------------------------------

  // TODO: Declarar el atributo posición en x (tipo float)
  float posx;
 

  float posy;
  
  
  float velo;
  // Diámetro
  float diametro;
  // Aceleración
  float acel;
  // Alfa
  float alfa;

  //--------------------------------------------------------------
  // Método Constructor
  //--------------------------------------------------------------

  /**
   * Método construtor de la clase
   * Inicializa los atributos del objeto
   */
  Burbuja ()
  {
    // TODO: Inicializar la posición y en height
    
    posy = random (0, height);
    
    // TODO: Inicializar la posición x en un valor aleatorio
    posx = random (0, width);
    
    // TODO: Inicializar la velocidad en -0.5
    
    velo = -0.5;

    // TODO: Inicializar el diametro en un aleatorio entre 15 y 80
    
    diametro = random (15 ,80);
    
    // TODO: Inicializar la aceleración en -0.02
    
    acel = -0.02;
    
    alfa =random(50,200);
  }

  //--------------------------------------------------------------
  // Métodos
  //--------------------------------------------------------------

  /**
   * Dibuja la burbuja en su posición X y Y
   
   */
  void dibujame()
  {
    // TODO: Pintar la burbuja según los atributos y los colores que deseen. Hay que utilizar transparencia.
   stroke(0);
   fill(255, 255, 255, alfa);
   ellipse(posx, posy, diametro, diametro);
    
  }

  /**
   * Modifica la posición de la burbuja
   */
  void flotar ()
  {
    // TODO: Sumarle a la posición en y la velocidad
    posy = posy + velo;
    // TODO: Sumarle a la velocidad, la aceleración.
    velo = velo + acel;
    
    float probabilidad = random (0,10);
    
    if(probabilidad <= 5)
    {
      
    acel = acel -0.01;
    
    }
    
    
    //TODO: Cuando la burbuja salga de la ventana, reiniciar la posición en y en height y la
    //      velocidad en -0.5.
   

    if(posy <= 0)
    {
      
    posy=height;
    posx= random(width);
    velo = -0.5;
    acel = -0.02;
    }
  
  }
}

Tortuga tortuga;

// TODO: Declarar la burbuja
Burbuja[] burbujas;
int numeroBurbujas;

PImage imgfondo;



// Burbuja burbuja1;
//Burbuja burbuja2;
//Burbuja burbuja3;
//Burbuja burbuja4;
//Burbuja burbuja5;
//Burbuja burbuja6;
// TODO: Declarar el caballito
Caballito caballito;
// Todo: declarar estrella
 estrella estrella;
 
 Rana rana;
 Pelota pelota;
 
//--------------------------------------------------------------
// Métodos
//--------------------------------------------------------------

/**
 * Configuración inicial del proyecto.
 * Definición del tamaño y color de fondo de la ventana.
 * Inicialización de variables.
 */
void setup()
{
  size (500,500);
  background (77,198,226);

  //TODO: Inicializa la tortuga
  tortuga = new Tortuga();
  
  //TODO: Inicializa la burbuja
  numeroBurbujas = 10;
  burbujas = new Burbuja[numeroBurbujas];
  
  // poner imagen de fondo
  
  imgfondo = loadImage("fondoprueba.jpeg");
  
  int i = 0;
  
  while (i < numeroBurbujas)
  {
  burbujas[i] = new Burbuja();
  i = i +1;
  }
 // burbujas[0] = new Burbuja();
  //burbujas[1] = new Burbuja();
//  burbujas[2] = new Burbuja();
//  burbujas[3] = new Burbuja();
//  burbujas[4] = new Burbuja();
//  burbujas[5] = new Burbuja();
//  burbujas[6] = new Burbuja();
//  burbujas[7] = new Burbuja();
//  burbujas[8] = new Burbuja();
//  burbujas[9] = new Burbuja();
  
  

  
  //TODO: Inicializa el caballito
  caballito = new Caballito();
  // TODO: Inicia la estrella
  estrella = new estrella();
  
  rana = new Rana();
  
  pelota = new Pelota();
 
}


void draw ()
{
 
  
 image (imgfondo, 0, 0, width, height);
 
 int i = 0; 
 while (i< numeroBurbujas)
 {
 burbujas[i].dibujame();
 burbujas[i].flotar();
 
 i = i + 1;
 // i++;
 }

  tortuga.dibujame();
  tortuga.nadar();
 
  caballito.dibujame();
  caballito.nadar();
  
  estrella.pintar();
  estrella.mover();
  
  rana.dibujame();
  rana.moverme();
  
  pelota.dibujame();
  pelota.nadar();

}



