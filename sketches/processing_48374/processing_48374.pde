
// Project 1
// 51-757 Computing for the Arts with Processing
// December 20, 2011
// Copyright Molly Nix December 2011 Pittsburgh, PA 15232

import processing.opengl.*;
import org.json.*;


String baseURL = "api.untappd.com/v3/user_feed";
String apiKey = "YOU NEED TO GET YOUR OWN IN ORDER FOR THE JSON REQUEST TO WORK";
String userID = "Molly";

int NAMEINDEX = 0;
int NAMEIDINDEX = 1;
int STYLEINDEX = 2;
int BREWERYINDEX = 3;
int BREWERYIDINDEX = 4;
int ABVINDEX = 5;
int RATINGINDEX = 6;
int arrayNumberCols=7;

String [] beerlist;
String [][] beer2d;
ArrayList styleList;
ArrayList breweryList;
ArrayList mostBreweryBeerList;


PFont largeHeaderFont;
PFont smallerTextFont;
PFont detailFont;
PFont smallTitleFont;

int csvNumberCols=0;

// Colors
color bgColor = #c2c3c4;
color medLtTxtClr = #f6f6f6;
color medDkTxtClr = #424041;
color accentClr = #e1232d;
color faintDkBg = #cccccc;
color faintLtBg = #e9e9eb;

// Widths & Margins
int visMargin = 76;
int narrowMargin = 17;
float barGraphWd = ((900-(2*visMargin))-(narrowMargin))/2;
float sectionhWdThird = ((900-(2*visMargin))-(2*narrowMargin))/3;
int barHt = 6;
int bottomOfBarGraphSection = 0;
int spaceBtwnSections = 50;



void setup() {
  size(900, 999);
  beerlist = loadStrings("beerlistbackup.csv");
  styleList = new ArrayList();
  breweryList = new ArrayList();
  mostBreweryBeerList = new ArrayList();
  setupArray();
  //JSONfetching();
  createStyleList();
  createBreweryList();
  largeHeaderFont = loadFont("HelveticaBold.vlw");
  smallerTextFont = loadFont("Bembo.vlw");
  detailFont = loadFont("MrsEaves.vlw");
  smallTitleFont = loadFont("MrsEavesItalic.vlw");
  smooth();
}

void draw () {
  background(bgColor);
  drawTitles();
  drawABVScoreSection();
  drawStrongestSection();
  drawBestSection();
  drawMostBeersOnList();
  drawNumberofBeersHad();
  drawNumberofBreweries();
  drawNumberofStyles();
  noLoop();
}

void drawTitles() {
  textFont(largeHeaderFont);
  textSize(57);
  fill(medLtTxtClr);
  text(userID + "'s Beer List", visMargin, visMargin+30);
  textFont(smallerTextFont);
  textSize(16);
  fill(medDkTxtClr);
  text("A look at what I've been drinking and checking into on Untappd.", visMargin, visMargin+60);
  textAlign(RIGHT);
  fill(medLtTxtClr);
  textFont(detailFont);
  text("Data provided by Untappd.", width-visMargin, visMargin+60);
  textAlign(LEFT);
}



