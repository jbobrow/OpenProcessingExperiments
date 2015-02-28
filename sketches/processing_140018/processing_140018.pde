
PShape bot;

void setup() {
  size(1000, 650);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("monster.svg");
} 

void draw(){
    shape(bot, mouseX, mouseY, 100, 100);  // Draw at coordinate (110, 90) at size 100 x 100
  }


