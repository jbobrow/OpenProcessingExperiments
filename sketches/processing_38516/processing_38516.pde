
PImage img;
int amount = 250;
Punt[] puntje = new Punt[amount];

void setup() {
  size(313,313);
  img = loadImage("fblogo.png");
  for (int i = 0; i < amount; i++) {
  puntje[i] = new Punt(int(random(width)),int(random(height)),int(random(3)));
  }
  
  background(255);
 // image(img,0,0,313,313);

  }
  
  void draw() {
  //loadPixels();
  img.loadPixels();
  for(int i = 0; i < amount; i++) {
   puntje[i].move();
  } 
    img.updatePixels();
  }
  
  class Punt {
 int x, y;
 float theta;
 int direction;
 int life = 0;


Punt(int X,int Y,int D) {
 x = X;
 y = Y;
 direction = D;
  theta = 1;
}
  
  void move() {
    life++;
    if(x >= width || x <= 0 || y <= 0 || y >= height) newLife();
     int loc = x + y*width;
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    if (r < 225 && g < 225 && b < 225){
      stroke(r,g,b);
    point(x,y);
    if(direction == 0) { x += 1; }
    if(direction == 1) { x -= 1; }
    if(direction == 2) { y += 1; }
    if(direction == 3) { y -= 1; }
    }
    else {newLife();}
    if (life > width/6) {newLife();}
  }
  
  void newLife() {
    x = int(random(width)); y = int(random(height)); life = 0; direction = int(random(3));
  }
  
}

void mouseClicked() {
 setup(); 
}

