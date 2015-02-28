
RomanZolanski nicki;
RomanZolanski minaj;
RomanZolanski Super;
RomanZolanski Bass;
RomanZolanski Star;
RomanZolanski Ships;

void setup() {
  size(1000, 1000);
  //background(204, 255, 255);
  noStroke();

  nicki = new RomanZolanski(0, 100, 70);
  minaj = new RomanZolanski(200, 200, 20);
  Super = new RomanZolanski(300, 300, 30);
  Bass = new RomanZolanski(500, 350, 50);
  Star = new RomanZolanski(300, 100, 10);
  Ships = new RomanZolanski(300, 200, 30);
}
void draw() {
  nicki.move();
  nicki.display();
  minaj.move();
  minaj.display();
  Super.move();
  Super.display();
  Bass.move();
  Bass.display();
  Star.move();
  Star.display();
  Ships.move();
  Ships.display();
 
}
void mouseClicked(){
  background(random(255), random(255), random(255));
}

class RomanZolanski {
 float x;
 float y;
 int diameter;
 float speed = 15;
 RomanZolanski(float tempX, float tempY, int tempDiameter) {
 x = tempX;
 y = tempY;
 diameter = tempDiameter;
 }
 void move() {
 x += random(-speed, speed);
 y += random(-speed, speed);
 }
 void display() {
   fill(255, mouseX, mouseY, 70);
 ellipse(x, y, diameter, diameter);
 } 
}
