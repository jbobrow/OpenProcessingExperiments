
int num = 200;//required number of things

//Set up arrays - 2 required

color[] nrColors = new color[4]; //saved color set to pick from 
//array1

float[] x = new float [num];//x-coordinate
float[] y = new float[num]; // y-coordinate
//array2

void setup() {
  size (300, 300);
  colorMode(RGB);
  smooth();

  //seed array- whatever that means, putting all the info into whats going to 
  //be drawn?  what info?
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = random(height);
  } 

  //colors plugged into array
  nrColors[0] = color(142, 59, 216);
  nrColors[1] = color(34, 175, 60);
  nrColors[2] = color(250, 159, 48);
  nrColors[3] = color(74, 48, 250);

  noStroke();
  smooth();
}

void draw() {

  background(255);

  for (int i=0; i < num; i++) {

    stroke(255);
    strokeWeight(3);
    fill(pickAColor());
    ellipseMode(CENTER);
    ellipse(x[i], y[i],20,20);
  }

  noLoop();
}



//this helper function picks a random color from the array
color pickAColor() {
  int c = int(random(4)); // random number from 0-3
  return nrColors[c]; // returns a color variable
}

//notice how difficult all this is to understand