void drawABVScoreSection() {
  int sectionStart = 200;
  float highestABV =  Float.parseFloat(beer2d[findHighestABVBeerIndex()][ABVINDEX]);
  textFont(detailFont);
  textSize(16);
  fill(medDkTxtClr);
  text("The styles I've had and their average ABV", visMargin, sectionStart+visMargin);
  stroke(faintDkBg);
  line(visMargin, visMargin+sectionStart+5, sectionhWdThird+visMargin+((sectionhWdThird+narrowMargin)*2), visMargin+sectionStart+5);
  noStroke();
  fill(medLtTxtClr);
  textAlign(RIGHT);
  text(highestABV + "%", visMargin, visMargin+sectionStart+30); 
  textAlign(LEFT);
  fill(medDkTxtClr);
  String thisStyle = "";
  String prevStyle = "";
  float textWidthMax = 0;
  for (int i = 0; i < styleList.size(); i++) {
    thisStyle = (String)(styleList.get(i));
    if (thisStyle.length() > prevStyle.length()) {
      textWidthMax = textWidth(thisStyle);
      prevStyle = thisStyle;
      println(textWidthMax);
    }
    int yPos= (i*25)+visMargin+sectionStart+30;
    if (i == styleList.size()-1) {
      bottomOfBarGraphSection = yPos+int(textWidthMax);
    }

    pushMatrix();
    textAlign(RIGHT);
    float horizSectWidth = (width-(2*visMargin))/(styleList.size());
    float horizSectHeight = 200;
    translate((visMargin + ((width-(2*visMargin))/(styleList.size()))*i)+(horizSectWidth/2), horizSectHeight+(visMargin+sectionStart+30)+10);
    rotate(radians(-60));
    fill(medDkTxtClr);
    text(thisStyle, 0, 0);
    popMatrix();
    textAlign(LEFT);
    fill(faintLtBg);
    rect(visMargin + i*((width-2*visMargin)/(styleList.size())), visMargin+sectionStart+30, horizSectWidth-2, horizSectHeight);
    noStroke();
    fill(accentClr);
    float average = getStyleBreweryAverage(thisStyle, STYLEINDEX, ABVINDEX);
    float bottomX = (visMargin + ((width-(2*visMargin))/(styleList.size()))*i);
    float bottomY = visMargin+sectionStart+30+horizSectHeight;
    beginShape();
    curveVertex(bottomX, bottomY);
    curveVertex(bottomX, bottomY);
    curveVertex(bottomX+(horizSectWidth/2), map(average, 0, highestABV, bottomY, bottomY-horizSectHeight));
    curveVertex(bottomX+horizSectWidth, bottomY);
    curveVertex(bottomX+horizSectWidth, bottomY);
    endShape();
    fill(accentClr);
  }
}


void drawNumberofBeersHad() {
  textFont(detailFont);
  int sectionStart = 100;
  fill(medDkTxtClr);
  text("The number of beers I've had", visMargin, sectionStart+visMargin);
  stroke(faintDkBg);
  line(visMargin, sectionStart+visMargin+5, sectionhWdThird+visMargin, sectionStart+visMargin+5);
  noStroke();
  textFont(largeHeaderFont);
  textSize(57);
  fill(medLtTxtClr);
  text(beerlist.length, visMargin, sectionStart+visMargin+57);
}

void drawNumberofBreweries() {
  fill(medDkTxtClr);
  textFont(detailFont);
  int sectionStart = 100;
  text("The number of breweries I've tried", visMargin+sectionhWdThird+narrowMargin, sectionStart+visMargin);
  stroke(faintDkBg);
  line(visMargin+sectionhWdThird+narrowMargin, sectionStart+visMargin+5, sectionhWdThird+visMargin+sectionhWdThird+narrowMargin, sectionStart+visMargin+5);
  noStroke();
  textFont(largeHeaderFont);
  textSize(57);
  fill(medLtTxtClr);
  text(breweryList.size(), visMargin+sectionhWdThird+narrowMargin, sectionStart+visMargin+57);
}


void drawNumberofStyles() {
  fill(medDkTxtClr);
  textFont(detailFont);
  int sectionStart = 100;
  text("The number of styles I've tried", visMargin+((sectionhWdThird+narrowMargin)*2), sectionStart+visMargin);
  stroke(faintDkBg);
  line(visMargin+((sectionhWdThird+narrowMargin)*2), sectionStart+visMargin+5, sectionhWdThird+visMargin+((sectionhWdThird+narrowMargin)*2), sectionStart+visMargin+5);
  noStroke();
  textFont(largeHeaderFont);
  textSize(57);
  fill(medLtTxtClr);
  text(styleList.size(), visMargin+((sectionhWdThird+narrowMargin)*2), sectionStart+visMargin+57);
}


