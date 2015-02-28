
Walker[] wkrs = new Walker[800] ;

void setup() {
  size(800, 600);
  for (int i=0; i<wkrs.length;i++) {
    //parametros: x,y,velocidad 
    wkrs[i] = new Walker(random(width),random(height),random(30,50));
  }
}

void draw() {
  //  background(0);
  fill(0, 0, 0, random(0, 15));
  rect(0, 0, width, height);  
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i].run();
  }
}

class Walker {
  float x, y, stepX, stepY, sz, Vel; 

  Walker(float _x, float _y, float _v) {
    x = _x;
    y = _y;
    Vel = _v;
    stepX = 35;
    stepY = 35;
    sz = 3;
  }

  void run() {
    update();
    display();
    actualizarPosicion();
  }
  void display() {
    noStroke();
    fill(random(100, 120), random(150, 245), random(150, 200), random(80, 235));
    ellipse(x, y, sz, sz);
  }



  void update() {
    //movimiento en X
    float r = random(100);
    if (r < 50) {
      x += stepX;
    } 
    else {
      x -= stepX;
    } 
    //movimiento en Y
    r = random(100);
    if (r < 50) {
     y += stepY;
    } 
    else {
     y -= stepY;
    }
  } 

 void actualizarPosicion() {
    float distanceX = mouseX-x;
    float distanceY = mouseY-y;
    x += (distanceX/Vel)+random(-1,1);
    y += (distanceY/Vel)+random(-1,1);
    //y actualizamos la posiciÃ³n de manera que la bola no acabe de llegar nunca...
    //xPos += distanceX/Vel;
    //yPos += distanceY/Vel;
  }
}
