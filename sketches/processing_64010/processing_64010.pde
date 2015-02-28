
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import de.looksgood.ani.*;
import controlP5.*;

ControlP5 cp5;

Minim minim;
AudioPlayer player2;

AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;
AudioPlayer player12;
AudioPlayer player13;
AudioPlayer player14;
AudioPlayer player15;
AudioPlayer player16;
AudioPlayer player17;
AudioPlayer player18;
AudioPlayer player19;
AudioPlayer player20;
AudioPlayer player21;
AudioPlayer player22;
AudioPlayer player23;
AudioPlayer player24;


MyControlListener visualiseBut;
MyControlListenerTwo visOneBut;
MyControlListenerThree visTwoBut;
MyControlListenerFour visThreeBut;
MyControlListenerFive visFourBut;
MyControlListenerSix visFiveBut;
MyControlListenerSeven visSixBut;

MyControlListenerEight backBut;

MyControlListenerNext Next;
MyControlListenerPrevious Previous;

MyControlListenerSources Sources;




//  OGC Button listeners
MyControlListenerNine But2012;
MyControlListenerTen But2013;
MyControlListenerEleven But2014;
MyControlListenerTwelve But2015;
MyControlListenerThirteen But2016;
MyControlListenerFourteen But2017;
MyControlListenerFifteen But2018;
MyControlListenerSixteen But2019;
MyControlListenerSeventeen But2020;

MyControlListenerEighteen But2050;
MyControlListenerNineteen But2055;
MyControlListenerTwenty But2060;
MyControlListenerTwentyOne But2065;
MyControlListenerTwentyTwo But2070;

MyControlListenerTwentyThree But2150;
MyControlListenerTwentyFour But2200;
MyControlListenerTwentyFive But2250;
MyControlListenerTwentySix But2300;
MyControlListenerTwentySeven But2350;
MyControlListenerTwentyEight But2400;
MyControlListenerTwentyNine But2427;
//   OGC Button Listeners

// Ani vars for CO2 in Business
public Ani diameterOne;
public Ani diameterTwo;
public Ani diameterThree;

// Ani vars for iPad CO2 emissions
public Ani diameterOneIpad;
public Ani diameterTwoIpad;
public Ani diameterThreeIpad;
public Ani diameterFourIpad;
public Ani diameterFiveIpad;
public Ani diameterSixIpad;
public Ani diameterSevenIpad;
public Ani diameterEightIpad;

// Ani Vars for Twenty Four Hrs
public Ani diameterOneTwentyFour;
public Ani diameterTwoTwentyFour;

//Ani vars for OGC
public Ani diameterOneOGC;
public Ani diameterTwoOGC;
public Ani diameterThreeOGC;

public Ani diameterFourOGC;
public Ani diameterFiveOGC;
public Ani diameterSixOGC;

public Ani diameterSevenOGC;
public Ani diameterEightOGC;
public Ani diameterNineOGC;

public Ani diameterTenOGC;
public Ani diameterElevenOGC;
public Ani diameterTwelveOGC;

public Ani diameterThirteenOGC;
public Ani diameterFourteenOGC;
public Ani diameterFifteenOGC;

public Ani diameterSixteenOGC;
public Ani diameterSeventeenOGC;
public Ani diameterEighteenOGC;

public Ani diameterNineteenOGC;
public Ani diameterTwentyOGC;
public Ani diameterTwentyOneOGC;

public Ani diameterTwentyTwoOGC;
public Ani diameterTwentyThreeOGC;
public Ani diameterTwentyFourOGC;

public Ani diameterTwentyFiveOGC;
public Ani diameterTwentySixOGC;
public Ani diameterTwentySevenOGC;

public Ani diameterTwentyEightOGC;
public Ani diameterTwentyNineOGC;
public Ani diameterThirtyOGC;

public Ani diameterThirtyOneOGC;
public Ani diameterThirtyTwoOGC;
public Ani diameterThirtyThreeOGC;

public Ani diameterThirtyFourOGC;
public Ani diameterThirtyFiveOGC;
public Ani diameterThirtySixOGC;

public Ani diameterThirtySevenOGC;
public Ani diameterThirtyEightOGC;
public Ani diameterThirtyNineOGC;

public Ani diameterFourtyOGC;
public Ani diameterFourtyOneOGC;
public Ani diameterFourtyTwoOGC;

public Ani diameterFourtyThreeOGC;
public Ani diameterFourtyFourOGC;
public Ani diameterFourtyFiveOGC;

public Ani diameterFourtySixOGC;
public Ani diameterFourtySevenOGC;
public Ani diameterFourtyEightOGC;

public Ani diameterFourtyNineOGC;
public Ani diameterFiftyOGC;
public Ani diameterFiftyOneOGC;

public Ani diameterFiftyTwoOGC;
public Ani diameterFiftyThreeOGC;
public Ani diameterFiftyFourOGC;

public Ani diameterFiftyFiveOGC;
public Ani diameterFiftySixOGC;
public Ani diameterFiftySevenOGC;

public Ani diameterFiftyEightOGC;
public Ani diameterFiftyNineOGC;
public Ani diameterSixtyOGC;

public Ani diameterSixtyOneOGC;
public Ani diameterSixtyTwoOGC;
public Ani diameterSixtyThreeOGC;


boolean bover = false;
boolean locked = false;


PFont header;
PFont main;
PFont buttons;

int  count; 

int butPosX = 1220;
int butPosY = 630;

/*************************** 
 CO2 in Business global variables
 ***************************/
int CO2BusCount;
int iPadCount;

/*
 diameter variables for large circles 
 starts at 0 because of .Ani lib. starts at 0 expands 
 to 210, 160 & 120 see diameter'X' vars in set up
 */
public int circ1 = 0;
public int circ2 = 0;
public int circ3 = 0;

// transparency variables
float transP = 0;
float transP2 = 0;
float transP3 = 0;
float transP4 = 0;
float transP5 = 0;
float transP6 = 0;



PFont headings;
PFont years;
PFont information;
/*************************** 
 CO2 in Business global variables
 ***************************/



/*************************** 
 iPad CO2 Variables
 ***************************/
public int iPadCirc1 = 0;
public int iPadCirc2 = 0;
public int iPadCirc3 = 0;
public int iPadCirc4 = 0;
public int iPadCirc5 = 0;
public int iPadCirc6 = 0;
public int iPadCirc7 = 0;
public int iPadCirc8 = 0;

float iPadTransP = 0;
float iPadTransP2 = 0;
float iPadTransP3 = 0;
float iPadTransP4 = 0;

int textFiveX = 950;
/*************************** 
 iPad CO2 Variables
 ***************************/




/*************************** 
 OGC Variables
 ***************************/

public int OGCCirc1 = 0;
public int OGCCirc2 = 0;
public int OGCCirc3 = 0;


int OGCtextX = 1150;
int OGCtextY = 145;
int OGCtextYvar = 18;

int OGCSelecter = 15;
int OGCCount;


float OGCTransP = 0;
float OGCTransP2 = 0;
float OGCTransP3 = 0;
float OGCTransP4 = 0;

int oilDay = 15165;
int gasDay = 60591;
int coalDay = 151762;

int oilLeft = oilDay / 365;
int gasLeft = gasDay / 365;
int coalLeft = coalDay / 365;

float dat1 = oilLeft * 17;
float dat2 = gasLeft * 17;
float dat3 = coalLeft * 17;

String daysOfOil = str(oilLeft);
String daysOfGas = str(gasLeft);
String daysOfCoal = str(coalLeft);

String theYearis = "2012";
/*************************** 
 OGC Variables
 ***************************/





/*************************** 
 Twenty Four Hrs
 ***************************/
public int bigCirc = 0;
public int smallCirc = 0;

float newsPap = 534;
float mobiPhone = 5.5;
float tweetSent = 312;
float blogWrit = 4.3;
float googSearch = 3902;

float tot = newsPap + mobiPhone + tweetSent + blogWrit + googSearch;
float tot2 =  tot/360;

float ang1 = googSearch / tot2;
float ang2 = newsPap / tot2;
float ang3 = tweetSent / tot2;
float ang4 = mobiPhone / tot2;
float ang5 = blogWrit / tot2;

int TwentyFourcount;

int TwentyFourtextFiveX = 950;

int bigX = 590;
int bigY = 410;

int smallX = 590;
int smallY = 410;

int rectTwoY = 520;

int Google = 45162;
int NewsPaper = 6180;
int Tweets = 3611;
int Mobiles = 636;
int Blogs = 497;

String numGoogle = str(Google);
String numNews = str(NewsPaper);
String numTweet = str(Tweets);
String numMobile = str(Mobiles);
String numBlog = str(Blogs);

float TwentyFourTransP = 0;
float TwentyFourP2 = 0;
float TwentyFourP3 = 0;
float TwentyFourP4 = 0;
/*************************** 
 Twenty Four Hrs
 ***************************/

int VisualCount = 0;

color[] c1 = new color [8];

PImage logo;

