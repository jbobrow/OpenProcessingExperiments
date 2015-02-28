

import ddf.minim.*;
PFont f; // A variable to hold onto a font
String[] allwords; // The array to hold all of the text 
int counter = 0;	// Where are we in the text
// We will use spaces and punctuation as delimiters 
String delimiters = " <>`~!@#$%^&*()-_=+/[]{}\"\"1234567890qwertyuiopasdfghjklzxcvbnm ,.?!;:'";
//String delimiters = "\"quotes\"";

Minim minim;
AudioSample A1;
AudioSample B1;
AudioSample C1;
AudioSample D1;
AudioSample E1;
AudioSample F1;
AudioSample G1;
AudioSample H1;
AudioSample I1;
AudioSample J1;
AudioSample K1;
AudioSample L1;
AudioSample M1;
AudioSample N1;
AudioSample O1;
AudioSample P1;
AudioSample Q1;
AudioSample R1;
AudioSample S1;
AudioSample T1;
AudioSample U1;
AudioSample V1;
AudioSample W1;
AudioSample X1;
AudioSample Y1;
AudioSample Z1;




void setup() 
{ 

  minim = new Minim(this);

  A1 = minim.loadSample("A.mp3", 2048);
  B1 = minim.loadSample("B.mp3", 2048);
  C1 = minim.loadSample("C.mp3", 2048);
  D1 = minim.loadSample("D.mp3", 2048);
  E1 = minim.loadSample("E.mp3", 2048);
  F1 = minim.loadSample("F.mp3", 2048);
  G1 = minim.loadSample("G.mp3", 2048);
  H1 = minim.loadSample("H.mp3", 2048);
  I1 = minim.loadSample("I.mp3", 2048);
  J1 = minim.loadSample("J.mp3", 2048);
  K1 = minim.loadSample("K.mp3", 2048);
  L1 = minim.loadSample("L.mp3", 2048);
   M1 = minim.loadSample("M.mp3", 2048);
  N1 = minim.loadSample("N.mp3", 2048);
  O1 = minim.loadSample("O.mp3", 2048);
 P1 = minim.loadSample("P.mp3", 2048);
  Q1 = minim.loadSample("Q.mp3", 2048);
  R1 = minim.loadSample("R.mp3", 2048);
 S1 = minim.loadSample("S.mp3", 2048);
  T1 = minim.loadSample("T.mp3", 2048);
  U1 = minim.loadSample("U.mp3", 2048); 
  V1 = minim.loadSample("V.mp3", 2048);
  W1 = minim.loadSample("W.mp3", 2048);
  X1 = minim.loadSample("X.mp3", 2048);
  Y1 = minim.loadSample("Y.mp3", 2048);
  Z1 = minim.loadSample("Z.mp3", 2048);
 
  size(400, 400); 
  // Load the font 
  f = loadFont("Georgia-Bold-24.vlw");
  //Any punctuation is used as a delimiter.
  // Load King Lear into an array of strings 
  String url = "http://www.wwe.com/"; 

  String[] rawtext = loadStrings(url); // Join the big array together as one long string 

  String everything = join(rawtext, " "); // Split the array into words using any delimiter 

  allwords = splitTokens(everything, delimiters); 


  colorMode(HSB);
}


void draw() 
{ 
 
  
 

  float RANDCOLOR = random(200, 225); 
  float FRAMERAND = random(1, 4);

  background(RANDCOLOR, 255, 255, 50);
  // filter(ERODE);
  frameRate(FRAMERAND);



  // Pick one word from King Lear 
  String theword = allwords[counter];
  
   
  
  // Count how many times that word appears in King Lear 
  int total = 0;
  //All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  //Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.
  //This loop counts the number of occurrences of the current word being displayed.
  //Data Input	341
  //The word “Lear” appears 226 times in the text of King Lear.


  for (int i = 0; i < allwords.length; i++) 
  { 
    if (theword.equals(allwords[i])) {
      total++;
    }
  }

if (theword.equals("A"))
{
A1.trigger();}
 
 if (theword.equals("B"))
{
B1.trigger();}

if (theword.equals("C"))
{
C1.trigger();}

if (theword.equals("D"))
{
D1.trigger();}
 
 if (theword.equals("E"))
{
E1.trigger();}

if (theword.equals("F"))
{
F1.trigger();}
if (theword.equals("G"))
{
G1.trigger();}
 
 if (theword.equals("H"))
{
H1.trigger();}

if (theword.equals("I"))
{
I1.trigger();}
if (theword.equals("J"))
{
J1.trigger();}
 
 if (theword.equals("K"))
{
K1.trigger();}

if (theword.equals("L"))
{
L1.trigger();}
if (theword.equals("M"))
{
M1.trigger();}
 
 if (theword.equals("N"))
{
N1.trigger();}

if (theword.equals("O"))
{
O1.trigger();}

if (theword.equals("P"))
{
P1.trigger();}
 
 if (theword.equals("Q"))
{
Q1.trigger();}

if (theword.equals("R"))
{
R1.trigger();}
if (theword.equals("S"))
{
S1.trigger();}
 
 if (theword.equals("T"))
{
T1.trigger();}

if (theword.equals("U"))
{
U1.trigger();}
if (theword.equals("V"))
{
V1.trigger();}
 
 if (theword.equals("W"))
{
W1.trigger();}

if (theword.equals("X"))
{
X1.trigger();}

if (theword.equals("Y"))
{
Y1.trigger();}
if (theword.equals("Z"))
{
Z1.trigger();}

  // Display the text and total times the word appears 
  textFont(f); 
  fill(0);
  words();
  words2();
  /*
  {text(theword, 0, 10);
   text(theword, 10, 20);
   text(theword, 20, 30);
   text(theword, 30, 40);
   text(theword, 40, 50);
   text(theword, 50, 60);
   text(theword, 60, 70);
   text(theword, 70, 80);
   text(theword, 80, 90);
   text(theword, 90, 100);
   text(theword, 100, 110);
   text(theword, 110, 120);
   text(theword, 120, 130);
   text(theword, 130, 140);
   text(theword, 140, 150);
   text(theword, 150, 160);
   text(theword, 160, 170);
   text(theword, 170, 180);}
   */
  //translate(0,20);
  //filter(ERODE);

  //text(total,10,110);
  stroke(0); 
  fill(0); 
  //rect(10,50,total/4,20);
  // Move onto the next word 
  counter = (counter + 1) % allwords.length;
  
  filter(DILATE);
}



void stop()
{
  A1.close();
  B1.close();
  C1.close();
  minim.stop();
  super.stop();
}




