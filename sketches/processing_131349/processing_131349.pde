
/*
 * Taller Programación MDI Veritas
 * Tarea#1
 * Crear un código donde múltiples círculos (o cualquier otra figura geométrica),
 * se muevan a diferentes velocidades. Cuando cualquier círculo se acerca a otro,
 * a un radio menor predefinido, entonces dibujar una línea entre ambos círculos.
 *
 * Tips: utilizar random() para definir cuanto se mueve un círculo en cada paso.
 * Checkear los bordes para que no se salgan los círculos.
 */

/* 
 * credits:
 * this program is an extension of Tarea1 
 * by Paula Chavarria (http://www.openprocessing.org/user/35857)
 * her program was taken as a base and was modified as needed
 *
 * features added:
 * - multiples shapes (regular polygons inscribed in a circle)
 *   . base shape class, draws every shape from initial center point
 * - shapes with several color themes
 * - shape shows its center
 * - no vertical nor horizontal looping when shapes are moving
 */

/*
 * @author Andres Villalobos
 * @date 2/2/14
 * @version 1.1
 */

// constants
int SCREEN_WIDTH = 1000;
int SCREEN_HEIGHT = 600;
int SHAPES_COUNT = 10;
int TOTAL_DIFFERENT_SHAPES = 4; // circle, square, triangle, hexagon
int NEIGHBOR_DISTANCE = 80;

// global variables
ArrayList<Shape> shapesCollection; // the collection of shapes painted on the canvas
ColorTheme theme; // shapes color theme

void setup() {
  size(1000, 600);
  noCursor();
  smooth();

  // select random color theme
  theme = new ColorTheme();
  int themeNumber = (int)random(0, 8);
  switch(themeNumber) {
  case 0: 
    theme.setDefaultTheme();
    break;
  case 1: 
    theme.setBlueTheme();
    break;
  case 2: 
    theme.setGreenTheme();
    break;
  case 3: 
    theme.setColorFullTheme();
    break;
  case 4:
    theme.setPurpleTheme();
    break;
  case 5: 
    theme.setLimeTheme();
    break;
  case 6:
    theme.setCaribeanTheme();
    break;
  case 7:
    theme.setColdTheme();
    break;
  case 8:
    theme.setAntiqueBlueTheme();
    break;
  default:
    theme.setDefaultTheme();
  }

  // initialize shapes collection
  shapesCollection = new ArrayList<Shape>();

  for (int i = 0; i < SHAPES_COUNT * TOTAL_DIFFERENT_SHAPES; i++) {    
    Shape square = new Square(theme);
    shapesCollection.add(square);

    Shape circle = new Circle(theme);
    shapesCollection.add(circle);

    Shape triangle = new Triangle(theme);
    shapesCollection.add(triangle);

    Shape hexagon = new Hexagon(theme);
    shapesCollection.add(hexagon);
  }
}

void draw() {

  // as we are animating we must clean the canvas background on every update cycle
  background(255);

  // iterates backwards through the shapes collection.
  for (int i = (SHAPES_COUNT * TOTAL_DIFFERENT_SHAPES) - 1; i >= 0; i--) {

    // gets the shape
    Shape shape = shapesCollection.get(i);

    // draws the shape in the canvas
    shape.paint();

    // gets the position from the shape, in order to calculate its distance with his neighbors
    float x1 = shape.centerX;
    float y1 = shape.centerY;

    // iterates backwards through the shape posible neighbors
    for (int j = i - 1; j >= 0 ; j --) {

      // gets the shape posible neighbor
      Shape posibleNeighbor = shapesCollection.get(j);

      // gets the position from the posible neighbor
      float x2 = posibleNeighbor.centerX;
      float y2 = posibleNeighbor.centerY;

      // calculates the distance from the posible neighbor to the shape
      float distance = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));

      // checks if the distance is less or equal to the min distance to be considered a neighbor
      if (distance <= NEIGHBOR_DISTANCE) {
        // as the possible neighbor is actually a neigbor a line should be drawn within the two circles
        stroke(127, 127, 127);
        line(x1, y1, x2, y2);
      }
    }
  }
}


// extends Shape class, calculates radius and defines how to draw itself 
public class Circle extends Shape {

  // constructor
  public Circle() { 
    type = "circle";
    //side  = random(MIN_SIDE, MAX_SIDE); //not needed
    radius = random(MIN_RADIUS, MAX_RADIUS);

    super.Shape();
  }

  public Circle(ColorTheme theme) { 
    type = "circle";
    //side  = random(MIN_SIDE, MAX_SIDE); //not needed
    radius = random(MIN_RADIUS, MAX_RADIUS);
    shapeColor = theme.colorsCollection[(int)random(0, theme.colorsCollection.length)];
    super.Shape();
  }

