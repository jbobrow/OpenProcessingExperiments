
String[] imFiles = {"fondo.png", "manzana.png", "newton1.png", "newton2.png"};
PImage[] im = new PImage[4];
  
int nX = 0;      // Coordenada X, Newton
int nY = 0;      // Coordenada Y, Newton
float mY = 0;    // Coordenada Y, manzanas
int mX = 15;     // Coordenada X, manzanas
float mV = 0;    // Velocidad Y, manzanas
float mA = 0.05; // Aceleracion Y, manzanas
int p = 0;       // Puntos conseguidos
boolean pCount = true;  // Almacena si se pueden contar puntos o no
long t = 0;      // Almacena el tiempo 
  
void setup() {
  size(400, 400);  
  nY = height - 135; 
  t = millis();  
   
  // Carga las imagenes
  for(int i = 0; i < 4; i = i + 1) {
    im[i] = loadImage(imFiles[i]);
  }
}
 
void draw() {
  background(200);
  image(im[0], 0, 0, width, height);  // Imagen de fondo
   
  // Movimiento de la manzana
  mV = mV + mA;  
  mY = mY + mV;  
  if (mY > height) {
    mY = 15;    
    mX = int(random(width - 20)); 
    mV = 0;   
    pCount = true;  // Al lanzar una nueva manzana, se podran volver a contar puntos
  }
   
  fill(255);  
   
  // Deteccion de la colision
  if (mY + 50 > nY && mY < nY + 135) {  
    if (mX + 40 > nX && mX < nX + 128) { 
      fill(255, 0, 0);  
      // Si hay colision, incrementa un punto
      if (pCount) p = p + 1;
      pCount = false;  // En cualquier caso, cada vez que se entre 
                       // aqui, ya no se pueden contar puntos
    } 
  }
 
  image(im[1], mX, mY);  // Manzana
  if(pCount) {
    image(im[2], nX, nY);  // Newton buscando manzanas
  } else {
    image(im[3], nX, nY);  // Newton alcanzo una manzana
  } 
   
  // Contabilizacion del tiempo
  float timer = (millis() - t) / 1000;  
 
  // Fin del juego (GAME OVER)
  if (timer >= 30) {  
    noLoop();
  }
 
  // Muestra el tiempo en la pantalla
  fill(0);
  textSize(20);  // Incrementa el tamaño de la fuente de texto
  text("Tiempo: " + (30 - timer), 10, 25);
 
  // Muestra los puntos en pantalla
  fill(0);  
  textSize(20);
  text("Manzanazos: " + p, 3 * width / 5, 25); 
}
 
void keyPressed() {
  // Incrementa las coordenadas en 3 unidades
  if (keyCode == RIGHT) {
    nX = nX + 3;
  }
  // Decrementa las coordenadas en 3 unidades
  if (keyCode == LEFT) {
    nX = nX - 3;
  }
  // Limita el valor de la coordenada X
  if (nX < 0) {
    nX = 0;
  }
  if (nX > width - 20) {  
    nX = width - 20;
  }
}