public void setup() {
  frameRate(30);
  size(1350, 700);

  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long

  player2 = minim.loadFile("marcus_kellis_theme.mp3", 2048);

  player3 = minim.loadFile("Recording 4.mp3", 2048);
  player4 = minim.loadFile("Recording 6.mp3", 2048);
  player5 = minim.loadFile("Recording 5.mp3", 2048);
  player6 = minim.loadFile("Recording 3.mp3", 2048);
  player7 = minim.loadFile("Recording 7.mp3", 2048);
  player8 = minim.loadFile("Recording 8.mp3", 2048);
  player9 = minim.loadFile("Recording 9.mp3", 2048);

  player10 = minim.loadFile("Recording 21.mp3", 2048);
  player11 = minim.loadFile("Recording 22.mp3", 2048);
  player12 = minim.loadFile("Recording 19.mp3", 2048);
  player13 = minim.loadFile("Recording 20.mp3", 2048);
  player14 = minim.loadFile("Recording 23.mp3", 2048);
  player15 = minim.loadFile("Recording 18.mp3", 2048);
  player16 = minim.loadFile("Recording 17.mp3", 2048);
  player17 = minim.loadFile("Recording 16.mp3", 2048);

  player18 = minim.loadFile("Recording 2.mp3", 2048);

  player19 = minim.loadFile("Recording 14.mp3", 2048);
  player20 = minim.loadFile("Recording 15.mp3", 2048);
  player21 = minim.loadFile("Recording 12.mp3", 2048);
  player22 = minim.loadFile("Recording 13.mp3", 2048);
  player23 = minim.loadFile("Recording 11.mp3", 2048);
  player24 = minim.loadFile("Recording 10.mp3", 2048);



  logo = loadImage("Logo.png");
  


  //One image for each state: Static - Hover - Click.
  PImage[] visOne = {
    loadImage ("VisOne.png"), loadImage ("VisOneHover.png"), loadImage ("VisOneHover.png")
  };
  PImage[] visTwo = {
    loadImage ("VisTwo.png"), loadImage ("VisTwoHover.png"), loadImage ("VisTwoHover.png")
  };
  PImage[] visThree = {
    loadImage ("VisFive.png"), loadImage ("VisThreeHover.png"), loadImage ("VisThreeHover.png")
  };
  PImage[] visFour = {
    loadImage ("VisSix.png"), loadImage ("VisFourHover.png"), loadImage ("VisFourHover.png")
  };
  PImage[] visFive = {
    loadImage ("VisOne.png"), loadImage ("VisFiveHover.png"), loadImage ("VisFiveHover.png")
  };
  PImage[] visSix = {
    loadImage ("VisSix.png"), loadImage ("VisSixHover.png"), loadImage ("VisSixHover.png")
  };


  cp5 = new ControlP5(this);

  background(255, 255, 255, 200);
  smooth();
  textAlign(LEFT);
  header = createFont("Helvetica Neue LT Com 75 Bold", 150, true);
  main = createFont("Helvetica Neue LT Com 65 Medium", 48, true);
  buttons = createFont("Helvetica Neue LT Com 75 Bold", 27, true);

  /* Standard colours for all visualisations */
  c1[0] = color(99, 184, 255);
  c1[1] = color(106, 90, 205);
  c1[2] = color(54, 100, 139);
  c1[3] = color(0, 205, 102);
  c1[4] = color(180, 55, 79);
  c1[5] = color(238, 220, 130);
  c1[6] = color(55, 79, 180);
  c1[7] = color(100);
  /* Standard colours for all visualisations */

  /* Only for CO2 in Business */
  headings = createFont("Helvetica Neue LT Com 65 Medium", 20, true);
  years = createFont("Helvetica Neue LT Com 75 Bold", 15, true);
  buttons = createFont("Helvetica Neue LT Com 75 Bold", 27, true);
  information = createFont("Cardiff Italic", 20, true);

  Ani.init(this);

  diameterOne = new Ani(this, 1.0, "circ1", 210, Ani.EXPO_IN_OUT);  
  diameterTwo = new Ani(this, 1.0, "circ2", 160, Ani.EXPO_IN_OUT);    
  diameterThree = new Ani(this, 1.0, "circ3", 120, Ani.EXPO_IN_OUT);
  /* Only for CO2 in Business */

  /* Only for iPad CO2 */
  Ani.init(this);

  diameterOneIpad = new Ani(this, 1.0, "iPadCirc1", 170, Ani.EXPO_IN_OUT);  
  diameterTwoIpad = new Ani(this, 1.0, "iPadCirc2", 90, Ani.EXPO_IN_OUT);    
  diameterThreeIpad = new Ani(this, 1.0, "iPadCirc3", 80, Ani.EXPO_IN_OUT);
  diameterFourIpad = new Ani(this, 1.0, "iPadCirc4", 4, Ani.EXPO_IN_OUT);
  diameterFiveIpad = new Ani(this, 1.0, "iPadCirc5", 8, Ani.EXPO_IN_OUT);
  diameterSixIpad = new Ani(this, 1.0, "iPadCirc6", 25, Ani.EXPO_IN_OUT);
  diameterSevenIpad = new Ani(this, 1.0, "iPadCirc7", 57, Ani.EXPO_IN_OUT);
  diameterEightIpad = new Ani(this, 1.0, "iPadCirc8", 25, Ani.EXPO_IN_OUT);
  /* Only for iPad CO2 */


  /* Only for Twenty Four Hrs */
  Ani.init(this);

  diameterOneTwentyFour = new Ani(this, 1.0, "bigCirc", 350, Ani.EXPO_IN_OUT);  
  diameterTwoTwentyFour = new Ani(this, 1.0, "smallCirc", 100, Ani.EXPO_IN_OUT);  
  /* Only for Twenty Four Hrs */

  /* Only for OGC */
  Ani.init(this);

  diameterOneOGC = new Ani(this, 1.0, "OGCCirc1", 42, Ani.EXPO_IN_OUT);
  diameterTwoOGC = new Ani(this, 1.0, "OGCCirc2", 166, Ani.EXPO_IN_OUT);  
  diameterThreeOGC = new Ani(this, 1.0, "OGCCirc3", 415, Ani.EXPO_IN_OUT);

  diameterFourOGC = new Ani(this, 1.0, "OGCCirc1", 41, Ani.EXPO_IN_OUT);
  diameterFiveOGC = new Ani(this, 1.0, "OGCCirc2", 165, Ani.EXPO_IN_OUT);  
  diameterSixOGC = new Ani(this, 1.0, "OGCCirc3", 414, Ani.EXPO_IN_OUT);

  diameterSevenOGC = new Ani(this, 1.0, "OGCCirc1", 40, Ani.EXPO_IN_OUT);
  diameterEightOGC = new Ani(this, 1.0, "OGCCirc2", 164, Ani.EXPO_IN_OUT);  
  diameterNineOGC = new Ani(this, 1.0, "OGCCirc3", 413, Ani.EXPO_IN_OUT);

  diameterTenOGC = new Ani(this, 1.0, "OGCCirc1", 39, Ani.EXPO_IN_OUT);
  diameterElevenOGC = new Ani(this, 1.0, "OGCCirc2", 163, Ani.EXPO_IN_OUT);  
  diameterTwelveOGC = new Ani(this, 1.0, "OGCCirc3", 412, Ani.EXPO_IN_OUT);

  diameterThirteenOGC = new Ani(this, 1.0, "OGCCirc1", 38, Ani.EXPO_IN_OUT);
  diameterFourteenOGC = new Ani(this, 1.0, "OGCCirc2", 162, Ani.EXPO_IN_OUT);  
  diameterFifteenOGC = new Ani(this, 1.0, "OGCCirc3", 411, Ani.EXPO_IN_OUT);

  diameterSixteenOGC = new Ani(this, 1.0, "OGCCirc1", 37, Ani.EXPO_IN_OUT);
  diameterSeventeenOGC = new Ani(this, 1.0, "OGCCirc2", 161, Ani.EXPO_IN_OUT);  
  diameterEighteenOGC = new Ani(this, 1.0, "OGCCirc3", 410, Ani.EXPO_IN_OUT);

  diameterNineteenOGC = new Ani(this, 1.0, "OGCCirc1", 36, Ani.EXPO_IN_OUT);
  diameterTwentyOGC = new Ani(this, 1.0, "OGCCirc2", 160, Ani.EXPO_IN_OUT);  
  diameterTwentyOneOGC = new Ani(this, 1.0, "OGCCirc3", 409, Ani.EXPO_IN_OUT);


  diameterTwentyTwoOGC = new Ani(this, 1.0, "OGCCirc1", 35, Ani.EXPO_IN_OUT);
  diameterTwentyThreeOGC = new Ani(this, 1.0, "OGCCirc2", 159, Ani.EXPO_IN_OUT);  
  diameterTwentyFourOGC = new Ani(this, 1.0, "OGCCirc3", 408, Ani.EXPO_IN_OUT);

  diameterTwentyFiveOGC = new Ani(this, 1.0, "OGCCirc1", 34, Ani.EXPO_IN_OUT);
  diameterTwentySixOGC = new Ani(this, 1.0, "OGCCirc2", 158, Ani.EXPO_IN_OUT);  
  diameterTwentySevenOGC = new Ani(this, 1.0, "OGCCirc3", 407, Ani.EXPO_IN_OUT);

  // 
  diameterTwentyEightOGC = new Ani(this, 1.0, "OGCCirc1", 4, Ani.EXPO_IN_OUT);
  diameterTwentyNineOGC = new Ani(this, 1.0, "OGCCirc2", 128, Ani.EXPO_IN_OUT);
  diameterThirtyOGC = new Ani(this, 1.0, "OGCCirc3", 377, Ani.EXPO_IN_OUT);

  diameterThirtyOneOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT); 
  diameterThirtyTwoOGC = new Ani(this, 1.0, "OGCCirc2", 123, Ani.EXPO_IN_OUT);
  diameterThirtyThreeOGC = new Ani(this, 1.0, "OGCCirc3", 372, Ani.EXPO_IN_OUT);

  diameterThirtyFourOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterThirtyFiveOGC = new Ani(this, 1.0, "OGCCirc2", 118, Ani.EXPO_IN_OUT);
  diameterThirtySixOGC = new Ani(this, 1.0, "OGCCirc3", 367, Ani.EXPO_IN_OUT);

  diameterThirtySevenOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterThirtyEightOGC = new Ani(this, 1.0, "OGCCirc2", 113, Ani.EXPO_IN_OUT);
  diameterThirtyNineOGC = new Ani(this, 1.0, "OGCCirc3", 362, Ani.EXPO_IN_OUT);

  diameterFourtyOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtyOneOGC = new Ani(this, 1.0, "OGCCirc2", 108, Ani.EXPO_IN_OUT);
  diameterFourtyTwoOGC = new Ani(this, 1.0, "OGCCirc3", 357, Ani.EXPO_IN_OUT);

  //
  diameterFourtyThreeOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtyFourOGC = new Ani(this, 1.0, "OGCCirc2", 28, Ani.EXPO_IN_OUT);
  diameterFourtyFiveOGC = new Ani(this, 1.0, "OGCCirc3", 277, Ani.EXPO_IN_OUT);

  diameterFourtySixOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtySevenOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFourtyEightOGC = new Ani(this, 1.0, "OGCCirc3", 227, Ani.EXPO_IN_OUT);

  diameterFourtyNineOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftyOneOGC = new Ani(this, 1.0, "OGCCirc3", 177, Ani.EXPO_IN_OUT);

  diameterFiftyTwoOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyThreeOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftyFourOGC = new Ani(this, 1.0, "OGCCirc3", 127, Ani.EXPO_IN_OUT);

  diameterFiftyFiveOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftySixOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftySevenOGC = new Ani(this, 1.0, "OGCCirc3", 77, Ani.EXPO_IN_OUT);

  diameterFiftyEightOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyNineOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterSixtyOGC = new Ani(this, 1.0, "OGCCirc3", 27, Ani.EXPO_IN_OUT);

  diameterSixtyOneOGC = new Ani(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterSixtyTwoOGC = new Ani(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterSixtyThreeOGC = new Ani(this, 1.0, "OGCCirc3", 1, Ani.EXPO_IN_OUT);
  /* Only for OGC */



  PFont pfont = createFont("Helvetica Neue LT Com 75 Bold", 20, true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 241);

  /* Only for OGC*/
  ControlFont OGCfont = new ControlFont(pfont, 241);
  /* Only for OGC*/

  cp5.addButton("Visualise")
    .setValue(0)
      .setPosition(butPosX, butPosY)
        .setSize(140, 30)
          .setColorBackground(color(154, 205, 50, 200))
            ;

  cp5.addButton("VisualOne")
    .setValue(128)
      .setPosition(410, 200)
        .setImages(visOne)
          .updateSize()
            ;

  cp5.addButton("VisualTwo")
    .setValue(0)
      .setPosition(772, 200)
        .setImages(visTwo)
          .updateSize()
            ;

  cp5.addButton("VisualThree")
    .setValue(0)
      .setPosition(410, 450)
        .setImages(visThree)
          .updateSize()
            ;

  cp5.addButton("VisualFour")
    .setValue(0)
      .setPosition(772, 450)
        .setImages(visFour)
          .updateSize()
            ;   

  cp5.addButton("VisualFive")
    .setValue(0)
      .setPosition(572, 450)
        .setImages(visFive)
          .updateSize()
            ;

  cp5.addButton("VisualSix")
    .setValue(0)
      .setPosition(935, 450)
        .setImages(visSix)
          .updateSize()
            ;

  cp5.addButton("Back")
    .setValue(0)
      .setPosition(1275, 70)
        .setSize(85, 30)
          .setColorBackground(color(154, 205, 50, 200))
            ;

  cp5.addButton("Next")
    .setValue(0)
      .setPosition(1275, 630)
        .setSize(85, 30)
          .setColorBackground(color(100))
            ;

  cp5.addButton("Previous")
    .setValue(0)
      .setPosition(0, 630)
        .setSize(130, 30)
          .setColorBackground(color(100))
            ;

  cp5.addButton("Sources")
    .setValue(0)
      .setPosition(0, 630)
        .setSize(130, 30)
          .setColorBackground(color(100))
            ;


  // OGC Buttons
  cp5.addButton("2012")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;

  cp5.addButton("2013")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2014")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 2)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;

  cp5.addButton("2015")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 3)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2016")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 4)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2017")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 5)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;     

  cp5.addButton("2018")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 6)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2019")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 7)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2020")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 8)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;  

  cp5.addButton("2050")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 13 - 9)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ;      

  cp5.addButton("2055")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 14 - 9)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2060")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 15 - 9)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2065")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 16 - 9)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2070")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 17 - 9)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2150")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 21)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2200")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 22)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2250")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 23)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2300")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 24)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2350")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 25)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2400")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 26)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  cp5.addButton("2427")
    .setValue(0)
      .setPosition(OGCtextX, OGCtextY + OGCtextYvar * 27)
        .setSize(50, OGCSelecter)
          .setColorBackground(color(255))
            ; 
  // OGC Buttons  

  visualiseBut = new MyControlListener(); 
  visOneBut = new MyControlListenerTwo(); 
  visTwoBut = new MyControlListenerThree(); 
  visThreeBut = new MyControlListenerFour(); 
  visFourBut = new MyControlListenerFive(); 
  visFiveBut = new MyControlListenerSix(); 
  visSixBut = new MyControlListenerSeven(); 

  backBut = new MyControlListenerEight(); 
  Next = new MyControlListenerNext(); 
  Previous = new MyControlListenerPrevious(); 
  Sources = new MyControlListenerSources(); 


  But2012 = new MyControlListenerNine();
  But2013 = new MyControlListenerTen();
  But2014 = new MyControlListenerEleven();
  But2015 = new MyControlListenerTwelve();
  But2016 = new MyControlListenerThirteen();
  But2017 = new MyControlListenerFourteen();
  But2018 = new MyControlListenerFifteen();
  But2019 = new MyControlListenerSixteen();
  But2020 = new MyControlListenerSeventeen();

  But2050  = new  MyControlListenerEighteen(); 
  But2055  = new  MyControlListenerNineteen();
  But2060  = new  MyControlListenerTwenty(); 
  But2065  = new  MyControlListenerTwentyOne(); 
  But2070  = new  MyControlListenerTwentyTwo(); 

  But2150  = new  MyControlListenerTwentyThree(); 
  But2200  = new  MyControlListenerTwentyFour(); 
  But2250  = new  MyControlListenerTwentyFive(); 
  But2300  = new  MyControlListenerTwentySix(); 
  But2350  = new  MyControlListenerTwentySeven(); 
  But2400  = new  MyControlListenerTwentyEight(); 
  But2427  = new  MyControlListenerTwentyNine(); 



  cp5.getController("Visualise")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;


  cp5.getController("VisualOne")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;     

  cp5.getController("VisualTwo")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;


  cp5.getController("VisualThree")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("VisualFour")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("VisualFive")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("VisualSix")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;


  cp5.getController("Back")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("Next")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("Previous")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;

  cp5.getController("Sources")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(27)
            ;
            

  cp5.getController("2012")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2013")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2014")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2015")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2016")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2017")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2018")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2019")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2020")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2050")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2055")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2060")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;   

  cp5.getController("2065")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2070")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2150")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2200")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2250")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2300")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2350")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2400")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;

  cp5.getController("2427")
    .getCaptionLabel()
      .setFont(OGCfont)
        .toUpperCase(false)
          .setColor(color(0))
            .setSize(15)
              ;




  cp5.getController("Visualise")
    .addListener(visualiseBut);

  cp5.getController("VisualOne")
    .addListener(visOneBut);

  cp5.getController("VisualTwo")
    .addListener(visTwoBut);

  cp5.getController("VisualThree")
    .addListener(visThreeBut);

  cp5.getController("VisualFour")
    .addListener(visFourBut);     

  cp5.getController("VisualFive")
    .addListener(visFiveBut);

  cp5.getController("VisualSix")
    .addListener(visSixBut);



  cp5.getController("Back")
    .addListener(backBut);     

  cp5.getController("Next")
    .addListener(Next);     

  cp5.getController("Previous")
    .addListener(Previous);     
    
  cp5.getController("Sources")
    .addListener(Sources);    



  cp5.getController("2012")
    .addListener(But2012);

  cp5.getController("2013")
    .addListener(But2013);

  cp5.getController("2014")
    .addListener(But2014);

  cp5.getController("2015")
    .addListener(But2015);

  cp5.getController("2016")
    .addListener(But2016);

  cp5.getController("2017")
    .addListener(But2017);

  cp5.getController("2018")
    .addListener(But2018);

  cp5.getController("2019")
    .addListener(But2019);

  cp5.getController("2020")
    .addListener(But2020);

  cp5.getController("2050")
    .addListener(But2050);

  cp5.getController("2055")
    .addListener(But2055);

  cp5.getController("2060")
    .addListener(But2060);

  cp5.getController("2065")
    .addListener(But2065);

  cp5.getController("2070")
    .addListener(But2070);

  cp5.getController("2150")
    .addListener(But2150);

  cp5.getController("2200")
    .addListener(But2200);

  cp5.getController("2250")
    .addListener(But2250);

  cp5.getController("2300")
    .addListener(But2300);

  cp5.getController("2350")
    .addListener(But2350);

  cp5.getController("2400")
    .addListener(But2400);

  cp5.getController("2427")
    .addListener(But2427);
}


