
// Homework 13
// 51-757 Computing for the Arts with Processing
// November 22, 2011
// Copyright Molly Nix November 2011 Pittsburgh, PA 15232

int NAMEINDEX = 0;
int STYLEINDEX = 1;
int BREWERYINDEX = 2;
int ABVINDEX = 3;
int RATINGINDEX = 4;
String [] beerlist;
String [][] beer2d;
ArrayList styleList;
ArrayList breweryList;
PFont largeHeaderFont;
PFont smallerTextFont;
PFont detailFont;
PFont smallTitleFont;

int csvNumberCols=0;

// Colors
color bgColor = color(244, 243, 238);
color medLtTxtClr = color(161, 161, 151);
color medDkTxtClr = color(120, 120, 112);
color accentClr = color(214, 107, 26);
color faintDkBg = color(233, 233, 228);
color faintLtBg = color(250, 250, 246);

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
  beerlist = loadStrings("bestbelgianbeerlist.csv");
  styleList = new ArrayList();
  breweryList = new ArrayList();
  setupArray();
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
  drawStyleScoreSection();
  drawABVScoreSection();
  drawStrongestSection();
  drawBestSection();
  drawMostBeersOnList();
  noLoop();
}

void drawTitles() {
  textFont(largeHeaderFont);
  textSize(57);
  fill(medLtTxtClr);
  text("Belgian Beers", visMargin, visMargin+30);
  textFont(smallerTextFont);
  textSize(16);
  fill(medDkTxtClr);
  text("A look at over 300 of the top beers in varying Belgian styles.", visMargin, visMargin+60);
  textAlign(RIGHT);
  fill(medLtTxtClr);
    textFont(detailFont);
  text("Thank you to BeerAdvocate.com for the data.", width-visMargin, visMargin+60);
    textAlign(LEFT);
}

void drawStyleScoreSection() {
  int sectionStart = 100;
  textFont(detailFont);
  textSize(16);
  fill(medDkTxtClr);
  text("Styles: ratings ranges and averages", visMargin, sectionStart+visMargin);
  stroke(faintDkBg);
  line(visMargin, visMargin+sectionStart+5, barGraphWd+visMargin, visMargin+sectionStart+5);
  noStroke();
  fill(medLtTxtClr);
  textAlign(RIGHT);
  text("5", barGraphWd+visMargin, visMargin+sectionStart+30); 
  textAlign(LEFT);
  fill(medDkTxtClr);
  String thisStyle = "";
  for (int i = 0; i < styleList.size(); i++) {
    thisStyle = (String)(styleList.get(i));
    int yPos= (i*25)+visMargin+sectionStart+30;
    if (i == styleList.size()-1) {
      bottomOfBarGraphSection = yPos;
    }
    text(thisStyle, visMargin, yPos);
    fill(faintLtBg);
    rect(visMargin, yPos+5, barGraphWd, barHt);
    stroke(bgColor);
    for (int j = 0; j < 5; j++) {
      line(map(j, 0, 5, 0, barGraphWd)+visMargin, yPos+5, map(j, 0, 5, 0, barGraphWd)+visMargin, yPos+5+barHt);
    }
    noStroke();
    fill(faintDkBg);
    float loRange = Float.parseFloat(beer2d[getStyleBreweryMinIndex(thisStyle, STYLEINDEX, RATINGINDEX)][RATINGINDEX]);
    float hiRange = Float.parseFloat(beer2d[getStyleBreweryMaxIndex(thisStyle, STYLEINDEX, RATINGINDEX)][RATINGINDEX]);
    float average = getStyleBreweryAverage(thisStyle, STYLEINDEX, RATINGINDEX);
    rect(map(loRange, 0, 5, 0, barGraphWd)+visMargin, yPos+5, map(hiRange, 0, 5, 0, barGraphWd)-map(loRange, 0, 5, 0, barGraphWd), barHt);
    fill(accentClr);
    ellipse(map(average, 0, 5, 0, barGraphWd)+visMargin, yPos+5+(barHt/2), barHt, barHt);
    fill(medDkTxtClr);
  }
}

