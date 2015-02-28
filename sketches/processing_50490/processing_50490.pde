
String [] lineas;
Palabra [] listaPalabras;
int indexLinea = 0;
int indexPalabra = 0;
int contadorPalabras = 0;
int totalPalabras = 0;
void setup() {
  size(800, 600);
  background(0);
  smooth();
  frameRate(30);
  lineas = loadStrings("wired.txt");
  for (int i = 0; i< lineas.length; i++) {
    String[] palabras = lineas [i].split(" "); //separa las palabras
    for (int j = 0; j< palabras.length; j++) {
      println(palabras[j]); // se recorrio palabras de cada linea cada palabra
      totalPalabras++; // se anade contador para saber cuantas palabras se tenian
    }
  }
  listaPalabras = new Palabra[totalPalabras]; //lista objetos palabra, clase ya creado, se inicio la lista con new
  println(totalPalabras);
}
void draw () {
  fill(0, 100);
  stroke(0);
  rect(0, 0, width, height);
  fill(255);
  if (contadorPalabras < totalPalabras) {  //para no pasarse del limite de palabras
    String[] palabras = lineas [indexLinea].split("");
    if (palabras.length > 0) { // crea nuevo objeto a partir de este contador 
      String palabra = palabras[indexPalabra];
      listaPalabras[contadorPalabras] = new Palabra(palabra);
      //text(palabra, width/2, height/2);
      if (indexPalabra < palabras.length-1) {
        indexPalabra++;
      }
      else {
        // println()
        indexPalabra = 0;
        indexLinea ++;
      }
      contadorPalabras++;
    }
    else {
      indexLinea ++;
    }
  }
  for (int i = 0; i<contadorPalabras-1; i++) {
    listaPalabras[i].mover();
    listaPalabras[i].dibujar();
  }
}
class Palabra {
  float x, y, xVel, yVel;
  String palabra;
  int magnet = 1500;
  float t = 0;
  float incremento = random(1)/3;
  float rad = random(20, 100);
  float xInic = width/2;
  float yInic = height / 2;
  Palabra(String palabra) {
    this.palabra = palabra;
    this.x= width / 2;
    this.y =height / 2;
  }
  void mover() {
    float forcex = 0;
    float forcey = 0;
    float x0 = x;
    float y0 = y;
    float x1 = mouseX;
    float y1 = mouseY ;
    float distX = x1-x0;
    float distY = y1-y0;
    //float distancia = sqrt((distX * distX) + (distY * distY));
    float distancia = dist(x0, y0, x1, y1);
    t += incremento;
    float tx = sin(t/20)*rad;
    float ty = sin(t/10)*rad;
    float powerx = x-(distX/distancia)*magnet/distancia;
    float powery = y-(distY/distancia)*magnet/distancia;
    forcex += ((xInic-x0)/2)/1.66;
    forcey += ((yInic-y0)/2)/1.66;
    x = powerx+forcex+tx;
    y = powery+forcey+ty;
  }
  void dibujar() {
    stroke(255);
    textAlign(CENTER, CENTER);
    text(palabra, x, y);
  }
}


