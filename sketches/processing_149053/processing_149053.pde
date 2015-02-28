
int x;
float y;
int c; //comprimento da linha
float iH; //intervalo horizontal entre as linhas
float iV; //intervalo vertical entre as linhas

void setup() {
  size(760,760);
  frameRate(20);
  smooth();
}

void draw() {
  background(0);
  
  x = 40;
  y = 120;
  c = 40;
  
  iH = 30;
  iV = 1;
  
  for(y = 120; y <= 720; y += iV) {
    for(x = 40; x <= 680; x += iH) {
      strokeWeight(1);
      stroke(255);
      line(x,y-(random(80)),x+c,y-(random(80)));
    }
  }
}