void drawStrongestSection() {
  fill(medDkTxtClr);
  text("The strongest beers I've drank", visMargin, bottomOfBarGraphSection+spaceBtwnSections);
  stroke(faintDkBg);
  line(visMargin, bottomOfBarGraphSection+spaceBtwnSections+5, sectionhWdThird+visMargin, bottomOfBarGraphSection+spaceBtwnSections+5);
  noStroke();
  int [] bestBeersOfStyle =  findTopXNumbersNoLimit(ABVINDEX, 3);
  int yPos= bottomOfBarGraphSection+spaceBtwnSections+30;
  for (int i = 0; i < 3; i++) {
    textFont(smallTitleFont);
    textSize(21);
    fill(accentClr);
    if (beer2d[(bestBeersOfStyle[i])][NAMEINDEX].length() > sectionhWdThird/8) {
      String [] nameOfBeer = split(beer2d[(bestBeersOfStyle[i])][NAMEINDEX], ' ');
      int currentLength = 0;
      int previousStringIndexEnd = 0;
      int loopStart = 0;
      for (int curWord = 0; curWord < nameOfBeer.length; curWord++) {
        currentLength = currentLength + nameOfBeer[curWord].length() + 1;
        if ((currentLength > sectionhWdThird/8) || (curWord == nameOfBeer.length-1)) {
          if ((curWord != 0)) {
            loopStart = previousStringIndexEnd;
          }
          String currentStringLine = "";
          for (int k = loopStart; k <= curWord; k++) {
            currentStringLine = currentStringLine + nameOfBeer[k] + " ";
          }
          text(currentStringLine, visMargin, yPos);
          if (curWord != nameOfBeer.length-1) {
            yPos = yPos+21;
          }
          currentLength = 0;
          previousStringIndexEnd = curWord;
        }
      }
    }
    else {
      text(beer2d[(bestBeersOfStyle[i])][NAMEINDEX], visMargin, yPos);
    }
    textFont(detailFont);
    textSize(16);
    fill(medLtTxtClr);
    yPos = yPos+15;
    text("A " + beer2d[(bestBeersOfStyle[i])][ABVINDEX] + "% ABV " + beer2d[(bestBeersOfStyle[i])][STYLEINDEX], visMargin, yPos);
    yPos = yPos+12;
    text("By " + beer2d[(bestBeersOfStyle[i])][BREWERYINDEX], visMargin, yPos);
    yPos = yPos+6;
    fill(faintLtBg);
    rect(visMargin, yPos, sectionhWdThird, barHt);
    stroke(bgColor);
    for (int j = 0; j < 5; j++) {
      line(map(j, 0, 5, 0, sectionhWdThird)+visMargin, yPos, map(j, 0, 5, 0, sectionhWdThird)+visMargin, yPos+barHt);
    }
    noStroke();

    fill(accentClr);
    float ratingScore = Float.parseFloat(beer2d[(bestBeersOfStyle[i])][RATINGINDEX]);
    ellipse(map(ratingScore, 0, 5, 0, sectionhWdThird)+visMargin, yPos+((barHt/2)), barHt, barHt);
    yPos = yPos + 40;
  }
}

