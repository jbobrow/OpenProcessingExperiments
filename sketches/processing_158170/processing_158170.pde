
//exercise 13.7 revisitado
//com arrays e classes

Circulo [] circulos = new Circulo[1];

void setup() {
  size(600,600);
  smooth();
  circulos[0] = new Circulo(random(width), random(height));
}

void draw() {
  background(8,7,90);
  
  for(int i = 0; i < circulos.length; i++) {
    circulos[i].respirar();
    circulos[i].mostrar();
  }
}

void mousePressed() {
  //novo circulo
  Circulo b = new Circulo(mouseX, mouseY);
  circulos = (Circulo[]) append(circulos, b);
}
class Circulo {
  
  float theta;
  //float dtheta;
  
  float raio;
  
  float x;
  float y;
  
  float espessura1;
  float espessura2;
  float espessura3;
  
  Circulo(float tempX, float tempY) {
    //theta = 0;
    theta = random(PI);
    //dtheta = random(-0.03,0.03);    
    raio = random(5,150);
    x = tempX;
    y = tempY;
    espessura1 = random(1,50);
    espessura2 = random(1,50);
    espessura3 = random(1,50);
  }
  
  void respirar() {
    //theta += dtheta;
    theta += 0.03;
  }
  
  void mostrar() {
    //raio+raio impede limita o descrescimento do tamanho da forma
    //se colocar só raio, o d vai quase ao zero
    float d = (sin(theta) + 1) * raio;
    //float d = (sin(theta) + 1) * raio+raio;
    stroke(216,15,62,d);
    noFill();
    //fill(150, 150);
    strokeWeight(espessura1);
    ellipse(x,y,d,d);
    strokeWeight(espessura2);
    ellipse(x,y,d-d/2,d-d/2);
    strokeWeight(espessura3);
    ellipse(x,y,d-d/4,d-d/4);
  }
}


