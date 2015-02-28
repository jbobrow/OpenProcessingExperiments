
float Xpos =200;
float Ypos =600;
float Xpos2 =600;
float Ypos2 =600;
float EXpos =500;
float EYpos =600;
float Mpos =600;
float Apos =200;
float ypos =300;

float text01_pos = 600;
float text02_pos = 600;
float text03_pos = 600;
float text04_pos = 600;
float text05_pos = 600;
boolean  gameStart = false;
int x = 0;
int y = 0;
int z = 500;



void setup() {
  size (800, 400);
  smooth();
  PFont score;
  textSize(15);
  score = createFont("verdana", 15);
}

void draw() {
  background (0);
  runIntro();


  if (gameStart == true) {

    introGetsAway();
    addCharacters();
    charactersMove();
    getScores();


    if (x>=5) {
      x=5;
      playerOneWins();
    }

    if (y>=5) {
      y=5;
      playerTwoWins();
    }

    if (mousePressed == true) {
      x=0;
      y=0;
    }
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        Apos -=10;
      }

      if (key == 'd' || key == 'D') {
        Apos +=10;
      }

      if (key == CODED) {
        if (keyCode == LEFT) {
          Mpos -=10;
        } 
        if (keyCode == RIGHT) {
          Mpos +=10;
        }
      }
    }
  }
}

void runIntro() {
  runText ();
  runImage();
}

void runText () {
  text("Monster(Player1) vs Alien(Player2)", text01_pos, 170);
  text("GET your own things and STAY away from the danger!", text02_pos, 200);
  text("Player1 presses 'LEFT' and 'RIGHT' to move, Player1 presses 'A' and 'D' to move, ", text05_pos, 230);
  text("YOU can't move together, FIGHT on the keyboard!", text03_pos, 260);
  text("Press 'UP' to start!", text04_pos, 290);
  text01_pos -=6;
  text02_pos -=5;
  text05_pos -=4;
  text03_pos -=3;
  text04_pos -=2;
  if (text01_pos <= 0) {
    text01_pos = 0;
  }
  if (text02_pos <= 0) {
    text02_pos = 0;
  }
  if (text03_pos <= 0) {
    text03_pos = 0;
  }
  if (text04_pos <= 0) {
    text04_pos = 0;
  }
  if (text05_pos <= 0) {
    text05_pos = 0;
  }
}


void runImage() {
  PImage[] M =new PImage[4];
  PImage n;
  n=loadImage("f.png");
  image(n, z-200, ypos+20, 40, 20);
  for (int i = 0; i < 4; i ++)
  {
    M[i]=loadImage("m.png");
  }
  for (int i = 0; i < 4; i ++)
  {

    image(M[int(0)], z-150, ypos, 50, 50); 
    image(M[int(1)], z-100, ypos, 50, 50); 
    image(M[int(2)], z-50, ypos, 50, 50);
    image(M[int(3)], z, ypos, 50, 50);
  }
  z--;
  if (z <= 0) {
    z = -50;
  }

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        gameStart = true;
      }
    }
  }
}


void introGetsAway() {
  text01_pos =  -1000;
  text02_pos =  -1000;
  text03_pos =  -1000;
  text04_pos =  -1000;
  text05_pos =  -1000;
  z = -50;
}


void addCharacters() {

  text(x, 250, 70);
  text(y, 250, 100);
  text("Player1_Score:", 100, 70);
  text("Player2_Score:", 100, 100);
  text("CLICK TO RESTART", mouseX, mouseY);
  PImage fish;
  PImage m;
  PImage a;
  PImage u;
  PImage e;
  e=loadImage("e.png");
  image(e, EXpos, EYpos, 40, 40);

  fish=loadImage("fish.png");
  image(fish, Xpos, Ypos, 50, 25);


  u=loadImage("u.png");
  image(u, Xpos2, Ypos2, 50, 25);


  m=loadImage("m.png");
  image(m, Mpos, 340, 60, 60);

  a=loadImage("A.png");
  image(a, Apos, 340, 60, 60);
}

void charactersMove() {
  EYpos+=20; 
  Ypos+=7; 
  Ypos2+=7; 
  if (Ypos>=400) {
    Ypos = 0;
    Xpos = random(0, 800);
  }

  if (Ypos2>=400) {
    Ypos2 = 0;
    Xpos2 = random(0, 800);
  }
  if (EYpos>=400) {
    EYpos = 0;
    EXpos = random(0, 800);
  }
}


void getScores() {
  if (Xpos >= Mpos-50 && Xpos <= Mpos + 50 && Ypos >= 300) {
    Ypos = 0;
    Xpos = random(0, 800);
    x++;
  }


  if (Xpos2 >= Apos-50 && Xpos2 <= Apos + 50 && Ypos2 >= 300) {
    Ypos2 = 0;
    Xpos2 = random(0, 800);
    y++;
  }

  if (EXpos >= Mpos-50 && EXpos <= Mpos + 50 && EYpos >= 300) {
    EYpos = -1000;
    EXpos = random(0, 800);
    x--;
  }

  if (EXpos >= Apos-50 && EXpos <= Apos + 50 && EYpos >= 300) {
    EYpos = -1000;
    EXpos = random(0, 800);
    y--;
  }
}


void playerOneWins() {
  text("Player1 Win!!!!", 200, 200);
  text("click to restart", 300, 300);
  Ypos = 0;
  Ypos2 = 0;
  EYpos = 0;
}


void playerTwoWins() {
  text("Player2 Win!!!!", 200, 200);
  text("click to restart", 300, 300);
  Ypos2 = 0;
  Ypos = 0;
  EYpos = 0;
}


