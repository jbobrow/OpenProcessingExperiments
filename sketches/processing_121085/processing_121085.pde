
import processing.pdf.*;


//created by Formo
//stanleyandDani

polybase[][] mybase = new polybase[30][20];
polybase[][] mybase1 = new polybase[30][20];
polybase[][] mybased = new polybase[30][20];
polybase[][] mybased1 = new polybase[30][20];

int cols =30;
int rows=20;
float angle;
void setup() {

  frameRate(10);
  size (1366, 768);
  smooth();
  noFill();

  mybase = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybase[k][l] = new polybase (k*3*30+(2*30*cos(radians(60))), l*2*30*sin(radians(60)), 30, 6);
    }
  }

  //
  mybased = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybased[k][l] = new polybase (k*3*30-(30*cos(radians(60))), l*2*30*sin(radians(60))+30*(sin(radians(60))), 30, 6);
    }
  }




  //

  mybase1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybase1[k][l] = new polybase (k*3*30+(2*30*cos(radians(60))), l*2*30*sin(radians(60)), 15, 6);
    }
  }

  mybased1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybased1[k][l] = new polybase (k*3*30-(30*cos(radians(60))), l*2*30*sin(radians(60))+30*(sin(radians(60))), 15, 6);
    }
  }
}

void draw() {
  background(255);
  for (int k = 0; k < cols; k++) {
    for (int l = 0; l < rows; l++) {
      fill(255);
      strokeWeight(.5);
      stroke(150);
      noFill();
      mybase[k][l].display();
      mybased[k][l].display();
      fill((90+127*sin(angle)));
      strokeWeight(.25);
      mybase1[k][l].display();
      angle +=.0005;
      mybase1[k][l].ukuran();



      mybased1[k][l].display();

      mybased1[k][l].ukuran();
    }
  }
}

class polybase {


  float bx;
  float by;
  float br;
  int bn;


  polybase(float tempbx, float tempby, float bradius, int bside) {

    bx= tempbx;
    by= tempby;
    br= bradius;
    bn= bside;
  }

  void display() {
    float sudut = 360.0/bn;
    beginShape();
    for (int j =0; j<bn; j++) {

      vertex(bx + br * cos(radians(sudut  * j)), 
      by + br * sin(radians(sudut  * j)));
    }
    endShape(CLOSE);
  }
  void ukuran() {

    br= br+.5;
    if (br>=25) {
      br = random(25)-10;
   
    }
  }
}



