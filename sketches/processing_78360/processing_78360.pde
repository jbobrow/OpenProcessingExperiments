
Retangulo retangulos[];
int quantosRetangulos = 0;

void setup() {
  
  size(800, 600);
  background(255);
  
  retangulos = new Retangulo[100000];
  
}

void draw() {
  //background(0);
  //ellipse(mouseX,mouseY,800*sin (millis()/1000.0 ), 800*sin( millis()/1000.0) );
  
  for (int i = 0; i < quantosRetangulos; i++) {
    retangulos[i].desenha();
  } 
  
  if (mousePressed) {
    float velocidade = dist(mouseX, mouseY, pmouseX, pmouseY);
   
    Retangulo meuRetangulo = new Retangulo(velocidade);
   retangulos[quantosRetangulos] = meuRetangulo;
   quantosRetangulos = quantosRetangulos + 1;
    /*
    

    translate(mouseX, mouseY);
    rotate( random(PI) );

    stroke(random(255), random(234), random(234, 255), 100);
    strokeWeight(3);
    noFill();
    //fill(random(255),random(234),random(234,255), 100);
    rect(0-velocidade/2, 0 - velocidade/2, velocidade, velocidade );
    */
  }
}

class Retangulo {
  
  float x, y;
  float vx, vy;
  
  float tamanho;
  float ang, vang;
  
  color cor;
  
  Retangulo( float tam) {
    x = mouseX;
    y = mouseY;
    ang = random(0,PI);
    cor = color( random(255), random(255), random(255), 40 );
    tamanho = tam; 
    vang = random(-0.2,0.2);
    vx = random(-5,5);
    vy = random(-5,5);
    
  }
  
  void desenha() {
    pushMatrix();
    translate(x,y);
    ang = ang + vang;
    x = x + vx;
    y = y + vy;
    vx = vx * 0.9;
    vy = vy * 0.9;
    vang = vang * 0.9;
    
    rotate(ang);
    stroke(cor);
    noFill();
    rect( - tamanho/2, - tamanho/2, tamanho, tamanho);
    popMatrix();
  }
  
}



