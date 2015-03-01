
//grid
int quantos = 3;
int st = 2;
int area = 80;
int contador;
int[][] no=new int[200][200];
float espacoH, espacoV;
PVector no1;
boolean fim;
int quantosX, quantosV;

void setup() {
  size(810, 570);
  background(255);
  prepara();
  quantosX = width/area;
  quantosV = height/area;
}

void draw() {
  translate(int(contador%quantosX) *area, int(contador/quantosX)*area);
  if (!fim) {
    sorteia(); //sorteia o primeiro

    // sorteia o segundo
    int dv = int(random(-2, 2));
    int dh = int(random(-2, 2));

    while (no1.x+dh > quantos - 1 || no1.y+dv > quantos - 1 || no1.x+dh<0 || no1.y+dv < 0 ) {
      dv = int(random(-2, 2));
      dh = int(random(-2, 2));
    }

    no[int(no1.x)+dh][int(no1.y)+dv]++; 

    strokeWeight(st);
    stroke(random(255),random(255),random(255));
    line((no1.x+1)*(espacoH), (no1.y+1)*(espacoV), (no1.x+dh+1)*(espacoH), (no1.y+dv+1)*(espacoV));
  }
  else {
    if (random(1)<.04) prepara();
  }
}

void sorteia() {
  //sorteia o primeiro
  int i =int(random(quantos));
  int j =int(random(quantos));
  int tentativas=0;

  //procura outro para ligar
  if (!fim) {
    while (no[i][j]>2) {
      i=int(random(quantos));
      j=int(random(quantos));
      tentativas++;
      if (tentativas>10000) { //para se nÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o achar uma nova possibilidade para ligar.
        fim=true;
        contador=(contador+1)%(quantosX * quantosV);
        return;
      }
    }
    no[i][j]++;
    no1=new PVector(i, j);
  }
}

void mousePressed() {
  prepara();
}

void keyPressed() {
  if (keyCode==UP) {
    quantos++;
  }
  else if (keyCode==DOWN) {
    quantos=max(1, (quantos-1));
  }
  fill(255);
  stroke(255);
   rect(int(contador%quantosX) *area, int(contador/quantosX)*area, area, area);
  prepara();
}


void prepara() {
  fim=false;
  noStroke();
  fill(255);
  rect(0, 0, area, area);
  stroke(0);
  text("keys UP and DOWN, mouseClick", 20, height-20);
  espacoH = area/(quantos);
  espacoV = area/(quantos);
  for (int j=0; j<quantos; j++) {
    for (int i=0; i<quantos; i++) {
      no[i][j]=0;
    }
  }
}
