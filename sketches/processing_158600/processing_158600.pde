
/*
Christopher Jarvis
Text & Time as Input

This program prints the time repeatedly across
the screen with a giant character over the top.
The colour of the time varies based on the minute,
the second, and the integer value of the giant character.

The character can be changed with the keyboard to any letter,
number or special character on the keyboard. The colour
of the character is based on the mouse position and the
integer value of the character.

The character size varies according to the second.

The idea of the program was to experiment with different ways of
using the time in art and still keeping one element at the centre
of the piece. I decided that the core element should also change,
bringing the focus back onto the time itself.

Sorry about all the 'magic numbers' - they are mostly based on
what looked good as I was writing, and cannot really be named.
They are fairly random, meaningless numbers (which, incidentally,
is how magic numbers are described).

*/

// Variables
int colWidth = 52;
int rowHeight = 15;
char bigChar = 'A';


void setup() {
  background(0);
  size(500,500);
}


void draw() {
  // For size changes in the letter
  background(0);
  
  // Variables that change
  int hour = hour();
  int min = minute();
  int sec = second();
  PFont font = createFont("Courier", 20);
  String time;
  
  // Change the minute value to two digits
  if (min < 10)
  {
    time = hour + ":0" + min + "." + sec;
  }
  else
  {
    time = hour + ":" + min + "." + sec;
  }
  
  // Mapping some values to fit RGB values
  int mappedMouseX = int(map(mouseX, 0, width, 0, 255));
  int mappedMouseY = int(map(mouseY, 0, height, 0, 255));
  int mappedSeconds = int(map(sec, 0, 59, 0, 255));
  
  // Text settings (time)
  textFont(font);
  textSize(10);
  textAlign(LEFT,CENTER);
  // Colours based on time and character value
  fill(min * 3, mappedSeconds, int(bigChar) * 2);
  
  // Drawing the time
  for (int row = 0; row < height; row += rowHeight)
  {
    for (int col = 0; col < width; col += colWidth)
    {
      text(time, col, row);
    }
  }
  
  // Character size (dynamic) and position (complicated)
  int charSize = 200 + (sec * 3);
  int charY = (height / 2) - (charSize / 4);
  int charX = (width / 2) - int(textWidth(bigChar) / 2);
  
  // Text settings (character)
  // Colours based on mouse position and character value
  fill(mappedMouseX, mappedMouseY, int(bigChar));
  textFont(createFont("Arial", charSize));
  textAlign(CENTER, CENTER);
  text(bigChar, charX, charY);
  
}


// Change the giant character to the user input key
void keyPressed() {
  bigChar = key;
}
