

// variable
int diam = 10; // diametro
float centX; // tamaño de la ellipse
float centY; // tamaño de la ellipse
 float posicion = 0.0;
 int pos = 2;
int bajacolor = 255;
int posicionn = 0;

void setup() {
  size(500,400);
  frameRate(24);
  smooth(); //suavizado
  background(180);
  centX = width/2; // ancho dividido por dos valor 250
  centY = height/2; // alto dividido por dos valor 150
  
  
  noFill(); // sin relleno
}

//frame loop
// si diam es menor o igual a 400 pasa algo
void draw() {
  if (diam <= 400) { // condicional
  //background(180);
  // dibuja ellipse
  stroke (random(200),random(50), random(30), random(255)); 
  strokeWeight(random(10));
  ellipse(centX, centY, diam, diam);
  // suma al diametro 10 pixeles
  
  diam += 10;
}
  
  else if (diam> 400) {
    
    posicion = posicion + 0.1;
  float n = noise(posicion) *height;
  strokeWeight(10);
  stroke(random(50), random(30), random(200), 30);
  line (n, 0, 50, 400);
  line (n, 0, 450, 400);
  line (450, 0, n, 400);
  line (50, 0, n, 400);
  
       posicionn++; // aumenta posicion en 1 en cada refresh de draw
       stroke(random(100), random(200), random(100), 25);
  line(posicionn, 20, posicionn, 80); // int x aumenta en 1 por posicion
  line (20, posicionn, 80, posicionn); // int y aumenta en 1 por posicion
  line (480,posicionn, 420, posicionn);
  line (posicionn,320, posicionn,380);
  
  if (posicionn > width) { // si variable posicion es mayor que ancho del sketch
    posicionn = 0;


  }
    }
}


