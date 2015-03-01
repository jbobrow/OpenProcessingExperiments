
float x, y, r, tam, vang;
void setup() {
  size(1000, 600);
  smooth();
  tam=100;
  x=width+tam+random(20);
  y=height-50;
  
  vang=8*PI/2/100;
  //x=width/2;
}

void draw() {
  background(255);
  noStroke();
  fill(255,255,0);
  rect(25,0,width-50,height-50);
  strokeWeight(5);
  stroke(0);
  fill(255);
  if (r>-PI/2) {
    r-=vang;
  }
  else {
    r=0;
    x-=tam;
    if(x<-tam){
      tam=pow(round(random(1,7)),2)*15;
      vang=8*PI/2/tam;
      x=width+random(tam);
    }
  }
  quadrado(x, y,r);
}

void quadrado(float px, float py, float r) {
  translate(px, py);
  rotate(r);
  rect(0, 0, tam, -tam);
}

