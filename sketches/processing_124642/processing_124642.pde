

//variables
String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890&&&&&&";
PFont fontfont = createFont("OCR A Std", 10, true);
PFont font = createFont("Garamond", 100, true);
PFont font2 = createFont("Helvetica", 100, true);
PFont font3 = createFont("Rockwell", 100, true);
PFont font4 = createFont("Futura", 100, true);
PFont font5 = createFont("Trajan Pro", 100, true);

boolean helvetica = false;
boolean rockwell = false;
boolean futura = false;
boolean trajan = false;
char letter;

int randomInt(int limit) {
  return int(random(limit));
}

void setup() {
  size(1300, 700);
  background(255);
  smooth();
}


void mouseMoved() {
  if (helvetica==true) {
    fill(255, 20, 20, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font2, randomInt(120));
    text(letter, pmouseX, pmouseY);
  }
  else {
    fill(0, 11, 80, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font, randomInt(120));
    text(letter, mouseX, mouseY);
  }

  if (rockwell==true) {
    fill(30, 255, 20, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font3, randomInt(120));
    text(letter, pmouseX, pmouseY);
  }
  else {
    fill(0, 11, 80, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font, randomInt(120));
    text(letter, mouseX, mouseY);
  }

  if (futura==true) {
    fill(255, 230, 0, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font4, randomInt(120));
    text(letter, pmouseX, pmouseY);
  }
  else {
    fill(0, 11, 80, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font, randomInt(120));
    text(letter, mouseX, mouseY);
  }
  
    if (trajan==true) {
    fill(255, 150, 0, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font5, randomInt(120));
    text(letter, pmouseX, pmouseY);
  }
  else {
    fill(0, 11, 80, random(255));
    char letter = alphabet.charAt(randomInt(alphabet.length()));
    textFont(font, randomInt(120));
    text(letter, mouseX, mouseY);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    background(255);
  }

  if (key == 'h') //if you press h, make the typeface helvetica
  {
    helvetica = true;
  }

  if (key == 'r') //if you press r, make the typeface rockwell
  {
    rockwell = true;
  }

  if (key == 'f') //if you press f, make the typeface futura
  {
    futura = true;
  }
  
   if (key == 't') //if you press t, make the typeface trajan
  {
    trajan = true;
  }
}


void keyReleased() {
  if (key == 'h') {
    helvetica = false;
  }
  if (key == 'r') {
    rockwell = false;
  }
  if (key == 'f') {
    futura = false;
  }
}

void draw() {
  //  background(255);
  
  fill(0);
  rect(20, 20, 216, 110);
  
  fill(255);
  textSize(10);
  textFont(fontfont);
  text("You are drawing with Garamond.", 25, 40); 
  smooth();
 
 
  fill(255);
  textSize(10);
  textFont(fontfont);
  text("Press Space to Clear Text", 25, 55); 
  smooth();
  
  fill(255);
  textSize(10);
  textFont(fontfont);
  text("Hold 'h' for Helvetica", 25, 70);
  
    fill(255);
  textSize(10);
  textFont(fontfont);
  text("Hold 'r' for Rockwell", 25, 85);
  
      fill(255);
  textSize(10);
  textFont(fontfont);
  text("Hold 'f' for Futura", 25, 100);
  
      fill(255);
  textSize(10);
  textFont(fontfont);
  text("Hold 't' for Trajan", 25, 115);
  
}

