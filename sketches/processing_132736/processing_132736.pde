

Food f1, f2;
Player1 p1;



void setup() {
  size(500, 300);
  frameRate(24);
  f1 = new Food(200, 300, 92);
  f2 = new Food(100, 200, 92);
  p1 = new Player1(300, 300, 10);
}

void draw() {
  background(120);
  bGround();
  f1.display();
  f2.display();
  p1.display();
}







void bGround() {
  for (int i = 0; i < width; i += 25) {
    for (int j = 0; j < height; j += 25) {
      fill(#E1F4F5);
      ellipse(i, j, 25, 25);
    }
  }
}





class Player1 {
  float pX;
float pY;
float speed;
color pColor = color(#92E5AA);

 Player1(float tempX, float tempY, float tempSpeed){
   pX = tempX;
   pY = tempY;
   speed = tempSpeed;
 }
 void display(){
 if (keyPressed) {
    if (key=='a') {
      pX -= speed;
    }
    if (key=='d') {
      pX += speed;
    }
    if (key=='s') {
      pY += speed;
    }
    if (key=='w') {
      pY -= speed;
    }
  }
  fill(pColor);
  rect(pX, pY, 30, 30);
 }
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
    float distance = dist(p1.pX,p1.pY,fX,fY);
    if(distance < 20){
       fX = random(width);
      fY = random(height);
      timer = 0;
      println("collision");
    }
    fill(#2EFF0F);
    ellipse(fX, fY, 30, 30);
  }
  
}



