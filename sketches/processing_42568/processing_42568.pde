
float Xpos = random(0, 300);
float Ypos = random(0, 300);
float Xpos2 = random(0, 300);
float Ypos2 = random(0, 300);
float speedX = random(5, 10);
float speedY = random(5, 10);
float speedA = random(5, 10);
float speedB = random(5, 10);
boolean gameStart = true;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(0);
  ellipse(Xpos, Ypos, 20, 20);
  ellipse(Xpos2, Ypos2, 20, 20);
  rect(mouseX, mouseY, 30, 30);

  if (gameStart = true) {
    Xpos = Xpos + speedX;  
    Ypos = Ypos + speedY;
    Xpos2 = Xpos2 + speedA;  
    Ypos2 = Ypos2 + speedB;
  }
  if (Xpos >= 300) {
    speedX = speedX * -1;
  }
  if (Xpos <= 0) {
    speedX = speedX * -1;
  }
  if (Ypos >= 300) {
    speedY = speedY * -1;
  }
  if (Ypos <= 0) {
    speedY = speedY * -1;
  }


  if (Xpos2 >= 300) {
    speedA = speedA * -1;
  }
  if (Xpos2 <= 0) {
    speedA = speedA * -1;
  }
  if (Ypos2 >= 300) {
    speedB = speedB * -1;
  }
  if (Ypos2 <= 0) {
    speedB = speedB * -1;
  }

  if (Xpos >= mouseX && Xpos <= mouseX+20 && Ypos >= mouseY && Ypos <= mouseY +20) {
    println("work1");
    fill(255, 0, 0);
    Xpos = mouseX+20;
    Ypos = mouseY+20;
    Xpos2 = mouseX+20;
    Ypos2 = mouseY+20;
  }

  if (Xpos2 >= mouseX && Xpos2 <= mouseX+20 && Ypos2 >= mouseY && Ypos2 <= mouseY +20) {
    println("work2");
    fill(255, 0, 0);
    Xpos2 = mouseX+20;
    Ypos2 = mouseY+20;
    Xpos = mouseX+20;
    Ypos = mouseY+20;
  }

  if (mousePressed == true) {
    fill(255);
    gameStart = true;
  }
}


