
import controlP5.*;

ControlP5 cp5;
String textValue = "";
PFont myFont;
PFont myBoldFont;
int randomSubject;
int bookTotal;
int randomBook;

String[][] subjects = new String[2][41];

void setup() {
  size(690,360);
  background(255);
 
  cp5 = new ControlP5(this);
  myFont=loadFont("font.vlw");
  myBoldFont=loadFont("bold.vlw");
  randomSubject=int(random(41));
  randomBook=0;

  fillStringArray();
  textFont(myFont, 14);

  cp5.addTextfield("bookNumber")
    .setPosition(122, 220)
    .setAutoClear(false)
    .setColorBackground(color(255, 255, 255))
    .setColor(color(0, 0, 0))
    .setFont(myFont)
    .setCaptionLabel("")
    .setWidth(50);
}

void draw() {
  background(255);
  fill(0);
  textFont(myBoldFont, 20);
  text("Welcome to your random book finder!!!", 10, 30);

  textFont(myFont, 14);
  text("1: Please begin in Gimbel Art and Design Library.", 10, 60);
  text("2: Get the Graphic Design, Communication Design, and Design & Technology Research Guide.", 10, 80);
  text("3: I will assign you a random subject/call number. ", 10, 100);
  text("Your subject is: ", 40, 130);
  textFont(myBoldFont, 14);
  text(subjects[0][randomSubject], 150, 130);
  textFont(myFont, 14);
  text("Call Number: ", 40, 150);
  textFont(myBoldFont, 14);
  text(subjects[1][randomSubject], 134, 150);
  textFont(myFont, 14);
  text("4: Now I will help you find a specific book. Please enter the number of", 10, 180);
  text("books in your section, then press ENTER.", 28, 200);
  text("# of Books: ", 40, 235);
  textValue=cp5.get(Textfield.class,"bookNumber").getText();
  bookTotal=int(textValue);
  text("Random Book Number: ", 40, 255);
  textFont(myBoldFont, 14);
  if(randomBook!=0){text(randomBook, 205, 255);}
  textFont(myFont, 14);
  text("5: Please navigate to the section listed above and grab the book that corresponds to the number. ", 10, 290);
  text("6: Study this book and gain inspiration. Press ENTER again if you have already used this book.", 10, 310);
  text("7: Press the 'R' Key to reset this algorithm and find your next book.", 10, 330);
}

void fillStringArray() {
  subjects[0][0] = "Advertising"; subjects[1][0] = "HF";
  subjects[0][1] = "Animation"; subjects[1][1] = "NC 1764-1766";
  subjects[0][2] = "Architectural Lettering"; subjects[1][2] = "NK 3600-3640";
  subjects[0][3] = "Branding"; subjects[1][3] = "HD";
  subjects[0][4] = "Color in Design"; subjects[1][4] = "NK 1548";
  subjects[0][5] = "Comic Art and Artists"; subjects[1][5] = "NC 1320-1763";
  subjects[0][6] = "Computer Software, Graphics, Color"; subjects[1][6] = "T 385";
  subjects[0][7] = "Design Patterns and Motifs"; subjects[1][7] = "NK 1390-1476";
  subjects[0][8] = "Design Theory & Writings"; subjects[1][8] = "NK 1505-1520";
  subjects[0][9] = "Exhibition Design"; subjects[1][9] = "T 396.5";
  subjects[0][10] = "Game Design"; subjects[1][10] = "GV 1200-1400";
  subjects[0][11] = "Game Design"; subjects[1][11] = "GV 1200-1400";
  subjects[0][12] = "Game Design"; subjects[1][12] = "QA 76";
  subjects[0][13] = "Game Design"; subjects[1][13] = "QA 76";
  subjects[0][14] = "Graphic Design"; subjects[1][14] = "NC 997-998";
  subjects[0][15] = "American Graphic Design"; subjects[1][15] = "NC 998.5";
  subjects[0][16] = "World Graphic Design"; subjects[1][16] = "NC 998.6";
  subjects[0][17] = "Graphic Designers"; subjects[1][17] = "NC 999.6";
  subjects[0][18] = "Graphic Novels"; subjects[1][18] = "PN 6700-6790";
  subjects[0][19] = "Green/Ecological/Sustainable Design"; subjects[1][19] = "GE";
  subjects[0][20] = "Illustration"; subjects[1][20] = "NC 960-980";
  subjects[0][21] = "Information Design"; subjects[1][21] = "NK 1510";
  subjects[0][22] = "Information Design"; subjects[1][22] = "NK 1510";
  subjects[0][23] = "Information Design"; subjects[1][23] = "NK 1510";
  subjects[0][24] = "Interactive Design"; subjects[1][24] = "QA 76";
  subjects[0][25] = "Interactive Design"; subjects[1][25] = "QA 76";
  subjects[0][26] = "Motion Graphics"; subjects[1][26] = "NC 997";
  subjects[0][27] = "New Media/Interactive Media"; subjects[1][27] = "QA 76";
  subjects[0][28] = "New Media/Interactive Media"; subjects[1][28] = "QA 76";
  subjects[0][29] = "New Media/Interactive Media"; subjects[1][29] = "QA 76";
  subjects[0][30] = "New Media/Interactive Media"; subjects[1][30] = "QA 76";
  subjects[0][31] = "New Media/Interactive Media"; subjects[1][31] = "QA 76";
  subjects[0][32] = "Photography"; subjects[1][32] = "TR";
  subjects[0][33] = "Product Design"; subjects[1][33] = "TS 23-194";
  subjects[0][34] = "Retail Design/Merchandising"; subjects[1][34] = "HF 5845";
  subjects[0][35] = "Techinical Drawing"; subjects[1][35] = "T 253";
  subjects[0][36] = "Tyopgraphy"; subjects[1][36] = "Z 246-250";
  subjects[0][37] = "Wayfinding"; subjects[1][37] = "NC 1002";
  subjects[0][38] = "Lighting Design"; subjects[1][38] = "TK 1005-4399";
  subjects[0][39] = "Web Design"; subjects[1][39] = "TK 5105";
  subjects[0][40] = "Web Design"; subjects[1][40] = "TK 5105";
}

//public void clear() {
//  cp5.get(Textfield.class,"textValue").clear();
//}

void keyReleased(){
  if (keyCode == ENTER) {
      randomBook=(int)random(1,bookTotal+1);
  }
  
  if (keyCode == 'R') {
      setup();
  }
}