public void draw() {



  
  
  count = count + 1;

  if (count == 1) {
    StartScreenFunction();
    image(logo,1292.5,12.5);
  }

  if (VisualCount >= 1) {
    Visual();
    image(logo,1292.5,12.5);
  }

  if (CO2BusCount >= 1) {
    startCO2Bus();
    image(logo,1292.5,12.5);
  }

  if (iPadCount >= 1) {
    startIpadCO2();
    image(logo,1292.5,12.5);
  }

  if (OGCCount >= 1) {
    showOGCText();
    image(logo,1292.5,12.5);
    OGCCount = OGCCount + 1;
  }

  if (OGCCount == 30) {
    OGCAniOne();
  }

  if (OGCCount >= 30) {
    startOGC();
    image(logo,1292.5,12.5);
  }


  if (TwentyFourcount >= 1) {
    startTwentyFour();
    image(logo,1292.5,12.5);
  }
}

class MyControlListener implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {
    println("the button was clicked");

    VisualCount = 0;

    background(255);
    Visual();

    VisualCount = VisualCount = + 1;

    cp5.getController("Next").hide();
    cp5.getController("Previous").hide();
    cp5.getController("Sources").hide();
     
    }
}

class MyControlListenerTwo implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 1st button was clicked");
    background(255);

    OGCCount = 0;
    OGCCount = OGCCount + 1;

    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();

    cp5.getController("Back").show();
    cp5.getController("Next").show();
    cp5.getController("Sources").hide();

    cp5.getController("2012").show(); 
    cp5.getController("2013").show();
    cp5.getController("2014").show();
    cp5.getController("2015").show();
    cp5.getController("2016").show();
    cp5.getController("2017").show();
    cp5.getController("2018").show();
    cp5.getController("2019").show();
    cp5.getController("2020").show();
    cp5.getController("2050").show();
    cp5.getController("2055").show();
    cp5.getController("2060").show();
    cp5.getController("2065").show();
    cp5.getController("2070").show();
    cp5.getController("2150").show();
    cp5.getController("2200").show();
    cp5.getController("2250").show();
    cp5.getController("2300").show();
    cp5.getController("2350").show();
    cp5.getController("2400").show();
    cp5.getController("2427").show();


    VisualCount = 0;
  }
}

class MyControlListenerThree implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 2nd button was clicked");
    background(255);

    TwentyFourcount = TwentyFourcount + 1;

    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();

    cp5.getController("Back").show();
    cp5.getController("Next").show();
    cp5.getController("Previous").show();
    
    cp5.getController("Sources").hide();

    TwentyFourTransP = 0;
    TwentyFourP2 = 0;
    TwentyFourP3 = 0;

    VisualCount = 0;
  }
}

class MyControlListenerFour implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 3rd button was clicked");
    println("the 4th button was clicked");

    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();

    cp5.getController("Next").show();
    cp5.getController("Previous").show();
    cp5.getController("Back").show();
    
    cp5.getController("Sources").hide();

    iPadCount = iPadCount +1;

    // resets transparency values to 0 so that everything is redrawn. 
    iPadTransP = 0;
    iPadTransP2 = 0;
    iPadTransP3 = 0;
    iPadTransP4 = 0;

    VisualCount = 0;
  }
}

class MyControlListenerFive implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 6th button was clicked");

    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();


    cp5.getController("Previous").show();
    cp5.getController("Back").show();
    
    cp5.getController("Sources").hide();

    CO2BusCount = CO2BusCount +1;

    // resets transparency values to 0 so that everything is redrawn. 
    transP = 0;
    transP2 = 0;
    transP3 = 0;
    transP4 = 0;
    transP5 = 0;
    transP6 = 0;

    VisualCount = 0;
  }
}

class MyControlListenerSix implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 5th button was clicked");
  }
}

class MyControlListenerSeven implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    println("the 6th button was clicked");
  }
}

// Back button for all visualisations.
class MyControlListenerEight implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {
    println("the 7th button was clicked");

    background(255);

    // reset counts to '0' so that the functions are not called.
    CO2BusCount = 0;
    iPadCount =  0;
    OGCCount = 0;
    TwentyFourcount = 0;
    VisualCount = 0;



    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    theYearis = "2012";

    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();

    cp5.getController("2012").hide();
    cp5.getController("2013").hide();
    cp5.getController("2014").hide();
    cp5.getController("2015").hide();
    cp5.getController("2016").hide();
    cp5.getController("2017").hide();
    cp5.getController("2018").hide();
    cp5.getController("2019").hide();
    cp5.getController("2020").hide();
    cp5.getController("2050").hide();
    cp5.getController("2055").hide();
    cp5.getController("2060").hide();
    cp5.getController("2065").hide();
    cp5.getController("2070").hide();
    cp5.getController("2150").hide();
    cp5.getController("2200").hide();
    cp5.getController("2250").hide();
    cp5.getController("2300").hide();
    cp5.getController("2350").hide();
    cp5.getController("2400").hide();
    cp5.getController("2427").hide();

    cp5.getController("Back").hide();
    cp5.getController("Next").hide();
    cp5.getController("Previous").hide();
    
    cp5.getController("Sources").hide();

    Visual();

    stopPlay18();

    rewindPlay2();  
    rewindPlay3();  
    rewindPlay4();  
    rewindPlay5();  
    rewindPlay6();  
    rewindPlay7();  
    rewindPlay8();  
    rewindPlay9();  
    rewindPlay10();  
    rewindPlay11();  
    rewindPlay12();  
    rewindPlay13();  
    rewindPlay14();  
    rewindPlay15();  
    rewindPlay16();  
    rewindPlay17();  
    rewindPlay18();  
    rewindPlay19();  
    rewindPlay20();  
    rewindPlay21();  
    rewindPlay22();  
    rewindPlay23();  
    rewindPlay24();
  }
}

class MyControlListenerNext implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    if (OGCCount >= 1) {

      cp5.getController("2012").hide();
      cp5.getController("2013").hide();
      cp5.getController("2014").hide();
      cp5.getController("2015").hide();
      cp5.getController("2016").hide();
      cp5.getController("2017").hide();
      cp5.getController("2018").hide();
      cp5.getController("2019").hide();
      cp5.getController("2020").hide();
      cp5.getController("2050").hide();
      cp5.getController("2055").hide();
      cp5.getController("2060").hide();
      cp5.getController("2065").hide();
      cp5.getController("2070").hide();
      cp5.getController("2150").hide();
      cp5.getController("2200").hide();
      cp5.getController("2250").hide();
      cp5.getController("2300").hide();
      cp5.getController("2350").hide();
      cp5.getController("2400").hide();
      cp5.getController("2427").hide();

      cp5.getController("Previous").show();

      stopPlay18();
      rewindPlay18();
      
      TwentyFourTransP = 0;
      TwentyFourP2 = 0;
      TwentyFourP3 = 0;
      TwentyFourP4 = 0;
      
      startTwentyFour();
      OGCCount = 0;
    }

    if (TwentyFourcount >= 2) {
      background(255);
      cp5.getController("Previous").show();
      iPadTransP = 0;
      iPadTransP2 = 0;
      iPadTransP3 = 0;
      iPadTransP4 = 0;
      startIpadCO2();
       TwentyFourcount = 0;
    }

    if (iPadCount >= 2) {
      background(255);
      cp5.getController("Previous").show();
      transP = 0;
      transP2 = 0;
      transP3 = 0;
      transP4 = 0;
      startCO2Bus();
      iPadCount = 0;
      cp5.getController("Next").hide();
    }
  }
}

class MyControlListenerPrevious implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    if (TwentyFourcount >= 2) {
      background(255);

      cp5.getController("2012").show(); 
      cp5.getController("2013").show();
      cp5.getController("2014").show();
      cp5.getController("2015").show();
      cp5.getController("2016").show();
      cp5.getController("2017").show();
      cp5.getController("2018").show();
      cp5.getController("2019").show();
      cp5.getController("2020").show();
      cp5.getController("2050").show();
      cp5.getController("2055").show();
      cp5.getController("2060").show();
      cp5.getController("2065").show();
      cp5.getController("2070").show();
      cp5.getController("2150").show();
      cp5.getController("2200").show();
      cp5.getController("2250").show();
      cp5.getController("2300").show();
      cp5.getController("2350").show();
      cp5.getController("2400").show();
      cp5.getController("2427").show();

      cp5.getController("Next").show();
      cp5.getController("Previous").hide();
      cp5.getController("Sources").hide();
      
      startOGC();
      TwentyFourcount = 0;
    }

    if (iPadCount >= 2) {
      cp5.getController("Next").show();
      background(255);
      TwentyFourTransP = 0;
      TwentyFourP2 = 0;
      TwentyFourP3 = 0;
      TwentyFourP4 = 0;

      startTwentyFour();
      iPadCount = 0;
    }

    if (CO2BusCount >= 2) {
      background(255);
      cp5.getController("Previous").show();
      iPadTransP = 0;
      iPadTransP2 = 0;
      iPadTransP3 = 0;
      iPadTransP4 = 0;
      startIpadCO2();
      CO2BusCount = 0;
      cp5.getController("Next").show();
    }
  }
}



// Sources button for 
class MyControlListenerSources implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {
    println("the Sources button was clicked");
    background(255);
    
    CO2BusCount = 0;
    iPadCount =  0;
    OGCCount = 0;
    TwentyFourcount = 0;
    VisualCount = 0;
    
    
    
