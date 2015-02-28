

//GLOBAL VARIABLES
PFont myFont; 
char keyPress = 50; 
color fillColor = color(0); 
String textTyped="";
boolean clearScreen = false; 
boolean clearLetter = false; 
color[] colorArray = new color [20];
String[] wordArray = new String [20];
color back;

//BUILT-IN FUNCTIONS
void setup() {
  size(800,400);
  background(fillColor);
  smooth();
  myFont = createFont("Helvetica", 100); 
  textFont(myFont, 180); 
  textAlign(CENTER);
  fill(255);
  colorArray [0] = color(255,0, 0);
  colorArray [1] = color(0, 0, 255) ;
  colorArray [2] = color(0,255,0);
  colorArray [3] = color(160,32,240);
  colorArray [4] = color(255,20,147);
  colorArray [5] = color(255,165,0);
  colorArray [6] = color(165,42,42);
  colorArray [7] = color(255,255,0);
  colorArray [8] = color(190,190,190);
  colorArray [9] = color(210,180,140);
  colorArray [10] = color(64,224,208);
  colorArray [11] = color(0);
  colorArray [12] = color(255);
  colorArray [13] = color(238,130,238);
  colorArray [14] = color(245,245,220);
  colorArray [15] = color(176,48,96);

  wordArray [0] =  "RED";
  wordArray [1] =  "BLUE";
  wordArray [2] =  "GREEN";
  wordArray [3] =  "PURPLE";
  wordArray [4] =  "PINK";
  wordArray [5] =  "ORANGE";
  wordArray [6] =  "BROWN";
  wordArray [7] =  "YELLOW";
  wordArray [8] =  "GRAY";
  wordArray [9] =  "TAN";
  wordArray [10] =  "TURQUOISE";
  wordArray [11] =  "BLACK";
  wordArray [12] =  "WHITE";
  wordArray [13] =  "VIOLET";
  wordArray [14] =  "BEIGE";
  wordArray [15] =  "MAROON";
}

void draw() {
  background(back);
  text(textTyped, width/2, height/2);
}

void keyPressed() { 
  keyPress = char(key); 
  textTyped+=keyPress;
  println(textTyped);

  if (key == ' ') {
    clearScreen = true;
    back=(0);
    textTyped="";
  }

  if (key == BACKSPACE) { 
    println("backspace");
    if(textTyped.length()>=2)textTyped=textTyped.substring(0,textTyped.length()-2);
    println(textTyped);
  }


  for (int i = 0; i<wordArray.length; i++) {
    if (textTyped.equals(wordArray[i]) ) back = colorArray[i];
  }
}


