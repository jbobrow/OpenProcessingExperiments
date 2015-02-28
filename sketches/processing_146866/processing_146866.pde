
import processing.video.*;
Capture cam;


int total = 80*60;
int imgScale = 8;
int columnas, filas;
ArrayList tractores = new ArrayList();
cosa[] cosasList = new cosa[total];
float maxFactor = 100, minFactor = 50;
PImage r;
PImage camFrame;

//declaramos variables
PVector gravedad, wind;

void setup() {
  size(640, 480);
  //inicializamos variables
  columnas = width/imgScale;
  filas = height/imgScale;
  cam = new Capture(this, 640, 480);
  cam.start();
  camFrame = createImage(cam.width, cam.height, RGB);
  gravedad = new PVector(0, 0.0);
  wind = new PVector(0, 0.0);
  r = loadImage("ramon.jpg");
  r.loadPixels();
  
  
  if (cam.available() == true) {
    cam.read();
    }
  
  //for (int i=0; i<total; i++) {
  //cosasList[i] = new cosa(r.pixels[i],i);
  //}
  int counter = 0;
  for (int i=0; i<columnas; i++) {
    for (int j=0; j<filas; j++) {
      int x=i*imgScale;
      int y=j*imgScale;
      cosasList[counter] = new cosa(r.get(x, y), x, y);
      counter++;
    }
  }
  noSmooth();
}

void draw() {
  background(0);
  
  for (cosa c : cosasList) {
    for (int i=0; i<tractores.size();i++) {
      attractor a = (attractor) tractores.get(i);
      c.addForce(a.getForce(c.posicion));
    }
    PVector grav = gravedad.get();
    grav.mult(c.myMass);
    c.addForce(grav);
    c.run();
  }
  noFill();
  for (int i=0; i<tractores.size();i++) {
    attractor a = (attractor) tractores.get(i);
    stroke(255, 0, 0);
    ellipse(a.pos.x, a.pos.y, map(a.factor, maxFactor, minFactor, 5, 30), map(a.factor, maxFactor, minFactor, 5, 30));
  }
}

void mousePressed() {
  camFrame.loadPixels();
  attractor att = new attractor(mouseX, mouseY, true, random(60, maxFactor));
  tractores.add(att);
}

void keyPressed(){
  
  if (key == CODED) {
    if (keyCode == UP) {
       attractor att = new attractor(random(0,width-1),random(0,height-1), true, random(60, maxFactor));
       tractores.add(att);
    } 
    if (keyCode == DOWN) {
      int ultimotrac = tractores.size();
      if (ultimotrac>0){
      tractores.remove(ultimotrac-1);
      }
    } 
  }
}


