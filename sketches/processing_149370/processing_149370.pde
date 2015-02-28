
float playerPosX, playerPosY;
float player2PosX, player2PosY;
int t = 3;
int b = 3;
boolean right = false, left = false, a = false, d = false, up = false, w = false;
ArrayList<Shell> shot = new ArrayList<Shell>();
ArrayList<Shell> shot2 = new ArrayList<Shell>();

PFont f;

void setup() {  
  size(400, 400);
  //top player
  playerPosX = (400/2) - (35/2);
  playerPosY = 10;
  //bottom player
  player2PosX = (400/2) - (35/2);
  player2PosY = 360;
  f = createFont("Arial", 16, true);
}


void draw() {  

  stroke(15);
  rect(0, 0, 400, 400);

  background(180);  

  fill(255);     

  rect(45, 200 - (55/2), 55, 55); //center left
  rect(295, 200 - (55/2), 55, 55); //center right
  rect(200 - (55/2), 200 - (55/2), 55, 55); //center

  fill(255, 0, 0);
  rect (playerPosX, playerPosY, 35, 35);
  fill(0, 0, 255);
  rect (player2PosX, player2PosY, 35, 35);

  //textfont (f,16);
  fill(255, 0, 0);
  text( "Lives : " + t, 10, 10);
  fill(0, 0, 255);
  text( "Lives : " + b, 10, 350);

  if (left == true) {
    if ( player2PosX > 5) {
      player2PosX = player2PosX - 7;
    }
  }
  if (right == true) {     
    if ( player2PosX < 360) {
      player2PosX = player2PosX + 7;
    }
  }  
  if (a == true) { // right
    if ( playerPosX > 5) {
      playerPosX = playerPosX - 7;
    }
  }
  if (d == true) { //left
    if ( playerPosX < 360) {
      playerPosX = playerPosX + 7;
    }
  }

  for (Shell shell : shot) {
    shell.update();
    shell.display();
    shell.gameplay1();
  }


  for (Shell shell1 : shot2) {
    shell1.update1();
    shell1.display();
    shell1.gameplay2();
  }
}


//Control//
void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (key == 'a' || key == 'A') {
    a = true;
  }
  if (key == 'd' || key == 'D') {
    d = true;
  }
  if (key == 'w' || key == 'W') {
    w = true;
    bang();
  }
  if (keyCode == UP) {
    up = true;
    pew();
  }
}
void keyReleased() {
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (key == 'a' || key == 'A') {
    a = false;
  }
  if (key == 'd' || key == 'D') {
    d = false;
  }
  if (key == 'w' || key == 'W') {
    w = false;
  }
  if (keyCode == UP) {
    up = false;
  }
}

///Game Parts///
void bang() {
  shot.add(new Shell(((int) playerPosX + (35/2)), (int)(playerPosY + 35)));
}

void pew() {
  shot2.add(new Shell(((int) player2PosX + (35/2)), (int)player2PosY));
}



class Shell {
  int x, y;
  int speed;

  Shell(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 5;
  }

  void update() {
    if ((y >= 200 - (55/2)) && (x >= 45) && x <= (45 + 55)) {
      speed = 0;
    } 
    else if ((y >= 200 - (55/2)) && (x >= 200 - (55/2)) && x <= (200 - (55/2) + 55)) { 
      speed = 0;
    } 
    else if ((y >= 200 - (55/2)) && (x >= 295) && x <= (295 + 55)) {
      speed = 0;
    } 
    else {
      y += speed;
    }
  }
  void update1() {
    if ((y <= (200 - (55/2) + 55)) && (x >= 45) && x <= (45 + 55)) {
      speed = 0;
    } 
    else if ((y <= 200 - (55/2) + 55) && (x >= 200 - (55/2)) && x <= (200 - (55/2) + 55)) { 
      speed = 0;
    } 
    else if ((y <= 200 - (55/2) + 55) && (x >= 295) && x <= (295 + 55)) {
      speed = 0;
    } 
    else {
      y -= speed;
    }
  }

  void gameplay1() {
    if ((y >= player2PosY) && (x <= (player2PosX + 35)) && (x >= player2PosX)) {
      b--;
      setup();
      if (b == 0) {
        endGame1();
        text("RED wins!", width/2, height/2);
      }
    }
    if (y == 400) {
      x = 500;
    }
  }
  void gameplay2() {
    if ((y <= playerPosY) && (x <= (playerPosX + 35)) && (x >= playerPosX)) {
      t--;
      setup();
      if (t == 0) {
        endGame1();
        text("BLUE wins!", width/2, height/2);
      }
    }
    if (y == 0) {
      x = 500;
    }
  }

  void endGame1() {
    noLoop();
    textAlign(CENTER);
    textSize(50);
  }

  void endGame2() {
    noLoop();
    textAlign(CENTER);
    textSize(50);
  }



  void display() {
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
}