  // draws the circle on the canvas
  void paint() {
    noStroke();
    fill(shapeColor, 180);
    ellipse(centerX, centerY, radius * 2, radius * 2);

    super.paint();
  }
}

public class ColorTheme {
  // global variables
  color[] colorsCollection;

  // constructor
  ColorTheme() {
    setDefaultTheme();
  }

  void setDefaultTheme() {
    color[] theme = new color[5];
    theme[0] = color(85, 98, 112);
    theme[1] = color(81, 81, 81);    
    theme[2] = color(255, 156, 0);
    theme[3] = color(6, 188, 220);
    theme[4] = color(214, 214, 214);
    colorsCollection = theme;
  }

  void setBlueTheme() {
    color[] theme = new color[5];
    theme[0] = color(73, 168, 200);
    theme[1] = color(30, 138, 174);
    theme[2] = color(1, 102, 144);
    theme[3] = color(0, 57, 109);
    theme[4] = color(26, 0, 42);
    colorsCollection = theme;
  }

  void setGreenTheme() {
    color[] theme = new color[5];
    theme[0] = color(213, 252, 177);
    theme[1] = color(182, 230, 138);
    theme[2] = color(89, 171, 144);
    theme[3] = color(82, 135, 130);
    theme[4] = color(34, 74, 77);
    colorsCollection = theme;
  }

  void setColorFullTheme() {
    color[] theme = new color[12];
    theme[0] = color(226, 3, 46);
    theme[1] = color(173, 26, 140);
    theme[2] = color(100, 38, 144);
    theme[3] = color(86, 74, 159);
    theme[4] = color(46, 115, 174);
    theme[5] = color(118, 198, 189);
    theme[6] = color(46, 166, 81);
    theme[7] = color(171, 209, 62);
    theme[8] = color(249, 244, 40);
    theme[9] = color(245, 183, 42);
    theme[10] = color(236, 136, 46);
    theme[11] = color(230, 86, 46);
    colorsCollection = theme;
  }

  void setPurpleTheme() {
    color[] theme = new color[5];
    theme[0] = color(23, 21, 22);
    theme[1] = color(38, 20, 27);
    theme[2] = color(135, 32, 70);
    theme[3] = color(135, 32, 70);
    theme[4] = color(255, 61, 132);
    colorsCollection = theme;
  }

  void setLimeTheme() {
    color[] theme = new color[5];
    theme[0] = color(176, 211, 110);
    theme[1] = color(139, 232, 190);
    theme[2] = color(59, 95, 79);
    theme[3] = color(229, 226, 71);
    theme[4] = color(237, 174, 66);
    colorsCollection = theme;
  }
  
  void setCaribeanTheme() {
    color[] theme = new color[5];
    theme[0] = color(0, 33, 49);
    theme[1] = color(250, 234, 229);
    theme[2] = color(251, 155, 7);
    theme[3] = color(251, 219, 23);
    theme[4] = color(0, 18, 39);
    colorsCollection = theme;
  }
  
  void setColdTheme() {
    color[] theme = new color[5];
    theme[0] = color(255, 245, 15);
    theme[1] = color(167, 232, 248);
    theme[2] = color(130, 158, 200);
    theme[3] = color(133, 121, 172);
    theme[4] = color(114, 89, 96);
    colorsCollection = theme;
  }
  
  void setAntiqueBlueTheme() {
    color[] theme = new color[5];
    theme[0] = color(231, 32, 27);
    theme[1] = color(55, 77, 90);
    theme[2] = color(119, 148, 152);
    theme[3] = color(152, 183, 178);
    theme[4] = color(216, 255, 229);
    colorsCollection = theme;
  }
}


// extends Shape class, calculates radius and defines how to draw itself
public class Hexagon extends Shape {

  // constructor
  public Hexagon() { 
    type = "hexagon";
    side  = random(MIN_SIDE, MAX_SIDE);    
    radius = side;

    super.Shape();
  }

  public Hexagon(ColorTheme theme) { 
    type = "hexagon";
    side  = random(MIN_SIDE, MAX_SIDE);    
    radius = side;
    shapeColor = theme.colorsCollection[(int)random(0, theme.colorsCollection.length)];
    super.Shape();
  }

  // draws the hexagon on the canvas
  void paint() {
    noStroke();
    fill(shapeColor, 180); 
    float apothem = (side * sqrt(3)) / 2;

    beginShape();
    vertex(centerX - (side / 2), centerY - apothem);
    vertex(centerX + (side / 2), centerY - apothem);
    vertex(centerX + radius, centerY);
    vertex(centerX + (side / 2), centerY + apothem);
    vertex(centerX - (side / 2), centerY + apothem);
    vertex(centerX - radius, centerY);
    endShape();   

    super.paint();
  }
}



