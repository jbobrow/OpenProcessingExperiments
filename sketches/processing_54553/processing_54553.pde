
Pea[] peas = new Pea[256];
int numPeas = 256;
int d = 25;
 
void setup() {
  size(400, 400);
  smooth();
  int i = 0;
  for (int x = 0; x < 400; x += d) {
    for (int y = 0; y < 400; y += d) {
      peas[i] = new Pea(x, y, d);
      i++;
    }
  }
}
 
void draw() {
  background(255);
  for (int i = 0; i < numPeas; i++) {
    peas[i].display();
  }
}
 
void mouseClicked() {
 for (int i = 0; i < numPeas; i++) {
    if (mouseX < peas[i].getX() + d && mouseX > peas[i].getX() && mouseY < peas[i].getY() + d && mouseY > peas[i].getY()) {
      peas[i].hide();
    }
 }
}
 
void keyPressed() {
  if (key == 'i') {
    for (int i = 0; i < numPeas; i++) {
      peas[i].hide();
    }
  }
 }

class Pea {
   
  int posX;
  int posY;
  int siz;
  int c;
   
  Pea(int x, int y, int d) {
    posX = x;
    posY = y;
    siz = d;
    c = 0;
  }
   
  void display() {
    noStroke();
    fill(c);
    rect(posX, posY, siz, siz);
  }
   
  int getX() {
    return posX;
  }
   
  int getY() {
    return posY;
  }
   
  void hide() {
    if (c == 0) c = 255;
    else c = 0;
  }
   
}class Pea {
   
  int posX;
  int posY;
  int siz;
  int c;
   
  Pea(int x, int y, int d) {
    posX = x;
    posY = y;
    siz = d;
    c = 0;
  }
   
  void display() {
    noStroke();
    fill(c);
    rect(posX, posY, siz, siz);
  }
   
  int getX() {
    return posX;
  }
   
  int getY() {
    return posY;
  }
   
  void hide() {
    if (c == 0) c = 255;
    else c = 0;
  }
   
}