    Sources();
    
    
    
    cp5.getController("Back").show();

    cp5.getController("Sources").hide();
    cp5.getController("VisualOne").hide();
    cp5.getController("VisualTwo").hide();
    cp5.getController("VisualThree").hide();
    cp5.getController("VisualFour").hide();
    cp5.getController("VisualFive").hide();
    cp5.getController("VisualSix").hide();

  }
}



class MyControlListenerNine implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    OGCAniOne();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2012";
  }
}

class MyControlListenerTen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    OGCAniTwo();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365;
    gasDay = gasDay - 365;
    coalDay = coalDay - 365;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();

    theYearis = "2013";
  }
}

class MyControlListenerEleven implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");


    OGCAniThree();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 2;
    gasDay = gasDay - 365 * 2;
    coalDay = coalDay - 365 * 2;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();


    theYearis = "2014";
  }
}

class MyControlListenerTwelve implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");


    OGCAniFour();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 3;
    gasDay = gasDay - 365 * 3;
    coalDay = coalDay - 365 * 3;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();


    theYearis = "2015";
  }
}

class MyControlListenerThirteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniFive();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 4;
    gasDay = gasDay - 365 * 4;
    coalDay = coalDay - 365 * 4;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2016";
  }
}

class MyControlListenerFourteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    OGCAniSix();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 5;
    gasDay = gasDay - 365 * 5;
    coalDay = coalDay - 365 * 5;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();

    theYearis = "2017";
  }
}

class MyControlListenerFifteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    OGCAniSeven();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 6;
    gasDay = gasDay - 365 * 6;
    coalDay = coalDay - 365 * 6;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2018";
  }
}

class MyControlListenerSixteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    OGCAniEight();


    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 7;
    gasDay = gasDay - 365 * 7;
    coalDay = coalDay - 365 * 7;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);



    startOGC();
    showOGCText();

    theYearis = "2019";
  }
}

class MyControlListenerSeventeen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniNine();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 8;
    gasDay = gasDay - 365 * 8;
    coalDay = coalDay - 365 * 8;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2020";
  }
}

class MyControlListenerEighteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniTen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - (365 * 38);
    gasDay = gasDay - 365 * 38;
    coalDay = coalDay - 365 * 38;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();

    theYearis = "2050";
  }
}

class MyControlListenerNineteen implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniEleven();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 43;
    gasDay = gasDay - 365 * 43;
    coalDay = coalDay - 365 * 43;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);


    startOGC();
    showOGCText();

    theYearis = "2055";
  }
}

class MyControlListenerTwenty implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniTwelve();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 48;
    gasDay = gasDay - 365 * 48;
    coalDay = coalDay - 365 * 48;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);    

    startOGC();
    showOGCText();

    theYearis = "2060";
  }
}

class MyControlListenerTwentyOne implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniThirteen();


    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 53;
    gasDay = gasDay - 365 * 53;
    coalDay = coalDay - 365 * 53;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2065";
  }
}

class MyControlListenerTwentyTwo implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniFourteen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 58;
    gasDay = gasDay - 365 * 58;
    coalDay = coalDay - 365 * 58;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2070";
  }
}

class MyControlListenerTwentyThree implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniFifteen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 138;
    gasDay = gasDay - 365 * 138;
    coalDay = coalDay - 365 * 138;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2150";
  }
}

class MyControlListenerTwentyFour implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniSixteen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 188;
    gasDay = gasDay - 365 * 188;
    coalDay = coalDay - 365 * 188;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);  

    startOGC();
    showOGCText();

    theYearis = "2200";
  }
}

class MyControlListenerTwentyFive implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniSeventeen();


    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 238;
    gasDay = gasDay - 365 * 238;
    coalDay = coalDay - 365 * 238;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2250";
  }
}

class MyControlListenerTwentySix implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniEighteen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 288;
    gasDay = gasDay - 365 * 288;
    coalDay = coalDay - 365 * 288;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2300";
  }
}

class MyControlListenerTwentySeven implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniNineteen();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 338;
    gasDay = gasDay - 365 * 338;
    coalDay = coalDay - 365 * 338;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2350";
  }
}

class MyControlListenerTwentyEight implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniTwenty();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 388;
    gasDay = gasDay - 365 * 388;
    coalDay = coalDay - 365 * 388;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2400";
  }
}

class MyControlListenerTwentyNine implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {

    background(255);
    println("the button was clicked");

    background(255);
    OGCAniTwentyOne();

    oilDay = 15165;
    gasDay = 60591;
    coalDay = 151762;

    oilDay = oilDay - 365 * 415;
    gasDay = gasDay - 365 * 415;
    coalDay = coalDay - 365 * 415;

    oilLeft = oilDay / 365;
    gasLeft = gasDay / 365;
    coalLeft = coalDay / 365;

    dat1 = oilLeft * 17;
    dat2 = gasLeft * 17;
    dat3 = coalLeft * 17;

    daysOfOil = str(oilLeft);
    daysOfGas = str(gasLeft);
    daysOfCoal = str(coalLeft);

    startOGC();
    showOGCText();

    theYearis = "2427";
  }
}


public void StartScreenFunction() {

  cp5.getController("VisualOne").hide();
  cp5.getController("VisualTwo").hide();
  cp5.getController("VisualThree").hide();
  cp5.getController("VisualFour").hide();
  cp5.getController("VisualFive").hide();
  cp5.getController("VisualSix").hide();

  cp5.getController("Back").hide();
  cp5.getController("Next").hide();
  cp5.getController("Previous").hide();
  cp5.getController("Sources").hide();

  cp5.getController("2012").hide();
  cp5.getController("2013").hide();
  cp5.getController("2014").hide();
  cp5.getController("2015").hide();
  cp5.getController("2016").hide();
  cp5.getController("2017").hide();
  cp5.getController("2018").hide();
  cp5.getController("2019").hide();
  cp5.getController("2020").hide();
  cp5.getController("2050").hide();
  cp5.getController("2055").hide();
  cp5.getController("2060").hide();
  cp5.getController("2065").hide();
  cp5.getController("2070").hide();
  cp5.getController("2150").hide();
  cp5.getController("2200").hide();
  cp5.getController("2250").hide();
  cp5.getController("2300").hide();
  cp5.getController("2350").hide();
  cp5.getController("2400").hide();
  cp5.getController("2427").hide();

  background(255);  

  textFont(header, 150);
  fill(100);
  text("Visualeyes", 10, 125);

  textFont(main, 40);
  fill(0);
  text("An Interactive application created by final year", 10, 250);
  text("Digital Art & Technology Student,", 10, 300);
  text("Christopher Dalton.", 10, 350);

  text("The idea behind Visualeyes is to open our eyes", 10, 450);
  text("to the technological world we live in and let", 10, 500);
  text("us understand the damage we are causing, although", 10, 550);
  text("the effects may not always be physically explicit.", 10, 600);
}

public void Visualise(int theValue) {
}

public void Visual() {

  background(255);

  VisualCount = 0;

  textFont(header, 150);
  fill(100);
  text("Infographics", 10, 125);

  textFont(header, 20);
  fill(0);
  text("Oil, Gas & Coal", 430, 415);
  text("Twenty Four Hours", 777.5, 415);
  text("iPad Emissions", 430, 665);
  text("Business", 825, 665);
  
  /* titles for next two visuals
  text("Amasd Chewvactu", 577, 665);
  text("Lorem Timsasd", 959, 665);
  */



  tint(255, 255);

  cp5.getController("Visualise").hide();
  cp5.getController("VisualOne").show();
  cp5.getController("VisualTwo").show();
  cp5.getController("VisualThree").show();
  cp5.getController("VisualFour").show();
  
  /* ready to add another 2 visuals
  cp5.getController("VisualFive").hide();
  cp5.getController("VisualSix").hide();
  */


  cp5.getController("Back").hide();
  cp5.getController("Sources").show();

  VisualCount = VisualCount + 1;
}




public void Sources(){
  background(255);
  
  image(logo,1292.5,12.5);
  
  textFont(header, 150);
  fill(100);
  text("Sources", 10, 125);
    
  textFont(buttons, 30);
  text("Oil, Gas & Coal", 25, 250);
  text("Twenty Four Hours", 750, 250);
  text("iPad Emissions", 25, 450);
  text("Business", 750, 450);
  
  
  textFont(buttons, 15);
  //Oil, Gas & Coal
  text("Worldometers - bit.ly/zwOVF", 25, 280);
  
  //Twenty Four Hours
  text("Rolf Kerstens Weblog - bit.ly/L0tCFa", 750, 280);
  text("CO2e Emissions (Google Spreadsheet) - bit.ly/KcQ0Zi", 750, 300);
  text("Fat Knowledge - bit.ly/KMq23t", 750, 320);
  text("Worldometers - bit.ly/zwOVF", 750, 340);
  text("Tech Crunch - tcrn.ch/Lw6TjD", 750, 360);
  text("Land Rover - bit.ly/MycB9E ", 750, 380);
  text("Fast Company - bit.ly/a9fete", 750, 400);
  
      
  //iPad Emissions
  text("Apple - bit.ly/FQkHEN", 25, 480);
  text("Apple - bit.ly/L25NKC", 25, 500);
  text("CO2e Emissions (Google Spreadsheet) - bit.ly/KcQ0Zi", 25, 520);
  text("Offset my iPad - bit.ly/LlPkVp", 25, 540);
  
  
  //Business
  text("Climate Savers - bit.ly/Mygc7I", 750, 480);
  text("CO2e Emissions (Google Spreadsheet) - bit.ly/KcQ0Zi", 750, 500);
  text("Oxfam - bit.ly/ITShKn", 750, 520);
  text("BBC - bbc.in/KBrXcg", 750, 540);
  
}















/* CO2 in Business */

