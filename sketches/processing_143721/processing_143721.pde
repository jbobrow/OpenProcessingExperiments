
// Game
// Computational Arts : Visual Arts
// Coursera
// Last update : 4 April 2014

// Define words array
String[] words = {"jeu", "game", "permainan", "juego", "gioco", "spel", 
"lojë", "Spiel", "oyun", "spil", "mäng", "peli", "cluiche", "leikur", 
"ipsum", "spillet", "gra", "jogo", "joc", "hra", "igra", "ciyaarta", 
"mchezo", "laro", "ere"};
color[] palette = {#210CE8, #BF142A, #087F24, #FFF421, #E76011};
int[] wordSize = {24, 36, 48, 72};
int counter;

// Setup
void setup(){
  // window size for this assignment
  size(900, 1000);
  // set background black
  background(0);
}

void draw(){
  while (counter < 150) {
    // set color random from palette
    fill(palette[int(random(0, 5))]);
    
    // Random location
    float x = random(0, width-150);
    float y = random(50, height-10);
    
    // PFont
    //PFont calibri = loadFont("calibri.vlw");

    // Write random text
    textSize(wordSize[int(random(0, 4))]);
    //textFont(calibri);
    text(words[int(random(0, words.length))], x, y);
    
    counter++;
  }
}

// keyPressed()
void keyPressed() {
  // Press s or S to save image
  if (key == 's' || key == 'S') {
    saveFrame("screenshot.png"); 
  }
  
  // DELETE or BACKSPACE to restart drawing
  if (key == DELETE || key == BACKSPACE) {
    background(0); 
  }
  
}



