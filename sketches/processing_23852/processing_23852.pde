

int xpos;
int ypos;
int rectSize;
int mappedSize;
String delimiters = " /,.?!;:[]-_";
String brokenText[];
String rejoinedText;
String[] textString; 
//String[] alphabetized;
String[] Title;
int[] numbers;
//int[] numbers2;
int[] largest;
int rectSizeW = 1;     // Diameter of rect
int rectSizeH;     // Diameter of rect
int margin = 100;
int numberOfLines;
int mappedHeight;
int yposPlus;
int longestWord;

int ANumber;

PFont FontHead;
PFont FontBody;
PFont FontBody2;

String TextToLoad;



///SETUP
void setup() { 
  colorMode(HSB,200,100,100); 
  size(900, 600);
  //size(screen.width, screen.height);
  background(0); 
  smooth();
  rectSize = 1;


  //TextToLoad = "http://files1-christoph-ender.de/Sherlock_Holmes/plain-text/scan.txt";
  TextToLoad = "http://files1-christoph-ender.de/Sherlock_Holmes/plain-text/iden.txt";
  //TextToLoad = "text3.txt";http://files1-christoph-ender.de/Sherlock_Holmes/plain-text/iden.txt

  //brokenText = loadStrings("http://www.usconstitution.net/const.txt");

  brokenText = loadStrings(TextToLoad);
 // println(brokenText);


  rejoinedText = join(brokenText," ");
  textString = splitTokens(rejoinedText,delimiters);
  numbers = new int[textString.length];
//  numbers2 = new int[textString.length];
  //alphabetized is an alphabetized list of the word in the text
  largest = new int[textString.length];
  //largest[0] should be the largest word based on character length
//  alphabetized = sort(textString);
//  //set number2[] with the number of characters per word
//  for (int i = 0; i < textString.length; i ++ ) {
//    numbers2[i] = alphabetized[i].length();
//  }
//  //numbers[] is set to be the length of the textString[]
  for (int i = 0; i < textString.length; i ++ ) {
    numbers[i] = textString[i].length();
  }
  //largest is sorted smallest to greatest in length
  largest = sort(numbers);
  //largest is reversed so the largest is alway largest[0]
  largest = reverse(largest);

  for(int i = 0; i < textString.length; i++) {
    if(textString[i].length() == largest[0]) {
      longestWord = i;
    }
  }

//  println(numbers);
//  println(numbers2);
  //sets the width of the rectangle

//  println(rectSize);
//  println(largest);
  //figures out how many lines there will be
  numberOfLines = int((textString.length)/(width - (margin * 2)));
  //mappedHeight = int( map(((screen.height - (margin * 2))/numberOfLines), 1 , screen.height - margin , 1, 500));
  mappedHeight = int(map((numberOfLines * (largest[0] *numberOfLines)), 1, height - (margin*2), 1, (height - (margin*2))/numberOfLines));
  //where to begin whatever margin is down from the largest rectangle 
  ypos = (largest[0] * numberOfLines)+margin;
  //margin from the edges
  xpos = margin;
  if(numberOfLines < 3) {
    numberOfLines=4;
  }

  yposPlus = int(map((largest[0] * numberOfLines),1,ypos-margin,1, mappedHeight));
  String TitleA = brokenText[4];
  //int Author = Title.indexOf("A");
  String Title = trim(TitleA);
  println(Title);
  //Text to screen

  textMode(SCREEN);
  FontHead = loadFont("Swiss721BT-LightCondensed-60.vlw");
  textFont(FontHead); 
  // FontBody loadFont(BauerBodoni-Roman-32.vlw);
  fill(195,90,90);
  text("Sherlock Holmes", 50, 70);
  FontBody = loadFont("Swiss721BT-LightCondensed-28.vlw");
  textFont(FontBody); 
  text("Comparing The Length of Words in the short story" + " " + Title , 450, 25,400,200);

  FontBody2 = loadFont("Swiss721BT-Light-14.vlw");
  textFont(FontBody2);

  text("Longest Word is" + " " + textString[longestWord] + " " + "and is" + " " + largest[0] + " " + "characters long", 450, 90,400,300);

  noLoop();
}

void draw() {

  noStroke();

  //draw to screen
  for (int i = 0; i < textString.length; i ++ ) {
    //maps the mappedSize based on number[i] from 1 to largest[0] to 0 200 this is used for the fill
    mappedSize = int(map(numbers[i], 1, largest[0], 0,200));
    fill(mappedSize,80,80);

    rectSizeH = int(map(textString[i].length(),1, largest[0]*numberOfLines, 1, mappedHeight*numberOfLines))*-1;

    //draws the rectangle on the screen based on xpos and ypos which is set below the height is set by 
    if(ypos < height) {
      if(textString[i].length() == largest[0]) {
        ellipse(xpos, ypos+10, 5, 5);  
        text(textString[i], xpos + 5, ypos+20);
      }
      rect(xpos, ypos, rectSize, rectSizeH);
    } 
    else {
    }

    if (xpos < width-margin) {
      xpos+=rectSize;
    } 
    else { 
      xpos = margin;
      ypos +=  yposPlus;
    }
  }


//  println(numberOfLines);
//  println(mappedHeight);
//  println(rectSizeH);
//  println(height);
//  println(yposPlus);
}






