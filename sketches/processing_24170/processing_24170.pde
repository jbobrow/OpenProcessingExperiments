
int bla = 0;
int m = 5;

int wo = 20;
int iu = 10;
void setup(){
  size(200,200);
  smooth();
}
void draw(){
  background(255);
  ojos();
  //nariz();
  boca();
  habla();
}
void ojos(){
  //dibujar ojos
  fill(0);
  ellipseMode(CENTER);
  ellipse(80,80,wo,wo);
  ellipse(120,80,wo,wo);
  
  wo = wo + iu;
  if((wo > 20) || (wo < 0)){
    iu = iu * -1;
  }
}
void nariz(){
  //dibujar nariz
  fill(0);
  rectMode(CENTER);
  rect(100,100,20,20);
}
void boca(){
  //dibujar boca
  fill(0);
  arc(100,120,50,bla,0,PI);
}
void habla(){
  //animar boca
  bla = bla + m;
  if((bla > 50) || (bla < 0)){
    m = m * -1;
  }
}

