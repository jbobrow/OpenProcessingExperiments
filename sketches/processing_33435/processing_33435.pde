
// Let's try this again
// Tag cloud with parsing and scroller
// July 25, 2011


////Declaring things

HourlyWords[] hourlyWords = new HourlyWords[24];
PFont font;
float minfontSize = 10;
float maxfontSize = 80;
int binW;
int scroller = 80;

////Setup

void setup() {

  //make sure width is divisible by 24 so it returns an int
  size(840, 500);
  binW = width/24;
  font = loadFont("ArialRoundedMTBold-100.vlw");
  for (int i = 0; i<= 23; i++) {

    // instantiate hourlywords object
    hourlyWords[i] = new HourlyWords(i);

    // load data from file
    String[] rawData = loadStrings("hourly_words/words-2011_5_23-"+i+".txt");

    // grab the wanted string
    String dataInput = rawData[0];

    // iterate over the input data and place in Word-HourlyWords objects
    String[] values = splitTokens(dataInput,";");

    for (int j = 0; j < values.length-1; j++) {
      String[] currentValues = splitTokens(values[j],",");

      // organizing our data so we have each in their own variable
      String currentString = currentValues[0];
      float currentWeight = float(currentValues[1]);

      //println(currentString+"-"+currentWeight);

      // create needed objects
      Word currentWord = new Word(currentString, currentWeight, hourlyWords[i].words);
      
      // insert word object into HourlyWords
      hourlyWords[i].addWord(currentWord);
    }
  }
}


  ////Draw
  void draw() {
    background(0);
 
    int currentBin = mouseX/binW;
    drawTagCloud(currentBin);
    //println("Hour "+currentBin);
  }  


  // display a given hour to the screen
  void drawTagCloud(int hourToDraw) {

    hourlyWords[hourToDraw].displayWords();
  }


