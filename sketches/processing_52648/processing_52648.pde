
int i;

float cols, rows;

boolean teller1 = true;
boolean teller2 = false;

void setup() {

  size(1000, 1000);
  smooth();
  stroke(255);
  frameRate(25);

  setParameters();
  makeControls();

  noStroke();
}



void draw() {

  // translate(width/2, height/2);

  // translate(100, 100);
  scale(0.6);

  //  i = i+rotatiesnelheid;


  background(0);
  stroke(255);

  translate(100, 100);


  cols = aantal;
  rows = aantal;


  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      float x = i*(stappen); 
      float y = j*(stappen);


      translate(x+20, y+50);

      pushMatrix(); 
             rotate(radians(rotatie));

      ster();
            rotate(radians(-rotatie));

      popMatrix();    

      translate(-x-20, -y-50);
    }
  }
}



