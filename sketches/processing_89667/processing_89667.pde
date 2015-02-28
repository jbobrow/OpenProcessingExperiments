
/* @pjs font="DINNeuzeitGrotesk-BoldCond-Regular.otf", "CooperBlackStd.otf", "BellGothicStd-Black.otf", "Oswald-Bold.ttf", "Oswald-Light.ttf"; */
/* @pjs font="AriaLig", "OpenSans-CondLight.ttf"; */

int myState = 5 ; //0 ;
int scalar = 150 ;
int pageTimer = 200 ;
int myTimer = pageTimer ;
int[] randomArray = {1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8 }  ;
float randomy = 0 ;

color backC ;

int y = 0 ;
int bottomOffset = 120 ; // offset of bars and grid
int topOffset = 40 ; // offset of bars and grid
int horizOffset = 10 ; 
int whichLine = 3 ; //3 ;

float easing; // Size of each step along the path
PFont myFont ; 
PFont myBigFont ; 
PFont myBiggerFont ; 
PFont cooperBlack ; 
PFont numberFont; 

String lines[] ;
int numLines ; 
int startLine = 1 ;

String yearlines[] ;
String randomYearLine[] ; 


int theBarLength = 0 ;

float barWidth = 60 ;

ArrayList myBars ;
int highestNum = 0 ;

String didYouKnow = "" ;
int tr = 0 ;
int ar = 0 ;
String[] myLine2 = {""} ; 
int dynCols[] = {
  3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17
} 
; 

color colorList[][] = {

  { 
    #8B538A, #BE38BC, #712170, #BE71BD, #3E123E
  }
  , // purples
  { 
    #893A32, #BC1C0B, #6F1107, #BB4D41, #520D05
  }
  , // reds
  {
    #438729, #34BB00, #1F6F00, #5BBB35, #175200
  }
  , // greens
  { 
    #BF803A, #F18A18, #A55F10, #F1BA7B, #D47B15
  }
  , // golds
  {
    #9A2FF0, #401363, #6920A3, #5B1C8D, #8228CA
  } // violets
  // {#EF7B48, #562109, #A34921, #11564E, #21A393} // browns and teals
} 
; 
int whichColorList = 0 ;



void setup() {

  //  colorMode(HSB, 100);
  size(1920, 1080) ;
  background(40) ;
  frameRate(24) ;
  noStroke() ;
  rectMode(CORNER) ; 
  //  myBigFont = loadFont("Futura-CondensedExtraBold-248.vlw") ;

  // myBigFont = createFont("FjallaOne-Regular.otf", 48);
  myBigFont = createFont("DINNeuzeitGrotesk-BoldCond-Regular.otf", 48);
  myBiggerFont = createFont("DINNeuzeitGrotesk-BoldCond-Regular.otf", 228);
  //myBiggerFont = createFont("FjallaOne-Regular.otf", 228) ; 
  cooperBlack = createFont("CooperBlackStd.otf", 180) ; 
numberFont = createFont("BellGothicStd-Black.otf", 180) ; 
osFont = createFont("Oswald-Bold.ttf", 200) ; 
osThinFont = createFont("Oswald-Light.ttf", 120) ; 

//osThinFont = createFont("OpenSans-CondLight.ttf", 120) ; 


  //   myBigFont = loadFont("AbadiMT-CondensedLight-168.vlw") ; 
  // myBiggerFont = loadFont("AbadiMT-CondensedExtraBold-220.vlw") ;   
  myFont = createFont("DINNeuzeitGrotesk-BoldCond-Regular.otf", 48); 



  textFont(myFont, 48) ; 
  lines = loadStrings("list.txt");
  yearlines = loadStrings("yearlist.txt") ; 

  //  println("there are " + lines.length + " lines");

  easing = 0.08;

  myBars = new ArrayList();

  textAlign(LEFT);


  //  println("highest = " + highestNum) ;

  numLines = int((width - (horizOffset+(barWidth))) / barWidth) ;

  //  makeBars(1, numLines) ;
}


