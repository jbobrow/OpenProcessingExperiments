
import ddf.minim.*;
import rita.*;

// PDAL Assignment 2: Revamped Self-Portrait by Miranda Steele
  
int letterInt=0, lineInt=0, x=28, y=40, upCounter = 0, numClips=12;
boolean finishedLine = true, clickedToStart=false;
RiText[] letters, lines;
RiText start;
PFont font;
Minim minim;
AudioSnippet[] mks, miranda, full, workingSnips;

void setup() {
  size(600, 560);
  frameRate(4);
  
  //Setting up the font
  font = loadFont("LiSongPro-24.vlw");
  RiText.setDefaultFont("LiSongPro-24.vlw");
  
  //Loading the diary entry from the separate text file
  lines = RiText.createLinesFromFile(this, "entry.txt", x, y, 26);

  //Setting up the text on the opening screen
  start = new RiText(this, "dear diar_");
  
  //Setting up minim & the arrays of AudioSnippets
  minim = new Minim(this);
  mks = new AudioSnippet[numClips];
  miranda = new AudioSnippet[numClips];
  full = new AudioSnippet[numClips];
  
  
  //Loading all of the snippets into the arrays
  for(int i=0; i<numClips-1; i++){
    mks[i] = minim.loadSnippet("mks"+i+".wav");
    miranda[i] = minim.loadSnippet("miranda"+i+".wav");
    full[i] = minim.loadSnippet("full"+i+".wav");
  }
}

void draw() {
  background(0);
  if(!clickedToStart){
    start.setColor(255);
  }
  
  if(clickedToStart){
    if(finishedLine) {
      if(upCounter==0) {
        letters = convertMKS(lines[lineInt].getText());
        workingSnips = mks;
        finishedLine=false;
      }
      else if(upCounter==1) {
        letters = convertMiranda(lines[lineInt].getText());
        workingSnips=miranda;
        finishedLine=false;
      }
      else if(upCounter==2) {
        letters = convertFull(lines[lineInt].getText());
        workingSnips=full;
        finishedLine=false;
      }
    }

   if(lineInt==0) //playing the clip for the first line
      workingSnips[lineInt].play(); 
      
    //This part causes the letters to be displayed as if someone were typing them.
    letters[letterInt].setColor(255);
    letters[letterInt].setX(x);
    letters[letterInt].setY(y);
    if(letterInt<letters.length-1){
      letterInt++;
      x+=20;
    }
    else {
      finishedLine = true;
      y+=42;
      x=28;
      letterInt=0;
      lineInt++;
      if(lineInt<lines.length)
        workingSnips[lineInt].play();
    }

    //Making sure the program stops once all of the lines have been converted
    if(lineInt==lines.length-1){
      noLoop();
    }
  }
}


/**
 * This part allows for an increasing amount of letters to be shown (from just my
 * initials to all the letters in my full name) when the up key is pressed
 */
void keyPressed() {
   if(key == CODED && keyCode == UP){
       if(upCounter < 2){
         upCounter++;
         noLoop();
         RiText.deleteAll();
         workingSnips[lineInt].close();

         //Reinitalizing draw variables (the ints, x, y)
         letterInt=0;
         lineInt=0;
         finishedLine=true;
         x=28;
         y=40;
         //Resetting working clips to the next array of snippets
         if(upCounter==1)
           workingSnips=miranda;
         else if(upCounter==2)
           workingSnips=full;
         loop();
     }
   }
}

//Setting up clicking to start
void mouseClicked() {
  if(!clickedToStart){
    clickedToStart = true;
    start.setVisible(false);
  }
}

/**
 * Converting the diary entry into the letters of the entry with only 
 * the letters in my initials included, i.e. (m, k, s).
 */
RiText[] convertMKS(String s){
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c=='M'||c=='k'||c=='K'||c=='s'||c=='S'||c==' '||c==','||c=='!'||c=='.'||c==':'||c==')'){
      convertedS=convertedS +c;
    }
    else
        convertedS=convertedS+"_";
  }
  return RiText.createLetters(this, font, convertedS, 0, 0);
}

//Same as above, but with (m, i, r, a, n, d, k, s)
RiText[] convertMiranda(String s){
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c=='M'||c=='i'||c=='I'||c=='r'||c=='R'||c=='a'||c=='A'||c=='n'||c=='N'||c=='d'||c=='D'||c=='k'||c=='K'||c=='s'||c=='S'||c==' '||c==':'||c==')'||c==','||c=='!'||c=='.'){
      convertedS=convertedS +c;
    }
    else
      convertedS=convertedS+"_";
  }
  return RiText.createLetters(this, font, convertedS, 0, 0);
}

// Now with my fullname (m, i, r, a, n, d, k, t, h, e, s, l).
RiText[] convertFull(String s) {
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c==' '||c==','||c=='!'||c=='.'||c==':'||c==')'||c=='k'||c=='K'||c=='s'||c=='S'||c=='i'||c=='r'||c=='a'||c=='n'||c=='d'||c=='k'||c=='t'||c=='h'||c=='e'||c=='s'||c=='l'||c=='M'||c=='I'||c=='R'||c=='A'||c=='N'||c=='D'||c=='K'||c=='T'||c=='H'||c=='E'||c=='S'||c=='L'){
      convertedS=convertedS +c;
    }
    else
        convertedS=convertedS+"_";
  }
  return RiText.createLetters(this, font, convertedS, 0, 0);
}


