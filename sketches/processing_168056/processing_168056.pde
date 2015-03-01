
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs font="Georgia.ttf"; */

char slovo;
string rijeci = "Begin...";

void setup() {
  size(640, 360);
  // Kreiranje fonta iz postojećih fontova....
  textFont(createFont("Georgia", 36));
}

void draw() {
  background(0); // Boja pozadine  = crna

  // Nacrtaj slovo na sredini ekrana
  textSize(14);
  text("Click on the program, then type to add to the String", 50, 50);
  text("Current key: " + slovo, 50, 70);
  text("The String is " + rijeci.length() +  " characters long", 50, 90);
  
  textSize(36);
  text(rijeci, 50, 120, 540, 300);
}

void keyPressed() {
  // varijabla "tipka" uvijek sadrži vrijednost 
  // zadnje pritisnute tipke....
  if ((tipka >= 'A' && tipka <= 'z') || tipka == ' ') {
    slovo = tipka;
    rijeci = rijeci + tipka;
    // Ispiši slovo na konzolu
    println(tipka);
  }
}
