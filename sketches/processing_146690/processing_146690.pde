
Matrix matrix;
PFont text1;

void setup() {
  size(650, 500);
  matrix = new Matrix(33,126,35);
  frameRate(24);
  matrix.display();
  text1 = loadFont ("Courier10PitchBT-Roman-48.vlw");
 
}

void draw() {
 matrix.numbers();
  Text();

}

void Text(){
  fill(255);
  noStroke();
  textAlign(CENTER);
  textFont(text1, 54);
  text("PROCESSING", width/2,95);
  text("Corso Base", width/2,140 );
  textFont(text1, 24);
  text("by MakeRn Lab", width/2,170);
  textFont(text1, 20);
  text("Presentazione Corso + Prima Lezione", width/2,220);
  text("17 Maggio @ FromMarketToMakers 2014 ", width/2,245);
  text("@ GrottaRossa - Via Della Lontra, 40 - Rimini", width/2,270);
  text("18 - 23 - 24 Maggio", width/2,310);
  text("ORE 19:00 - 21:00", width/2,335);
  text("@ MakeRn Lab - Via Cagni, 14 - Rimini", width/2,360);
  textFont(text1, 24);
  text("www.makern.it", width/2,410);
  if (mousePressed == true) {
    fill(255,0,0);
    noStroke();
    textFont(text1, 30);   
      textAlign(LEFT); 
    text("SKILL YOURSELF!", map(mouseX,0,width,0,width-260),mouseY);
  }
}
class Matrix{
int lowchar;
int highchar;
int charsize;
int columns;
int rows;
int[] place;

  Matrix(int lowchar, int highchar, int charsize){
    this.lowchar = lowchar;
    this.highchar = highchar;
    this.charsize = charsize;
  }
  
  void display(){
  background(0);

  columns = int(width/charsize);
  rows = int(height/charsize);
  place = new int[columns];
  for (int i = 0; i < columns; i++) {
  place[i] = int(random(rows));

  }
}
  
  void numbers(){
  int thechar;
  char c;

  fill(0, 0, 0, 55);
  rect(0, 0, width, height);
  fill(0, 255, 0);
  for (int i = 0; i < columns; i++) {
    thechar = int(random(lowchar, highchar))+1;
    if (random(1000)>900)
    { 
      thechar = 32;
      c = char(thechar);
      fill(0, 255, 0);
      text(c, charsize*i, place[i]*charsize);
    } 
    else {
      c = char(thechar);
      fill(0, 255, 0);
      text(c, charsize*i, place[i]*charsize);
      place[i]++;
      if (place[i]>rows) {
        place[i] = 0;
      }
    }
  }
 } 
}



