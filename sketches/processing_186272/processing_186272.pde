
float px[][] = new float[30][30];
float py[][] = new float[30][30];
float alvopx[][] = new float[30][30];
float alvopy[][] = new float[30][30];
int quantos, curvas, sec;

void setup() {
  size(900, 500);
  background(255, 255, 255);
  smooth();
  quantos=5;
  curvas=10;
  for (int j = 0; j<curvas; j++) {
    for (int i = 0; i<quantos+1; i++) {
      px[i][j]=i*width/quantos;
      py[i][j]=height/2;
    }
  }
  sorteiCurva();
}

void draw() {
  fill(random(250, 255), random(250, 255), 50, 1);
  strokeWeight(.1);
  curva();
  for (int j = 0; j<curvas; j++) {
    for (int i = 0; i<quantos+1; i++) {
      px[i][j]=px[i][j]+(alvopx[i][j]-px[i][j])/100;
      py[i][j]=py[i][j]+(alvopy[i][j]-py[i][j])/100;
    }
  }
  if(sec!=second() && second()%3==0){
  sec=second();
   sorteiCurva();
  }
}

void mousePressed() {
  sorteiCurva();
}


void sorteiCurva() {
  for (int j = 0; j<curvas; j++) {

    for (int i = 0; i<quantos+1; i++) {
      alvopx[i][j] = i*width/quantos+random(-200, 200);
      alvopy[i][j] = random(0.1*height, height*.9);
    }
  }
}

void curva() {
  stroke(255);
  strokeWeight(.25);
  beginShape();
  curveVertex(0, py[0][0]);
  curveVertex(0, py[0][0]);
  for (int j = 0; j<curvas; j++) {
    for (int i = 0; i<quantos+1; i++) {
      curveVertex(px[i][j], py[i][j]);
    }
  }
  curveVertex(1.1*width, py[quantos][curvas-1]);
  curveVertex(2*width, py[quantos][curvas-1]);
  curveVertex(3*width, py[quantos][curvas-1]);
  endShape(CLOSE);
}
           

void keyPressed() {
  background(255);
}
