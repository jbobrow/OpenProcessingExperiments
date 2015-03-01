
PVector bPos = new PVector(0, 0);
PVector bVel = new PVector(10, 2);
int scoreO;
int scoreT;
float pSpeed = 15;

boolean p1UP, p1DN, p2UP, p2DN; 

PVector p1paddleDim = new PVector(5, 1);
PVector p2paddleDim = new PVector(1, 5);
int bSize = 20;
int p1Y;
int p2Y;

int p1X;
int p2X;

PFont ACaslon;
PFont Avenir;

void setup() {
  rectMode(CENTER);
  size(600, 600, P2D);

  //font
  Avenir = loadFont("ACaslon.vlw");
  ACaslon = loadFont("Avenir.vlw");

  scoreO = 0;
  scoreT = 0;

  bPos.x = height/2;
  bPos.y = height/2;

  p1Y = width/4;
  p2Y = height/4;
  p1paddleDim.x = 5;
  p1paddleDim.y = height/3;
  p2paddleDim.x = 5;
  p2paddleDim.y = height/3;
  p1X = 3;
  p2X = height - 3;
}

void draw() {

  background(0);
  fill(0);
  rect(width/2, height/2, width, height);

  //Divider * Credit to Leiah although I changed it up a bit
  fill(random(255), random(0), random(95));
  stroke(255, 255, 0);
  strokeWeight(2);
  for (int i = 0; i<30; i++) {
    ellipse(300, 15+i*36, 10, 10);
  }

  ellipseMode(CENTER);
  ellipse(bPos.x, bPos.y, bSize, bSize);

  rect(15, p1Y, p1paddleDim.x, p2paddleDim.y);
  rect(width-15, p2Y, p1paddleDim.x, p2paddleDim.y);
  moveLogic();
  collisionLogic();
  changeLogic();
  scoreLogic();
  stroke(50, 145, 195);
  fill(random(255));
  rect(pSpeed, p1Y, p1paddleDim.x, p1paddleDim.y);
  fill(random(255), random(50), random(0));
  rect(width-15, p2Y, p2paddleDim.x, p2paddleDim.y);
}

void keyPressed () {
  if (key == 'w') {
    p1UP = true;
    p1DN = false;
  }

  if (key == 's') {
    p1DN = true;
    p1UP = false;
  }


  if (key == CODED) {
    if (keyCode == UP) {
      p2UP = true;
      p2DN = false;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2UP = false;
      p2DN = true;
    }
  }
}

void keyReleased() {

  if (key == 'w') {
    p1UP = false;
  }

  if (key == 's') {
    p1DN = false;
  }


  if (key == CODED) {
    if (keyCode == UP) {
      p2UP = false;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2DN = false;
    }
  }
}

void moveLogic() {

  bPos.x -= bVel.x;
  bPos.y += bVel.y;
  stroke(35);
  fill (random(255));
  ellipse(bPos.x, bPos.y, bSize, bSize);

  if (p1UP) p1Y -= pSpeed + random(-10, 10);
  if (p1DN) p1Y += pSpeed + random(-10, 10);

  if (p2UP) p2Y -= pSpeed + random(-10, 10);
  if (p2DN) p2Y += pSpeed + random(-10, 10);
}

void collisionLogic() {

  if (bPos.x - bSize/2 <= p1X+(p1paddleDim.x/2 ) && bPos.x - bSize/2 > p1X - p1paddleDim.x/2 && bPos.y <p1Y + p2paddleDim.y/2 && bPos.y > p1Y - p1paddleDim.y/2) {
    bPos.x = 1 + bSize/2 - (p1X+(p1paddleDim.x/2 ));
    bVel.x *= -1;
  }

  if (bPos.x + bSize/2 >= p2X-(p2paddleDim.x/2 ) && bPos.x - bSize/2 < p2X + p2paddleDim.x/2 && bPos.y > p2Y - p2paddleDim.y/2 && bPos.y < p2Y + p1paddleDim.y/2) {
    bPos.x = (p2X-(p2paddleDim.x/2 ))- 1 - bSize/2;
    bVel.x *= -1;
  }
  if (bPos.y - bSize/2 < 0 || bPos.y + bSize/2 > height - 40 ) {
    bVel.y *=-1;
  }

  if (bPos.y + (bSize/2) >= height*2) {
    bVel.y *= -1;
  }
  if (bPos.y - (bSize/2) <= height-height) {
    bVel.y *= -1;
  }
}

void changeLogic() {

  fill(random(0), random(200), random(185));
  textSize(64);
  textAlign(CENTER); 
  textSize(30);
  textFont(ACaslon, 85);
  text(""+scoreT, 400, 200);
  if (bPos.x <= 25) {
    scoreT += 1;
    bPos.x = width/2;
    bVel.x *= -1;
    p1paddleDim.y -= 20;
    if (p1paddleDim.y <= 30) {
      p1paddleDim.y = 30;
      fill(random(125), random(92), random(5));
      rect(width/2, height/2, width, height);
    }
  }

  fill(random(195), random(95), random(175));
  text(""+scoreO, 200, 400);
  if (bPos.x > width) {
    scoreO += 1;
    bPos.x = width/2;
    bVel.x *= -1;
    p2paddleDim.y -= 10;
    if (p2paddleDim.y <= 30) {
      p2paddleDim.y = 30;
    }
    text(""+scoreT, 400, 400);
    if (bPos.x <= 0) {
      scoreT += 1;
      bPos.x = width/2;
      bVel.x *= -1;
      //ballVel.x -= 1;
      p1paddleDim.y -= 10;
      if (p1paddleDim.y <= 30) {
        p1paddleDim.y = 30;
      }
    }
  }
}
void scoreLogic () {
  //credit to Gentry who helped me with this!
  if (scoreT == 20) {
    fill(random(255), random(0), random(50));
    textSize(25);
    text("Player One Wins!", 450, 75);
    bVel.x = 0;
    bVel.y = 0;
  }

  if (scoreO == 20) {
    fill(random(255), random(255), random(50));
    textSize(25);
    text("Player Two Wins!", 100, 75);
    bVel.x = 0;
    bVel.y = 0;
  }
}



