
//Vanessa Faienza
//Problem Set 3 - Question 2

boolean animate = true;

int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;

FallingBall[] b = new FallingBall[50];  

void setup() {
  size(400, 400);
  smooth();

  for (int i=0; i < b.length; i++) {
    b[i] = new FallingBall(random (-50, 150), random(-100, 0), 0, random(0.3, 1));
  }
}

void draw() {
  background(255);


  for (int i=0; i < b.length; i++) {
    b[i].display(animate);
  }
  if (animate == true) {
    fill(0);
  }

  rect(btnX, btnY, btnW, btnH);
}


class FallingBall {

  float x;
  float y;
  float speed;
  float gravity;
  float weight;


  FallingBall(float ballX, float ballY, float ballS, float ballW) {
    this.speed = ballS;
    gravity = 0.1;
    this.x = ballX;
    this.y = ballY;
    this.weight = ballW;
  }


  void display(boolean ballAni) {
    if (ballAni == true) {

      this.y = this.y + this.speed + this.weight;  
      this.speed = this.speed + gravity;

      if (this.y >= height-100) {
        this.speed *= -0.9;
        this.y = height-100;
      }
    }

    fill(14, 237, 224);
    ellipse(width/4 + this.x, this.y, 50*this.weight, 50*this.weight);
  }
}

void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    animate = !animate;
  }
}

