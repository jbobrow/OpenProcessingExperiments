
//variables
PImage spider;
PImage back;
PImage title;

//define gameState
int gameState = 0;
  
/////////////////////////////////////////////
//setup

void setup() {
  
  //basic
  size(800, 800);
  smooth ();
  noStroke();
  
  //define images
  spider = loadImage("spider.png");
  back = loadImage("back.png");
  title = loadImage("title.png");
}

/////////////////////////////////////////////
//draw

void draw() {
  
  //set cursor
  cursor(spider);

  //call gameState  
  gameState();
  
}


/////////////////////////////////////////////
//key

void keyPressed() {
  if (keyCode == ENTER) {
    gameState++;
    if (gameState >= 2) {
      gameState = 0;
    }
  }
}


