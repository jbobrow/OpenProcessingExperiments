
//Carlyn Maw, January 2014
//Week 3 Boundries, Example 1
//How many fingers does a computer have to count on?

//WORKS DIFFERENTLY IN JAVA MODE AND JAVASCRIPT MODE.
//(no numeric types in javascript)

PFont f;

//a whole number between -128 and 127
byte floodMeByte = 0;

//32 bits.
//a whole number between 
//2,147,483,647 and as low as -2,147,483,648
int floodMeInt = 0;

//64 bits.
//a number between
//-9,223,372,036,854,775,808 and 9,223,372,036,854,775,807
//(don't count on more than 16 significant digits if using
//decimals.) 
long floodMeLong = 0;

void setup() {
  size(480, 300);
  f = createFont("Georgia", 20, true);
}

void draw() { 
  drawBackground();
  writeMessage("byte:", 50, height/4);
  writeMessage(str(floodMeByte), 200, height/4);
  floodMeByte++;
  
  writeMessage("int:", 50, 2*height/4);
  writeMessage(str(floodMeInt), 200, 2*height/4);
  floodMeInt++;
  
  writeMessage("long:", 50, 3*height/4);
  writeMessage(str(floodMeLong), 200, 3*height/4);
  floodMeLong++;
}

void drawBackground() {
  background(204);
  textFont(f);
}

void writeMessage(String message, int myStartX, int myStartY) {
  int x = myStartX;
  fill(255);
  textSize(42); 
  text(message, x, myStartY);
}




