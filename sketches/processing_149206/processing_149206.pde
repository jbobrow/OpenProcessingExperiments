
int x;
float y;
int c; //comprimento da linha
float iH; //intervalo horizontal entre as linhas
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
  iH = 1.5;
  iV = 100;
  
  for(y = 120; y <= 720; y += iV) {
    for(x = 40; x <= 680; x += iH) {
      strokeWeight(0.5);
      stroke(255);
      line(x,y-(random(80)),x+c,y-(random(80)));
    }
  }
}