public void startCO2Bus() {

  background(255);
  CO2BusCount = CO2BusCount +1;

  if (CO2BusCount >= 2) {
    showText();
  }

  if (CO2BusCount == 30) {
    CO2BusAniOne();
  }

  if (CO2BusCount >= 30) {
    animate();
  }


  if (CO2BusCount >=60) {
    CO2BusCircTitles();
  }


  if (CO2BusCount >=90) {
    CO2BusOtherCircles();
  }

  if (transP2 >= 255) {
    CO2BusInfoPoints();
  }

  if (CO2BusCount >= 45) {
    transP = transP + 5;
  }

  if (CO2BusCount >= 75) {
    transP2 = transP2 + 5;
  }

  if (CO2BusCount >= 100) {
    transP3 = transP3 + 5;
  }

  if (transP3 >= 200) {
    CO2Key();
  }

  if (mouseX > 625-100 && mouseX < 625+100 && 
    mouseY > 400-100 && mouseY < 400+100 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[0] = color(0);
    }
  }
  else {
    c1[0] = color(99, 184, 255);
  }


  if (mouseX > 720-70 && mouseX < 720+70&& 
    mouseY > 280-70 && mouseY < 280+70 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[1] = color(0);
    }
  }
  else {
    c1[1] = color(106, 90, 205);
  }


  if (mouseX > 805-50&& mouseX < 805+50 && 
    mouseY > 220-50 && mouseY < 220+50 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[2] = color(0);
    }
  }
  else {
    c1[2] = color(54, 100, 139);
  }


  if (mouseX > 420-50 && mouseX < 420+50 && 
    mouseY > 330-50 && mouseY < 330+50 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[4] = color(0);
    }
  }
  else {
    c1[4] = color(180, 55, 79);
  }


  if (mouseX > 510-50 && mouseX < 510+50 && 
    mouseY > 345-50 && mouseY < 345+50 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[3] = color(0);
    }
  }
  else {
    c1[3] = color(0, 205, 102);
  }



  if (mouseX > 518-7 && mouseX < 518+7 && 
    mouseY > 286-7 && mouseY < 286+7 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      
      player10.play();
    }
  }
  else {
    stopPlay10();
  }

  if (mouseX > 376-7 && mouseX < 376+7 && 
    mouseY > 370-7 && mouseY < 370+7 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(376, 370, 400, 125, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("The same amount of CO2 would", 382, 394);
      text("be emitted from 10,379 hours", 382, 434);
      text("talking on a mobile phone.", 382, 474); 
      player11.play();
    }
  }
  else {
    stopPlay11();
  }

  if (mouseX > 768-7 && mouseX < 768+7 && 
    mouseY > 215-7 && mouseY < 215+7 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(768, 215, 400, 200, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("With £115 million you could buy", 776, 239);
      text("4.6 million goats for third", 776, 279);
      text("world countries these goats", 776, 319);
      text("provide milk to drink & sell", 776, 359);
      text("as well as fertiliser.", 776, 399);
      player12.play();
    }
  }
  else {
    stopPlay12();
  }

  if (mouseX > 810-7 && mouseX < 810+7 && 
    mouseY > 280-7 && mouseY < 280+7 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(810, 280, 400, 160, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("If all 4x4s sold in the UK last", 818, 304);
      text("year were to travel 10 kilometers", 818, 344);
      text("they could emit the same", 818, 384);
      text("amount of CO2.", 818, 424);
      player13.play();
    }
  }
  else {
    stopPlay13();
  }

  if (mouseX > 360-12 && mouseX < 360+12 && 
    mouseY > 272-12 && mouseY < 272+12 && transP3 >= 255) {
    bover = true;  
    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(360, 272, 400, 330, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("Since 2006, the department for", 368, 296); 
      text("Children, Schools and families", 368, 336);
      text("has been turning off their", 368, 376); 
      text("computers over night and at", 368, 416);
      text("weekends and has saved over", 368, 456); 
      text("53,000 Kilowatts of electricty", 368, 496); 
      text("resulting in the omission of", 368, 536); 
      text("over 35,000 kilos of CO2.", 368, 576); 
      player14.play();
    }
  }
  else {
    stopPlay14();
  }

  if (mouseX > 900-12 && mouseX < 900+12 && 
    mouseY > 285-12 && mouseY < 285+12 && transP3 >= 255 && transP5 >=255) {
    bover = true;  
    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(500, 285, 400, 80, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("This wastes 4,753 tonnes of", 508, 309); 
      text("CO2 every year.", 508, 349);
      player15.play(); 
      transP6 = transP6 + 5;
    }
  }
  else {
    stopPlay15();
  }

  if (mouseX > 900-12 && mouseX < 900+12 && 
    mouseY > 370-12 && mouseY < 370+12 && transP3 >= 255 && transP4 >= 255) {
    bover = true;  
    if (!locked) {
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(500, 370, 400, 40, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("Costing £115 million per year.", 508, 394); 
      player16.play(); 
      transP5 = transP5 + 5;
    }
  }
  else {
    stopPlay16();
  }

  if (mouseX > 900-12 && mouseX < 900+12 && 
    mouseY > 499-12 && mouseY < 499+12 && transP3 >= 255) {
    bover = true;  
    if (!locked) {
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(500, 499, 400, 160, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("One in 6 businesses in the UK", 508, 523); 
      text("does not turn their computers", 508, 563);
      text("off at night or over the", 508, 603); 
      text("weekend.", 508, 643); 
      player17.play(); 

      transP4 = transP4 + 5;
    }
  }
  else {
    stopPlay17();
  }
}





public void showText() {

  noStroke();  
  // heading
  fill(0);
  rect(0, 25, 410, 40);
  fill(255);
  textFont(buttons, 37);
  text("Infographic Number 4.", 10, 57); 

  // sub heading  
  fill(255, 64, 64);
  rect(0, 70, 255, 30);
  textFont(buttons, 27);
  fill(255); 
  text("CO2 in Business...", 10, 94);
}

public void animate() {


  // Main Circles  
  stroke(0);
  strokeWeight(2);
  fill(c1[4]);
  ellipse(420, 330, circ3, circ3);

  fill(c1[3]);
  ellipse(510, 345, circ3, circ3);

  fill(c1[0]);
  ellipse(625, 400, circ1, circ1);

  fill(c1[2]);
  ellipse(805, 220, circ3, circ3);

  fill(c1[1]);
  ellipse(720, 280, circ2, circ2);
}

public void CO2BusCircTitles() {

  // circle titles
  textFont(buttons, 20);
  fill(255, 255, 255, transP); 
  text("1 in 6", 600, 405);

  textFont(buttons, 20);
  text("35,290", 375, 340);
  text("53,960", 460, 350);
  text("£115m", 690, 290);
  text("4,753", 795, 230);

  textFont(buttons, 10);
  text("Tonnes of", 795, 240);
  text("CO2", 795, 248.5);    
  text("KG's of CO2", 375, 350);   
  text("Kilowatts", 460, 360);
}


public void CO2BusOtherCircles() {

  // Sub circles
  fill(255, 255, 255, transP2);
  stroke (0, 0, 0, 200);
  strokeWeight(3);
  ellipse(518, 286, 7, 7);
  ellipse(376, 370, 7, 7);
  ellipse(768, 215, 7, 7);
  ellipse(810, 280, 7, 7);    


  // Leading circles
  int sizeXY = 5;

  fill(238, 201, 0, transP2);
  noStroke();

  // 1 in 6
  ellipse(700, 500, sizeXY, sizeXY);
  ellipse(730, 500, sizeXY, sizeXY);
  ellipse(760, 500, sizeXY, sizeXY);
  ellipse(790, 500, sizeXY, sizeXY);
  ellipse(820, 500, sizeXY, sizeXY);
  ellipse(850, 500, sizeXY, sizeXY);
  ellipse(880, 500, sizeXY, sizeXY);


  // £115m
  fill(238, 201, 0, transP4);
  ellipse(760, 370, sizeXY, sizeXY);
  ellipse(790, 370, sizeXY, sizeXY);
  ellipse(820, 370, sizeXY, sizeXY);
  ellipse(850, 370, sizeXY, sizeXY);
  ellipse(880, 370, sizeXY, sizeXY);


  // 4,753
  fill(238, 201, 0, transP5);
  ellipse(850, 285, sizeXY, sizeXY);
  ellipse(880, 285, sizeXY, sizeXY);
}

public void CO2BusInfoPoints() {

  // information points.    
  textFont(information, 20);

  // 35,290 & 53,960
  fill(0, 0, 0, transP6);
  ellipse(360, 272, 20, 20);
  fill(255, 255, 255, transP6);
  text("i", 357, 278);

  // 4,753
  fill(0, 0, 0, transP5);
  ellipse(900, 285, 20, 20);
  fill(255, 255, 255, transP5);
  text("i", 897, 291);

  // £115m
  fill(0, 0, 0, transP4);
  ellipse(900, 370, 20, 20);
  fill(255, 255, 255, transP4);
  text("i", 897, 376);

  // 1 in 6
  fill(0, 0, 0, transP3);
  ellipse(900, 499, 20, 20);
  fill(255, 255, 255, transP3);
  text("i", 897, 505);
}

public void CO2Key() {

  noStroke();
  fill (0);

  // Rectangle for key
  fill(255);
  rect(940, 230, 350, 350);

  // lines for effect on rectangle key
  stroke(245);
  strokeWeight(10);
  line(960, 230, 940, 250); 
  line(980, 230, 940, 270); 
  line(1000, 230, 940, 290); 
  line(1020, 230, 940, 310); 
  line(1040, 230, 940, 330); 
  line(1060, 230, 940, 350); 
  line(1080, 230, 940, 370); 
  line(1100, 230, 940, 390); 
  line(1120, 230, 940, 410); 
  line(1140, 230, 940, 430); 
  line(1160, 230, 940, 450); 
  line(1180, 230, 940, 470); 
  line(1200, 230, 940, 490); 
  line(1220, 230, 940, 510); 
  line(1240, 230, 940, 530); 
  line(1260, 230, 940, 550);
  line(1280, 230, 940, 570);
  line(1290, 240, 950, 580);
  line(1290, 260, 970, 580);
  line(1290, 280, 990, 580);
  line(1290, 300, 1010, 580);
  line(1290, 320, 1030, 580);
  line(1290, 340, 1050, 580);
  line(1290, 360, 1070, 580);
  line(1290, 380, 1090, 580);
  line(1290, 400, 1110, 580);
  line(1290, 420, 1130, 580);
  line(1290, 440, 1150, 580);
  line(1290, 460, 1170, 580);
  line(1290, 480, 1190, 580);
  line(1290, 500, 1210, 580);
  line(1290, 520, 1230, 580);
  line(1290, 540, 1250, 580);
  line(1290, 560, 1270, 580);

  // Content title
  textFont(buttons, 20);    
  fill(120);
  text("Carbon dixoide emissions in", 30, 220);
  text("the business world", 30, 240);

  // Content
  textFont(buttons, 15);    
  text("This infographic shows that by turning off", 30, 270);
  text("computers, businesses & families can save", 30, 290);
  text("money. ", 30, 310);
  text("In a time when money is tight due to the", 30, 350);
  text("recession, the world looks for new ways to", 30, 370);
  text("scrap and save every penny it can.", 30, 390);
  text("By turning of computers and laptops", 30, 410);
  text("We can not only save money but help towards", 30, 430);
  text("saving our world. Some experts say it is too", 30, 450);
  text("late to correct the damage we have inflicted", 30, 470);
  text("on the planet but, if we don't try, we will", 30, 490);
  text("never know.", 30, 510);


  // Business's in UK
  fill(c1[0]);
  textFont(buttons, 28);
  text("Business's in the UK", textFiveX, 260);

  // Wasted in Electricity
  fill(c1[1]);
  textFont(buttons, 28);
  text("Wasted on Electricity", textFiveX, 300);

  // Wasted at night & w/end
  fill(c1[2]);
  textFont(buttons, 28);
  text("Wasted at night & w/end", textFiveX, 340);

  // Saved since 2006 
  fill(c1[3]);
  textFont(buttons, 28);
  text("Saved since 2006", textFiveX, 380);

  // Not emmited since 2006
  fill(c1[4]);
  textFont(buttons, 28);
  text("Not emitted since 2006", textFiveX, 420);
}  

public void CO2BusAniOne() {
  Ani.to(this, 1.0, "circ1", 210, Ani.EXPO_IN_OUT);
  diameterOne.start();

  Ani.to(this, 1.0, "circ2", 160, Ani.EXPO_IN_OUT);
  diameterTwo.start();

  Ani.to(this, 1.0, "circ3", 120, Ani.EXPO_IN_OUT);
  diameterThree.start();
}
/* CO2 in Business */











/* ipad CO2 */

public void startIpadCO2() {

  background(255);
  iPadCount = iPadCount + 1;

  if (iPadCount >= 2) {
    showIpadText();
  }

  if (iPadTransP4 >= 255) {
    showIpadKey();
  }

  if (iPadCount == 30) {
    iPadAniOne();
  }

  if (iPadCount >= 30) {
    animateIpadCircs();
  }

  if (iPadCount >= 60) {
    iPadTransP = iPadTransP + 5;
    iPadTitles();
  }

  if (iPadTransP >= 200) {
    iPadTransP2 = iPadTransP2 + 5;
    animateIpadLines();
  }

  if (iPadTransP2 >= 200) {
    iPadTransP3 = iPadTransP3 + 5;    
    iPadOtherCircles();
  }

  if (iPadTransP3 >= 200) {
    iPadTransP4 = iPadTransP4 + 5;
    iPadInfoPoints();
  }


  if (mouseX > 500-75 && mouseX < 500+75 && 
    mouseY > 300-75 && mouseY < 300+75 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[0] = color(0);
    }
  }
  else {
    c1[0] = color(99, 184, 255);
  }

  if (mouseX > 710-35 && mouseX < 710+35 && 
    mouseY > 300-35 && mouseY < 300+35 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[1] = color(0);
    }
  }
  else {
    c1[1] = color(106, 90, 205);
  }

  if (mouseX > 500-30 && mouseX < 500+30 && 
    mouseY > 515-30 && mouseY < 515+30 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[2] = color(0);
    }
  }
  else {
    c1[2] = color(54, 100, 139);
  }


  if (mouseX > 780-2 && mouseX < 780+2 && 
    mouseY > 220-2 && mouseY < 220+2 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[3] = color(0);
    }
  }
  else {
    c1[3] = color(0, 205, 102);
  }


  if (mouseX > 780-4 && mouseX < 780+4 && 
    mouseY > 380-4 && mouseY < 380+4 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[4] = color(0);
    }
  }
  else {
    c1[4] = color(180, 55, 79);
  }


  if (mouseX > 710-10 && mouseX < 710+10 && 
    mouseY > 390-10 && mouseY < 390+10 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[5] = color(0);
    }
  }
  else {
    c1[5] = color(238, 220, 130);
  }


  if (mouseX > 630-22.5 && mouseX < 630+22.5 && 
    mouseY > 390-22.5 && mouseY < 390+22.5 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[6] = color(0);
    }
  }
  else {
    c1[6] = color(55, 79, 180);
  }


  if (mouseX > 565-10 && mouseX < 565+10 && 
    mouseY > 585-10 && mouseY < 585+10 && iPadTransP4 >= 255) {
    bover = true;  
    if (!locked) { 
      c1[7] = color(0);
    }
  }
  else {
    c1[7] = color(100);
  }


  if (mouseX > 584-7 && mouseX < 584+7 && 
    mouseY > 285-7 && mouseY < 285+7 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(584, 285, 400, 190, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("You could wash your laundry", 592, 309);
      text("for a million years and still not", 592, 339);
      text("emit this much CO2, or you", 592, 379); 
      text("could run a laptop for 5,136", 592, 419);
      text("years.", 592, 459);

      player19.play();
    }
  }
  else {
    rewindPlay19();
    stopPlay19();
  }

  if (mouseX > 700-7 && mouseX < 700+7 && 
    mouseY > 256-7 && mouseY < 256+7 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(700, 256, 405, 250, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("Going swimming ten times would", 708, 278);
      text("emit less CO2 than this, and", 708, 318); 
      text("it’s healthy. 180 kilos is", 708, 358); 
      text("the same amount emitted as two", 708, 398); 
      text("low energy light bulbs over", 708, 438); 
      text("the course of one year.", 708, 478);

      player20.play();
    }
  }
  else {
    stopPlay20();
  }


  if (mouseX > 700-12 && mouseX < 700+12 && 
    mouseY > 595-12 && mouseY < 595+12 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(700, 467, 400, 125, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("You can offset your iPad and", 708, 491);
      text("other apple products at", 708, 531); 
      text("offsetmyipad.com.", 708, 571);
      player21.play();
    }
  }
  else {
    stopPlay21();
  }

  if (mouseX > 400-12 && mouseX < 400+12 && 
    mouseY > 485-12 && mouseY < 485+12 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(400, 157, 400, 325, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("It costs around 4 dollars 79", 408, 181);
      text("cents, or 3 pounds 10pence to", 408, 221);
      text("offset your iPad. Carbon", 408, 261); 
      text("offsetting works by taking", 408, 301); 
      text("your money and putting it", 408, 341); 
      text("towards a ‘green scheme’ such", 408, 381); 
      text("as alternative energy sources", 408, 421);
      text("or rain forest regeneration.", 408, 461);

      player22.play();
    }
  }
  else {
    stopPlay22();
  }

  if (mouseX > 810-12 && mouseX < 810+12 && 
    mouseY > 265-12 && mouseY < 265+12 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(810, 265, 405, 320, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("In its life time one iPad will", 818, 289);
      text("emit 180 kilos of CO2. This is", 818, 329);
      text("made-up of 67% production, 25%", 818, 369);
      text("customer use, 6% transportation", 818, 409);
      text("and 2% goes towards recycling.", 818, 449); 
      text("A years’ worth of Electric", 818, 489);
      text("showers will emit the same ", 818, 529);
      text("amount of CO2.", 818, 569);

      player23.play();
    }
  }
  else {
    stopPlay23();
  }

  if (mouseX > 380-12 && mouseX < 380+12 && 
    mouseY > 242-12 && mouseY < 242+12 && iPadTransP4 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(380, 242, 400, 290, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("In the first three days the", 388, 264); 
      text("new iPad was released, 3", 388, 304); 
      text("million were sold. Over their", 388, 344); 
      text("lifetimes they will emit 540", 388, 384);
      text("million kilos of CO2, around", 388, 424);
      text("the same as all European", 388, 464); 
      text("flights for one day.", 388, 504);
      player24.play();
    }
  }
  else {
    stopPlay24();
  }
}


