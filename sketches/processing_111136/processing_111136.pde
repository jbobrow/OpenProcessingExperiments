
final static ArrayList<Circulo> circs = new ArrayList();
final static ArrayList<Quadrado> quads = new ArrayList();


float xInicial = 600;
float tamanhoInicial = 100;
float velocidade = 5;
float taxaAumento = 10;
float angulo = radians(random(0,360));
color azul = color(100,100,255,150);
color vermelho = color(255,50,50,150);


void setup() {
  size(800, 400);
  smooth();
}

void draw() {
  background(0);
  
  //update da posicao de todos os elementos
  //for (Circulo b: circs)   b.updatePos(); //Circulos
  for (Quadrado q: quads)   q.updatePos();  //Quadrados
  
  //uma funcao para fazer crescer apenas o ultimo item
  //if (!circs.isEmpty()) { circs.get(circs.size()-1).grow(); } //Circulos
  if (!quads.isEmpty()) { quads.get(quads.size()-1).grow(); } //Quadrados
  
  
}

void mousePressed() {
  
  //cria os elementos ao clicar 
  //circs.add( new Circulo(xInicial, mouseY, velocidade, tamanhoInicial, azul, taxaAumento) ); //Circulos
  quads.add( new Quadrado(xInicial, mouseY, velocidade, tamanhoInicial, vermelho, taxaAumento, angulo) ); //Quadrados
    
  
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
    noStroke();      
    fill(cor);
    ellipse(xpos, ypos, tamanho, tamanho);
 
  }
  
  void grow() {
    
    if (mousePressed == true) {
      tamanho += aumento;
    }
    
  }
  
}




/* DEFINE A CLASSE QUADRADO*/
class Quadrado {
  float xpos, ypos, velocidade, tamanho, aumento, rotacao;
  color cor;
  
  Quadrado(float x, float y, float v, float t, color c, float a, float r) {
    xpos = x;
    ypos = y;
    velocidade = v;
    tamanho = t;
    cor = c;
    aumento = a;
    rotacao = r;
  }
  
  //método update
  void updatePos() {
    
    xpos -= velocidade;  
    noStroke();
    rectMode(CENTER);      
    fill(cor);
    rect(xpos, ypos, tamanho, tamanho);
}
  
  void grow() {
    
    if (mousePressed == true) {
      tamanho += aumento;
    }
    
  }
  
  
}
