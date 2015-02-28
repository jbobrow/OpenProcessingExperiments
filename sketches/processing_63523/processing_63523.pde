
//------------------------------------------------------------
int max_height = 20;
int min_height = 0;
int letter_height = max_height; // Height of the letters
int letter_width = 20;          // Width of the letter
int htg = color(255);   // Hintergrundfarbe
int x = -letter_width;          // X position of the letters
int y = 0;                      // Y position of the letters

boolean newletter;
char letter;
//------------------------------------------------------------

void setup()
{
  size (500,500);
  noStroke();
  colorMode(RGB);
  background (htg);
  smooth();
}
//if(text == 'a' || letter == 'A') {fill(0,0,0);}}  
//char A;
//char letter;
//A = 'A'; 
//'A' = fill(0,0,0);
 //text ("A",x 90){fill(23,34,67);}}
void draw()
{
// if text = 'A' { fill (23,45,78);}
//----- Farben der Buchstaben von Annette ?!
if(keyPressed) {if (key == 'a' || key == 'A') {fill(0,0,0);}}
if(keyPressed) {if (key == 'b' || key == 'B') {fill(176,100,0);}}
if(keyPressed) {if (key == 'c' || key == 'C') {fill(192,192,192);}}
if(keyPressed) {if (key == 'd' || key == 'D') {fill(200,152,0);}}
if(keyPressed) {if (key == 'e' || key == 'E') {fill(112,136,216);}}
if(keyPressed) {if (key == 'f' || key == 'F') {fill(120,100,80);}}
if(keyPressed) {if (key == 'g' || key == 'G') {fill(120,156,168);}}
if(keyPressed) {if (key == 'h' || key == 'H') {fill(184,204,184);}}
if(keyPressed) {if (key == 'i' || key == 'I') {fill(248,252,200);}}
if(keyPressed) {if (key == 'j' || key == 'J') {fill(224,228,208);}}
if(keyPressed) {if (key == 'k' || key == 'K') {fill(0,108,64);}}
if(keyPressed) {if (key == 'l' || key == 'L') {fill(176,160,144);}}
if(keyPressed) {if (key == 'm' || key == 'M') {fill(0,100,0);}}
if(keyPressed) {if (key == 'n' || key == 'N') {fill(24,108,80);}}
if(keyPressed) {if (key == 'o' || key == 'O') {fill(184,0,0);}}
if(keyPressed) {if (key == 'p' || key == 'P') {fill(120,100,88);}}
if(keyPressed) {if (key == 'q' || key == 'Q') {fill(176,176,176);}}
if(keyPressed) {if (key == 'r' || key == 'R') {fill(96,48,0);}}
if(keyPressed) {if (key == 's' || key == 'S') {fill(232,224,8);}}
if(keyPressed) {if (key == 't' || key == 'T') {fill(160,152,152);}}
if(keyPressed) {if (key == 'u' || key == 'U') {fill(144,72,0);}}
if(keyPressed) {if (key == 'v' || key == 'V') {fill(104,72,21);}}
if(keyPressed) {if (key == 'w' || key == 'W') {fill(40,120,88);}}
if(keyPressed) {if (key == 'x' || key == 'X') {fill(112,164,136);}}
if(keyPressed) {if (key == 'y' || key == 'Y') {fill(200,204,0);}}
if(keyPressed) {if (key == 'z' || key == 'Z') {fill(144,168,120);}}
//----- Farben anderer Zeichen
if(keyPressed) {if (key == ' '){noFill();letter_height = max_height;}}
if(keyPressed) {if (key == '.'){fill(255,255,255);}}

//----- Farben Zahlen
if(keyPressed) {if (key == '0'){fill(208,188,176);letter_height = max_height;}}
if(keyPressed) {if (key == '1'){fill(176,212,208);letter_height = max_height;}}
if(keyPressed) {if (key == '2'){fill(224,200,0);  letter_height = max_height;}}
if(keyPressed) {if (key == '3'){fill(32,104,64);  letter_height = max_height;}}
if(keyPressed) {if (key == '4'){fill(144,16,40);  letter_height = max_height;}}
if(keyPressed) {if (key == '5'){fill(168,132,72); letter_height = max_height;}}
if(keyPressed) {if (key == '6'){fill(48,96,2);    letter_height = max_height;}}
if(keyPressed) {if (key == '7'){fill(144,156,32); letter_height = max_height;}}
if(keyPressed) {if (key == '8'){fill(104,0,1);    letter_height = max_height;}}
if(keyPressed) {if (key == '9'){fill(56,100,120); letter_height = max_height;}}
//-----


  if(newletter == true) {
    // Draw the "letter"
    int y_pos;
    if (letter_height == max_height) {
      y_pos = y;
      rect( x, y_pos, letter_width, letter_height );
    } else {
      y_pos = y;//y+ min_height;
      rect( x, y_pos, letter_width, letter_height );
      fill(255,255,255);
      rect( x, y_pos, letter_width, letter_height );  //rect( x, y_pos-min_height, letter_width, letter_height );

    }
    newletter = false;
  }

}

//------------------------------------------------------------
void keyPressed()
{
  // if the key is between 'A'(65) and 'z'(122)
  if( key >= 'A' && key <= 'z') {
    int keyIndex;
    if(key <= 'Z') {
      keyIndex = key-'A';
      letter_height = max_height;
      //fill(colors[key-'A']);
    } else {
      keyIndex = key-'a';
      letter_height = max_height; // min_height;
      //fill(colors[key-'a']);
    }
  } else {
   fill(htg); // htg farbe
    letter_height = 20; // Original 10 (halb so hoch)
  }

  newletter = true;
  
    //Key Absatz
  if(keyPressed) {if (key == ENTER){
      x = -letter_width -letter_width ;
    y+= max_height;
    noFill(); }}
  
 
  
  //Key rückgängig machen
  if(keyPressed) {if (key == BACKSPACE){
     //fill(htg);
     
     x = ( x + letter_width );
    letter_height = max_height; }
  else{
    x = ( x + letter_width );
  
  }
  }

  // Update the "letter" position
  //x = ( x + letter_width ); 

  // Wrap horizontally
  if (x > width - letter_width) {
    x = 0;
    y+= max_height;
  }

  // Wrap vertically
  if( y > height - letter_height) {
    y = 0;      // reset y to 0
  }
  

}

//--------------------------------------------------
//Speichern
void keyReleased() {
  if (keyCode == CONTROL) 
  saveFrame(timestamp()+".jpg");
}
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
//--------------------------------------------------

