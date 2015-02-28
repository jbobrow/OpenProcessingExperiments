
// crashCourse processing by Corneel Cannaerts 2014
// nested loops

// a second loop can be nested inside a first one
// every time the first loop gets executed, the second loop will be executed a numer of times
// mind the {}, edit > auto format (ctrl+t) can help with indentation

int pad = 50;
int numX = 20;
int numY = 20;
float stepX;
float stepY;

void setup() {  
  size(600, 600);
  stepX = (width-2*pad)/(numX-1);
  stepY = (height-2*pad)/(numY-1);
  rectMode(CENTER);
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  //start first loop
  for (int i=0; i<numX; i++) {
    //start second loop
    for (int j=0; j<numY; j++) {     
      // rect(pad+i*stepX, pad+j*stepY, 20, 20);
      rect(pad+i*stepX, pad+j*stepY, i, j);
    }//end second loop
  }//end first loop
}



