
PFont font;
int[][] valores;


void setup() {
  size(800, 800);
  frameRate(8);
  font=loadFont("Serif-30.vlw");
  textFont(font, 30);

  valores=new int[20][20];
  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      valores[i][j]=(int)random(2);
    }
  }
}

void draw() {
  background(0);
  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      text(valores[i][j], j*40, i*40);
    }
  }
  
  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      if(18-i<0){
        valores[19-i][j]=(int)random(2);
        continue;
      }
     valores[19-i][j]=valores[18-i][j];
    }
  }
}