public void showIpadText() {




  noStroke();
  // heading
  fill(0);
  rect(0, 25, 410, 40);
  fill(255);
  textFont(buttons, 37);
  text("Infographic Number 3.", 10, 57); 

  // sub heading  
  fill(255, 64, 64);
  rect(0, 70, 302, 30);
  textFont(buttons, 27);
  fill(255); 
  text("iPad CO2 emissions...", 10, 94);
}

public void showIpadKey() {

  noStroke();
  fill (0);

  // Rectangle for key
  fill(255);
  rect(840, 230, 350, 350);

  // lines for effect on rectangle key
  stroke(245);
  strokeWeight(10);
  line(960, 230, 940, 250); 
  line(980, 230, 940, 270); 
  line(1000, 230, 940, 290); 
  line(1020, 230, 940, 310); 
  line(1040, 230, 940, 330); 
  line(1060, 230, 940, 350); 
  line(1080, 230, 940, 370); 
  line(1100, 230, 940, 390); 
  line(1120, 230, 940, 410); 
  line(1140, 230, 940, 430); 
  line(1160, 230, 940, 450); 
  line(1180, 230, 940, 470); 
  line(1200, 230, 940, 490); 
  line(1220, 230, 940, 510); 
  line(1240, 230, 940, 530); 
  line(1260, 230, 940, 550);
  line(1280, 230, 940, 570);
  line(1290, 240, 950, 580);
  line(1290, 260, 970, 580);
  line(1290, 280, 990, 580);
  line(1290, 300, 1010, 580);
  line(1290, 320, 1030, 580);
  line(1290, 340, 1050, 580);
  line(1290, 360, 1070, 580);
  line(1290, 380, 1090, 580);
  line(1290, 400, 1110, 580);
  line(1290, 420, 1130, 580);
  line(1290, 440, 1150, 580);
  line(1290, 460, 1170, 580);
  line(1290, 480, 1190, 580);
  line(1290, 500, 1210, 580);
  line(1290, 520, 1230, 580);
  line(1290, 540, 1250, 580);
  line(1290, 560, 1270, 580);

  // Content title
  textFont(buttons, 20);    
  fill(120);
  text("Apple iPad a real killer.", 30, 200);

  // Content
  textFont(buttons, 15);
  text("One of the world’s most popular brands and", 30, 230);
  text("products, but if you own one would you", 30, 250);
  text("consider the effects that the item is having on", 30, 270);
  text("the world?", 30, 290);

  text("The answer is most probably not, which is fine,", 30, 320);
  text("because why would you? We don’t think about ", 30, 340);
  text("the products we buy in terms of morality nor", 30, 360);
  text("are we conscious about the effects they have", 30, 380); 
  text("on our world, not just the harmful gasses", 30, 400);
  text("but the metals mined to make the processors", 30, 420);
  text("within these products, the countries where the", 30, 440);
  text("metals come from are infested with war and", 30, 460);
  text("genocide.", 30, 480);

  text("This infograph displays how harmful a popular ", 30, 510);
  text("product can become. One iPad isn’t all that", 30, 530); 
  text("harmful but take it to market and sell", 30, 550);
  text("3 million and it can be come detrimental.", 30, 570);

  text("Consider the effects.", 30, 610);



  // 300 Million iPads
  fill(c1[0]);
  textFont(buttons, 28);
  text("300 Million iPads", textFiveX, 260);

  // 1 iPad life cycle  
  fill(c1[1]);
  textFont(buttons, 28);
  text("1 iPad life cycle", textFiveX, 300);

  // Cost to offset iPad
  fill(c1[2]);
  textFont(buttons, 28);
  text("Cost to offset your iPad", textFiveX, 340);

  // Recycling
  fill(c1[3]);
  textFont(buttons, 28);
  text("Recycling (2%)", textFiveX, 380);

  // Transport
  fill(c1[4]);
  textFont(buttons, 28);
  text("Transport (6%)", textFiveX, 420);

  // Customer use
  fill(c1[5]);
  textFont(buttons, 28);
  text("Customer use (25%)", textFiveX, 460);

  // Production
  fill(c1[6]);
  textFont(buttons, 28);
  text("Production (67%)", textFiveX, 500);

  // Production
  fill(c1[7]);
  textFont(buttons, 28);
  text("How to offset your iPad", textFiveX, 540);
}   

public void animateIpadLines() {  
  // Lines

    // 540,000,000 - 180
  strokeWeight(2);
  stroke(100, 60, 90, iPadTransP2);
  line(588, 300, 663, 300);  

  // 180 - recycle
  strokeWeight(1);
  stroke(100, 60, 90, iPadTransP2);
  line(740, 265.5, 778.5, 221);  

  // 180 - transport
  strokeWeight(1);
  stroke(100, 60, 90, iPadTransP2);
  line(740, 337.5, 777.5, 377);  

  // 180 - customer use
  strokeWeight(1);
  stroke(100, 60, 90, iPadTransP2);
  line(710, 347.5, 710, 377.5);  

  // 180 - production
  strokeWeight(1);
  stroke(100, 60, 90, iPadTransP2);
  line(680, 335, 648, 370);  

  // 540,000,000 - offset your carbon
  strokeWeight(2);
  stroke(100, 60, 90, iPadTransP2);
  line(500, 388, 500, 472.5);  

  // offset your carbon - click to offset
  strokeWeight(1);
  stroke(100, 60, 90, iPadTransP2);
  line(527, 547, 555, 576);
}


public void animateIpadCircs() {  

  // local variables for circles

    // 540,000,000 kg
  float posXone = 500;
  float posYone = 300;

  // 180 kg
  float posXtwo = 710;
  float posYtwo = 300;

  // offset your carbon
  float posXthree = 500;
  float posYthree = 515;

  // recycling
  float posXfour = 780;
  float posYfour = 220;

  // transport
  float posXfive = 780;
  float posYfive = 380;

  // customer use
  float posXsix = 710;
  float posYsix = 390;

  // production
  float posXseven = 630;
  float posYseven = 390;

  // click to offeset
  float posXeight = 565;
  float posYeight = 585;


  strokeWeight(5);
  stroke(50);


  // 540,000,000 kg
  fill(c1[0]);
  ellipse(posXone, posYone, iPadCirc1, iPadCirc1);

  // 180 kg
  fill(c1[1]);
  ellipse(posXtwo, posYtwo, iPadCirc2, iPadCirc2);

  // offset your carbon
  fill(c1[2]);
  ellipse(posXthree, posYthree, iPadCirc3, iPadCirc3);


  noStroke();

  // recycling 
  fill(c1[3]);
  ellipse(posXfour, posYfour, iPadCirc4, iPadCirc4);

  // transport 
  fill(c1[4]);
  ellipse(posXfive, posYfive, iPadCirc5, iPadCirc5);

  // customer use
  fill(c1[5]);
  ellipse(posXsix, posYsix, iPadCirc6, iPadCirc6);

  // production
  fill(c1[6]);
  ellipse(posXseven, posYseven, iPadCirc7, iPadCirc7);

  // click to offset
  fill(c1[7]);
  ellipse(posXeight, posYeight, iPadCirc8, iPadCirc8);
}


public void iPadTitles() {

  // circle titles
  textFont(buttons, 25);
  fill(255, 255, 255, iPadTransP); 
  text("540,000,000", 430, 310);
  text("180", 688, 310);
  text("$4.79", 470, 525);

  textFont(buttons, 10);
  text("KG's of CO2", 430, 322.5);
  text("KG's of", 688, 322.5);
  text("CO2", 688, 332.5);
}



public void iPadOtherCircles() {

  // Sub circles
  fill(255, 255, 255, iPadTransP3);
  stroke (0, 0, 0, 200);
  strokeWeight(3);
  ellipse(584, 285, 7, 7);
  ellipse(700, 256, 7, 7);


  // Leading circles
  int sizeXY = 5;

  fill(238, 201, 0, iPadTransP3);
  noStroke();

  // How to offset
  ellipse(590, 595, sizeXY, sizeXY);
  ellipse(620, 595, sizeXY, sizeXY);
  ellipse(650, 595, sizeXY, sizeXY);
  ellipse(680, 595, sizeXY, sizeXY);

  // Cost to offset
  ellipse(450, 485, sizeXY, sizeXY);
  ellipse(420, 485, sizeXY, sizeXY);

  // 1 iPad life cycle
  ellipse(760, 265, sizeXY, sizeXY);
  ellipse(790, 265, sizeXY, sizeXY);


  // 300 Million iPads
  ellipse(410, 242, sizeXY, sizeXY);
}

public void iPadInfoPoints() {

  // information points.    
  textFont(information, 20);

  // How to offset
  fill(0, 0, 0, iPadTransP4);
  ellipse(700, 595, 20, 20);
  fill(255, 255, 255, iPadTransP4);
  text("i", 697, 602);

  // Cost to offset
  fill(0, 0, 0, iPadTransP4);
  ellipse(400, 485, 20, 20);
  fill(255, 255, 255, iPadTransP4);
  text("i", 397, 492);

  // 1 iPad Life Cycle
  fill(0, 0, 0, iPadTransP4);
  ellipse(810, 265, 20, 20);
  fill(255, 255, 255, iPadTransP4);
  text("i", 807, 272);

  // 300 Million iPads
  fill(0, 0, 0, iPadTransP4);
  ellipse(380, 242, 20, 20);
  fill(255, 255, 255, iPadTransP4);
  text("i", 377, 249);
}


