
//The amazing game of shoot.
//Player one = 'a', player two = 'l' to shoot the duck
//Press SPACE to go again.
//Press 'y' at the same time to restart.

PFont font1 = createFont("Courier Bold", 50); //big font
PFont font2 = createFont("Ariel", 12); //small font

PImage[] bushes = new PImage[2];
PImage[] ducks = new PImage[15];

int frame=0;
int frame1=0;

void setup() {
  bushes[0] = loadImage("image1.bmp");
  bushes[1] = loadImage("image2.bmp");

  ducks[0] = loadImage("image3.bmp");
  ducks[1] = loadImage("image4.bmp");
  ducks[2] = loadImage("image5.bmp");
  ducks[3] = loadImage("image6.bmp");
  ducks[4] = loadImage("image7.bmp");
  ducks[5] = loadImage("image8.bmp");
  ducks[6] = loadImage("image9.bmp");
  ducks[7] = loadImage("image10.bmp");
  ducks[8] = loadImage("image11.bmp");
  ducks[9] = loadImage("image12.bmp");
  ducks[10] = loadImage("image13.bmp");
  ducks[11] = loadImage("image14.bmp");
  ducks[12] = loadImage("image15.bmp");
  ducks[13] = loadImage("image16.bmp");
  ducks[14] = loadImage("image17.bmp");

  frameRate(30);
  size(400, 400); //size 400 * 400 size of pictures
  background(0); //background is black
  textAlign(CENTER, CENTER); //text aligns center horizontally and center vertically
}

boolean bool_shoot; //
boolean bool_won; //
boolean bool_p1won; 
boolean bool_p2won;

int time;

int player1;
int player2;


int rand = int(random(60, 300)); //a random value adjusted to the frame rate (60) between 1 and 5 seconds
void draw() {
  image(bushes[frame], 0, 0);
  if (millis()%2000>0 && millis() % 2000 < 120) { //every 1.88 seconds the bush will shake
    frame++;
  }
  if (frame>1) {
    frame = 0;
  }



  bool_won = bool_p1won || bool_p2won;
  if (time == rand && !bool_won) {
    bool_shoot = true;
    time = 0;
  }
  if (bool_shoot) {
    //shows the duck flying away
    image(ducks[frame1], 0, 0);
    if (frame1<14) {
      frame1++;
    }
  }

  textFont(font2);
  text("Player 1", 35, 20);
  text("Wins: "+str(player1), 35, 35);
  text("Player 2", 365, 20);
  text("Wins: "+str(player2), 365, 35);
  textFont(font1);

  if (bool_p1won) {
    bool_shoot = false;
    text("Player 1 wins!", 200, 320);
  }

  if (bool_p2won) {
    bool_shoot = false;
    text("Player 2 wins!", 200, 320);
  }

  time += 1;
}

void keyPressed() {
  if (!bool_shoot && !bool_won) {
    if (key == 'l') {
      bool_p1won = true;
      player1++;
    }
    if (key == 'a') {
      bool_p2won = true;
      player2++;
    }
  }

  if (bool_shoot && !bool_won) {
    if (key == 'a') {
      bool_p1won = true;
      player1++;
    }
    if (key == 'l') {
      bool_p2won = true;
      player2++;
    }
  }

  if (bool_won && key == ' ') {

    int rand = int(random(60, 300));
    time = 0;
    frame1 = 0;
    bool_won = false;
    bool_p1won = false;
    bool_p2won = false;
    bool_shoot = false;
  }
  if (bool_won && key == 'y') {

    int rand = int(random(60, 300));
    frame1 = 0;
    time = 0;
    bool_won = false;
    bool_p1won = false;
    bool_p2won = false;
    bool_shoot = false;
    player1 = 0;
    player2 = 0;
  }
}



