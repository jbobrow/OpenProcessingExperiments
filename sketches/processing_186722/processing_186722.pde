
float px[][]=new float[10][10];
float py[][]=new float[10][10];
float apx[][]=new float[10][10];
float apy[][]=new float[10][10];
float disx[] =new float[10];
float disy[] =new float[10];
boolean cor;
int quantospontos = 6;
int quantasCurvas = 7;
int sec;
int alpha=60;

void setup() {
  size(900, 450);
  cor=true;
  for (int j=0; j<quantasCurvas; j++) {
    for (int i=0; i<quantospontos; i++) {
      px[j][i] = width/2;
      py[j][i] = height/2;
      disx[i] = width/2;
      disy[i] = height/2;
    }
  }
}
void draw() {
  background(0, 150, 200);
  anda();
  curva();
  if (sec!=second()) sorteia();
}
void mouseClicked() {
  sorteia();
  cor=!cor;
  background(255);
}


void curva() {
  fill(255, alpha);
  stroke(255);
  strokeWeight(.25);
  for (int j=0; j<quantasCurvas; j++) {
    beginShape();
    curveVertex(px[j][quantospontos-1], py[j][quantospontos-1]);
    for (int i=0; i<quantospontos; i++) {
      curveVertex(px[j][i], py[j][i]);
    }
    curveVertex(px[j][0], py[j][0]);
    curveVertex(px[j][1], py[j][1]);
    endShape();
  }
}

void sorteia() {
  for (int j=0; j<quantasCurvas; j++) {
    for (int i = 0; i<quantospontos; i++) {
      float raiox=1.1*random(width/15, width/3);
      float raioy=0.5*random(height/15, 2*height/3);
      apx[j][i] = disx[i]+raiox*cos(i*TWO_PI/quantospontos);
      apy[j][i] = disy[i]+raioy*sin(i*TWO_PI/quantospontos);
    }
  }
  sec=second();
}

void anda() {
  for (int j=0; j<quantasCurvas; j++) {
    for (int i=0; i<quantospontos; i++) {
      px[j][i] += (apx[j][i] - px[j][i])/20; 
      py[j][i] += (apy[j][i] - py[j][i])/20;
    }
  }
}
