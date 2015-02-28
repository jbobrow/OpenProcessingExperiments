

final static ArrayList<Circulo> circs = new ArrayList();

float tamanhoInicial = 100;
float velocidade = 5;
float taxaAumento = 10;
color azul = color(100,100,255,150);

void setup() {
  size(800, 400);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  
  //update da posicao de todos os circulos
  for (Circulo b: circs)   b.updatePos();
  
  //uma funcao para fazer crescer apenas o ultimo item
  if (!circs.isEmpty()) {
    circs.get(circs.size()-1).grow();
  }
  
  
}

void mousePressed() {
  
  circs.add( new Circulo(600, mouseY, velocidade, tamanhoInicial, azul, taxaAumento) );
  
}








/* DEFINE A CLASSE CÍRCULO*/
class Circulo {
  float xpos, ypos, velocidade, tamanho, aumento;
  color cor;
  
  Circulo(float x, float y, float v, float t, color c, float a) {
    xpos = x;
    ypos = y;
    velocidade = v;
    tamanho = t;
    cor = c;
    aumento = a;
  }
  
  //método update
  void updatePos() {
    xpos -= velocidade;  
          
    fill(cor);
    ellipse(xpos, ypos, tamanho, tamanho);
 
  }
  
  void grow() {
    
    if (mousePressed == true) {
      tamanho += aumento;
    }
    
  }
  
}