public void iPadAniOne() {

  Ani.to(this, 1.0, "iPadCirc1", 170, Ani.EXPO_IN_OUT);
  diameterOneIpad.start();

  Ani.to(this, 1.0, "iPadCirc2", 90, Ani.EXPO_IN_OUT);
  diameterTwoIpad.start();

  Ani.to(this, 1.0, "iPadCirc3", 80, Ani.EXPO_IN_OUT);
  diameterThreeIpad.start();

  Ani.to(this, 1.0, "iPadCirc4", 4, Ani.EXPO_IN_OUT);
  diameterFourIpad.start();

  Ani.to(this, 1.0, "iPadCirc5", 8, Ani.EXPO_IN_OUT);
  diameterFiveIpad.start();

  Ani.to(this, 1.0, "iPadCirc6", 25, Ani.EXPO_IN_OUT);
  diameterSixIpad.start();

  Ani.to(this, 1.0, "iPadCirc7", 57, Ani.EXPO_IN_OUT);
  diameterSevenIpad.start();

  Ani.to(this, 1.0, "iPadCirc8", 25, Ani.EXPO_IN_OUT);
  diameterEightIpad.start();
}

/* ipad CO2 */

















/*  OGC   */
public void startOGC() {

  // local variables for circles

  background(255); 
  OGCCount = OGCCount +1;

  if (OGCCount >= 1) {
    showOGCText();
  }

  if (OGCCount >=30) {
    animateOGCCircs();
  }

  if (OGCCount >=90) {
    showOGCExtraText();
  }





  println(OGCCount);
}





public void showOGCText() {


  noStroke();

  fill(0, 0, 0, 205); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 10 - 4.5, 6, 6);
  fill(0, 0, 0, 200); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 11 - 4.5, 6, 6);
  fill(0, 0, 0, 195); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 12 - 4.5, 6, 6);

  fill(0, 0, 0, 165); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 19 - 13.5, 6, 6);
  fill(0, 0, 0, 160); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 20 - 13.5, 6, 6);
  fill(0, 0, 0, 155); 
  ellipse(OGCtextX + 20, OGCtextY + OGCtextYvar * 21 - 13.5, 6, 6);


  // heading
  fill(0);
  rect(0, 25, 410, 40);
  fill(255);
  textFont(buttons, 37);
  text("Infographic Number 1.", 10, 57); 

  // sub heading  
  fill(255, 64, 64);
  rect(0, 70, 335, 30);
  textFont(buttons, 27);
  fill(255); 
  text("Non-Renewable World...", 10, 94);



  // The Year is
  fill(100);    
  rect(0, 480, 180, 25);
  textFont(buttons, 20);    
  fill(255);
  text("The Year is " + theYearis + ":", 10, 500);

  // Oil
  fill(c1[0]);     
  rect(0, 540, 505, 25);
  fill(25);
  text("We currently have enough oil to last " + daysOfOil + " years.", 10, 560);

  // Gas
  fill(c1[1]); 
  rect(0, 570, 505, 25);
  fill(25);
  text("The worlds gas supply will run out in " + daysOfGas + " years.", 10, 590);

  // Coal
  fill(c1[2]);    
  rect(0, 600, 517.5, 25);
  fill(25);    
  text("There are " + daysOfCoal + " years left before we run out of coal.", 10, 620);    

  player18.play();
} 








public void animateOGCCircs() {


  // Oil
  float OGCXone = 450;
  float OGCYone = 350;

  // Gas
  float OGCXtwo = 580;
  float OGCYtwo = 350;

  // Coal
  float OGCXthree = 900;
  float OGCYthree = 350;


  strokeWeight(5);
  stroke(50);

  // Oil
  fill(c1[0]);
  ellipse(OGCXone, OGCYone, OGCCirc1, OGCCirc1);

  // Gas
  fill(c1[1]);
  ellipse(OGCXtwo, OGCYtwo, OGCCirc2, OGCCirc2);

  // Coal
  fill(c1[2]);
  ellipse(OGCXthree, OGCYthree, OGCCirc3, OGCCirc3);
}

public void showOGCExtraText() {

  textFont(headings, 18);

  fill(25);     
  text("Oil", 437.5, 315);
  text("Gas", 562.5, 250);
  text("Coal", 880, 125);  

  // Content title
  textFont(buttons, 20);    
  fill(120);
  text("Oil, Gas & Coal", 30, 220);

  // Content
  textFont(buttons, 15);    
  text("We are running out of oil, gas & coal ", 30, 250);
  text("and we need to harness an acceptable", 30, 270);
  text("replacement such as the hydrogen fuel", 30, 290);
  text("cell. Not only are we running out but", 30, 310);
  text("in using these substances we are having", 30, 330);
  text("a devastating effect on the planet", 30, 350);
  text("some scientists say it is too late to", 30, 370);
  text("have an impact, but we need to at least try", 30, 390);
  text("This application will focus on the ", 30, 430);
  text("technological aspect and how technology ", 30, 450);
  text("is impacting on our world.", 30, 470);
}

/*  OGC   */













/* Twenty Four Hrs */
public void startTwentyFour() {

  TwentyFourcount = TwentyFourcount + 1;

  if (TwentyFourcount >= 2) {
    showTwentyFourText();
  }

  if (TwentyFourcount >= 30) {    
    animateTwentyFour();
  }

  if (TwentyFourcount == 30) {
    TwentyFourAniOne();
  }

  if (TwentyFourcount >= 60) {
    TwentyFourOtherCircles();
    TwentyFourTransP = TwentyFourTransP + 5;
  }

  if (TwentyFourTransP >= 200) {
    TwentyFourP2 = TwentyFourP2 + 5;
  }

  if (TwentyFourP2 >= 200) {
    TwentyFourP3 = TwentyFourP3 + 5;
  } 

  if (TwentyFourP3 >= 255) {
    showTwentyFourKey();
  }

  if (mouseX > 467-7 && mouseX < 467+7 && 
    mouseY > 285-7 && mouseY < 285+7 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(467, 285, 400, 290, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("Every Google search produces", 475, 309); 
      text("0.2 grams of Carbon dioxide.", 475, 349); 
      text("This doesn’t sound like a lot ", 475, 389); 
      text("but in one day the total amount", 475, 429); 
      text("emitted could reach 780 tonnes.", 475, 469); 
      text("That’s the same weight as 243 ", 475, 509);
      text("Range Rovers.", 475, 549);  

      player3.play();
    }
  }
  else {
    stopPlay3();
  }

  if (mouseX > 675-7 && mouseX < 675+7 && 
    mouseY > 256-7 && mouseY < 256+7 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(675, 256, 400, 400, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("It takes 170 grams of CO2 to", 683, 280);  
      text("produce and distribute one", 683, 320);  
      text("newspaper, some 850 times", 683, 360); 
      text("more than one Google search.", 683, 400);  
      text("Could this mean that we will", 683, 440); 
      text("see the end of traditional", 683, 480);  
      text("news sources, not because the", 683, 520);  
      text("internet is more accessible", 683, 560);  
      text("and easier to use, but", 683, 600);  
      text("because it is greener?", 683, 640); 

      player4.play();
    }
  }
  else {
    stopPlay4();
  }

  if (mouseX > 431-7 && mouseX < 431+7 && 
    mouseY > 483-7 && mouseY < 483+7 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(431, 115, 405, 350, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("4.9 tonnes.", 439, 459);  
      text("course of a year at just", 439, 419); 
      text("less than this over the", 439, 379); 
      text("Compared to a human who emits", 439, 339); 
      text("amounts to 6.2 tonnes of CO2", 439, 299); 
      text("the tweets sent in one day it", 439, 259); 
      text("Google search. If you take all", 439, 219); 
      text("CO2, 10 times less than one", 439, 179); 
      text("One Tweet emits 0.02 grams of", 439, 139); 

      player5.play();
    }
  }
  else {
    stopPlay5();
  }

  if (mouseX > 800-12 && mouseX < 800+12 && 
    mouseY > 545-12 && mouseY < 545+12 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(800, 297, 400, 250, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("Every day 3.9 billion Google", 808, 321); 
      text("searches are made. 522 million", 808, 361); 
      text("news papers are circulated.", 808, 401); 
      text("311 million tweets are sent. 5.4", 808, 441); 
      text("million mobile phones are sold", 808, 481); 
      text("and 4.3 million blogs are written.", 808, 521);


      player6.play();
    }
  }
  else {
    stopPlay6();
  }


  if (mouseX > 380-12 && mouseX < 380+12 && 
    mouseY > 430-12 && mouseY < 430+12 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(380, 430, 405, 240, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("It takes one glass of orange", 388, 454); 
      text("juice to emit the same amount", 388, 494); 
      text("of CO2 as 1,050 Google searches", 388, 534);
      text("and one cheese burger will", 388, 574); 
      text("emit the same CO2 as 15,000", 388, 614); 
      text("Google searches.", 388, 654);

      player7.play();
    }
  }

  else {
    stopPlay7();
  }


  if (mouseX > 790-12 && mouseX < 790+12 && 
    mouseY > 255-12 && mouseY < 255+12 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(790, 255, 405, 200, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("On average using a mobile phone", 798, 279); 
      text("for one year emits 112 kilos of", 798, 319);
      text("CO2. All the phones sold today", 798, 359);
      text("will emit 6.4 million tonnes", 798, 399);
      text("of CO2 this year alone.", 798, 439);


      player8.play();
    }
  }

  else {
    stopPlay8();
  }


  if (mouseX > 410-12 && mouseX < 410+12 && 
    mouseY > 300-12 && mouseY < 300+12 && TwentyFourP3 >= 255) {
    bover = true;  

    if (!locked) { 
      stroke(100);
      strokeWeight(2.5);
      fill(100, 100, 100, 200);
      rect(410, 300, 405, 160, 7, 7);
      fill(255);
      textFont(buttons, 25);
      text("One typical blog post produces", 418, 324); 
      text("850 grams of CO2. That’s", 418, 364);
      text("roughly the same as one bottle ", 418, 404); 
      text("of imported beer.", 418, 444);



      player9.play();
    }
  }

  else {
    stopPlay9();
  }
}


public void showTwentyFourText() {

  background(255);  
  noStroke();


  noStroke();  
  // heading
  fill(0);
  rect(0, 25, 410, 40);
  fill(255);
  textFont(buttons, 37);
  text("Infographic Number 2.", 10, 57); 

  // sub heading  
  fill(255, 64, 64);
  rect(0, 70, 285, 30);
  textFont(buttons, 27);
  fill(255); 
  text("Twenty four hours...", 10, 94);
}

public void showTwentyFourKey() {
  // Rectangle for key
  noStroke();
  fill(255);
  rect(840, 230, 350, 350);

  // lines for effect on rectangle key
  stroke(245);
  strokeWeight(10);
  line(960, 230, 940, 250); 
  line(980, 230, 940, 270); 
  line(1000, 230, 940, 290); 
  line(1020, 230, 940, 310); 
  line(1040, 230, 940, 330); 
  line(1060, 230, 940, 350); 
  line(1080, 230, 940, 370); 
  line(1100, 230, 940, 390); 
  line(1120, 230, 940, 410); 
  line(1140, 230, 940, 430); 
  line(1160, 230, 940, 450); 
  line(1180, 230, 940, 470); 
  line(1200, 230, 940, 490); 
  line(1220, 230, 940, 510); 
  line(1240, 230, 940, 530); 
  line(1260, 230, 940, 550);
  line(1280, 230, 940, 570);
  line(1290, 240, 950, 580);
  line(1290, 260, 970, 580);
  line(1290, 280, 990, 580);
  line(1290, 300, 1010, 580);
  line(1290, 320, 1030, 580);
  line(1290, 340, 1050, 580);
  line(1290, 360, 1070, 580);
  line(1290, 380, 1090, 580);
  line(1290, 400, 1110, 580);
  line(1290, 420, 1130, 580);
  line(1290, 440, 1150, 580);
  line(1290, 460, 1170, 580);
  line(1290, 480, 1190, 580);
  line(1290, 500, 1210, 580);
  line(1290, 520, 1230, 580);
  line(1290, 540, 1250, 580);
  line(1290, 560, 1270, 580);

  // Content title
  textFont(buttons, 20);    
  fill(120);
  text("Communication around the Globe", 30, 220);

  // Content
  textFont(buttons, 15);    
  text("Thanks to technology we are now able to  ", 30, 250);
  text("communicate at a phenomenal speed.", 30, 270);
  
  text("It now takes just seconds to communicate ", 30, 290);
  text("with someone across the globe.", 30, 310);
  text("Although the internet and modern", 30, 330);
  text("communication are wonderful inventions,", 30, 350);
  text("have you ever considered the effects that", 30, 370);
  text("these communication methods may be having", 30, 390);
  text("on our world. every day 3 billion", 30, 410);
  text("Google searches are made, which emits a", 30, 430);
  text("staggering 7.8 million tonnes of CO2.", 30, 450);
  
  text("Almost six years worth of CO2 from", 30, 480);
  text("flights out of heathrow.", 30, 500);

  text("This infograph compares the amount of", 30, 530);
  text("communication from a number of different", 30, 550);
  text("technologies over one day and looks at", 30, 570);
  text("the damage this may cause.", 30, 590);


  // Google Searches
  fill(c1[0]);
  textFont(buttons, 28);
  text("Google Searches", TwentyFourtextFiveX, 260);

  // News Papers Circulated   
  fill(c1[1]);
  textFont(buttons, 28);
  text("News Papers Circulated", TwentyFourtextFiveX, 300);
  // Tweets Sent
  fill(c1[2]);
  textFont(buttons, 28);
  text("Tweets Sent", TwentyFourtextFiveX, 340);

  // Mobile Phones Sold
  fill(c1[3]);
  textFont(buttons, 28);
  text("Mobile Phones Sold", TwentyFourtextFiveX, 380);

  // Blogs Written
  fill(c1[4]);
  textFont(buttons, 28);
  text("Blogs Written", TwentyFourtextFiveX, 420);
}


