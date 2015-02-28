
//Gina DeMatteo
//September 28,2011
//Array 

//Setting up the variables for the arrays
int num = 18; //This establishes the set of rectangles that create the moving side bar
float[] y = new float[num];

int rectangleA = 1; //This establishes the variables for the rectangle that is dropping down on the right side
float[] x = new float[rectangleA]; 

int rectangleB = 1; //This establishes the variables for the rectangle that is rising from the center
float[] z = new float[rectangleB]; 

void setup() {
  size(300, 300);
  noFill();
  background(0);
  smooth();
  colorMode(HSB, 200);

  //Below sets the range of random strokes and fills for the composition
  //The stroke and fill changes when the composition is reset
  stroke(15, random(height), random(width), random(width));
  fill(100, random(width), random(height), 100);

  //Setting the Arrays
  for (int j = 0; j < x.length; j++) {
    x[j] = random(height);

    for (int k = 0; k < z.length; k++) {
      z[k] = random(height);
    }

    for (int i = 0; i < y.length; i++) {
      y[i] = random(height);
    }
  }
}


void draw() {
  background(0);

  //Seeding the array
  //Properties for the dropping rectangle on the right side of composition
  for (int j = 0; j<x.length;j++) {
    rect((width/x.length) * j+250, x[0], 15, 30); //placement, size and direction of movement
    x[j] = x[j]+1; 
    if (x[j] > height) x[j] = 0;
  }

  //Seeding the array
  //Properties for the rising rectangle in the center of the composition
  for (int k = 0; k<z.length;k++) {
    rect((width/z.length) * k+150, height-z[k], 15, 30); //placement, size and direction of movement
    z[k] = z[k]+1; 
    if (z[k] > height) z[k] = 0;
  }

  //Seeding the array
  //Properties for the set of rectangles on left that form a side bar
  for (int i = 0; i<y.length;i++) {
    rect((width/y.length) * 2, y[i], 40, 40); //placement, size and direction of movement
    y[i] = y[i]+1; 
    if (y[i] > height) y[i] = 0;
  }
}










