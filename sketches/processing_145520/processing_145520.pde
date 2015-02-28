
/*
 * Taller Programación MDI Veritas
 * Tarea #1
 * Crear un código donde múltiples círculos (o cualquier otra figura geométrica),
 * se muevan a diferentes velocidades. Cuando cualquier círculo se acerca a otro,
 * a un radio menor predefinido, entonces dibujar una línea entre ambos círculos.
 *
 * Tips: utilizar random() para definir cuanto se mueve un círculo en cada paso.
 * Checkear los bordes para que no se salgan los círculos.
 *
 */
 
/*
 * Credits:
 * this program is an extension of Tarea1
 * by Mauricio Varela (http://www.openprocessing.org/sketch/131324).
 *
 * His program was taken as a base and was modified as needed.
 *
 * features added:
 * - 3D shapes used.
 * - Different colors
 *
 */
 
/**
 * main program file
 *
 * @author Eric Marin
 * @date 21/4/14
 * @version 1.0
 */
 
int minX, minY, maxX, maxY;
int shapeRadius = 30;
int shapeQty = 30;
 
float distanceToDrawLine = 100;
float [][] shapes = new float[shapeQty][2];
int [] shapeColors = new color[4];
int [] shapeAngle = new int[shapeQty];
float[] shapeSpeed = new float[shapeQty];
 
float randomX, randomY;
 
void setup() {
  size(960, 640, P3D);
  colorMode(RGB, 255);
  smooth();
  lights();
  
  //set the min and max values for positioning the shapes
  minX = 0;//shapeRadius;
  minY = 0;//shapeRadius;
  maxX = width;
  maxY = height;
 
  for (int i=0; i < shapeQty; i++) {
    //initial shape positions
    //random between min and max to respect the borders
    shapes[i][0]=random(minX, maxX);
    shapes[i][1]=random(minY, maxY);
 
    /*shape colors, are always random
     *maximum value for rgb colors is 255, but will make the clearest color grayish
     *since i am using a white background
     */
    shapeColors[0] = color(240, 240, 240, 255); //white
    shapeColors[1] = color(240, 10, 10, 255); //red
    shapeColors[2] = color(10, 240, 10, 255); //green
    shapeColors[3] = color(10, 10, 240, 255); //blue
 
    //sets an angle (direction for the shape)
    shapeAngle[i] = (int)random(0, 360);
     
    //sets shape speed
    shapeSpeed[i] = random(0.5,5);
  }
}
 
void draw() {
  boolean willCalculateNextX;
  boolean willCalculateNextY;
  float nextX;
  float nextY;
 
  background(0);
  noStroke();
 
  randomX = random(0, 2);
  randomY = random(0, 2);
 
  //shapes must move randomly
  for (int i = 0; i < shapeQty; i++) {
 
    //draw shapes at their starting point
    stroke(shapeColors[(int)random(0, 3)]);
    //fill(shapeColors[i][0], shapeColors[i][1], shapeColors[i][2], shapeColors[i][3]);
    
    pushMatrix();
    translate(shapes[i][0], shapes[i][1], 0);
    sphere(shapeRadius);
    popMatrix();
 
    //calculate next coordinates
    nextX = CalculateNextX(shapes[i][0], shapeAngle[i], shapeSpeed[i]);
    nextY = CalculateNextY(shapes[i][1], shapeAngle[i], shapeSpeed[i]);
     
    //handles bounces in X axis
    if ((nextX+shapes[i][0] <= minX) || (nextX+shapes[i][0] >= maxX)) {
      shapeAngle[i]= 180 - shapeAngle[i];
      nextX = CalculateNextX(shapes[i][0], shapeAngle[i], shapeSpeed[i]);
      nextY = CalculateNextY(shapes[i][1], shapeAngle[i], shapeSpeed[i]);
    }
    //handles bouncing in Y axis
    else if ((nextY+shapes[i][1] <= minY) || (nextY+shapes[i][1] >= maxY)) {
      shapeAngle[i]= 360 - shapeAngle[i];
      nextX = CalculateNextX(shapes[i][0], shapeAngle[i], shapeSpeed[i]);
      nextY = CalculateNextY(shapes[i][1], shapeAngle[i], shapeSpeed[i]);
    }
 
    shapes[i][0]+= nextX;
    shapes[i][1]+= nextY;
 
    for (int j=0; j < shapeQty; j++) {
      float currentDistance = sqrt(sq(shapes[j][0]-shapes[i][0])+sq(shapes[j][1]-shapes[i][1]));
      if (currentDistance < distanceToDrawLine) {
        stroke(shapeColors[(int)random(0, 3)]);
        line(shapes[i][0], shapes[i][1], shapes[j][0], shapes[j][1]);
      }
    }
  }
}
 
 
float CalculateNextX(float x, float angle, float speed) {
  return  -1 * speed * cos(radians(angle));
}
 
float CalculateNextY(float y, float angle, float speed) {
  return  -1 * speed * sin(radians(angle));
}

