
//This program creates a pogostick-like object that moves side-to-side and jumps using the WASD control layout. //In the constructor one can set the gravity to each pogo stick object to simulate how it might fall on a //different planet or just under different gravitational conditions.
Pogo jumpy;
Pogo mama;

void setup() {
  size(200, 200);
  jumpy = new Pogo(100, 0, 0, 0.7, 99, 229, 93);
  mama = new Pogo(75, 20, 0, 1.5, 242, 83, 88);
}

void draw() {
  background(255);
  jumpy.fall();
  jumpy.SideToSide();
  jumpy.display();
  mama.fall();
  mama.SideToSide();
  mama.display();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    jumpy.reset();
    mama.reset();
  }
  if (key == 'w' || key == 'W') {
    jumpy.jump();
    mama.jump();
  }
}
class Pogo {
  float x, y, speed, gravity, colorR, colorG, colorB, originalX, originalY, originalS;
  Pogo(float tempx, float tempy, float tempspeed, float tempgravity, float tempcolorR, float tempcolorG, float tempcolorB) {
    originalX = tempx;
    originalY = tempy;
    originalS = tempspeed;

    x = tempx;
    y = tempy;
    speed = tempspeed;
    gravity = tempgravity;
    colorR = tempcolorR;
    colorG = tempcolorG;
    colorB = tempcolorB;
  }

  void fall() {
    y = y + speed;
    x = x;
    speed = speed + gravity;
    if (y > height-23) { // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
      speed = speed * -.5; // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    }
  }
  void display() {
    stroke(colorR, colorG, colorB);
    line(x-3, y+2, x+3, y+2);
    line(x, y, x, y+23);
  }
  void SideToSide() {
    if (keyPressed) {
      if (key == 'd' || key == 'D') {
        x = x + 5;
      }
    }
    if (keyPressed) {  
      if (key == 'a' || key == 'A') {
        x = x - 5;
      }
    }
  }
  void jump() {
    speed = -9;
  }
  void reset() {
    background(255);
    x = originalX;
    y = originalY;
    speed = originalS;
  }
}
