
/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen. 
 */


int x = 30;
PFont fontA;
  
void setup() 
{
  size(540, 540);
  background(255);

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("BankGothic-Medium-90.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);

  // Only draw once
  noLoop();
}

void draw() {
  // Use fill() to change the value or color of the text
  fill(0);
  textSize(50);
  text("fühlen lesen teilen", x, 60);
  fill(20);
  textSize(47);
  text("universitätstrasse", x+10, 100);
  fill(35);
  textSize(44);
  text("stand der technik", x+19.5, 137);
  fill(50);
  textSize(41);
  text("Gourmet  Himmel", x+28.5, 170);
  fill(65);
  textSize(38);
  text("kaufen sie kunst", x+37, 200);
  fill(80);
  textSize(35);
  text("sitzen verboten", x+45 , 227);
  fill(95);
  textSize(32);
  text("Montag spezial", x+52.5, 251);
  fill(110);
  textSize(29);
  text("moderne  liebe", x+59, 272);
  fill(125);
  textSize(26);
  text("nicht betreten", x+65.5, 290);
  fill(140);
  textSize(23);
  text("privatstrasse", x+71.5, 305);
  textSize(20);
  fill(155);
  text("glückparken", x+77, 317);
  fill(120);
  textSize(15);
  text("universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse universitätstrasse",-10, 350);
text("freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse freundschaftstrasse", -10, 360);
text("vorteilstrasse           vorteilstrasse             vorteilstrasse           vorteilstrasse             vorteilstrasse           vorteilstrasse             vorteilstrasse           vorteilstrasse             vorteilstrasse", -10, 370);
text("wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse wickendenstrasse", -10, 380);
text("wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse wassermanstrasse",-10,390);
text("bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen bei rot nicht abbiegen",-10,400);
fill(140);
  textSize(26);
  text("glückparken", x+200, 425);
  fill(120);
  textSize(29);
  text("privatstrasse", x+195, 440);
  fill(95);
  textSize(33);
  text("moderne liebe", x+189, 458);
  fill(65);
  textSize(37);
  text("nicht betreten", x+182, 479);
  fill(30);
  textSize(42);
  text("montag spezial", x+174, 503);
  fill(30);
  textSize(48);
  text("sitzen verboten", x+165, 530);
  fill(180);
  textSize(5);
  text("kaufen sie kunst", x+155, 560);
  fill (200);
  text("gourmet himmel", x, 613);

}

