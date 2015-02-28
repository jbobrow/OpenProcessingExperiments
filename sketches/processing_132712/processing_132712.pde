
//if statements, for loops,

Food f1, f2;
Player1 p1;


void setup () {
  size(500, 500);
  frameRate(24);
  f1 = new Food(200,300,92);
  f2 = new Food(100,200,92);
  p1 = new Player1(300,300,.05);
}

void draw(){
  background(0);
  f1.display();
  f2.display();
  p1.display();
}
 

class Food {
  int timer = 0;
  float fX;
  float fY;
  int respawn;

  Food(float tempX, float tempY, int tempTime) {
    fX = tempX;
    fY = tempY;
    respawn = tempTime;
  }

  void display() {
    timer++;
    if (timer >= respawn) {
      fX = random(width);
      fY = random(height);
      timer = 0;
    }
    float distance = dist(p1.pX, p1.pY, fX, fY);
    if (distance < 20) {
      fX = random(width);
      fY = random(height);
      timer = 0;
      println("collision");
    }
    fill(#F7EBEC);
    ellipse(fX, fY, 30, 30);
  }
}

class Player1 {
  float pX;
  float pY;
  float easing;

  Player1(float tempX, float tempY, float tempEasing) {
    pX= tempX;
    pY= tempY;
    easing = tempEasing;
  }

  void display() {
    float targetX = mouseX;
    float targetY = mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY - pY) * easing;
    fill(#F01835);
    ellipse(pX, pY, 30, 30);
  }
}