void drawBestSection() {
  fill(medDkTxtClr);
  text("The top-rated beers I've drank", visMargin+sectionhWdThird+narrowMargin, bottomOfBarGraphSection+spaceBtwnSections);
  stroke(faintDkBg);
  line(visMargin+sectionhWdThird+narrowMargin, bottomOfBarGraphSection+spaceBtwnSections+5, visMargin+(sectionhWdThird*2)+narrowMargin, bottomOfBarGraphSection+spaceBtwnSections+5);
  noStroke();
  int [] bestBeersOfStyle =  findTopXNumbersNoLimit(RATINGINDEX, 3);
  int yPos= bottomOfBarGraphSection+spaceBtwnSections+30;
  for (int i = 0; i < 3; i++) {
    textFont(smallTitleFont);
    textSize(21);
    fill(accentClr);
    if (beer2d[(bestBeersOfStyle[i])][NAMEINDEX].length() > sectionhWdThird/8) {
      String [] nameOfBeer = split(beer2d[(bestBeersOfStyle[i])][NAMEINDEX], ' ');
      int currentLength = 0;
      int previousStringIndexEnd = 0;
      int loopStart = 0;
      for (int curWord = 0; curWord < nameOfBeer.length; curWord++) {
        currentLength = currentLength + nameOfBeer[curWord].length() + 1;
        if ((currentLength > sectionhWdThird/8) || (curWord == nameOfBeer.length-1)) {
          if ((curWord != 0)) {
            loopStart = previousStringIndexEnd;
          }
          String currentStringLine = "";
          for (int k = loopStart; k <= curWord; k++) {
            currentStringLine = currentStringLine + nameOfBeer[k] + " ";
          }
          text(currentStringLine, visMargin+sectionhWdThird+narrowMargin, yPos);
          if (curWord != nameOfBeer.length-1) {
            yPos = yPos+21;
          }
          currentLength = 0;
          previousStringIndexEnd = curWord;
        }
      }
    }
    else {
      text(beer2d[(bestBeersOfStyle[i])][NAMEINDEX], visMargin+sectionhWdThird+narrowMargin, yPos);
    }
    textFont(detailFont);
    textSize(16);
    fill(medLtTxtClr);
    yPos = yPos+15;
    text("A " + beer2d[(bestBeersOfStyle[i])][ABVINDEX] + "% ABV " + beer2d[(bestBeersOfStyle[i])][STYLEINDEX], visMargin+sectionhWdThird+narrowMargin, yPos);
    yPos = yPos+12;
    text("By " + beer2d[(bestBeersOfStyle[i])][BREWERYINDEX], visMargin+sectionhWdThird+narrowMargin, yPos);
    yPos = yPos+6;
    fill(faintLtBg);
    rect(visMargin+sectionhWdThird+narrowMargin, yPos, sectionhWdThird, barHt);
    stroke(bgColor);
    for (int j = 0; j < 5; j++) {
      line(map(j, 0, 5, 0, sectionhWdThird)+visMargin+sectionhWdThird+narrowMargin, yPos, map(j, 0, 5, 0, sectionhWdThird)+visMargin+sectionhWdThird+narrowMargin, yPos+barHt);
    }
    noStroke();
    fill(accentClr);
    float ratingScore = Float.parseFloat(beer2d[(bestBeersOfStyle[i])][RATINGINDEX]);
    ellipse(map(ratingScore, 0, 5, 0, sectionhWdThird)+visMargin+sectionhWdThird+narrowMargin, yPos+((barHt/2)), barHt, barHt);
    yPos = yPos + 40;
  }
}

void drawMostBeersOnList() {
  fill(medDkTxtClr);
  text("The Brewery I've had most", visMargin+(sectionhWdThird*2)+(narrowMargin*2), bottomOfBarGraphSection+spaceBtwnSections);
  stroke(faintDkBg);
  line(visMargin+(sectionhWdThird*2)+(narrowMargin*2), bottomOfBarGraphSection+spaceBtwnSections+5, visMargin+(sectionhWdThird*3)+(narrowMargin*2), bottomOfBarGraphSection+spaceBtwnSections+5);
  noStroke();
  textFont(smallTitleFont);
  textSize(21);
  fill(accentClr);
  int yPos= bottomOfBarGraphSection+spaceBtwnSections+30;
  text(beer2d[findBestBrewery()][BREWERYINDEX], visMargin+(sectionhWdThird*2)+(narrowMargin*2), yPos);
  textFont(detailFont);
  textSize(16);
  fill(medLtTxtClr);
  yPos = yPos+15;
  for (int i = 0; i < beerlist.length; i++) {
    if (beer2d[i][BREWERYINDEX].equals(beer2d[findBestBrewery()][BREWERYINDEX]) == true) {
      boolean isRepeat = false;
      for (int j = 0; j < mostBreweryBeerList.size(); j++) {
        if (beer2d[i][NAMEINDEX].equals(mostBreweryBeerList.get(j)) == true) {
          isRepeat = true;
        }
      }
      if (isRepeat == false) {
        mostBreweryBeerList.add(beer2d[i][NAMEINDEX]);
      }
    }
  }
  for (int k = 0; k < mostBreweryBeerList.size(); k++) {
    text("" + mostBreweryBeerList.get(k), visMargin+(sectionhWdThird*2)+(narrowMargin*2), yPos);
    yPos = yPos+12;
  }
}





