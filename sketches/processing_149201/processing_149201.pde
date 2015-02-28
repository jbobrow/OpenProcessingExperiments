
float playerPosX, playerPosY;
float player2PosX, player2PosY;
int t = 3;
int b = 3;
boolean right = false, left = false, 
a = false, d = false, up = false, w = false;
ArrayList<Shell> shot = new ArrayList<Shell>();
ArrayList<Shell> shot2 = new ArrayList<Shell>();

PFont f;

void setup() {  
  size(400, 400);
  //top player
  playerPosX = 10;
  playerPosY = 10;
  //bottom player
  player2PosX = 360;
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
  fill(0, 0, 255);
  text( "Lives : " + t, 10, 10);
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
  }


  for (Shell shell1 : shot2) {
    shell1.update1();
    shell1.display();
  }
}



void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (key == 'a') {
    a = true;
  }
  if (key == 'd' ) {
    d = true;
  }
  if (key == 'w') {
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
  if (keyCode==RIGHT) {
    right = false;
  }
  if (key=='a') {
    a = false;
  }
  if (key=='d') {
    d = false;
  }
  if (key == 'w') {
    w = false;
  }
  if (keyCode == UP) {
    up = false;
  }
}

/////////////////////////////////////////////
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
    speed = 10;
  }

  void update() {
    y += speed;
  }
  void update1() {
    y -= speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(0, 0, 2, 2);
    popMatrix();
  }
}

