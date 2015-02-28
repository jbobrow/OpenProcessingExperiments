
int NUMERO_PUNTI=300;

void setup() {
  size(650, 650);
  smooth();
  frameRate(30);
}

void draw() {
  float t=0;
  background(230);
  stroke(0);
  strokeWeight(1);
  // Assi cartesiani per la funzione Seno:
  line(200,100,630,100);
  fill(0);
  triangle(630,100,625,95,625,105);
  line(200,5,200,190);
  triangle(200,5,195,10,205,10);
  // Assi cartesiani per la funzione Coseno:
  line(100,200,100,630);
  triangle(100,630,95,625,105,625);
  line(5,200,195,200);
  triangle(195,195,195,205,200,200);
  // Circonferenza trigonometrica:
  fill(255);
  ellipse(100,100,180,180);
  strokeWeight(3);
  for(int i=0;i<frameCount;i++) {
    t=i*2*PI/NUMERO_PUNTI;
    stroke(0,150,0);
    point(map(t,0,2*PI,200,600),map(sin(t),-1,1,190,10)); // grafico della funzione Seno
    stroke(0,0,255);
    point(map(cos(t),-1,1,10,190),map(t,0,2*PI,200,600)); // grafico della funzione Coseno
  }
  stroke(0);
  line(100,100,100+90*cos(t),100-90*sin(t)); // raggio "proiettante" della circonferenza trigonometrica
  strokeWeight(1);
  stroke(150);
  line(100+90*cos(t),100-90*sin(t),map(t,0,2*PI,200,600),map(sin(t),-1,1,190,10)); // proiezione (dall'estremità del raggio al punto che traccia il grafico della funzione Seno)
  line(100+90*cos(t),100-90*sin(t),map(cos(t),-1,1,10,190),map(t,0,2*PI,200,600)); // proiezione (dall'estremità del raggio al punto che traccia il grafico della funzione Coseno)
  stroke(255,0,0);
  strokeWeight(5);
  point(100+90*cos(t),100-90*sin(t)); // punto "proiettante" della circonferenza
  point(map(t,0,2*PI,200,600),map(sin(t),-1,1,190,10)); // punto che traccia il grafico della funzione Seno
  point(map(cos(t),-1,1,10,190),map(t,0,2*PI,200,600)); // punto che traccia il grafico della funzione Coseno
  if (frameCount==NUMERO_PUNTI) noLoop();
}



