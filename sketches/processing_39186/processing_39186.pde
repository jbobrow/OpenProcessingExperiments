
void setup() {
  size(400, 400);
  smooth();
  colorMode(HSB, 100);
  background(10, random(0, 100), 100);
}

float a;
float b;

//Sets up the number of rectangles and squares to draw
void draw() {    
  for (int a=0; a<width*4; a+=100) {
    for (int b=0; b<width/2; b+=80) {
      rectSize(a, b);
      noLoop();
    }
  }
}

void rectSize(float a, float b) {
  
//sets the parameters for size and strokeweight of shapes
  strokeWeight(random(.5, 3));   
    float c = random(25, 70);
    float d = random(10, 20);
    
//defines the coordinates for the gradient rectangles
  stroke(0, 250);    
  fill(random(1, 100));
  rect(random(width), random(0, height/2), c, d);

 //defines the coordinates for the white squares
  noFill();    
  stroke(0, 0, 100);
  rect(random(width), random(325, 350), d, d);
}