void draw() {

  /*
myTimer = myTimer - 1 ;
   if (myTimer == 0) {
   myState = (myState + 1)%4 ;
   
   myTimer = 200;
   }
   */

  switch (myState) {

  case 0 :  // preparing to show circ stats bars
    background(40) ; 
    //  if (whichLine == 11) { whichLine = 13 ; } ;

    //    println("doing this column: " + whichLine) ; 
    getHighestNum() ;

    // add new bars

    // figure out if we need a color change
    if (startLine == 1) { // it's time for a color change
      whichColorList = int(random(colorList.length)) ;
    }


    // how many bars to add? 
    //   println("startLine = " + startLine + ", numLines = " + numLines) ;

    if (startLine < lines.length) {
      makeBars(startLine, startLine+numLines, colorList[whichColorList]) ;
      myState = 1 ;
      startLine += numLines ;
    } 
    else {
      myState = 2 ;
    }


    break; 

  case 1 :  // showing circulation stats bars

    noStroke() ;
    for (int i = 0; i < myBars.size(); i++) {
      Bar bar = (Bar) myBars.get(i);
      bar.deploy() ;
    }



    // only display these bars for a short time, then go back to state 0 and load more bars
    myTimer = myTimer - 1 ;
    if (myTimer == 0) {
      myState = 0 ;

      myTimer = pageTimer;
    }


    break ;


  case 2 :  // going to state 3
    //    text("state 2 ", 100, 100) ;
    background(40) ; 
    //   println("case 2" ) ;
    myState = 3 ;
    break ;

  case 3 :  // preparing for the "did you know" state
    background(40) ; 
    //    println("in case 3 whichLine = " + whichLine) ; 
    startLine = 1 ;
    whichLine = ( whichLine + 1 ) ;

    if (whichLine > 18) { 
      whichLine = 3 ;
    } 

    // when state 3 ends, set up for state 4, the "did you know" state

    if (int(random(1)) > -1) {
      myState = 4 ;

      //  textAlign(CENTER, CENTER);

      tr = int(random(1, lines.length)) ;  // this is going to be the row; a month and a year. don't choose row 0, I think.
      myLine2 = split(lines[tr], ',');
      ar = dynCols[int(random(dynCols.length))] ;  // this is going to be the column, should either be Gate Count or Tech Materials or maybe both???
      backC = color(random(0, 220), random(0, 220), random(0, 220)) ;
    } 
    else {
      myState = 0 ;
    }
    break ;



  case 4: // "Did you know? 
    background(backC) ; 
    fill(255) ; 


    String[] firstLine = split(lines[0], ",") ;

    textFont(myBigFont, 108) ;
    text(myLine2[0]+ " "  + myLine2[1], 40, 240) ; 


    textFont(myBigFont, 148) ;
    text(firstLine[ar], 40, 368) ; 

    rect(50, 386, 10*(pageTimer - myTimer), 5) ; 

    textFont(myBiggerFont, 268) ;
    String fff = myLine2[ar] ;
//    println(fff) ; 
//    if (fff.length > 0) {


      text(myLine2[ar], 40, 600) ;
/*    } 
    else { 
      text("0", 40, 600) ;
    }
    */

    textFont(myBigFont, 80) ;
    text("Milner Library Circulation Statistics", 40, 720) ; 


    myTimer = myTimer - 1 ;
    if (myTimer == 0) {
      // textAlign(LEFT);

      myState = 5 ;


      myTimer = pageTimer;
    }
    break ;


  case 5: // preparation for showing some year stats
    // prepare for state 5 by getting a line of data from year counts
    // get a random line of data to show for years.
    backC = color(random(0, 220), random(0, 220), random(0, 220)) ;
 background(backC) ; 
 int index1 = int(random(1, yearlines.length)) ;

    randomYearLine = split(yearlines[index1], ',') ;
    for (int x = 0; x < 16; x++) {
      randomArray[x] = int(random(width/2)) ;
    }
    randomy = random(2) ; 
    myState = 6 ; 
    break ; 

  case 6:
  background(backC) ; 

for (int m = 0; m < 16; m=m+2) {
  fill(255, map(randomArray[m], 0, width, 0, 100)) ;
  if (randomy > 1) {
ellipse(randomArray[m], randomArray[m+1], (m*(pageTimer - myTimer)), (m*(pageTimer - myTimer))) ; 
  } else {
     rectMode(CENTER) ; 
    rect(randomArray[m], randomArray[m+1], (m*(pageTimer - myTimer)), (m*(pageTimer - myTimer))) ; 

  }
}

 
   fill(255) ; 
     rectMode(CORNER) ; 
     rect(60, 790, 50+10*(pageTimer - myTimer), 5) ; 
    
  textFont(myBigFont, 100) ;
    text(randomYearLine[0], 60, 890) ; 
   //   textFont(osThinFont, 40) ;
      int yearCounter = 2008 ;
  
      for (int i = 0; i < 5; i++) {
          textFont(osFont, 40) ;
        text(yearCounter+i, 60, 340 + i*120-80) ;
          textFont(osThinFont, 120) ;
       
        text(randomYearLine[i+1], 170, 330 + i*120-80) ;
      }
 
  
  // noStroke() ;
      
      


    myTimer = myTimer - 1 ;
    if (myTimer == 0) {
       rectMode(CORNER) ; 
      myState = 0 ; 
      myTimer = pageTimer ;
    }
    break ;
  }
}

