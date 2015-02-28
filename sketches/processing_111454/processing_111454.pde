
char letter = '`';
size(1000, 1000);
background(255);
fill(0);
textSize(6);
PFont font;
font = loadFont("Futura-Medium-12.vlw");
//Write Alphabet

//for (int x=0; x<26;x++) {
//  letter++;
//  print(letter);
//}

textFont(font, 24);
for (int i= 0; i<10000;i++) {
      float colRed = random(255);
    float colBlue = random(255);
    float colGreen = random(255);
  fill(colRed, colGreen, colBlue);
  float xLoc=random(height);
  float yLoc = random(width);
  
int incriment = (int)random(26);
letter=char((letter+incriment)%25+65);


  text(letter, xLoc, yLoc);
}