//////////////////////
// FIND SUPERLATIVES
//////////////////////

int [] findTopXNumbers(String styleBreweryName, int styleBreweryColumn, int numCol, int numSeries) {
  int [] topIndexes = new int[numSeries];
  int thisNewArrayIndexNumber = 0;
  while (thisNewArrayIndexNumber < numSeries) {
    float tempAsFloat = 0;
    float thisLoopMax = 0;
    int indexOfMaximum = 0;
    int grabFirstOne = 0;
    for (int i = 0; i < beerlist.length; i++) {
      if (styleBreweryName.equals(beer2d[i][styleBreweryColumn]) == true) {
        if (grabFirstOne < 1) {
          if (checkIfArrayContains(topIndexes, i) == false) {
            indexOfMaximum = i;
            grabFirstOne++;
          }
        }
        tempAsFloat = Float.parseFloat(beer2d[i][numCol]);
        thisLoopMax = Float.parseFloat(beer2d[indexOfMaximum][numCol]);
        if (tempAsFloat >= thisLoopMax) {
          if (checkIfArrayContains(topIndexes, i) == false) {
            indexOfMaximum = i;
          }
        }
      }
    }
    topIndexes[thisNewArrayIndexNumber] = indexOfMaximum;
    thisNewArrayIndexNumber++;
  }
  return topIndexes;
}



int [] findTopXNumbersNoLimit(int numCol, int numSeries) {
  int [] topIndexes = new int[numSeries];
  int thisNewArrayIndexNumber = 0;
  while (thisNewArrayIndexNumber < numSeries) {
    float tempAsFloat = 0;
    float thisLoopMax = 0;
    int indexOfMaximum = 0;
    int grabFirstOne = 0;
    boolean shouldAdd = true;
    for (int i = 0; i < beerlist.length; i++) {
      if (grabFirstOne < 1) {
        if (checkIfArrayContains(topIndexes, i) == false) {
          indexOfMaximum = i;
          grabFirstOne++;
        }
      }
      tempAsFloat = Float.parseFloat(beer2d[i][numCol]);
      thisLoopMax = Float.parseFloat(beer2d[indexOfMaximum][numCol]);
      if (tempAsFloat >= thisLoopMax) {
        if (checkIfArrayContains(topIndexes, i) == false) {
          indexOfMaximum = i;
        }
      }
    }
    if (shouldAdd == true) {
      topIndexes[thisNewArrayIndexNumber] = indexOfMaximum;
      println(topIndexes[thisNewArrayIndexNumber]);
      thisNewArrayIndexNumber++;
    }
    else {
      //
    }
  }
  return topIndexes;
}


boolean checkIfArrayContains(int [] topIndexes, int indexInQuestion) {
  boolean returnState = false;
  for (int i = 0; i < topIndexes.length; i++) {
    if (topIndexes[i] == indexInQuestion) {
      returnState = true;
      //println(i);
    }
  }
  return returnState;
}

