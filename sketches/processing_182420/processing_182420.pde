
//creo i vettori per moltiplicare gli oggetti delle classi
QuaGira[] qua = new QuaGira[56];
Inspirals[] insp = new Inspirals[36];

float x, y;
float xi, yi;

// creo la finestra e chiamo i vettori e le posizioni in cui compariranno gli oggetti   
void setup() {
  size(820, 600);
  smooth();
  for (int i = 0; i < qua.length; i++) {
    x = random(width);
    y = random(height);
    qua[i] = new QuaGira(x, y);
  }
  for (int e = 0; e < insp.length; e++) {
    xi = width/2;
    yi = height/2;
    insp[e] = new Inspirals(xi, yi);
  }
}

void draw() {
  background(#6F0808); // chiamo qui lo sfondo perché il movimento degli oggetti non crei strascichi
  for (int i = 0; i < qua.length; i++) { // disegno gli oggetti della classe QuaGira
    qua[i].move();
    qua[i].display();
  }
  if (keyPressed) { // disegno gli oggetti della classe Inspirals
    if (key == ' ') { // che appaiono alla pressione della barra spaziatrice
      for (int e = 0; e < insp.length; e++) {
        insp[e].spira();
      }
    }
  }
}

// creo la classe Inspirals e definisco le variabili
class Inspirals {
  float xi, yi;
  float angle = 0.0;
  float scalar = 1;
  float speed = 0.2;
  
  // ne definisco il costruttore
  Inspirals(float tXi, float tYi) {
    xi = tXi;
    yi = tYi;
  }
  
  // definisco gli oggetti della classe e le azioni che compirà
  void spira() {
    frameRate(22); // abbasso il numero di fotogrammi perchè si vedano più chiaramente i cerchi
    xi = random(width) + cos(angle) * scalar;
    yi = random(height) + sin(angle) * scalar;
    strokeWeight(0.5);
    stroke(#4E4C5A);
    fill(random(255), random(255), random(255), random(255));
    ellipse( xi, yi, 22, 22);
    angle += speed;
    scalar += speed;
  }
}
// creo la classe QuaGira e ne definisco le variabili
class QuaGira {
  float x;
  float y;
  int lato = 22;
  float speed = 1.8;
  float xmove = random(-1.5, 3);
  float ymove = random(-1.5, 3);
  
  // definisco il costruttore della classe
  QuaGira(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void move() {
    // assegno indicazioni ai vettori di movimento 
    x += xmove; // come muoversi all'interno della finestra
    y += ymove;
    if (x >= width || x <= 0) { // cosa fare una volta raggiunti gli estremi della finestra (rimbalzare)
      xmove *= -1;
    }
    if (y >= height || y <= 0) {
      ymove *= -1;
    }
    x += random(-speed, speed); // imprimo un ulteriore moto oscillatorio randomico agli oggetti
    y += random(-speed, speed);
  }
  
  void display() { // creo gli oggetti della classe con le rispettive caratteristiche visive
    rectMode(CENTER);
    stroke(102);
    strokeWeight(6);
    strokeJoin(BEVEL);
    fill(0);
    rect(x, y, lato, lato);
  }
}


