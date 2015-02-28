
final static ArrayList<Circulo> circs = new ArrayList();

void setup() {
  size(800, 400);
  smooth();
  noStroke();
  mousePressed();
}

void draw() {
  background(0);
  for (Circulo b: circs)   b.update();
}

void mousePressed() {
  circs.add( new Circulo(600, mouseY, 5, 100) );
  
}





/* DEFINE A CLASSE CÍRCULO*/
class Circulo {
  float xpos, speed, ypos, tamanho;
  
  Circulo(float x, float y, float s, float t) {
    xpos = x;
    ypos = y;
    speed = s;
    tamanho = t;
  }
  
  //método update
  void update() {
    xpos -= speed;  
       
    if (mousePressed) {
      tamanho += 10;
    }
    else {
      tamanho = 100;
    }
       
    fill(255,0,0,150);
    ellipse(xpos, ypos, tamanho, tamanho);
  }
  
  
}
