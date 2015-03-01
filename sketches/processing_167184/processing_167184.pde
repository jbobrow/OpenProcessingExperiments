
//Conejo Tejada, Eric (Group 301) - Mike Wazowsky tessellation

int sizex, sizey;
int shapes;
int form = 1;


void setup() {
  size (800, 800);
  shapes = 25;
  sizex = width/shapes;
  sizey = height/shapes;
  smooth();
}
void draw() {

  background (255);


  if (form == 1) {
    for (int j=0; j<height/shapes; j++) {
      for (int i=0; i<width/shapes; i++) {
        fill(255, 175, 70); //cuernos
        bezier(i*sizex+4, j*sizey+8, i*sizex+3, j*sizey+3, i*sizex, j*sizey, i*sizex+8, j*sizey+3);
        bezier(i*sizex+25, j*sizey+8, i*sizex+26, j*sizey+3, i*sizex+29, j*sizey, i*sizex+21, j*sizey+3);

        fill (0, 255, 55); //cabeza
        ellipse (i*sizex+15, j*sizey+15, 25, 25);

        fill(255); //ojo
        ellipse (i*sizex+15, j*sizey+12, 12, 12);

        fill (0, random(0, 255), 0); //iris
        ellipse (i*sizex+15, j*sizey+12, 6, 6);

        noFill(); //boca
        arc(i*sizex+15, j*sizey+15, 18, 18, 0, PI);
      }
    }
  } 
  
  else {
    for (int j=0; j<height/shapes; j++) {
      for (int i=0; i<=j; i++) {
        fill(255, 175, 70); //cuernos
        bezier(i*sizex+4, j*sizey+8, i*sizex+3, j*sizey+3, i*sizex, j*sizey, i*sizex+8, j*sizey+3);
        bezier(i*sizex+25, j*sizey+8, i*sizex+26, j*sizey+3, i*sizex+29, j*sizey, i*sizex+21, j*sizey+3);

        fill (0, 255, 55); //cabeza
        ellipse (i*sizex+15, j*sizey+15, 25, 25);

        fill(255); //ojo
        ellipse (i*sizex+15, j*sizey+12, 12, 12);

        fill (0, random(0, 255), 0); //iris
        ellipse (i*sizex+15, j*sizey+12, 6, 6);

        noFill(); //boca
        arc(i*sizex+15, j*sizey+15, 18, 18, 0, PI);
      }
    }
  }
}

void keyPressed () {
  if (key == 'j')  form = 2;
  else form = 1;
}