void drawABVScoreSection() {
  int sectionStart = 100;
  float highestABV =  Float.parseFloat(beer2d[findHighestABVBeerIndex()][ABVINDEX]);
  float sectionLeftPos = visMargin + narrowMargin + barGraphWd;
  textFont(detailFont);
  textSize(16);
  fill(medDkTxtClr);
  text("Styles: ABV ranges and averages", sectionLeftPos, sectionStart+visMargin);
  stroke(faintDkBg);
  line(sectionLeftPos, visMargin+sectionStart+5, barGraphWd+sectionLeftPos, visMargin+sectionStart+5);
  noStroke();
  fill(medLtTxtClr);
  textAlign(RIGHT);
  text(highestABV + "%", barGraphWd+sectionLeftPos, visMargin+sectionStart+30); 
  textAlign(LEFT);
  fill(medDkTxtClr);
  String thisStyle = "";
  for (int i = 0; i < styleList.size(); i++) {
    thisStyle = (String)(styleList.get(i));
    int yPos= (i*25)+visMargin+sectionStart+30;
    text(thisStyle, sectionLeftPos, yPos);
    fill(faintLtBg);
    rect(sectionLeftPos, yPos+5, barGraphWd, barHt);
    stroke(bgColor);
    for (int j = 0; j < highestABV; j++) {
      line(map(j, 0, highestABV, 0, barGraphWd)+sectionLeftPos, yPos+5, map(j, 0, highestABV, 0, barGraphWd)+sectionLeftPos, yPos+5+barHt);
    }
    noStroke();
    fill(faintDkBg);
    float loRange = Float.parseFloat(beer2d[getStyleBreweryMinIndex(thisStyle, STYLEINDEX, ABVINDEX)][ABVINDEX]);
    float hiRange = Float.parseFloat(beer2d[getStyleBreweryMaxIndex(thisStyle, STYLEINDEX, ABVINDEX)][ABVINDEX]);
    float average = getStyleBreweryAverage(thisStyle, STYLEINDEX, ABVINDEX);
    rect(map(loRange, 0, highestABV, 0, barGraphWd)+sectionLeftPos, yPos+5, map(hiRange, 0, highestABV, 0, barGraphWd)-map(loRange, 0, highestABV, 0, barGraphWd), barHt);
    fill(accentClr);
    ellipse(map(average, 0, highestABV, 0, barGraphWd)+sectionLeftPos, yPos+5+(barHt/2), barHt, barHt);
    fill(medDkTxtClr);
  }
}

void drawStrongestSection() {
  fill(medDkTxtClr);
  text("Strongest Beers on list", visMargin, bottomOfBarGraphSection+spaceBtwnSections);
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
  text("Top-rated Beers on list", visMargin+sectionhWdThird+narrowMargin, bottomOfBarGraphSection+spaceBtwnSections);
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
  text("Brewery with most beers on the list", visMargin+(sectionhWdThird*2)+(narrowMargin*2), bottomOfBarGraphSection+spaceBtwnSections);
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
      text(beer2d[i][NAMEINDEX], visMargin+(sectionhWdThird*2)+(narrowMargin*2), yPos);
      yPos = yPos+12;
    }
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
    topIndexes[thisNewArrayIndexNumber] = indexOfMaximum;
    thisNewArrayIndexNumber++;
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



////////////////////////////////////////
// CREATE BEER ARRAYS AND ARRAYLISTS
//////////////////////////////////////

void createStyleList() {
  for (int i = 0; i<beerlist.length-1; i++) {
    if ((i > 0) && (beer2d[i][STYLEINDEX].equals(beer2d[i-1][STYLEINDEX]) == true)) {
      for (int j = 0; j < styleList.size(); j++) {
        if (beer2d[i][STYLEINDEX].equals(styleList.get(j)) == true) {
          //do nothing
        }
      }
    }
    else {
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


