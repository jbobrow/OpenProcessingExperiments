
//grid
int quantos = 3;
int tam=10;
int[][] no=new int[200][200];
float espacoH, espacoV;
PVector no1;
boolean fim;

void setup() {
  size(500, 500);
  prepara();
  text("keys UP and DOWN, mouseClick",20, height-20);
}

void prepara() {
  fim=false;
  background(255);
  espacoH = width/(quantos+1.0);
  espacoV = height/(quantos+1.0);

  // desenha o fundo
  for (int j=0; j<quantos; j++) {
    fill(0);
    for (int i=0; i<quantos; i++) {
      no[i][j]=0;
      ellipse((i+1)*(espacoH), (j+1)*(espacoV), tam, tam);
    }
  }
}
void draw() {
  if (!fim) {
    sorteia();

    //sorteia um para ligar
    int dv = int(random(-2, 2));
    int dh = int(random(-2, 2));

    while (no1.x+dh > quantos - 1 || no1.y+dv > quantos - 1 || no1.x+dh<0 || no1.y+dv < 0 ) {
      dv = int(random(-2, 2));
      dh = int(random(-2, 2));
    }
    no[int(no1.x)+dh][int(no1.y)+dv]++;
    strokeWeight(tam);
    line((no1.x+1)*(espacoH), (no1.y+1)*(espacoV), (no1.x+dh+1)*(espacoH), (no1.y+dv+1)*(espacoV));
  }
}

void sorteia() {
  //sorteia o primeiro
  int i =int(random(quantos-0.0001));
  int j =int(random(quantos-0.0001));
  int tentativas=0;
  if (!fim) {
    while (no[i][j]>2) {
      i=int(random(quantos));
      j=int(random(quantos));
      tentativas++;
      if (tentativas>10000) {
        fim=true;
        println("fim");
        //stop();
        return;
      }
    }
    no[i][j]++;
    no1=new PVector(i, j);
    fill(no[i][j]*85);
    stroke(random(255), random(255), random(255));
    ellipse((i+1)*(espacoH), (j+1)*(espacoV), tam, tam);
    //println(i + " " + " " + j + " __ " + no[i][j] + " " + tentativas);
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
tam=max(20-quantos/2, 2);
  prepara();
}

