
//projecto 4: classes e arrays
//círculos aparecem quando o cursor clica no fundo
//os círculos reagem à distância do rato
//as linhas dos círculos variam de espessura aleatoriamente.
//os círculos mexem-se mais depressa quando o rato está perto.

Circulo[] circulos = new Circulo[1];

void setup() {
  size(600,600);
  smooth();
  circulos[0] = new Circulo(random(width),random(height),10, random(1,10));
}

void draw() {
  background(150);
  for(int i = 0; i < circulos.length; i++) {
    circulos[i].criar();
    circulos[i].mexer();
  }
}

void mousePressed() {
  //cria um novo circulo
  Circulo b = new Circulo(mouseX, mouseY, 10, random(1,10));
  circulos = (Circulo[]) append(circulos, b);
}
class Circulo {
  
  float x;
  float y;
  float d;
  float espessura;
  float distancia;
  
  Circulo(float tempX, float tempY, float tempD, float tempEspessura) {
    x = tempX;
    y = tempY;
    d = tempD;
    espessura = tempEspessura;
  }
  
  void criar() {
    strokeWeight(espessura);
    stroke(0);
    noFill();
    ellipse(x,y,d,d);
    ellipse(x,y,d+20,d+20);
    ellipse(x,y,d+40,d+40);
  }
  
  void mexer() {
    x = x + random(-1,1);
    y = y + random(-1,1);
    
    x = constrain(x,0,width);
    y = constrain(y,0,height);
    
    //os círculos respondem à presença do rato
    distancia = dist(x,y,mouseX,mouseY);
    //como cheguei ao *5? tentativa e erro.
    if(x >= distancia*5 && y >= distancia*5) {
      x = x + random(-10,10);
      y = y + random(-10,10);
  }
}
}


