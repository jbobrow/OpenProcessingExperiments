
//variação do projecto da linha a saltar (linha_saltona)
//1.prencher o campo com linhas de 20 px de comprimento, num intervalo horizontal de 20 px, e vertical de 60px.
//2. pôr as linhas a saltar aleatóriamente(mexer y)

int x;
float y;
int c; //comprimento da linha
int iH; //intervalo horizontal entre as linhas
float iV; //intervalo vertical entre as linhas

void setup() {
  size(760,760);
  frameRate(10);
  smooth();
}

void draw() {
  background(0);
  
  x = 40;
  y = 120;
  c = 40;
  iH = 80;
  iV = 120;
  
  for(y = 120; y <= 720; y += iV) {
    for(x = 40; x <= 680; x += iH) {
      strokeWeight(random(1,10));
      stroke(255);
      line(x,y-(random(80)),x+c,y-(random(80)));
    }
  }
}