// base class that defines a regular polygon inscribed in a circle
// each class that extends Shape class, should define how to paint itself
public abstract class Shape
{
  // constants
  static final float MIN_SIDE = 20.0;
  static final float MAX_SIDE = 100.0;
  static final float MIN_RADIUS = 10.0;
  static final float MAX_RADIUS = 75.0;
  static final float MAX_ANGLE = 360;
  static final float MIN_ANGLE = 0;
  static final float MAX_SPEED = 1.5;
  static final float MIN_SPEED = 0.1;

  // attributes for drawing
  String type;
  float centerX;
  float centerY;
  float radius;
  color shapeColor;
  float side;

  // attributes for moving 
  float speed;
  float angle;
  float deltaX; // the difference from x1 to x2, according to the angle
  float deltaY; // the difference from y1 to y2, according to the angle

  // constructor
  public void Shape() {
    centerX = random(radius, SCREEN_WIDTH - radius);
    centerY = random(radius, SCREEN_HEIGHT - radius);
    angle = random(MIN_ANGLE, MAX_ANGLE);
    speed = random(MIN_SPEED, MAX_SPEED);
    calculateDelta();
  }

  // draw the shape in the canvas
  public void paint()
  {
    // draw shape center point
    fill(127, 127, 127);
    rect(centerX-2, centerY-2, 4, 4);

    // checks if the circle has reached the right or left border
    if (centerX + deltaX > SCREEN_WIDTH - radius || centerX + deltaX < radius) {
      // as a collision is inminent the circle should "bounce", to do so the opposite of the angle (direction) is needed. e.g The opposite of 180 is 0.
      angle = MAX_ANGLE/2 - angle;

      // to avoid vertical or horizontal looping
      if (angle == 0 || angle == 90 || angle == 180 || angle == 270 || angle == 360) {
        angle = random(MIN_ANGLE, MAX_ANGLE);
      }

      calculateDelta();
    } 
    else if (centerY + deltaY > SCREEN_HEIGHT - radius || centerY + deltaY < radius) 
    {
      // as a collision is inminent the circle should "bounce", to do so the opposite of the angle (direction) is needed. e.g The opposite of 90 is 270.
      angle = MAX_ANGLE - angle;

      // to avoid vertical or horizontal looping
      if (angle == 0 || angle == 90 || angle == 180 || angle == 270 || angle == 360) {
        angle = random(MIN_ANGLE, MAX_ANGLE);
      }
      
      calculateDelta();
    }

    // sets the circle's position for the next update
    centerX += deltaX;
    centerY += deltaY;
  }

  // method which calculates the deltas. The shape new position is calculated upon the trigonometric functions.
  void calculateDelta() {
    // calculates the deltas based on the angle, as the angle is based on a clockwise direction the trigonometric functions result are multiplied by -1.
    deltaY = -1 * speed * sin(radians(angle));
    deltaX = -1 * speed * cos(radians(angle));
  }
}


// extends Shape class, calculates radius and defines how to draw itself
public class Square extends Shape {

  // constructor
  public Square() { 
    type = "square";
    side  = random(MIN_SIDE, MAX_SIDE);   
    radius = (side * sqrt(2)) / 2;

    super.Shape();
  }
  
  public Square(ColorTheme theme) { 
    type = "square";
    side  = random(MIN_SIDE, MAX_SIDE);   
    radius = (side * sqrt(2)) / 2;
    shapeColor = theme.colorsCollection[(int)random(0, theme.colorsCollection.length)];
    super.Shape();
  }

  // draws the square on the canvas
  void paint() {
    noStroke();
    fill(shapeColor, 180);
    rect(centerX - (side / 2), centerY - (side / 2), side, side);

    super.paint();
  }
}


// extends Shape class, calculates radius and defines how to draw itself
public class Triangle extends Shape {

  // constructor
  public Triangle() { 
    type = "triangle";
    side  = random(MIN_SIDE, MAX_SIDE);
    float h = sqrt((side * side) - ((side / 2) * (side / 2)));
    radius = (2 * h) / 3;

    super.Shape();
  }

  public Triangle(ColorTheme theme) { 
    type = "triangle";
    side  = random(MIN_SIDE, MAX_SIDE);
    float h = sqrt((side * side) - ((side / 2) * (side / 2)));
    radius = (2 * h) / 3;
    shapeColor = theme.colorsCollection[(int)random(0, theme.colorsCollection.length)];
    super.Shape();
  }

  // draws the triangle on the canvas
  void paint() {
    noStroke();
    fill(shapeColor, 180);

    float apothem = (sqrt(3) / 6 ) * side; 
    triangle (centerX - (side / 2), centerY + apothem, centerX, centerY - radius, centerX + (side /2), centerY + apothem);

    super.paint();
  }
}



