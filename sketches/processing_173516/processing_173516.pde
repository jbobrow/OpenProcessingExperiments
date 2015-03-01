
// Inspired By Herbert Spencer

ArrayList <Nodi> NODI = new ArrayList();

final int numNodi = 120;

int distanzaNodi;
int margineX, margineY;

float step;

void setup() {
  size(600, 400);
  colorMode(HSB);

  distanzaNodi = 85;
  step = 2;

  margineX = width / 10;
  margineY = height / 10;

  NODI.clear();

  for (int i = 0; i < numNodi; i++) {
    NODI.add(new Nodi(random(0 + margineX, width - margineX), random(0 + margineY, height - margineY)));
  }

  for (int i = 0; i < numNodi; i++) {
    
    NODI.get(i).id = i;

    float p = random(0, 1); 
    if (p > 0.25)
      NODI.get(i).puntiCardine = true; 
    else {
      NODI.get(i).puntiCardine = false;
    }
  }
}

void draw() { 
  background(30);
  smooth();

  println("distanzaNodi: " + distanzaNodi);

  for (int i = 0; i < NODI.size (); i++) {
    NODI.get(i).selectNodes();
    NODI.get(i).disegnaPunti();
    NODI.get(i).disegnaLinee();
    if (NODI.get(i).puntiCardine)
      NODI.get(i).spostaPunti();
  }
}

class Nodi {

  ArrayList <Nodi> nodi = new ArrayList();

  int id;

  float x, y;
  float angolo;
  int diametro = 9;

  boolean puntiCardine, punta, trascina;

  color coloreLinee;
  color colorePunti = #FFD31F;
  color colorePuntiCardine = #B7B7B7;

  Nodi(float X, float Y) {
    x = X;
    y = Y;
  }

  void selectNodes() {
    nodi.clear();
    for (int i = 0; i < NODI.size (); i++) {
      if (dist(x, y, NODI.get(i).x, NODI.get(i).y) <= distanzaNodi)
        nodi.add(NODI.get(i));
    }
  }

  void disegnaLinee() { 

    float distanza;
    float spessore;

    for (int i = 0; i < nodi.size (); i++) {

      distanza = dist(x, y, nodi.get(i).x, nodi.get(i).y);

      spessore = map(distanza, diametro, distanzaNodi, 5, 0.1);
      spessore = constrain(spessore, 0.01, 5);      
      strokeWeight(spessore);

      coloreLinee = color(distanza * 3.75, 200, 200);
      stroke(coloreLinee, 80);

      if (distanza > 0)
          line(x, y, nodi.get(i).x, nodi.get(i).y);
    }
  }

  void disegnaPunti() {    
    noStroke();    
    if (puntiCardine) {
      if (punta) {
        strokeWeight(5);
        stroke(colorePuntiCardine, 50);
        fill(colorePuntiCardine, 170);
      } else {
        fill(colorePuntiCardine, 150);
      }
    } else { 
      muoviPunti();
      fill(colorePunti, 170);
    }
    ellipse(x, y, diametro, diametro);
  }

  void muoviPunti() {
    noiseSeed(id); 
    angolo += (noise((float)millis()/100.0) - .5) * HALF_PI;

    x += cos(angolo)*step;
    y += sin(angolo)*step;
  }

  void spostaPunti() {

    float distanza;

    distanza = dist(mouseX, mouseY, x, y);

    if (distanza < diametro / 2 ) {
      punta = true;
      if (mousePressed) {
        trascina = true;
      } else {
        trascina = false;
      }
    } else {
      punta = false;
    }

    if (trascina) {
      x = x + (mouseX - pmouseX);
      y = y + (mouseY - pmouseY);
    }
  }
}

void keyPressed() {  
  if (key == '+')
    distanzaNodi += 5;
  if (key == '-')
    if (distanzaNodi >= 5)
      distanzaNodi -= 5;

  if (key == 'a')
    step+=0.1;
  if (key == 'd')
    if (step > 0)
      step-=0.1;

  if (key == 'r')
    setup();
}



