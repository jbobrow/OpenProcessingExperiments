
//The Greatness of Steve - Find the Popularity of a Name in a Text!
String name = "Hamlet";
String[] book;
String s;
//String[] bookData;
int wordy;
int n = 1, q = 0;
float headX = 400;
float headY = 300;
int counter;
String allText;

void setup() {
  size (800, 600); //size of the window
  smooth(); //smooth rectangles
  background(215); //background color
  frameRate(10); //slower progress

  //loading in a font
  PFont myFont;
  myFont = loadFont("Aharoni.vlw");
  textFont(myFont, 48);

  String[] bookData = loadStrings("hamlet.txt"); //loaded
 wordy=bookData.length; //length of the text
 allText = join(bookData, " "); //getting all of the text onto one line, I guess? (from Daniel Shiffman)
 book = splitTokens(allText, " ,.?!:;[]-");  //split up by space or punctuation, getting rid of useless parts
 wordy=0;
}
void draw() {
  //write the name on screen
  background(215); //background color
  wordy = wordy+1;
  fill(0); //black fill
  text("Oh, "+name+"! "+n+"mentions.", 100, 100); //text
 // Look at words one at a time
String s = book[counter];
text(s,10,550);
//  println(s);
 counter = (counter + 1) % book.length;
//Processing will add to n if the word touched on is Hamlet.
 if (s.equals("Hamlet")) {
n = n+1;
}
  man();
  println(n);
}

void man() {
  fill(255);
  stroke(#31B2FF);
  strokeWeight(5);
  line(headX, headY, headX, headY+n*10);//body
  line(headX-n*4.5, headY+n*2.5, headX+n*4, headY+n*4.5); //arms
  line(headX, headY+n*10, headX-n*3, headY+n*15);//left leg
  line(headX, headY+n*10, headX+n*3, headY+n*15); //right leg
  ellipse (headX, headY, n*5, n*5); //head 
  ellipse(headX-n,headY-n/2,n,n); //left eye
  ellipse(headX+n,headY-n/2,n,n); //right eye
  line(headX-n,headY+n,headX+n,headY+n); //mouth
  curve(headX*.75,headY,headX-n,headY+n,headX+n,headY+n,headX*1.25,headY);
  line(headX-n,headY+n,headX+n,headY+n); 
 }


