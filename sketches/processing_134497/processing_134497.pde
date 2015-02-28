

woker[] w = new woker[500];

void setup() {
  size(400, 300);
  
  noStroke();

  fill(#2C064D);
   ellipse(random(100),random (height), 50, 50); 
  for (int i=0;i<w.length;i++) {
    w[i] = new woker(random(3, 10), random(200, 500));
  }
}

void draw() {
  //fondo con alfa
  fill(0);
  rect(0, 0, width, height);

  for (int i=0;i<w.length;i++) {
    w[i].run();
  }
}

void mousePressed() {
  for (int i=0;i<w.length;i++) {

    w[i].xPos = random(width); 
    w[i].yPos = random(height);
    
  }
}

class woker {

  float xPos, xVel;
  float yPos, yVel;
  float sz;

  woker(float _sz, float _vel) {
    xPos = random(width);
    yPos = random(height);
    xVel = _vel/2;
    yVel = _vel/2;
    sz = _sz;
  }
  
  void run(){
    actualizar();
    dibujar();
  }

  void actualizar() {
    //calculamos la distÃ¡ncia entre el mouse y la bola en los 2 ejes
    float distanceX = mouseX-xPos;
    float distanceY = mouseY-yPos;
    //y actualizamos la posiciÃ³n de manera que la bola no acabe de llegar nunca...
    xPos += distanceX/random(xVel);
    yPos += distanceY/random(yVel);
  }

  void dibujar() {
   
    fill(random(255),random(255),random(255));
    ellipse(xPos, yPos, sz, sz);
 
    
   
  }
  
} 



