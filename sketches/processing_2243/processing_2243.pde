
PFont fontA;

void setup() 
{
  size(401, 601);
  background(255);
  smooth();
  fontA = loadFont("ArialMT-45.vlw");
  textAlign(CENTER);
  textFont(fontA, 24);
  noStroke();
}

int n = 0;
void draw() 
{
  char letter;
  int counter;
  int margin = 19;

  fill(255);
  rectMode(CORNERS);
  rect(0,0,401,601);

  for(int row = 1; row < 11; row++) {
    for(int column = 1; column < 11; column++) {

      int r=0;
      int g=0;
      int b=0;
      int i_r = 0;
      int i_g =0;
      int i_b=0;

      counter = (int) random(26);

      if (counter >= 0 || counter < 9) {

        r = (i_r*r + counter-8)/(i_r + 1);
        i_r++;
      } 
      if (counter > 8 || counter < 18) {
        g = (i_g*g + counter-8)/(i_g + 1);
        i_g++;
      } 
      if (counter > 17 || counter < 26) {
        b = (i_b*b + counter-7)/(i_b + 1);
        i_b++;
      }

      ellipseMode(CENTER);

      fill(r*256/8-1,0,0,100);
      ellipse(width/4, 3*height/4, 100, 100);

      fill(0,g*256/9-1,0,100);

      ellipse(width/2, 3*height/4, 100, 100);

      fill(0,0,b*256/9-1,100);
      ellipse(3*width/4, 3*height/4, 100, 100);

      fill(0);

      if (counter == 1) {  
        letter = 'A';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 2) {
        letter = 'B';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 3) {
        letter = 'C';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 4) {
        letter = 'D';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 5) {
        letter = 'E';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 6) {
        letter = 'F';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 7) {
        letter = 'G';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 8) {
        letter = 'H';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 9) {
        letter = 'I';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 10) {
        letter = 'J';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 11) {
        letter = 'K';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 12) {
        letter = 'L';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 13) {
        letter = 'M';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 14) {
        letter = 'N';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 15) {
        letter = 'O';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 16) {
        letter = 'P';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 17) {
        letter = 'Q';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 18) {
        letter = 'R';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 19) {
        letter = 'S';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 20) {
        letter = 'T';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 21) {
        letter = 'U';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 22) {
        letter = 'V';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 23) {
        letter = 'W';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 24) {
        letter = 'X';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 25) {
        letter = 'Y';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      } 
      if (counter == 0) {
        letter = 'Z';
        text(letter, margin + (width - 2 * margin)*column/11, margin + (height - 15*margin)*row/11);
      }


    } 

  }
}

