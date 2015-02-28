
// crashCourse processing by Corneel Cannaerts 2014
// nested loops

// transformations translate, scale or rotate the canvas 
// the order of transformations is important 
// turning around and taking a few steps forward 
// or
// taking a few steps forward and turning around  
// you'll end up in a different place ;)

// translation can be added together,
// translations placed between pushMatrix() and popMatrix() will only affect code inbetween those commands. 

int pad = 50;
int numX = 20;
int numY = 20;
float stepX;
float stepY;

void setup() {  
  size(600, 600);
  smooth();
  stepX = (width-2*pad)/(numX-1);
  stepY = (height-2*pad)/(numY-1);
  rectMode(CENTER);
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  for (int i=0; i<numX; i++) {
    for (int j=0; j<numY; j++) {     
     pushMatrix(); 
     translate(pad+i*stepX, pad+j*stepY);
     rotate(random(map(j,0,numY,0,PI/4)));
     rect(random(j), random(j), 20, 20);
     popMatrix();
    }
  }
  noLoop();
}

void keyPressed(){
  loop();
}



