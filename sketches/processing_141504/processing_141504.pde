
ArrayList auras;
int radar = 10;
float speed = 2;

int jiggle = 2;

void setup() {
  size(800, 600);
  smooth();
  auras = new ArrayList();
  auras.add(new Circle(random(width), random(height)));
}

void draw() {
  //background(0);
  fill(255, 10);
  rect(0, 0, width, height);

  if (frameCount > 60*speed) {
    auras.add(new Circle((width),(height)));
    if (speed > 0.1)
      speed -= 0.02;
    frameCount = 0;
  }

  for (int i=0; i < auras.size(); i++) {
    Circle myCircle = (Circle) auras.get(i);
    myCircle.drawCircle();
  }
}


class Circle {
  float specialX;
  float specialY;
  int specialSize = radar*2;
  int alph = 0;
  

  Circle(float tempX, float tempY) {
    specialX = tempX;
    specialY = tempY;
  }

  void drawCircle() {
    fill(0);
    noStroke();

    specialX += (mouseX - specialX) * 0.05;
    specialY += (mouseY - specialY) * 0.05;

    

    ellipse(specialX, specialY, specialSize, specialSize);
    alph += 10;
  
  }
}