int findHighestABVBeerIndex() {
  float tempAsFloat = 0;
  float currentMaxAsFloat = 0;
  int indexOfMaximum = 0; 
  for (int i = 0; i < beerlist.length; i++) {
    tempAsFloat = Float.parseFloat(beer2d[i][ABVINDEX]);
    currentMaxAsFloat = Float.parseFloat(beer2d[indexOfMaximum][ABVINDEX]);
    if (tempAsFloat > currentMaxAsFloat) {
      indexOfMaximum = i;
    }
  }
  return indexOfMaximum;
}


int findBestBrewery() {
  int highestLoopCount = 0;
  int highestLoopCounterIndex = 0;
  for (int i = 0; i < beerlist.length; i++) {
    int currentLoopCounter = 0;
    // if a brewery appears again on the list, add it to the counter and save the index
    for (int j = 0; j < beerlist.length; j++) {
      if (beer2d[i][BREWERYINDEX].equals(beer2d[j][BREWERYINDEX]) == true) {
        currentLoopCounter = currentLoopCounter+1;
      }
    }
    if (currentLoopCounter > highestLoopCount) {
      highestLoopCount = currentLoopCounter;
      highestLoopCounterIndex = i;
    }
  }
  return highestLoopCounterIndex;
}

int getBreweryBeerNumber(int i) {
  int currentLoopCounter = 0;
  for (int j = 0; j < beerlist.length; j++) {
    if (beer2d[i][BREWERYINDEX].equals(beer2d[j][BREWERYINDEX]) == true) {
      currentLoopCounter++;
    }
  }
  return currentLoopCounter;
}


//////////////////////////////
// GET MAX, MIN, AND AVERAGES
//////////////////////////////

int getStyleBreweryMaxIndex(String styleBreweryName, int styleOrBreweryColumn, int numberColumn) {
  float currentiAsFloat = 0;
  float currentMaximumAsFloat = 0;
  int indexOfCurrentMaximum = 0;
  int grabFirstOne = 0;
  for (int i = 0; i < beerlist.length; i++) {
    if (styleBreweryName.equals(beer2d[i][styleOrBreweryColumn]) == true) {
      if (grabFirstOne < 1) {
        indexOfCurrentMaximum = i;
        grabFirstOne++;
      }
      currentiAsFloat = Float.parseFloat(beer2d[i][numberColumn]);
      currentMaximumAsFloat = Float.parseFloat(beer2d[indexOfCurrentMaximum][numberColumn]);
      if (currentiAsFloat >= currentMaximumAsFloat) {
        indexOfCurrentMaximum = i;
      }
    }
  }
  return indexOfCurrentMaximum;
}

int getStyleBreweryMinIndex(String styleBreweryName, int styleOrBreweryColumn, int numberColumn) {
  float tempMinAsFloat = 0;
  float currentMinAsFloat = 0;
  int indexOfCurrentMin = 0;
  int grabFirstOne = 0;
  for (int i = 0; i < beerlist.length; i++) {
    if (styleBreweryName.equals(beer2d[i][styleOrBreweryColumn]) == true) {
      if (grabFirstOne < 1) {
        indexOfCurrentMin = i;
        grabFirstOne++;
      }
      currentMinAsFloat = Float.parseFloat(beer2d[indexOfCurrentMin][numberColumn]);
      tempMinAsFloat = Float.parseFloat(beer2d[i][numberColumn]);
      if (tempMinAsFloat <= currentMinAsFloat) {
        indexOfCurrentMin = i;
      }
    }
  }
  return indexOfCurrentMin;
}


float getStyleBreweryAverage(String styleBreweryName, int styleOrBreweryColumn, int numCol) {
  float styleBreweryFinalAvg = 0;
  float styleBreweryTotalScore = 0;
  int numEntries = 0;
  for (int i = 0; i < beerlist.length; i++) {
    if (styleBreweryName.equals(beer2d[i][styleOrBreweryColumn]) == true) {
      styleBreweryTotalScore = styleBreweryTotalScore + Float.parseFloat(beer2d[i][numCol]);
      numEntries++;
    }
  }
  styleBreweryFinalAvg = styleBreweryTotalScore/numEntries;
  return styleBreweryFinalAvg;
}




