
sky cloud;
sky plane;
sky fly;
sky sail;
sky sea;
sky dust;
sky speck;
sky firefly;
sky lightning;
sky free;
sky electric;
sky blink;
 
void setup() {
  size(1500, 1000);
  background(0);
  noStroke();
 
  cloud = new sky(1, 2, 3);
  plane = new sky(4, 5, 6);
  fly = new sky(7, 8, 9);
  sail = new sky(10, 11, 12);
  sea = new sky(13, 14, 15);
  dust = new sky(16, 17, 18);
  speck = new sky(19, 20, 21);
  firefly = new sky(22, 23, 24);
  lightning = new sky(25, 26, 27);
  free = new sky(28, 29, 30);
  electric = new sky(31, 32, 33);
  blink = new sky(34, 35, 36);
}
void draw() {
  cloud.move();
  cloud.display();
  plane.move();
  plane.display();
  fly.move();
  fly.display();
  sail.move();
  sail.display();
  sea.move();
  sea.display();
  dust.move();
  dust.display();
  speck.move();
  speck.display();
  firefly.move();
  firefly.display();
  lightning.move();
  lightning.display();
  free.move();
  free.display();
  electric.move();
  electric.display();
  blink.move();
  blink.display();
  
}

class sky {
 float x;
 float y;
 int measure;
 float speed = 40;
 sky(float whatX, float whatY, int whatMeasure) {
 x = whatX;
 y = whatY;
 measure = whatMeasure;
 }
 void move() {
 x += random(-speed, speed);
 y += random(-speed, speed);
 // += random(-speed, speed);
 }
 void display() {
   fill(224, 255, 0, 50);
 ellipse(x, y, measure, measure);
 
 }
}



