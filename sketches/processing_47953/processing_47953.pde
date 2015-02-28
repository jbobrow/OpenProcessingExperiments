


///CONFIG VARS
float jitterFactor         =  10;
int   cantidadParticulas   =  550;
int   screenWidth          =  500;
int   screenheight         =  400;
//CLASS OBJECTS
PGraphics screenBuffer1;
Particula particulas[];


void setup() {
  println("setup");
  size(500, 400);
  frameRate(100);
  
  //instance objects
  initObjects();
}

void initObjects() {

  println("init objects - start");
  particulas = new Particula[cantidadParticulas];
  for (int i=0; i<particulas.length; i++) {
    particulas[i] = new Particula(noise(i)*width, noise(i*2)*height);
  }
  screenBuffer1 = createGraphics(width, height, P3D); 
  screenBuffer1.beginDraw();
  screenBuffer1.background(255);
  screenBuffer1.endDraw();
  screenBuffer1.strokeWeight(2);
  println("init objects - end");
}

void update() {
   for (int i=0; i<particulas.length; i++) {
     particulas[i].jitter(jitterFactor);
   }
}

void draw() {
  update();
  //DRAW ON BUFFER 1
  drawBuffer1(screenBuffer1, particulas);
  image(screenBuffer1, 0, 0);
}

void drawBuffer1(PGraphics buffer, Particula arregloParticulas[]) {
  buffer.beginDraw();
  screenBuffer1.stroke(0, 30);
  for (int i=0; i<arregloParticulas.length; i++) {
    buffer.line(arregloParticulas[i].x, arregloParticulas[i].y, arregloParticulas[i].x1, arregloParticulas[i].y1);
  }
  buffer.endDraw();
}

void keyPressed() 
{
  /*
  if (key == 's') {
    save("image"+(int(random(0, 100)))+".jpg");
  }
  */
}

void mouseClicked() {
  screenBuffer1.background(255);
  for (int i=0; i<particulas.length; i++) {
    particulas[i] = new Particula(noise(i)*width, noise(i*2)*height);
  }
}