///////////////////////////////////////////////////////////////////
// CREATE BEER ARRAYS AND ARRAYLISTS IF IT'S FROM THE UNTAPPD WEBSITE
////////////////////////////////////////////////////////////////////

void JSONfetching() {
  String url = "http://" + baseURL + "?user=" + userID + "?offset=0" + "&key=" + apiKey;
  println(url);

  try {
    JSONObject allCheckinData = new JSONObject(join(loadStrings(url), ""));
    JSONArray results = allCheckinData.getJSONArray("results");
    beer2d = new String [results.length()][arrayNumberCols];
    for (int i=0; i < results.length(); i++) {
      JSONObject singleBeer = results.getJSONObject(i);
      beer2d[i][NAMEINDEX] = singleBeer.getString("beer_name");
      beer2d[i][NAMEIDINDEX] = "" + singleBeer.getString("beer_id");
      beer2d[i][BREWERYINDEX] = singleBeer.getString("brewery_name");
      beer2d[i][BREWERYIDINDEX] = "" + singleBeer.getString("brewery_id");
      String beerUrl = "http://" + "api.untappd.com/v3/beer_info" + "?bid=" + singleBeer.getInt("beer_id") + "&user" + userID + "&key=" + apiKey;
      JSONObject beerInfo = new JSONObject(join(loadStrings(beerUrl), ""));
      JSONObject singleBeerInfo = beerInfo.getJSONObject("results");
      beer2d[i][ABVINDEX] = "" + singleBeerInfo.getString("beer_abv");
      beer2d[i][STYLEINDEX] = singleBeerInfo.getString("type");
      beer2d[i][RATINGINDEX] = "" + singleBeerInfo.getString("avg_rating");
    }
  } 
  catch (JSONException e) { 
    println (e.toString());
  }
};


//////////////////////////////////////////////////
// CREATE BEER ARRAYS AND ARRAYLISTS IF IT'S A CSV
//////////////////////////////////////////////////

void createStyleList() {
  for (int i = 0; i<beerlist.length; i++) {
    boolean isRepeat = false;
    if ((i>0) && (beer2d[i][STYLEINDEX].equals(beer2d[i-1][STYLEINDEX]) == false)) {
      for (int j = 0; j < styleList.size(); j++) {
        if (beer2d[i][STYLEINDEX].equals(styleList.get(j)) == true) {
          isRepeat = true;
        }
      }
    }
    else if ((i>0) && (beer2d[i][STYLEINDEX].equals(beer2d[i-1][STYLEINDEX]) == true)) {
      isRepeat = true;
    }
    if (isRepeat == false) {
      styleList.add(beer2d[i][STYLEINDEX]);
    }
  }
}

void createBreweryList() {
  for (int i = 0; i<beerlist.length-1; i++) {
    if ((i > 0) && (beer2d[i][BREWERYINDEX].equals(beer2d[i-1][BREWERYINDEX]) == true)) {
      for (int j = 0; j < breweryList.size(); j++) {
        if (beer2d[i][BREWERYINDEX].equals(breweryList.get(j)) == true) {
          //do nothing
        }
      }
    }
    else {
      breweryList.add(beer2d[i][BREWERYINDEX]);
    }
  }
}

void setupArray() {
  //calculate the number of columns in CSV
  for (int i=0; i < beerlist.length; i++) {
    String [] chars=split(beerlist[i], ',');
    if (chars.length>csvNumberCols) {
      csvNumberCols=chars.length;
    }
  }
  //Create 2D Array
  beer2d = new String [beerlist.length][csvNumberCols];
  for (int i=0; i < beerlist.length; i++) {
    String [] temp = new String [beerlist.length];
    temp= split(beerlist[i], ',');
    for (int j=0; j < temp.length; j++) {
      beer2d[i][j]=temp[j];
    }
  }
}


