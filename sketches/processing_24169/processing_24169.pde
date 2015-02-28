

// Based on "Space Invader - Continuous Movement" by 50ftW & Omykron
// Reminds me of http://www.youtube.com/watch?v=x3ukrhzTh7E

void setup() {
    size(600, 440); // Canvas size (width = 600, height = 600)
    frameRate(8);   // Frames per second (?)
}
  
void draw() {
    background(255);   // Cover with white background
    invader.display(); // Display the invader
    invader.move();    // Move the invader forward
}

Invader invader = new Invader(40, // Length of side of square
    8,  // Width in squares
    7,  // Height in squares
    20, // Speed per frame (in pixels, not squares)
    new String[] { // These are the boxes by color ("no" is transparent)
    "no", "no", "green", "no", "no", "green", "no", "no",
    "no", "yellow", "yellow", "yellow", "yellow", "yellow", "yellow", "no",
    "red", "red", "no", "red", "red", "no", "red", "red",
    "no", "maroon", "maroon", "maroon", "maroon", "maroon", "maroon", "no",
    "no", "no", "blue", "no", "no", "blue", "no", "no",
    "no", "blue2", "no", "blue2", "blue2", "no", "blue2", "no",
    "blue2", "no", "no", "no", "no", "no", "no", "blue2"   });

class ColorRGBA {
    int r, g, b, a;

    ColorRGBA(int r, int g, int b, int a) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }
}
    
class Invader {
 
    int l = 40; // Length of the side of the square
    int x =  0; // Top left corner of invader, x position
    int y =  0; // Top left corner of invader, y position
    
    int h, w, d;

    int x_speed, y_speed; // Speeds for x and y axis

    ColorRGBA[][] squares; // Cubes by color and transparency
 
    HashMap colors;

    void display() {
 
        noStroke(); // No borders
    
        translate(x, y); // Set base coordinates for drawing

        for (int pos_x = 0; pos_x < w; pos_x++) {
            for (int pos_y = 0; pos_y < h; pos_y++) {
                ColorRGBA c = squares[pos_x][pos_y];
                fill(c.r, c.g, c.b, c.a);
                rect(pos_x * l, pos_y * l, l, l);
            }
        }
 
        translate(-x, -y); // Set back to (0,0) for drawing all canvas

        // Now draw a grid
        stroke(205);
 
        for(int i = 0; i < width; i += 20)
            line(i, 0, i, height); // Vertical lines
    
        for(int i = 0; i <= height; i += 20)
            line(0, i, width, i);       // Horizontal lines
 
    }
 
    void move() {
 
        // When reaching horizontal limits, invert x speed
        if (x <= 0 || (x + (w * l)) >= width)
            x_speed = -x_speed; // Invertir velocidad x
 
        // When reaching horizontal limits, invert y speed
        if (y <= 0 || (y + (h * l)) >= height)
            y_speed = -y_speed; // Invertir velocidad x
 
        x = x + x_speed; // Move horizontally (for next frame)
        y = y + y_speed; // Move vertically (for next frame)
 
    }
 
    // Constructor
    Invader(int l, int w, int h, int s, String[] squares) {

        this.l = l; // Largo del lado
        this.w = w; // Ancho (en cubos)
        this.h = h; // Alto (en cubos)
        this.x_speed = -s; // Assign default speed
        this.y_speed = -s; //  use negative to bounce on (0,0)

        // Set up color names  (RGB + opacity)
        colors = new HashMap();
        colors.put("no",     new ColorRGBA(  0,   0,   0,   0)); // 0% opacity
        colors.put("green",  new ColorRGBA( 30, 113,  75, 255));
        colors.put("yellow", new ColorRGBA(252, 226,  23, 255));
        colors.put("red",    new ColorRGBA(255,  22,   5, 255));
        colors.put("maroon", new ColorRGBA(170,  32,  43, 255));
        colors.put("blue",   new ColorRGBA( 69,  71,  88, 255));
        colors.put("blue2",  new ColorRGBA( 67, 168, 229, 255));

        this.squares = new ColorRGBA[w][h]; // [d];
        for (int pos_x = 0; pos_x < w; pos_x++)
            for (int pos_y = 0; pos_y < h; pos_y++)
                this.squares[pos_x][pos_y] =
                    (ColorRGBA) colors.get(squares[pos_x + pos_y * w]);
    
    }
}

