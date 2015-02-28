
// Variables globales
Human player; // player tendrá un datatype de clase Human
Board board; // board tendrá un dataype de clase Board

// Función de configuración
void setup() {
  
  size(400, 400); // Asignamos un tamaño de 400x400 píxeles a nuestro programa
  frameRate(30); // Indicamos que la pantalla se refreque 30 veces por segunda (por defecto es 60)
  smooth(); // Aplicamos el filtro anti-aliasing !!! Cuidado !!! que puede relentizar la máquina
  
  board = new Board(40, 10, 10); // Creamos un tablero de 10x10 casillas (las casillas serán de 40x40 píxeles)
  player = new Human(0, 0, 40); // Creamos el objeto player (jugador) y lo colocaremos en la casilla 0 (0,0)
  
}


// Función principal
void draw() {
  
  board.drawBoard(); // Dibujamos el tablero
  player.drawHuman(); // Llamámos al método de dibujar a nuestro personaje
  
}


// Función que detecta cuanso de pulsa un botón del ratón (cualquier botón)
void mouseClicked() {
  
  player.moveHuman(mouseX, mouseY); // Llamámos al método de desplazar a nuestro personaje
  
}


// Clase Humano
class Human {
  
  // Atributos de la clase
  int posX, posY; // Indicará en que casillas está (no será el valor X e Y del lienzo)
  int sizeSquare; // Para poder ajustar la posición
  
  // Función constructora, que utilizaremos para inicializar los objetos de esta clase
  Human(int x, int y, int sizeSquare) {
    this.posX = x + sizeSquare/2;
    this.posY = y + sizeSquare/2;
    this.sizeSquare = sizeSquare;
  }
  
  // Método (función) de esta clase que se encargará de dibujar por pantalla a nuestro personaje
  void drawHuman() {
    
    // Realizamos varios cambios para dibujar formas
    strokeWeight(2); // Tamaño del borde de las formas dibujadas
    stroke(50, 205, 50); // Color del borde de las formas dibujadas (LimeGreen)
    fill(173, 255, 47); // Color de relleno de las formas dibujadas (GreenYellow)
    ellipse(this.posX, this.posY, 40, 40); // Dibujamos un círculo que será la cara del jugador
    
    noStroke(); // No dibujaremos los bordes de la formas
    fill(0); // Relleno de color negro
    pushMatrix(); // Salvamos la configuración
    translate(-8, -6);
    ellipse(this.posX, this.posY, 8, 8);
    translate(16, 0);
    ellipse(this.posX, this.posY, 8, 8);    
    popMatrix();
    
    noFill(); // No rellenaremos las formas
    strokeWeight(1); // Ancho del borde de las formas de 1 píxel
    stroke(0); // Color negro del borde
    arc(this.posX, this.posY+5, 20, 15, 0, PI); // Con la instrucción de dibujar un arco hacemos la boca
  }
  
  // Método (función) que se encargará de mover al personaje
  void moveHuman(int x, int y) {
    float tempX = x/this.sizeSquare;
    float tempY = y/this.sizeSquare;
    this.posX = floor(tempX) * this.sizeSquare + this.sizeSquare/2;
    this.posY = floor(tempY) * this.sizeSquare + this.sizeSquare/2; 
  }
  
}


class Board {
  
  int squareSize, columns, rows; // Atributos de la clase

  // Función constructora
  Board(int squareSize, int columns, int rows) {
    this.squareSize = squareSize;
    this.columns = columns;
    this.rows = rows;
  }
  
  // Función que dibujará el tablero
  void drawBoard() {
    background(0); // Color del fondo del tablero
    // Configuramos el grosor y color de las líneas de dibujo
    fill(100); // Color de relleno
    strokeWeight(1); // Ancho del borde de las formas de 1 píxel
    stroke(0); // Color negro del borde
    
    // Dibujamos las casillas del interior del tablero
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        rect(x * this.squareSize, y * this.squareSize, this.squareSize, this.squareSize);
      }
    }
  }
  
}
