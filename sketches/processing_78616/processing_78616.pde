
int totalDice = 1024;

Wuerfel[][] grid;

int cols = int(sqrt(totalDice));
int rows = int(sqrt(totalDice));

void setup() {
  size(720, 480); 
  background(150);
  fill(0);
  noStroke();
  frameRate(50);
  randomSeed(totalDice);
  smooth();
  grid = new Wuerfel[cols][rows];

  for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      grid[i][j] = new Wuerfel(i*width/sqrt(totalDice), j*width/sqrt(totalDice), width/sqrt(totalDice), random(frameCount % 6));
    }
  }
}

void draw() {
  background(255);

  /*
  translate(360,-360);  
  rotate(radians(45));
  scale(1.2);
  */
  
  for (int j=0; j < cols; j++) {
    for (int i=0; i < rows; i++) {
      grid[i][j].display();
      grid[i][j].update();
    }
  }
}


void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("line-######.png");
  }
}

class Wuerfel {

  float diceSize, xpos, ypos;
  float radius;
  int count;
  float offset = 1.5;
  int life;

  Wuerfel(float _xpos, float _ypos, float _diceSize, float _count) {
    xpos = _xpos;
    ypos = _ypos;
    count = int(_count);
    diceSize = _diceSize;
    radius = diceSize/5;
    
    int life = 255 + int(random(frameCount % 300));
  }

  void display() {

    if (count == 1) {
      showOne();
    }
    if (count == 2) {
      showTwo();
    }
    if (count == 3) {
      showThree();
    }
    if (count == 4) {
      showFour();
    }
    if (count == 5) {
      showFive();
    }
    if (count == 6) {
      showSix();
    }
  }

  void update() {
    fill(0,life);
    life -= 2;
    if (life <= 0) {
      count += int(random(-6, 6));
      if (count < 1 || count > 6) {
        count = abs(int(random(1, 6)));
        life = 255 + int(random(300));
      }
    }
    //println(life);
  }

  void showOne() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2, ypos + diceSize/2, radius, radius);
  }
  void showTwo() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
  }  
  void showThree() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
  }
  void showFour() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
  }
  void showFive() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2, ypos + diceSize/2, radius, radius);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
  }
  void showSix() {
    fill(255);
    rect(xpos, ypos, diceSize, diceSize);
    fill(0,life);
    ellipseMode(CENTER);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2-radius*offset, ypos + diceSize/2, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2-radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2+radius*offset, radius, radius);
    ellipse(xpos + diceSize/2+radius*offset, ypos + diceSize/2, radius, radius);
  }
}
