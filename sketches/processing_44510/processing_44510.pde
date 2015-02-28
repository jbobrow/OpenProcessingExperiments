
PFont f;  
PImage myImage;
String[] text;   
int counter = 1509;
String delimiters = " ,.?!;:[]--";

void setup() {
  size(600,400);
  f = loadFont( "Tahoma-Bold-48.vlw" );
  String[] rawtext = loadStrings("http://www.gutenberg.org/cache/epub/4962/pg4962.txt");
  String everything = join(rawtext, "" );
  text = splitTokens(everything,delimiters);
  frameRate(7);
  myImage = loadImage( "Cholera_bacteria_SEM.jpg" );
}

void draw() {
  background(255);
  image(myImage,0,0);
  String theword = text[counter];
  int total = 0;
  for (int i = 0; i < text.length; i ++ ) { 
    if (theword.equals(text[i])) {
      total ++;
    }
  }
  
  noStroke();
  float shade = map(total, 0, 40, 0, 40); 
  fill(60, 167, 44, shade);
  rect(0,0,600,400);
  textFont(f);
  fill(0);
  text(theword,120,200);
  
  counter = (counter + 1) % text.length;
}




