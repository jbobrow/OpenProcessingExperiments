
/*Tarea 1
 Crear un código donde múltiples círculos (o cualquier otra figura geométrica),
 se muevan a diferentes velocidades. 
 
 Cuando cualquier círculo se acerca a otro, a un radio menor predefinido, 
 entonces dibujar una línea entre ambos círculos.
 
 Tips: utilizar random() para definir cuanto se mueve un círculo en cada paso. 
 Checkear los bordes para que n se salgan los círculos*/

int minX, minY, maxX, maxY;
int shapeRadius = 100;
int shapeQty = 50;

float distanceToDrawLine = 50;
float [][] shapes = new float[shapeQty][2];
int [][] shapeColors = new int[shapeQty][4];
int [] shapeAngle = new int[shapeQty];
float[] shapeSpeed = new float[shapeQty];

float randomX, randomY;

void setup() {
  size(600, 600);
  colorMode(RGB, 255);
  //noCursor();
  smooth();
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
    shapeColors[i][0] = (int)random(240);//red
    shapeColors[i][1] = (int)random(240);//green
    shapeColors[i][2] = (int)random(240);//blue
    shapeColors[i][3] = (int)random(20, 100);//alpha

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
    stroke(shapeColors[i][0], shapeColors[i][1], shapeColors[i][2]);
    fill(shapeColors[i][0], shapeColors[i][1], shapeColors[i][2], shapeColors[i][3]);
    ellipse(shapes[i][0], shapes[i][1], shapeRadius, shapeRadius);

    //draw point in the center of the shape
    noStroke();
    ellipse(shapes[i][0], shapes[i][1], 3, 3);

    //shapes must towards its direction
    //willCalculateNextx = true;
    //willCalculateNextY = true;

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
        stroke(shapeColors[i][0], shapeColors[i][1], shapeColors[i][2]);
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



