
/*Tomas de Camino
para el taller de rogramacion de MDI veritas
Base para armar un automata celular.
*/

//construye el arreglo para el automata celular
int spaceSize = 100;
float rectSize;
int[][] cellSpace = new int[spaceSize][spaceSize];

void setup() {
  size(600, 600);
  //inicializa las celdas
  for (int i =0; i < spaceSize; i++) {
    for (int j =0; j < spaceSize; j++) {
      cellSpace[i][j] = i*j;
    }
  }
  rectSize = width / spaceSize;
  colorMode(HSB, 100*100, 100, 100);
}

void draw() {
  noStroke();
  smooth();
  for (int i =0; i < spaceSize; i++) {
    for (int j =0; j < spaceSize; j++) {
      fill(cellSpace[i][j], 255, 255,150);
      rect(i*rectSize, j*rectSize, rectSize, rectSize);
      fill(cellSpace[spaceSize-i-1][spaceSize-j-1], 255, 255,100);
      rect(i*rectSize, j*rectSize, rectSize, rectSize);
      //para que sea ciclico
      if (cellSpace[i][j]>=10000) {
        cellSpace[i][j]=0;
      } 
      else {
        cellSpace[i][j]+=10;
      }
    }
  }
}

