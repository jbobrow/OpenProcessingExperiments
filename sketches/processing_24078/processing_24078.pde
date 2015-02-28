
// Based on "Space Invader - Continuous Movement" by 50ftW & Omykron
// Reminds me of http://www.youtube.com/watch?v=x3ukrhzTh7E

Invader invader; // Declare a global invader object (not yet created)

void setup() {

    size(600, 440); // Canvas size (width = 600, height = 600)
    frameRate(8);   // Frames per second (?)

    invader = new Invader(); // Create invader (define)

}
 
void draw() {

    background(255);   // Cover with white background
    invader.display(); // Display the invader
    invader.move();    // Move the invader forward

}
   
// Esta es la clase que define a los objetos de tipo Invader
class Invader {

    // Variables del objeto
    int l = 40; // lado de cada cuadrado
    int x =  0; // Esquina arriba izquierda posicion X
    int y =  0; // Esquina arriba izquierda posicion y
    // Caso inicial es 0,0 y tiene que rebotar!
    // por eso empieza con velocidad negativa,
    // para que rebote a positiva
    int x_speed = -20; // Velocidad inicial x = -20
    int y_speed = -20; // Velocidad inicial y = -20
    int invader_width  = l * 8; // Ancho total del invader
    int invader_height = l * 7; // Alto total del invader

    // Metodo que imprime al objeto
    void display() {

        noStroke(); // No borders
   
        // Cuadrados verdes arriba
        fill(30, 113, 75); // ej x inicial 120 y inicial 40
        rect(x + (2 * l), y, l, l);
        rect(x + (5 * l), y, l, l);

        // Rectangulo amarillo largo (ancho 6l)
        fill(252, 226, 23);
        rect(x + l, y + l, l * 6, l);

        // Rectangulos rojos (ancho 2l)
        fill(255, 22, 5);
        rect(x, y + l * 2, l * 2, l);
        rect(x + (3 * l), y + l * 2, l * 2, l);
        rect(x + (6 * l), y + l * 2, l * 2, l);

        // Rectangulo bordo (ancho 6l)
        fill(170, 32, 43);
        rect(x + l, y + l * 3, l * 6, l);

        // Rectangulos azules
        fill(69, 71, 88);
        rect(x + (2 * l), y + l * 4, l, l);
        rect(x + (5 * l), y + l * 4, l, l);

        // Cuadrados celestes abajo
        fill(67, 168, 229);
        rect(x + l, y + l * 5, l, l);
        rect(x + (3 * l), y + l * 5, l * 2, l); // Ancho 2l
        rect(x + (6 * l), y + l * 5, l, l);
        rect(x, y + l * 6, l, l);
        rect(x + (7 * l), y + l * 6, l, l);

        // Dibujar cuadrilla del fondo
        stroke(205);

        for(int i = 0; i < width; i += 20)
            line(i, 0, i, height + 20);
   
        for(int i = 0; i <= height; i += 20)
            line(0, i, width, i);

    }

    // Metodo que mueve al objeto
    void move() {

        // Si llego al limite X, invertir velocidad x
        if (x == 0 || (x + invader_width) == width)
            x_speed = -x_speed; // Invertir velocidad x

        // Si llego al borde de y, invertir velocidad y
        if (y == 0 || (y + invader_height) == height)
            y_speed = -y_speed; // Invertir velocidad x

        x = x + x_speed;
        y = y + y_speed;

    }

    Invader() {} // Constructor

}
 
// basado en SpaceInvaders http://www.flickr.com/photos/50ftw/5230871540/   