public void animateTwentyFour() {

  float[] angs = {
    ang1, ang2, ang3, ang4, ang5
  };
  float lastAng = 0;

  if (TwentyFourcount >= 35) {
    for (int i = 0; i < angs.length; i++) {
      fill(c1[i]);
      strokeWeight(5);
      stroke(100);
      arc(bigX, bigY, bigCirc, bigCirc, lastAng, lastAng+radians(angs[i]));
      lastAng += radians(angs[i]);
    }


    strokeWeight(5);
    stroke(100);
    fill(255);
    ellipse(smallX, smallY, smallCirc, smallCirc);
  }
}

public void TwentyFourOtherCircles() {

  // Sub circles
  fill(255, 255, 255, TwentyFourTransP);
  stroke (0, 0, 0, 200);
  strokeWeight(3);
  ellipse(467, 285, 7, 7);
  ellipse(675, 256, 7, 7);
  ellipse(431, 483.5, 7, 7);


  // Leading circles
  int sizeXY = 5;

  fill(238, 201, 0, TwentyFourP2);
  noStroke();

  // How to offset
  ellipse(720, 545, sizeXY, sizeXY);
  ellipse(750, 545, sizeXY, sizeXY);
  ellipse(780, 545, sizeXY, sizeXY);

  // Cost to offset
  ellipse(400, 430, sizeXY, sizeXY);

  // 1 iPad life cycle
  ellipse(710, 265, sizeXY, sizeXY);
  ellipse(740, 265, sizeXY, sizeXY);
  ellipse(770, 265, sizeXY, sizeXY);

  // 300 Million iPads
  ellipse(430, 300, sizeXY, sizeXY);



  // information points.    
  textFont(information, 20);

  // How to offset
  fill(0, 0, 0, TwentyFourP3);
  ellipse(800, 545, 20, 20);
  fill(255, 255, 255, TwentyFourP3);
  text("i", 797, 552);

  // Cost to offset
  fill(0, 0, 0, TwentyFourP3);
  ellipse(380, 430, 20, 20);
  fill(255, 255, 255, TwentyFourP3);
  text("i", 377, 437);

  // 1 iPad Life Cycle
  fill(0, 0, 0, TwentyFourP3);
  ellipse(790, 265, 20, 20);
  fill(255, 255, 255, TwentyFourP3);
  text("i", 787, 272);

  // 300 Million iPads
  fill(0, 0, 0, TwentyFourP3);
  ellipse(410, 300, 20, 20);
  fill(255, 255, 255, TwentyFourP3);
  text("i", 407, 307);
}


public void TwentyFourAniOne() {

  Ani.to(this, 1.0, "bigCirc", 350, Ani.EXPO_IN_OUT);
  diameterOneTwentyFour.start();

  Ani.to(this, 1.0, "smallCirc", 100, Ani.EXPO_IN_OUT);
  diameterTwoTwentyFour.start();
}
/* Twenty Four Hrs */



/* OGC ANI FUNCTIONS. */
public void OGCAniOne() {
  Ani.to(this, 1.0, "OGCCirc1", 42, Ani.EXPO_IN_OUT);
  diameterOneOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 166, Ani.EXPO_IN_OUT);  
  diameterTwoOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 415, Ani.EXPO_IN_OUT);
  diameterThreeOGC.start();
}

public void OGCAniTwo() {
  Ani.to(this, 1.0, "OGCCirc1", 41, Ani.EXPO_IN_OUT);
  diameterFourOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 165, Ani.EXPO_IN_OUT); 
  diameterFiveOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 414, Ani.EXPO_IN_OUT);
  diameterSixOGC.start();
}


public void OGCAniThree() {      
  Ani.to(this, 1.0, "OGCCirc1", 40, Ani.EXPO_IN_OUT);
  diameterSevenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 164, Ani.EXPO_IN_OUT);  
  diameterEightOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 413, Ani.EXPO_IN_OUT);
  diameterNineOGC.start();
}

public void OGCAniFour() {
  Ani.to(this, 1.0, "OGCCirc1", 39, Ani.EXPO_IN_OUT);
  diameterTenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 163, Ani.EXPO_IN_OUT);  
  diameterElevenOGC.start(); 
  Ani.to(this, 1.0, "OGCCirc3", 412, Ani.EXPO_IN_OUT);
  diameterTwelveOGC.start();
}


public void OGCAniFive() {
  Ani.to(this, 1.0, "OGCCirc1", 38, Ani.EXPO_IN_OUT);
  diameterThirteenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 162, Ani.EXPO_IN_OUT);  
  diameterFourteenOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 411, Ani.EXPO_IN_OUT);
  diameterFifteenOGC.start();
}

public void OGCAniSix() {
  Ani.to(this, 1.0, "OGCCirc1", 37, Ani.EXPO_IN_OUT);
  diameterSixteenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 161, Ani.EXPO_IN_OUT);  
  diameterSeventeenOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 410, Ani.EXPO_IN_OUT);
  diameterEighteenOGC.start();
}

public void OGCAniSeven() {
  Ani.to(this, 1.0, "OGCCirc1", 36, Ani.EXPO_IN_OUT);
  diameterNineteenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 160, Ani.EXPO_IN_OUT);  
  diameterTwentyOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 409, Ani.EXPO_IN_OUT);
  diameterTwentyOneOGC.start();
}

public void OGCAniEight() {
  Ani.to(this, 1.0, "OGCCirc1", 35, Ani.EXPO_IN_OUT);
  diameterTwentyTwoOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 159, Ani.EXPO_IN_OUT);  
  diameterTwentyThreeOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 408, Ani.EXPO_IN_OUT);
  diameterTwentyFourOGC.start();
}

public void OGCAniNine() {
  Ani.to(this, 1.0, "OGCCirc1", 34, Ani.EXPO_IN_OUT);
  diameterTwentyFiveOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 158, Ani.EXPO_IN_OUT);  
  diameterTwentySixOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 407, Ani.EXPO_IN_OUT);
  diameterTwentySevenOGC.start();
}


public void OGCAniTen() {
  Ani.to(this, 1.0, "OGCCirc1", 4, Ani.EXPO_IN_OUT);
  diameterTwentyEightOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 128, Ani.EXPO_IN_OUT);
  diameterTwentyNineOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 377, Ani.EXPO_IN_OUT);
  diameterThirtyOGC.start();
}

public void OGCAniEleven() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterThirtyOneOGC.start(); 
  Ani.to(this, 1.0, "OGCCirc2", 123, Ani.EXPO_IN_OUT);
  diameterThirtyTwoOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 372, Ani.EXPO_IN_OUT);
  diameterThirtyThreeOGC.start();
}

public void OGCAniTwelve() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterThirtyFourOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 118, Ani.EXPO_IN_OUT);
  diameterThirtyFiveOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 367, Ani.EXPO_IN_OUT);
  diameterThirtySixOGC.start();
}

public void OGCAniThirteen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterThirtySevenOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 113, Ani.EXPO_IN_OUT);
  diameterThirtyEightOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 362, Ani.EXPO_IN_OUT);
  diameterThirtyNineOGC.start();
}


public void OGCAniFourteen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtyOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 108, Ani.EXPO_IN_OUT);
  diameterFourtyOneOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 357, Ani.EXPO_IN_OUT);
  diameterFourtyTwoOGC.start();
}


public void OGCAniFifteen() {   
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtyThreeOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 28, Ani.EXPO_IN_OUT);
  diameterFourtyFourOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 277, Ani.EXPO_IN_OUT);
  diameterFourtyFiveOGC.start();
}

public void OGCAniSixteen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtySixOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFourtySevenOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 227, Ani.EXPO_IN_OUT);
  diameterFourtyEightOGC.start();
}

public void OGCAniSeventeen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFourtyNineOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftyOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 177, Ani.EXPO_IN_OUT);
  diameterFiftyOneOGC.start();
}


public void OGCAniEighteen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyTwoOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftyThreeOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 127, Ani.EXPO_IN_OUT);
  diameterFiftyFourOGC.start();
}

public void OGCAniNineteen() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyFiveOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftySixOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 77, Ani.EXPO_IN_OUT);
  diameterFiftySevenOGC.start();
}

public void OGCAniTwenty() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterFiftyEightOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterFiftyNineOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 27, Ani.EXPO_IN_OUT);
  diameterSixtyOGC.start();
}

public void OGCAniTwentyOne() {
  Ani.to(this, 1.0, "OGCCirc1", 0, Ani.EXPO_IN_OUT);
  diameterSixtyOneOGC.start();
  Ani.to(this, 1.0, "OGCCirc2", 0, Ani.EXPO_IN_OUT);
  diameterSixtyTwoOGC.start();
  Ani.to(this, 1.0, "OGCCirc3", 1, Ani.EXPO_IN_OUT);
  diameterSixtyThreeOGC.start();
}

/* OGC ANI FUNCTIONS. */











void stopPlay2() {
  player2.pause();
}

void stopPlay3() {
  player3.pause();
}

void stopPlay4() {
  player4.pause();
}

void stopPlay5() {
  player5.pause();
}

void stopPlay6() {
  player6.pause();
}

void stopPlay7() {
  player7.pause();
}

void stopPlay8() {
  player8.pause();
}

void stopPlay9() {
  player9.pause();
}

void stopPlay10() {
  player10.pause();
}

void stopPlay11() {
  player11.pause();
}

void stopPlay12() {
  player12.pause();
}

void stopPlay13() {
  player13.pause();
}

void stopPlay14() {
  player14.pause();
}

void stopPlay15() {
  player15.pause();
}

void stopPlay16() {
  player16.pause();
}

void stopPlay17() {
  player17.pause();
}

void stopPlay18() {
  player18.pause();
}

void stopPlay19() {
  player19.pause();
}

void stopPlay20() {
  player20.pause();
}

void stopPlay21() {
  player21.pause();
}

void stopPlay22() {
  player22.pause();
}

void stopPlay23() {
  player23.pause();
}

void stopPlay24() {
  player24.pause();
}



void rewindPlay2() {
  player2.rewind();
}

void rewindPlay3() {
  player3.rewind();
}

void rewindPlay4() {
  player4.rewind();
}

void rewindPlay5() {
  player5.rewind();
}

void rewindPlay6() {
  player6.rewind();
}

void rewindPlay7() {
  player7.rewind();
}

void rewindPlay8() {
  player8.rewind();
}

void rewindPlay9() {
  player9.rewind();
}

void rewindPlay10() {
  player10.rewind();
}

void rewindPlay11() {
  player11.rewind();
}

void rewindPlay12() {
  player12.rewind();
}

void rewindPlay13() {
  player13.rewind();
}

void rewindPlay14() {
  player14.rewind();
}

void rewindPlay15() {
  player15.rewind();
}

void rewindPlay16() {
  player16.rewind();
}

void rewindPlay17() {
  player17.rewind();
}

void rewindPlay18() {
  player18.rewind();
}

void rewindPlay19() {
  player19.rewind();
}

void rewindPlay20() {
  player20.rewind();
}

void rewindPlay21() {
  player21.rewind();
}

void rewindPlay22() {
  player22.rewind();
}

void rewindPlay23() {
  player23.rewind();
}

void rewindPlay24() {
  player24.rewind();
}



