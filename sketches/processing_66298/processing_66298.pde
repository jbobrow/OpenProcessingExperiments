
//First, declare the names of the arrays that will store the info
int[] ages;
String[] genders;
String[] answers;

//Some additional numbers we'll need to space things out, loop, etc.
float xinc;
int numElements;

PFont font;

void setup() {
  size(700, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);
  font = loadFont ("LetterGothicMT-Bold-36.vlw");
  textFont(font);

  //Load the data from the text files into 3 separate arrays
  ages = int(loadStrings("ages.txt"));
  genders = loadStrings("genders.txt");
  answers = loadStrings("responses.txt");
  numElements = ages.length;

  xinc = width / numElements;
}

void draw() {
  background(50, 10, 90);
  textSize(18);
  fill(0, 0, 0);  
  text("Are You Superstitious?", 25, 260);
  fill(20, 90, 90);
  text("Y", 25, 290);
  fill(200, 90, 90);
  text("N", 45, 290);




  //Create a loop that moves "i" from 0 -> n, where n is the length of all three arrays.
  for (int i=0; i<numElements; i++) {

    //Now you can use "i" to represent one person's response. 
    //answers[i], genders[i] and ages[i] represent one person, for each given "i".
    //So we can do some checks and use the data to space out, colorize the bars, etc.
    if (answers[i].equals("Y")) { //Because you used "Y" and "N" instead of numbers...
      fill(20, 90, 90);
    } 
    else {
      fill(200, 90, 90); //picks the color based on answer.
    }

    //The hight of the bar is based on age:
    rect(i*xinc, height/2, xinc, -ages[i] *2);

    fill(0, 0, 0);
    text("AGE", 25, height/2);
  }
}


