
/** AntoniaCasali_PROYECTO_LCO_25_08_09
Este Sketch está basado en la función de movimientos de "Splouch" de GrgrDvrt (http://www.rmx.cz/monsters/2009-08/splouch/index.html) 
tambien se puede encontrar como usuario en openProcessing/
Hilos que se mueven siguiendo el mouse y cambian su dirección al hacer click. Al cambiar los movimientos en 
los ejes vectoriales los hilos crean un efecto tridimensional. Los colores, sencillos, permiten ver el movimiento
de los hilos que se enredan en su delgadez a propósito de los tirones del mouse. 
Complementé el sketch con música de AIR. //(Cosa que se puede ver teniendo el archivo que enviaré adjunto)// pero
a la vez también funciona por si sólo. 
This sketch is based on a function of moves of "Splouch" from GrgrDvrt (http://www.rmx.cz/monsters/2009-08/splouch/index.html) 
(you can also find it as a user on openProcessing)/ 
Threads that move within the surface chasing the mouse and changing direcctions by clicking. By changing the movements of the x and y 
vectors a 3D visual effect is created. The simplicity of colors makes the effect works better in order to see the 
threads combine with each other. I Complemented this Sketch with some "AIR" music, wich works having the file (setting it: groove.mp3 in the data folder of the file); But
it works perfectly well without it. */




//import ddf.minim.*;
//Minim minim;
//AudioPlayer groove; //Audio: MIKE_MILLS "AIR" talkie walkie 

int nCintas = 40;//Numero de cintas o hilos
Cintas[] Cintas; //arreglo de objetos (declarado antes de ejecutarse)

int stw = 250; //ubicación de las x y las y
int sth = 250;

void setup()
{
  size(1000, 400,P2D);
  //minim = new Minim (this); //MUSICA que dejo como comentada. En el caso de que se quiera recurrir a un archivo este debe tener el nombre de groove.mp3 y estar en la carpeta data del sketch y ser quitados los // de comentarios
  //groove= minim.loadFile ("groove.mp3", 512);
  //groove.loop();
  
  smooth();
  Cintas = new Cintas[nCintas]; //arreglo de objetos
  for(int i = 0; i < nCintas; i++)
  {
    Cintas[i] = new Cintas(stw / 2, sth / 2, (mouseX - stw / 2) / 100, (mouseY - sth / 2) / 100, 35.0 + 1.0); 
  }
} 

void draw()
{
  background (#AD9F83);
  for(int i = 0; i < nCintas; i++) Cintas[i].update(); //ciclo for que actualiza las cintas si el numero es menor a un n de citas se le agregan dos
}

void mousePressed() //función mouse interactiva
{
  for(int i = 0; i < nCintas; i++) Cintas[i].salto = !Cintas[i].salto;
}



// inicializacion del Objeto y sus caracteristicas (arbitrarios)
class Cintas
{
  
  public float x;
  public float y;
  public float vx;
  public float vy;
 private CintasPoint[] pts;
  public float life;
  public boolean dir = true; //booleano verdadero o falso
  public boolean salto = true;

  
  Cintas(float x, float y, float vx, float vy, float life)
  {
    init(x, y, vx, vy, life); //objeto comienza a ejecutarse Y TIENE VIDA!!
  }
  
  private void init(float x, float y, float vx, float vy, float life)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.life = life;
    pts = new CintasPoint[0]; // incia objeto puntos que hacen las linea
    dir = true;
  }
  
  public void update()
  {
    if (dir) pts = (CintasPoint[])append(pts, new CintasPoint(x, y, 0, 0));
    else pts = (CintasPoint[])shorten(pts); // funcion proposicional logica se acorta o se alarga 
    move();
    int nPts = pts.length;
    for(int i = nPts - 1; i >=0 ; i--)
    {
      float r = (float)i / nPts;
      smooth();
      fill (0,0,0,0);
      strokeWeight (random(0.1,0.2));
      smooth();
      pts[i].move(mouseX, mouseY, r, salto); // Las cintas se mueven segun el mouse 
      line(pts[min(i + 1, nPts - 1)].x, pts[min(i + 1, nPts - 1)].y, pts[i].x, pts[i].y);
    }
    
    life -= -20.5;
    if (life <= 0 && dir) dir = false;
    else if (!dir && pts.length <=7) init(pts[0].x, pts[0].y, pts[0].vx, pts[0].vy, 35.0 + random(15.0));
  }
  
  private void move() // movimiento de las cintas (velocidad)
  {
    vx += random(-2.0, 2) + (mouseX - stw/2.0) / 2000.0;
    vy += random(-2.0, 2) + (mouseY - sth/2.0) / 2000.0;
    vx *= 0.95;
    vy *=0.95;
    x += vx;
    y += vy;
  }
  
}
class CintasPoint //donde parte la cinta
{
  
  public float x;
  public float y;
  public float vx;
  public float vy;
  
  
  CintasPoint(float x, float y, float vx, float vy) // caracteristicas this. para no confundir esta x con otro caracter. 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  
  public void move(float tx, float ty, float r, boolean salto) // funcion movimiento que permite que se mueva (calculo)
  {
    vx += (salto ? r : 1 - r) * (tx - x) / 100;
    vy += (salto ? r : 1 - r) * (ty - y) / 1500;
    vx *= 0.95;
    vy *= 0.95;
    x += vx;
    y += vy;
  }
} 

//void stop () 
//{groove.close ();
//minim.stop();
//super.stop();
//} //MUSICA. LEER INSTRUCCIONES AL PRINCIPIO


