

Food f1, f2;
Player1 p1;


float eX = 350;
float eY = 350;
float pX = 400;
float pY = 400;
float easing = .07;

void setup() {
  size(450, 450);
  frameRate(24);
  f1 = new Food(200, 300, 92);
  f2 = new Food(150, 200, 92);
  p1 = new Player1(200,200,.07);
  
}  

void draw() {
  background(#0B1783);
  f1.display();
  f2.display();
  p1.display();
  
}

void player1() {
  
}




class Food {
  int timer = 0;
  float fX = 300;
  float fY = 300;
  int respawn;

  Food(float tempX, float tempY, int tempTime) {
    fX = tempX;
    fY = tempY; 
    respawn = tempTime;
  }

  void display() {
    timer++;
    if (timer >= 48) {
      fX = random(width);
      fY = random(height);
      timer = 0;
    }  
    float distance = dist(p1.pX, p1.pY, fX,fY);
    if(distance < 30){
      fX = random(width);
      fY = random(height);
      timer = 0;
      println("collision");
    }
    fill(#9D09E8);
    ellipse(fX, fY, 30, 30);
  }
}

class Player1 {
  float pX;
  float pY;
  float easing;


  Player1(float tempX, float tempY, float tempEasing) {
    pX = tempX;
    pY = tempY;
    easing = tempEasing;
  }
  void display() {
    float targetX = mouseX;
    float targetY = mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY -pY) * easing;
    fill(#A71414);
    ellipse(pX, pY, 30, 30);
    
  }
}



