
int siz = 30;
int numElements = 100;
float posX[] = new float[numElements];
float posY[] = new float[numElements];
float velX[] = new float[numElements];
float velY[] = new float[numElements];

void setup() {
  size(800, 600);

  //initialize the objects
  for (int i = 0; i < numElements; i++) {
    posX[i] = int( random(100, width-100)); //this defines the starting location of the objects
    posY[i] = int( random(100, height-100));
    velX[i] = int( random(1, 4)); //this defines the velocity
    velY[i] = int( random(3, 9));
  }
}

void draw() {
  //background(100);
  fill(20, 30, 50, 60);
  rect(0, 0, width, height);

 
  for (int i = 0; i < numElements; i++) {
    //here are the balls
    fill(100,23,45);
    ellipse(posX[i], posY[i], siz, siz);

    //This limits the X border
    if (posX[i] > width || posX[i] < 0) {
      velX[i] = velX[i]* -1;
    }

    //This limits the Y border
    if (posY[i] > height || posY[i] < 0) {
      velY[i] = velY[i]* -1;
    }
    //update section
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];
  }
}
