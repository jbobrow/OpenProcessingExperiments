
PFont    font;
PImage   btnAll;
PImage   btnBlind;
PImage   btnDeaf;
int      r;
int      g;
int      b;
int      state;
int      index;
int      count;
int      countBlind;
int      countDeaf;
int      factor;
float    barHeight;
float    barFactor;
float    barAlph;
float    xPos;
float    yPos;
float[]  barHeights;
String   uTitles;
String[] uTitle;
String[] uChap;
wordBar[][] uBars;
wordBar[][] uBarsBlind;
wordBar[][] uBarsDeaf;

void setup() 
{
  size(600, 810);
  smooth();
  noStroke();
  background(255);
  uBars      = new wordBar[18][100];
  uBarsBlind = new wordBar[18][100];
  uBarsDeaf  = new wordBar[18][100];
  barHeights = new float[18];
  uChap      = new String[18];
  uTitle     = new String[18];
  barHeight  = 0;
  barFactor  = 2400;
  barAlph    = 0;
  xPos       = 0;
  yPos       = 0;
  index      = 0;
  count      = 0;
  countBlind = 0;
  countDeaf  = 0;
  factor     = 7;
  r         = 13;
  g         = 13;
  b         = 16;
  state     = 0;
  btnBlind  = loadImage("btnBlind.png");
  font      = loadFont("ITCAvantGardePro-Md-14.vlw");
  textFont(font, 9);
  parseMe();
  initBarHeights();
  wordInq();
}

void draw() 
{
  background(255);
  textFont(font, 12);
  text("ULYSSES", 20, 30);
  titlePrint();
  fill(213, 213, 216);
  ellipse(width - 33.5, 30, 21, 21);
  ellipse(width - 63.5, 30, 21, 21);
  ellipse(width - 93.5, 30, 21, 21);
  fill(255);
  ellipse(width - 33.5, 30, 19, 19);
  ellipse(width - 63.5, 30, 19, 19);
  ellipse(width - 93.5, 30, 19, 19);
  if (mousePressed && mouseX > (width - 44) && mouseX < (width - 23) && mouseY > 19.5 && mouseY < 40.5)
  {
    state = 0;
  }
  if (mousePressed && mouseX > (width - 74) && mouseX < (width - 53) && mouseY > 19.5 && mouseY < 40.5)
  {
    state = 2;
  }
  if (mousePressed && mouseX > (width - 104) && mouseX < (width - 83) && mouseY > 19.5 && mouseY < 40.5)
  {
    state = 1;
  }
  if (state == 0)
  {
    fill(223, 223, 226);
    ellipse(width - 33.5, 30, 15, 15);
    for (int i = 0; i < 18; i++)
    {
      for (int j = 0; j < 100; j++)
      {
        uBars[i][j].drawBar();
      }
    }
  }
  if (state == 1)
  {
    fill(13, 13, 16);
    textFont(font, 12);
    text("/  SILENCE", 70, 30);
    fill(223, 223, 226);
    ellipse(width - 93.5, 30, 15, 15);
    for (int i = 0; i < 18; i++)
    {
      for (int j = 0; j < 100; j++)
      {
        uBarsDeaf[i][j].drawBar();
      }
    }
  }
  if (state == 2)
  { 
    fill(13, 13, 16);
    textFont(font, 12);
    text("/  BLINDNESS", 70, 30);
    fill(223, 223, 226);
    ellipse(width - 63.5, 30, 15, 15);
    for (int i = 0; i < 18; i++)
    {
      for (int j = 0; j < 100; j++)
      {
        uBarsBlind[i][j].drawBar();
      }
    }
  }
}

void parseMe() 
{
  String[] uOrig    =  loadStrings("ulysses.txt");      // load full text
  String   uJoined  =  join(uOrig, " ");                // join all of the lines together within the array into one non-array string
  uJoined           =  uJoined.toLowerCase();           // convert this string to lowercase
  uChap             =  split(uJoined, "//");            // split this string into arrays based on chapter divisions
}

void initBarHeights()
{
  // set what the height of each row of bars should be based on chapter length
  for (int i = 0; i < barHeights.length; i++)
  {
    barHeights[i]  = uChap[i+1].length()/barFactor;
  }
}


// loop starts at the position 0 of the first chapter segment
// the new index is the last position of the word plus the number of letters of the word - the new point at which to begin searching
// as long as this value is greater than 0 (as long as there is an occurrence of the word - if not it would return -1)
// count up to keep track of the number of times the loop goes, which is the number of times the word appears
// set up the wordBar class for each chapter - each one gets a separate row
void wordInq() 
{
  for (int i = 0; i < barHeights.length; i++)
  {
    yPos        = yPos + barHeight + 5; 
    barHeight   = barHeights[i];
    index       = ((uChap[i+1].length()/100)*i);
    for (int j = 0; j < 100; j++)
    {
      countBlind = 0;
      countDeaf  = 0;
      xPos       =  (width - (width - 175)) + 4*j;
      while ( (uChap[i+1].indexOf ("blind", index) >= 0) && (uChap[i+1].indexOf ("blind", index) < uChap[i+1].length()/100*(j+1)))
      {
        countBlind++;
        index = uChap[i+1].indexOf("blind", index) + 5;
      } 
      barAlph = map(countBlind, 0, factor, 255, 0);
      uBarsBlind[i][j] = new wordBar();
      uBarsBlind[i][j].init(r, g, b, xPos, yPos + 60, barHeight, barAlph);
      while ( (uChap[i+1].indexOf ("silence", index) >= 0) && (uChap[i+1].indexOf ("silence", index) < uChap[i+1].length()/100*(j+1)))
      {
        countDeaf++;
        index = uChap[i+1].indexOf("silence", index) + 7;
      }
      barAlph = map(countDeaf, 0, factor, 255, 0);
      uBarsDeaf[i][j] = new wordBar();
      uBarsDeaf[i][j].init(r, g, b, xPos, yPos + 60, barHeight, barAlph);
      barAlph = map((countBlind + countDeaf), 0, factor-3, 255, 0);
      uBars[i][j] = new wordBar();
      uBars[i][j].init(r, g, b, xPos, yPos + 60, barHeight, barAlph);
    }
  }
}

void titlePrint()
{
  uTitles  = ("Telemachus,Nestor,Proteus,Calypso,Lotus Eaters,Hades,Aeolus,Lestrygonians,Scylla and Charybdis,Wandering Rocks,Sirens,Cyclops,Nausicaa,Oxen of the Sun,Circe,Eumaeus,Ithaca,Penelope").toUpperCase();
  uTitle   = split(uTitles, ",");
  yPos = 0;
  for (int i = 0; i < uTitle.length; i++)
  {
    fill(200, 200, 203);
    textFont(font, 9);
    xPos = width - (width - 20);
    yPos = yPos + barHeights[i] + 5;
    text(uTitle[i], xPos, (yPos - (barHeights[i] - 7)) + 60);
  }
}


