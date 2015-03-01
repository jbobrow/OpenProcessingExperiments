
/* w2_assignment
 *
 */

int cols, rows;
int order [];
float angle [];
float offsetX [];
float offsetY [];
int dim;
int gap;
int margin;
float shadowOffsetX [];
float shadowOffsetY [];

void setup() {

  size(500, 500);
  background(0);

  randomSeed(5);

  cols = 5; 
  rows = 5;
  gap = 3;
  margin = 10;

  rectMode(CORNER);
  noStroke();
}

void draw() {

  // create random draw order
  order = new int[cols*rows];
  for (int k=0; k<rows*cols; ++k) order[k] = k;
  for (int k=0; k<rows*cols; ++k) {
    int j = k + int(random(rows*cols-k));
    int tmp = order[j];
    order[j] = order[k];
    order[k] = tmp;
  }

  // random angle and offset
  angle = new float[cols*rows];
  offsetX = new float[cols*rows];
  offsetY = new float[cols*rows];
  shadowOffsetX = new float[cols*rows];
  shadowOffsetY = new float[cols*rows];
  for (int k=0; k<rows*cols; ++k) {
    angle[k] = 0.04*random(-1, 1);
    offsetX[k] = random(5*gap);  
    offsetY[k] = random(5*gap);
    shadowOffsetX[k] = 4;
    shadowOffsetY[k] = 4;
  }


  dim = min((width+gap-2*margin)/cols-gap, (height+gap-2*margin)/rows-gap);

  float hmargin = (width - (cols*(dim+gap)-gap))/2;
  float vmargin = (height - (rows*(dim+gap)-gap))/2;

  background(255);

  for (int k=0; k<rows*cols; ++k) {

    // random square to draw
    int c = order[k]%cols, r = order[k]/cols;

    rotate(angle[k]);

    // draw shadow
    fill(140, 180);
    rect(hmargin+c*(size+gap)+offsetX[k]+shadowOffsetX[k], 
    vmargin+r*(size+gap)+offsetY[k]+shadowOffsetY[Y], size, size);

    // draw square
    fill(55+200*(k/(1.0*rows*cols)), 0, 0, 255);
    rect(hmargin+c*(size+gap)+offsetX[k], vmargin+r*(size+gap)+offsetY[k], dim, dim);
    rotate(-angle[k]);
  }
  
}

