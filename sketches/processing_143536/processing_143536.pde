
import processing.video.*;

Capture cam;

Triangulo triangulo;

color c[];
int numColor, numCopiasX, numCopiasY;
int arregloColor[][];
float rotaciones[][];
int val = 0;
int captura =0;
String camera[]; 

color c2[][];
int nSubX = 40;
int nSubY = 35;


void setup() {
  size(1280, 1024);

  frameRate(30);

  camera = Capture.list();
  println(camera);
  cam = new Capture(this);
  cam.start();
  triangulo = new Triangulo();
  noStroke();

  c = new color[numColor];
  arregloColor = new int[nSubX][nSubY];

  c2 = new color[nSubX][nSubY];
  rotaciones = new float[nSubX][nSubY];

  for (int i=0;i<nSubX; i++) {
    for (int j=0;j<nSubY; j++) {
      rotaciones[i][j] = radians(int(random(3))*90);
    }
  }
  //  println(rotaciones[0][0]);
  noStroke();
}

void draw() {
  background(0);
  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);
  for (int i=0; i<nSubX; i++) {//+=width/nSubX) {
    for (int j=0; j<nSubY; j++) {//=height/nSubY) {
      c2[i][j] = cam.get(i*width/nSubX, j*height/nSubY);
      fill(color(c2[i][j]));
      pushMatrix();
      translate(i*width/nSubX, j*height/nSubY);
      rotate(rotaciones[i][j]);
      scale(0.01*width/nSubX, 0.01*height/nSubY);
      triangulo.draw();
      popMatrix();
    }
  }
  if (val == 100 % 30) {
    update();
    val=0;
    //    save("d010/d010_"+captura+".png");
    captura+=1;
  }
  val+=1;
}

void keyPressed() {
  if (key=='s') {
    String tiempo = hour() + "-" + minute()+ "-" +second();
    //    save("d010/d010_"+tiempo+".png");
  }
}

void update() {
  for (int i=0; i<nSubX; i++) {
    for (int j=0;j<nSubY; j++) {
      rotaciones[i][j] = radians(int(random(3))*90);
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

