
//PS3_QUESTION.3_KESHIA.KINGSLEY

PShape bot;

void setup() {
  size(640, 360);
  smooth();
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("bot1.svg");

} 

void draw() {
  background(102);
  
  // Draw left bot
  bot.disableStyle();  // Ignore the colors in the SVG
  fill(0, 102, 153);  // Set the SVG fill to blue
   stroke(255);
translate(width/2, height/2);
 float zoom = map(mouseX, 0, height, 0.1, 4.5); // scales the drawing
  scale(zoom);
shape(bot,-140,-140);


  //Draw right bot
  translate(width/4,45);
  float zoom1 = map(mouseY, 0, width, -0.6, 4.5); // scales the drawing
  scale(zoom1); //
  bot.enableStyle();
  shape(bot, -500, -200); 
}

