
//by Emilie Roquet
//modified by Fanny Claudon 
//noté par Marion Desmonnet

/*
1) thème respecté ***
2) motif initial visible au lancement ***
3) sketch qui fonctionne bien ***
4) copyright ***
5) code commenté clairement **
6) motif change au clic
7) boucle for ***
8) conditions if ***
*/



//carrés de 2x2 pixels
float l, h = 10;
float i, j = 5;
float[] x, y;

int nombreRectangles = 400;
//définir un nombre d'objet pour appliquer une fonction de souris


void setup() {
  size(400, 400);
  smooth();

  x = new float[nombreRectangles];
  y = new float[nombreRectangles];

  for ( int i = 0; i < nombreRectangles; i = i + 1 ) {
    x[i] = random(15, width-15);
    y[i] = random(15, height-15);
  }
}

void draw() {
 

  background(255);

  for ( int i = 0; i < nombreRectangles; i = i + 1 ) {

    float distance = dist(mouseX, mouseY, x[i], y[i]);
    //distance d'évitement des points avec la souris

    if ( distance < 30 ) {
      float radians = atan2(mouseY-y[i], mouseX-x[i]);
      radians = radians + PI;
      x[i] = constrain( cos(radians) * 10 + x[i], 15, width - 15);
      y[i] = constrain( sin(radians) * 10 + y[i], 15, height - 15);
    }

    stroke(255, 154, 63);
    strokeWeight(5);
    rect(x[i], y[i], l, h); 
    
  }

}

void keyPressed(){
  if ( key == 's') {
    saveFrame("atol-##.png");
    //enregistre plusieurs images (01,02,03)
  }
}











