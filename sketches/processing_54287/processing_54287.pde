
//Ariel Leath
//text visualization Feb 26 
//The Love Song of J. Alfred Prufrock by T.S. Eliot

String name = "Prufrock";
String[] prufText;
String a;
//int prufText;
int x;
int y;
String totalText;
int counter;
int n = 1;
PImage tsEliot;


void setup() {
  size(800, 600);
  background (93, 69, 69);
  int x = 20;
  int y = 500;
  smooth();
  frameRate(2);
  //font loading
  PFont vladScript;
  vladScript = loadFont("vlad.vlw");
  textFont(vladScript, 35);

  String[] dataLines=loadStrings("pruf.txt");
  y= dataLines.length;
  totalText=join(dataLines, " ");
  prufText = splitTokens(totalText, " ");
  y=0;
  
  //title
  text ("The Love Song of J. Alfred Prufrock", 20, 50);
  text ("T.S. Eliot", 200, 99);
  //pic
  tsEliot=loadImage("ts.jpg");
}


void draw () {
  //String[] dataLines=loadStrings("pruf.txt");
  //point (x,y);
  // println (dataLines);
  y=y+30;
  String a = prufText[counter];
  text (a, x+99, y+99);
  counter = (counter + 1) % prufText.length; //thanks, shiffman & tracy
  n = n + 20;
  
  if (keyPressed){
    text (a, x+99, y+25);
  }
  else {
    text (a, x+200, y+200);
  }
 //ol' t.s. eliot, for funzies 
 image(tsEliot, 450, 150);
}



//void textMove() {
//String dataLines[]=loadStrings("pruf.txt");
//prufText = dataLines.length;
//textFont(vladScript, second()+2);