void keyPressed() {

  if (keyCode == RIGHT) {
    pageTimer = pageTimer + 50 ;
    if (pageTimer > 200) { 
      pageTimer = 200;
    }
  }
  if (keyCode == LEFT) {
    pageTimer = pageTimer - 50  ; 
    if (pageTimer < 50) { 
      pageTimer = 50;
    }
  }
  // println(pageTimer) ;
}

// guy walks into a bar

class Bar {

  PVector location ;
  PVector targetLocation ;
  color myC ;
  int whatShape ; 
  int horizDirection ;

  Bar(PVector startLoc, PVector tLoc, color aColor) {
    location = new PVector(0, 0, 0) ;
    targetLocation = new PVector(0, 0, 0) ;
    myC = aColor ; 


    location.set(startLoc) ;
    targetLocation.set(tLoc) ;
  }

  void deploy() {

    // If the current position is more than 1 pixel away from target  
//    println(location.dist(targetLocation)) ; // (dist(location.x, location.y, targetLocation.x, targetLocation.y)) ;

    if (location.dist(targetLocation) > 1.0) {
      // Update the current position towards the target position

        location.y -= (location.y-targetLocation.y) * easing;

    }


    fill(myC);
 //   if (location.y < 65) {
//println("bottomOffset = " + bottomOffset + ", location.y = " + location.y) ; 
//    }

      rect(location.x, height-bottomOffset, barWidth-2, -(location.y-topOffset)) ; 


  
  }
}

int theNum = 0 ;

void dashedLine(int start, int stop, int theHeight, int length, int space) {
  int i = start ;
  while (i < stop) {
    line(i, theHeight, i+length, theHeight);
    i = i + space + length ;
  }
}

void getHighestNum() {
  // calculate the highest number in this column and save for scaling later
  highestNum = 0 ;

  for (int i = 1; i < lines.length; i++) {

    String[] myLine = split(lines[i], ',');

    //       println("myLine[3] = " + myLine[3] + ",  highestNum = " + highestNum ) ;

    if (highestNum < int(myLine[whichLine])) {

      //     println("highestNum was " + highestNum + "but now setting highestNum to " + myLine[3]) ;
      highestNum = int(myLine[whichLine]) ;
    }
  }
//  println("highest num = " + highestNum) ;
}

