

// Learned to use a bit of math: TWO_PI cos and sin from the last help session
// Applying cricles from samples online
// Thank you Cici for letting me reverse engeneer your code and teaching me to connect the dots



Molecule[] mol;

int atomNumber = 40;
float r = 0;
PImage img;

void setup() {
  
  size(600, 600);
  smooth();
  img = loadImage("itpsolo.png");
  
  
  background(255);
  mol = new Molecule[atomNumber];
  for (int i=0; i<atomNumber; i++) {
    r = random(10, width/2);
    mol[i] = new Molecule(cos(TWO_PI*(i/atomNumber))*r, sin(TWO_PI*(i/atomNumber))*r, i, r, i);
  }
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  for (int i = 0; i < atomNumber; i++) {
    mol[i].change();
    mol[i].displayMol();
    mol[i].distance();
   
  }
  image(img, 0, 0, 100,80);
  //image(img, width/2, height/2, 60,60);
}

class Molecule {
  float xMol, yMol;
  float changeSpin;
  float dMol;
  int idMol;
  float dis;

  Molecule(float tempxMol, float tempyMol, float tempC, float tempD, int tempID) {
    xMol = tempxMol;
    yMol = tempyMol;
    changeSpin = tempC;
    dMol = tempD;
    idMol = tempID;
  }

//wiggle wiggle wiggle
  void change() {
    changeSpin = changeSpin + random(-0.1, 0.03);
  }

//atoms
  void displayMol() {
    noStroke();
    fill(random(102,178),random(50,100), random(204,255), 90);
    xMol = cos(TWO_PI*(changeSpin/atomNumber))*dMol;
    yMol = sin(TWO_PI*(changeSpin/atomNumber))*dMol;
    ellipse(xMol, yMol, 15,15);

  }

//connect the dots
  void distance() {
    for (int i=0; i<atomNumber; i++) {
      dis = dist(xMol, yMol, mol[i].xMol, mol[i].yMol);
      if (dis < 100) {
        dis = map(dis, 0, 100, 0, 255);
        stroke(dis);
        line(xMol, yMol, mol[i].xMol, mol[i].yMol);
      }
    }
  }
}

//reset
void mouseClicked() {
  setup();
}



