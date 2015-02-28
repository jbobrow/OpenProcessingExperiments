
PFont titleFont = createFont("Impact", 20);
int INTRO = 0;
int RUN_GAME = 1;
int GAME_OVER = 2;
int gameState;

Cloud c;
Candy [] can = new Candy [8];
Basket bas;
int score = 0;



void setup () {
  size (500, 600);
  smooth ();
  noStroke();
  c = new Cloud ();
  bas = new Basket();


  for (int i = 0; i < can.length; i++) {
    x[i] = random (width);
    y[i] = random (height);
    speed [i] = random (0.1, 0.3);
    can [i] = new Candy();
  }
}
////////////////////////////////////////////////////////////
void draw () {

  if (gameState == INTRO) {
    intro();
  }
  else if (gameState == RUN_GAME) {
    runGame();
  } 
  else if (gameState == GAME_OVER) {
    gameover();
  }
}
//--------------------------------------------------------------



void intro() {
  background(200, 245, 255);

  fill(0);
  
  textFont(titleFont);
  text("Candy Catchers", width/16, height/2);
  //textFont(basicFont);
  text("By:Georgina.Y,Keshia.K and Simone.R", width/16, 350);
  text ("Instructions: Cacth as many Candy as you can before time",width/16,440);
  text("runs out! If you miss one you'll lose a point.",width/16,460);
  text ("Click to start!", width/16, 500);
}

void runGame() {
  background (172, 235, 250);
  for (int i = 0; i < can.length; i++) {
    can[i].run_game();
   
  }

  c.display();
  bas.operate();
}



//---------------------------------------------------------------


