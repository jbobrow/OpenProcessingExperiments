
int x, y;              //posición de la serpiente en cuadrícula
int gridSize = 20;    //tamaño de la cuadrícula
int gridSizeX = 30;   //elementos horizontales de la cuadrícula
int gridSizeY = 20;   //elementos verticales de la cuadrícula
int dir = 1;          //1==derecha, 2== izquierda, 3==abajo, 4==arriba
int comidaX, comidaY;  //posición de la comida
PImage comida;
int puntos = 1;
int[][] snake = new int[gridSizeX][gridSizeY];
boolean lleno = false;

void setup() {
  //no dynamic size allowed for javascript mode  
  //size(gridSize*gridSizeX, gridSize*gridSizeY);
  size(600, 400);
  frameRate(10);
  ellipseMode(CORNER);
  fill(255);
  //definimos valores iniciales
  x = gridSizeX/2;
  y = gridSizeY/2;
  snake[x][y] = 1;
  comidaX = (int)random(0, gridSizeX-1);
  comidaY = (int)random(0, gridSizeY-1);
  comida = loadImage("apple.png");
}

void draw() {
  background(0);
  
  //moviendo serpiente
  if (dir == 1) x++;
  else if (dir == 2) x--;
  else if (dir == 3) y++;
  else if (dir == 4) y--;
  
  //comprobación si serpiente sale de pantalla
  if (x < 0) x = gridSizeX-1;
  else if (x >= gridSizeX) x = 0;
  else if (y < 0) y = gridSizeY-1;
  else if (y >= gridSizeY) y = 0;
          
  //comiendo la manzana?
  if (x == comidaX && y == comidaY) {
    comidaX = (int)random(0, gridSizeX-1);
    comidaY = (int)random(0, gridSizeY-1);
    puntos++;
    lleno = true;
  }
  
  //choquando consigo mismo
  if (snake[x][y] > 0) {
    text("game over", 300,100);
    noLoop();
  }
  
  //dibujar serpiente
  if (lleno) snake[x][y] = puntos-1;
  else snake[x][y] = puntos;
  
  for (int i=0; i<gridSizeX; i++){
    for (int j=0; j<gridSizeY; j++){
      if (snake[i][j] > 0) {
        rect(i*gridSize, j*gridSize, gridSize, gridSize);
      }
      if (!lleno) snake[i][j]--;
    }
  }
  lleno = false;
  //dibujar comida
  image(comida, comidaX*gridSize-5, comidaY*gridSize-5, gridSize+10, gridSize+10);
  text(puntos,width-20,20);
}

void keyPressed() {
  if (keyCode == LEFT) dir = 2;
  else if (keyCode == RIGHT) dir = 1;
  else if (keyCode == UP) dir = 4;
  else if (keyCode == DOWN) dir = 3;
}



