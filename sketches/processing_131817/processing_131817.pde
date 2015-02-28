
/*
Laura Rodríguez Escudé
Primera tarea - Programación
M-IxD, 2014
*/

int i;
int numCircles = 10;
int radius = 50;
float [][] myArray = new float[numCircles][3];
float myRandom = random(10, ((width+height)/2)/8);

void setup(){
  size(300,300);
  smooth();
  frameRate(24);
  //noCursor();
  colorMode(HSB,255,255,255);
  for (int i=0; i<numCircles; i++){
    //x
    myArray [i][0] = int (random((radius/2),(width - radius/2)));
    //y
    myArray [i][1] = int (random((radius/2),(height - radius/2)));
  }
}

void draw(){
  background (#FFFFFF);
  noFill();
  strokeWeight(2);
  stroke (255*sin(frameCount/48),255,255,75);
  for (int i=0;i<numCircles;i++){
    //posicion inicial
    ellipse(myArray[i][0], myArray[i][1], radius, radius);
    //myArray[i][0] ++;
    //myArray[i][1] ++;
  }
    if (myArray[i][0] > (radius/2)){
      myArray[i][0] += 1;
      myArray[i][1] += 1;
    }

}
}
