
PImage img;
int amount = 1000;
Punt[] puntje = new Punt[amount];

void setup() {
  img = loadImage("foto1.png");
  int wth = img.width;
  int hth = img.height;
 // amount = (wth*hth)/10;
 // size(wth,hth);
  size(450,291);
  for (int i = 0; i < amount; i++) {
  puntje[i] = new Punt(int(random(width)),int(random(height)),int(random(3)));
  }
  
  for (int i = 0; i < amount; i++) {
  puntje[i].begin();
  }
  
  background(255);
  //image(img,0,0);

  }
  
  void draw() {
  img.loadPixels();
  for(int i = 0; i < amount; i++) {
   puntje[i].move();
  } 
    img.updatePixels();
  }
  
  class Punt {
 float x, y;
 float lastx,lasty;
 float theta;
 int direction;
 int life = 0;
 float rb,gb,bb;


Punt(int X,int Y,int D) {
 x = X;
 y = Y;
 direction = D;
  theta = random(2*PI);
}

  void begin() {
    int loc = int(x) + int(y)*width;
 //   println(loc);
     rb = red(img.pixels[loc]);
     gb = green(img.pixels[loc]);
     bb = blue(img.pixels[loc]);
  }
  
  void move() {
    life++;
    if (life > 50) {newLife();}
    if(x >= width || x <= 0 || y <= 0 || y >= height) newLife();
     int loc = int(x) + int(y)*width;
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    if (r < rb-10 || r > rb+10 || g < gb-10 || g > gb+10 || b < bb-10 || b > bb+10){
    theta += random(-0.1,0.2);
   x = lastx;
   y = lasty;
   life++; life++; life++; life++;}
    else {
     stroke(rb,gb,bb,128);
     // println(rb);
      lastx=x;
     lasty=y;
     theta += random(-0.2,0.5);
   x += random(3)*sin(theta);
   y += random(3)*cos(theta);
     line(x,y,lastx,lasty);}
  }
  
  void newLife() {
    x = int(random(width)); y = int(random(height)); life = 0; direction = int(random(3)); begin();
  }
  
}

void mouseClicked() {
 setup(); 
}

