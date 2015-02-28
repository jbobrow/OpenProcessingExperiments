
Triangulo triangulo;

color c[];
int numColor, numCopiasX, numCopiasY;
int arregloColor[][];
int val = 0;
int captura =0;

void setup() {
  size(800, 600);

  numColor = 6;
  numCopiasX = width/100;
  numCopiasY = height/100;

  triangulo = new Triangulo();
  noStroke();

  c = new color[numColor];
  arregloColor = new int[numCopiasX][numCopiasY];

  for (int i=0; i<numColor; i++) {
    c[0]=color(255);
    c[1]=color(203);
    c[2]=color(124);
    c[3]=color(255, 41, 81);
    c[4]=color(255, 0, 0);
    c[5]=color(0);
  }
  for (int i=0; i<numCopiasX; i++) {
    for (int j=0;j<numCopiasY; j++) {
      arregloColor[i][j] = int(random(6));
    }
  }
}

void draw() {
  background(0);
  for (int i=0; i<numCopiasX; i++) {
    for (int j=0;j<numCopiasY; j++) {
      fill(c[arregloColor[i][j]]);
      pushMatrix();
      translate(width/numCopiasX*i, height/numCopiasY*j);
      triangulo.draw();
      popMatrix();
    }
  }
  if (val == 10 % 12) {
    update();
    val=0;
//    save("d008/d008_S_"+captura+".png");
    captura+=1;
  }
  val+=1;
}

void update() {
  for (int i=0; i<numCopiasX; i++) {
    for (int j=0;j<numCopiasY; j++) {
      arregloColor[i][j] = int(random(6));
    }
  }
}

class Triangulo {

  void Triangulo() {
  }
  void draw() {
    pushMatrix();
    beginShape();
    vertex(0, 0);
    vertex(100, 100);
    vertex(0, 100);
    endShape(CLOSE);
    popMatrix();
  }
}
