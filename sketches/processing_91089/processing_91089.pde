
//0 - Main Menu
//1 - Play Game
//2 - Pause Screen
//3 - Options
//4 - Credits

int screens = 0; //Default loading screen
PImage startScreen; //Our starting screen image

void setup() {
  size(800, 600); //Up to Jerry to decide
}

void draw() {
  switch(screens) {
  case 0: 
    loadStartScreen();
    break;
  case 1: 
    loadGamePlay(); 
    break;
  case 2: 
    pauseGame();
    break;
  case 3: 
    loadOptions();
    break;
  case 4: 
    loadCredits();
    break;
  }
}
  
void loadStartScreen(){  //Code to load start screen 
 startScreen = loadImage("startscreen.png");
 
 int timer = millis();
 image(startScreen,0,0); //Position image on screen


   
 
 
}

void loadGamePlay(){
  //Code to load the real game
}

void pauseGame(){
  //Code to pause game
}

void loadOptions(){
  //Code to load options
}

void loadCredits(){
  //Code to load credits
}
  
