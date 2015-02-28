
//Will Cordes
//Assignment 6.1, Arrays and Images
//Adapted from N. Senske, "carArray", Lecture 6

color blackNight = color(#000000); // black

int numberVariable = 65; // number of variables

float[] horizontal = new float[numberVariable]; // x-coordinate
float[] vertical = new float[numberVariable]; // y-coordinate
float[] movementVariable = new float[numberVariable]; // speed
color[] colorVariable = new color[numberVariable]; 

void setup() {
  size(300, 300);
  colorMode(RGB, width);
  smooth();

  for (int i=0; i < numberVariable; i++) {
    horizontal[i] = random(width);
    vertical[i] = i * (height/numberVariable);
    movementVariable[i] = random(1, 5);
    colorVariable[i] = color(int(random(255)));
  }
}

void draw() {
  background(blackNight);

  for (int i=0; i <numberVariable; i++) {
    stroke(random(width));
    fill(colorVariable[i]);
    ellipse(horizontal[i], vertical[i], random(15), random(15));
    
    horizontal[i] = horizontal[i]+movementVariable[i];
    if (horizontal[i]>width+15){
      horizontal[i] = -15;
    }
  }
}


