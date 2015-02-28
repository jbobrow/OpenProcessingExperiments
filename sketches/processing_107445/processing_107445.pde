
/* @pjs preload="pic2.jpg"; */
import java.util.Date;

//the image stuff
int numTweets = 800;
float fontSizeMax = 12;
float spacing = 10;
float kerning = 0.5;
PFont font;
PImage img;
String t = "";

float x = 0;
float y = 10;
int tweetNum = 0;
int tweetCounter = 0;
boolean drawNext = false;

String[] tweets = new String[numTweets];

void setup() {
  size(536, 536);
  background(255);
  smooth();

  //image stuff
  font = createFont("Times", 8);
  img = loadImage("mlk2.jpg");
  loadData();
  frameRate(30);
}

void draw() {
  textAlign(255);
  int lag = int(random(5, 30));
  if (frameCount % lag == 0) {
    t = tweets[tweetCounter];      
    int charPos = 0;
    for (int i = 0; i < t.length(); i++) {
      int imgX = (int) map(x, 0, width, 0, img.width);
      int imgY = (int) map(y, 0, height, 0, img.height);
      color c = img.pixels[imgY*img.width + imgX]; //get current color:

      pushMatrix();
      translate(x, y);
      char letter = t.charAt(i);
      textFont(font, fontSizeMax);
      fill(255);
      noStroke();
      rect(0, -spacing, textWidth(letter)+1, spacing+1); //cover previous letter
      fill(c);
      text(letter, 0, 0);
      float letterWidth = textWidth(letter) + kerning;
      x = x + letterWidth; // update x-coordinate
      popMatrix();

      if (x+letterWidth >= width) {  // end of line? go to the next line
        x = 0;
        y = y + spacing; // add line height
      }
      if (y >= height) { //end of pic? draw at the beginning
        y = 10;
        x = 0;
      }
    } //end of for loop that draws the tweet
    tweetCounter++;
    //println(tweetCounter);
    if (tweetCounter >= tweets.length) {
      tweetCounter = 0;
    }
  }
}

void loadData() {
  String[] rows = loadStrings("outputTues.txt");
  for (int i = 0; i < numTweets; i++) {
    String text = rows[i].replace("\n", " ");
    tweets[i] = text;
  }
}



