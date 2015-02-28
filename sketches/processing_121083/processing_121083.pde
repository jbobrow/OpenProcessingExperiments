

//created by Formo
//stanleyandDani
polybase[][] mybase = new polybase[13][13];
polybase[][] mybase1 = new polybase[10][10];
polybase[][] mybased = new polybase[13][13];
polybase[][] mybased1 = new polybase[10][10];

int cols =13;
int rows=13;

void setup() {

  size (1800, 800);
  smooth();
  noFill();

  mybase = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybase[k][l] = new polybase (k*3*50+(2*50*cos(radians(60))), l*2*50*sin(radians(60)), 50, 6);
    }
  }

  //
  mybased = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybased[k][l] = new polybase (k*3*50-(50*cos(radians(60))), l*2*50*sin(radians(60))+50*(sin(radians(60))), 50, 6);
    }
  }




  //

  mybase1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybase1[k][l] = new polybase (k*3*50+(2*50*cos(radians(60))), l*2*50*sin(radians(60)), 20, 6);
    }
  }

  mybased1 = new polybase [cols][rows];
  for (int k = 0; k < cols; k++) {
    for (int l =0; l < rows; l++) {
      // Initialize each object
      mybased1[k][l] = new polybase (k*3*50-(50*cos(radians(60))), l*2*50*sin(radians(60))+50*(sin(radians(60))), 20, 6);
    }
  }
}

void draw() {
  background(255);
  for (int k = 0; k < cols; k++) {
    for (int l = 0; l < rows; l++) {
      fill(255);
      strokeWeight(.7);
      mybase[k][l].display();
      mybased[k][l].display();
      fill(random(200-225));
      strokeWeight(.25);
      mybase1[k][l].display();

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
    if (br>=40) {
      br = random(40)-10;
    }
  }
}