void makeBars(int startLine, int endLine, color aColorList[]) {
  // add the BARS

  myBars.clear() ;  // make sure it's empty first!

  // how many bars to add? 
  //  int numLines = int((width - (horizOffset+(barWidth))) / barWidth) ;
  // println("from " + startLine + " to " + endLine) ;
  // for (int i = 1; i < lines.length; i++) {
  int startingX = 0 ; 

  if (endLine > lines.length) { 
    endLine = lines.length ;
  } 
  ;


  for (int i = startLine; i < endLine; i++) {

    //   startingX++ ; 
    String[] myLine = split(lines[i], ',');
    color myColor = aColorList[int(random(aColorList.length))] ;

    int x = horizOffset+ int(((i - startLine)+1)*barWidth) ;

    //   int barLength = int(myLine[whichLine]) ; // sometimes there's no number entered here so deal with it
    String barLength = "";  // default to zero if bad input  
    barLength = myLine[whichLine];
    barLength = barLength.replaceAll(",", "") ; // get rid of commas in numeric fields

    theBarLength = 0 ;

    if (isInteger(barLength)) { 
      theBarLength = int(barLength) ;
    } 
    else {
      //println("got exception "+ myLine); }  ;
    }
    float myStarting =  map(0, 0, highestNum, topOffset, height-bottomOffset ) ;
    float myTarget = map(theBarLength, 0, highestNum, topOffset, height-bottomOffset ) ;
    //    println("adding a bart at " + myTarget + ", " + x) ;
    myBars.add(new Bar(new PVector(x, myStarting, 0), new PVector(x, myTarget, 0), myColor)) ;

    // add the information under the columns
    fill(255); 
    textFont(myFont, 12) ; 
    text(myLine[2], 10+(((i-startLine)+1)*barWidth), height-(bottomOffset-20)) ;
    text(myLine[whichLine], 10+(((i-startLine)+1)*barWidth), height-(bottomOffset-32)) ;
  }


  // print out the grid
  printAGrid(0, round(highestNum)) ; 
  /*

   int temp = 0 ; 
   int interval = int(int(highestNum / 1000)*100) ; 
 //  println("temp and highestNum are " + temp + " + " + highestNum) ; 
   while (temp < highestNum) {
   
   float myNum = 0 ;
   
   myNum = map(temp, 0, highestNum, bottomOffset, height-topOffset) ;
   //     println("myNum = " + myNum) ;
   textFont(myFont, 12) ; 
   text(temp, 10, height-myNum) ;
   stroke(100);
   
   //line(10, (height-i)-bottomOffset, width-10, (height-i)-bottomOffset) ;
   dashedLine(50, width-10, int(height-myNum), 4, 8) ;
   
   temp += interval ;
   }
   */


  //  println("printed out grid") ; 

  // print out the name of the column
  String[] myLine1 = split(lines[0], ',');
  fill(255) ; 
  textFont(myFont, 48) ; 
  text(myLine1[whichLine], horizOffset+(barWidth), height-(40)) ;
}


boolean isInteger(String str) {
  return str.matches("^-?[0-9]+(\\.[0-9]+)?$");
}


float roundup(float num, float magnitude) {
  
  num= (ceil(num/magnitude)) * (magnitude)  ;
  
  return(num) ;
}

void printAGrid(int min, int max) {

  float range ;
  int exponent ;
  float magnitude ;
  int subdivisions = 10 ; 

  range = max - min; 
//  println(range) ;
  exponent = int(log(range)/log(10));       // See comment below.
  magnitude = pow(10, exponent);

 // println("magnitude = " + magnitude) ; 
 // println("exponent = " + exponent) ; 

float maxxy = roundup(max, magnitude) ;
//println("maxxy = " + maxxy) ; 
  float value_per_division = maxxy / subdivisions;
  
//  println("value per division = " + value_per_division) ;
  
  int temp = 0 ; 
  
    float myNum = 0 ;
//     while (temp <  highestNum) {
  for (int m = 0; m < subdivisions; m++) {
  
 //  println("temp = " + temp) ;
   myNum = map(temp, 0, highestNum, bottomOffset, height-topOffset) ;
 
    textFont(myFont, 12) ; 
   text(temp, 10, height-myNum) ;
   stroke(100);
   
    dashedLine(50, width-10, int(height-myNum), 4, 8) ;
   
   temp += value_per_division ;

     
     }
//println(" ") ; 
}




