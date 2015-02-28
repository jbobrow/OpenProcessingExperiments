

/**
 <strong>Helix</strong><br>
 por Herbert Spencer<br>
 e[ad] Escuela de Arquitectura y Diseño<br>
 <br>
 en este ejemplo las rotaciones son acumulativas usando arreglos
 */

int margen = 20;  // margen del dibujo
int esp = 10;     // espaciador
int numElements;  // total de hélices
float[] punto;    // nuevo arreglo para almacenar las rotaciones
int counter = 0;  // contador para recorrer el arreglo de puntos


void setup() {
  size(900, 200);

  /* calcular cuantas hélices existen.
   Como esta variable es un int, los números están cuidadosamente asignados
   para que el resultado no tenga parte decimal */

  numElements = ((width-margen*2)/esp) * ((height-margen*2)/esp);
  // println(numElements); /* para saber el número de elementos */

  // inicializar el arreglo de floats "puntos"
  punto = new float[numElements];
  fill(0);
  stroke(0);
  smooth();
}

void draw() {
  background(255);
  for (int y = margen; y < height-margen; y += esp) {
    for (int x = margen; x < width-margen; x += esp) {
      helix(x, y, counter);
      counter++;
    }
  }
  counter = 0;
}

void helix(int _x, int _y, int rot) {

  // calcula la distancia ente el mouse y las coordenadas de entrada
  float d = dist(mouseX, mouseY, _x, _y); 

  pushMatrix();
  { // resetea el sistema de coordenadas
    translate(_x, _y);

    /* la rotación de cada hélice se incrementa en una
     cantidad proporcional a la distancia 'd' (entre su posición y el mouse)
     acumulando diferencias entre cada una de ellas */

    punto[rot] += d/3000;
    rotate(punto[rot]);

    // el eje
    stroke(0);
    beginShape();
    vertex(-esp/2, 0);
    vertex(0, 1);
    vertex(esp/2, 0);
    vertex(0, -1);
    endShape();
  }
  popMatrix();
}



