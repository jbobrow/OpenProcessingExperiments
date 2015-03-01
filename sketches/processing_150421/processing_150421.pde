
/* @pjs pauseOnBlur="true"; */

// Talking Robot
// Steve Tiffany, 2012, proc.js version 2014
// Demonstrates lip sync in a moving blend morph.

// HTML 5 audio, no library, whopping 6-word vocabulary
Audio[] the = new Audio();
Audio[] dog = new Audio();
Audio[] is = new Audio();
Audio[] inn = new Audio(); // avoid keyword 'in'
Audio[] orange = new Audio();
Audio[] marmalade = new Audio();
Audio[] word = new Audio[6]; // put word samples in an array
String fileExt;

int[][] mouths = new int [6][15]; // number of words, max num+shape+wait data per word
int[][] sent = new int [11][9]; //number of sentences, max words per sentence
int[] sentID = new int [11]; // identifying number of each sentence -- gets shuffled
color[] bg = {#0266FC,#ff5700,#95cc16,#dc6e00,#444ab4,#3c8000,#e8c506,#00a8c4};

PGraphics curtain;
boolean newSent = true;
boolean newPerformance = true;
boolean curtainOpening = true;
boolean curtainClosing = false;
boolean betweenSentences = true;
boolean mouthStillOpen = false; 
int sentNum, sentCounter, wordCounter, mouthCounter, numWords;
int wordNum, numMouths, mouthNum, prevMouthNum;
int waitress, startTime, mouthShutTime;
int x,y,xspeed,yspeed,xkitchen,ykitchen,xtable,ytable;
int leftCurtainX, rightCurtainX, curtainWaitress;
int bgColor, prevbg;

void setup() {
  size(640,480); 
  frameRate(30);
  smooth();
  // detect which extension we ought to use
  if (the.canPlayType && the.canPlayType("audio/ogg")) {
    fileExt = ".ogg";
  } else {
    fileExt = ".m4a";
  }
  //loads the audio file and appends the file extension
  the.setAttribute("src","the"+fileExt);
  dog.setAttribute("src","dog"+fileExt);
  is.setAttribute("src","is"+fileExt);
  inn.setAttribute("src","in"+fileExt);
  orange.setAttribute("src","orange"+fileExt);
  marmalade.setAttribute("src","marmalade"+fileExt);
  word[0] = the;
  word[1] = dog;
  word[2] = is;
  word[3] = inn;
  word[4] = orange;
  word[5] = marmalade;
   
   // first number is the number of mouths needed to lip sync this word, then:
   // 1st mouth, then number of milliseconds to show 1st mouth, then
   // 2nd mouth, then number of milliseconds to show 2nd mouth, etc.
   mouths[0]=new int[]{2,0,105,5,306}; // the
   mouths[1]=new int[]{3,1,87,4,237,1,238}; // dog
   mouths[2]=new int[]{2,2,174,1,174}; // is
   mouths[3]=new int[]{2,2,216,1,245}; // in
   mouths[4]=new int[]{2,4,284,1,337}; // orange
   mouths[5]=new int[]{7,7,129,2,64,7,129,2,78,8,154,2,172,1,100}; // marmalade
   
   // sentence as integer array... 
   // each number is the number of the sound sample of that word, e.g. word[0] = "the"
   sent[0]=new int[]{0,1,2,3,0,5,7}; //  The dog is in the marmalade. 
   sent[1]=new int[]{0,5,2,3,0,1,7}; //  The marmalade is in the dog. 
   sent[2]=new int[]{0,1,2,4,7}; //  The dog is orange. 
   sent[3]=new int[]{5,2,4,7}; //  Marmalade is orange. 
   sent[4]=new int[]{0,1,3,0,5,2,0,4,1,7}; //  The dog in the marmalade is the orange dog. 
   sent[5]=new int[]{0,5,2,4,5,7}; //  The marmalade is orange marmalade. 
   sent[6]=new int[]{0,4,1,2,0,5,1,7}; //  The orange dog is the marmalade dog. 
   sent[7]=new int[]{4,2,3,4,5,7}; //  Orange is in orange marmalade. 
   sent[8]=new int[]{0,4,3,0,1,2,4,5,7}; //  The orange in the dog is orange marmalade. 
   sent[9]=new int[]{0,4,1,2,3,0,4,5,7}; //  The orange dog is in the orange marmalade. 
   sent[10]=new int[]{0,4,5,2,3,0,4,1,7}; //  The orange marmalade is in the orange dog. 
 
   sentID = new int[]{0,1,2,3,4,5,6,7,8,9,10};
   
   int c = 30; int cstep = 13; // make the curtains
   curtain = createGraphics(320, 480, JAVA2D);
   curtain.beginDraw();
   curtain.colorMode(HSB);
   for (int i=0; i<320; i++) {
     //curtain.stroke(234,240,c);
     curtain.stroke(14,240,c);
     curtain.line(i,0,i,480);
     c+=cstep; 
     if (c>240) {cstep = -13;}
     if (c<30) {cstep = 13;}
   }
   curtain.endDraw();
   
   x = int(random(300,340)); y = 360;
   xkitchen = x; ykitchen = y;
   if (x>width/2) {
     xtable = int(random(width*0.25));
     xspeed = int(random(2,4));
   } else {
     xtable = int(random(width*0.75, width));
     xspeed = int(random(-2,-4));
   }
   ytable = int(random(height/2));
   yspeed = int(random(-2,2));
   leftCurtainX=0; rightCurtainX=320;
   bgColor = 0;
   mouthNum=7;
   waitress=millis()+3000;
}

void draw() { 
  int currtime = millis();
  if (curtainOpening==true) {
    leftCurtainX -= 4; rightCurtainX += 4;
    if (leftCurtainX<-320) {curtainOpening = false;}
  }
  if (curtainClosing==true) {
    leftCurtainX += 4; rightCurtainX -= 4;
    if (leftCurtainX>0 ) {
      leftCurtainX = 0; rightCurtainX = 320; 
      if (currtime>curtainWaitress) {
        curtainClosing = false; curtainOpening = true;
        prevbg = bgColor;
        while (prevbg == bgColor) {
          bgColor = int(random(8));
        }
      }
    }
  }
  // Want to perform sentences in random order but with no repeats, so use...
  if (newPerformance) { // Knuth shuffle, a.k.a. Fisher-Yates shuffle
    for (int i=sentID.length-1; i>0; i--) { // working up from the bottom of the list
      int j = int(random(0,i)); // j is a random number between 0 and number of remaining elements
      int hold = sentID[j]; // switch the random number j with the bottom unshuffled element
      sentID[j] = sentID[i];
      sentID[i] = hold;
    }
    sentCounter = 0;
    newPerformance = false;
  }
  if (mouthStillOpen && currtime>mouthShutTime) {mouthNum = 7; mouthStillOpen = false;}
  if (newSent && currtime>waitress) {
    // sentence order is determined at the start of the 11-sentence "performance"
    sentNum = sentID[sentCounter]; 
    wordCounter = 0; mouthCounter = 0; 
    wordNum = sent[sentNum][wordCounter];
    numMouths = mouths[wordNum][mouthCounter];
  // begin audio
    word[wordNum].play(); // play sample
    mouthCounter++; // ready to read first mouthshape
    mouthNum = mouths[wordNum][mouthCounter];
    mouthCounter++; // ready to read first wait time, use it to set waitress
    waitress = currtime + mouths[wordNum][mouthCounter];
    newSent = false; 
    betweenSentences = false; 
  } else { // it's not a new sentence this time through, so you don't really need
    // to do anything yet unless it's done displaying the current mouth
    if (currtime>waitress) { // and then you need to do the next mouth...
      mouthCounter++;
      if (mouthCounter<(numMouths*2)) { //  *2 because there's (1) shape and (1) wait time
        mouthNum = mouths[wordNum][mouthCounter]; // read mouth shape,
         mouthCounter++; // in preparation of reading that shape's wait time...
        waitress = currtime + mouths[wordNum][mouthCounter];
      } else { // you've read all the mouth shapes for this word
        wordCounter++; // go on to the next word
        wordNum = sent[sentNum][wordCounter];
        if (wordNum<6) {
          mouthCounter = 0; // reset because it's a new word
          numMouths = mouths[wordNum][mouthCounter];
          word[wordNum].play(); // play the sample
          mouthCounter++; // ready to read this mouthshape
          prevMouthNum = mouthNum;
          mouthNum = mouths[wordNum][mouthCounter];
          mouthCounter++; // ready to read this word's first wait time 
          waitress = currtime + mouths[wordNum][mouthCounter];
        } else if (wordNum==6) { // it's a comma
          // (no commas in this program)
          waitress = currtime + 300;
        } else if (wordNum==7) { // it's a period, so start a new sentence
          // want it to pick a new x/y location, and then smoothly go to it
          // between sentences.  Like a waitress, start at kitchen, go to table
          startTime = currtime; 
          waitress = currtime + int(random(700,900));
          mouthStillOpen = true; 
          mouthShutTime = currtime + 150; // close mouth later
          xkitchen = x; ykitchen = y;
          if (x>width/2) {
            xtable = int(random(width*0.25));
            xspeed = int(random(3,5));
          } else {
            xtable = int(random(width*0.75, width));
            xspeed = int(random(-3,-5));
          }
          ytable = int(random(height/2));
          yspeed = int(random(-3,3));
          betweenSentences = true;
          newSent = true;
          sentCounter++;
          if (sentCounter>=sentID.length) {
            newPerformance = true; 
            // it has said every sentence once, so close curtain 
            waitress = currtime + 7000; 
            curtainWaitress = currtime + 5000;
            curtainClosing=true;
          }
        }
      }
    }
  }
  background(bg[bgColor]);
  robot();
  if (curtainOpening==true || curtainClosing==true) {
    image(curtain, leftCurtainX, 0);
    image(curtain, rightCurtainX, 0);
  }
}

void robot() {
  setXY();
  strokeWeight(2); stroke(0);
  fill(215);
  beginShape(); // chest -- shapes made in Blend Morph Coder
  curveVertex(map(x,0,width,232,216), map(y,0,height,541,531));
  curveVertex(map(x,0,width,163,181), map(y,0,height,420,416));
  curveVertex(map(x,0,width,200,231), map(y,0,height,387,393));
  curveVertex(map(x,0,width,424,456), map(y,0,height,392,401));
  curveVertex(map(x,0,width,454,476), map(y,0,height,417,430));
  curveVertex(map(x,0,width,417,420), map(y,0,height,537,540));
  curveVertex(map(x,0,width,232,216), map(y,0,height,541,531));
  curveVertex(map(x,0,width,163,181), map(y,0,height,420,416));
  curveVertex(map(x,0,width,200,231), map(y,0,height,387,393));
  endShape();
  fill(190);
  beginShape(); // chest top
  curveVertex(map(x,0,width,166,184), map(y,0,height,390,390));
  curveVertex(map(x,0,width,309,327), map(y,0,height,369,360));
  curveVertex(map(x,0,width,453,484), map(y,0,height,394,402));
  curveVertex(map(x,0,width,378,420), map(y,0,height,418,437));
  curveVertex(map(x,0,width,215,251), map(y,0,height,422,434));
  curveVertex(map(x,0,width,166,184), map(y,0,height,390,390));
  curveVertex(map(x,0,width,309,327), map(y,0,height,369,360));
  curveVertex(map(x,0,width,453,484), map(y,0,height,394,402));
  endShape();
  fill(215);
  beginShape(); // left arm
  curveVertex(map(x,0,width,139,135), map(y,0,height,505,517));
  curveVertex(map(x,0,width,127,151), map(y,0,height,427,427));
  curveVertex(map(x,0,width,146,171), map(y,0,height,425,425));
  curveVertex(map(x,0,width,157,150), map(y,0,height,517,527));
  curveVertex(map(x,0,width,139,135), map(y,0,height,505,517));
  curveVertex(map(x,0,width,127,151), map(y,0,height,427,427));
  curveVertex(map(x,0,width,146,171), map(y,0,height,425,425));
  endShape();
  beginShape(); // right arm
  curveVertex(map(x,0,width,496,499), map(y,0,height,511,516));
  curveVertex(map(x,0,width,470,495), map(y,0,height,424,424));
  curveVertex(map(x,0,width,490,517), map(y,0,height,422,422));
  curveVertex(map(x,0,width,515,512), map(y,0,height,516,520));
  curveVertex(map(x,0,width,496,499), map(y,0,height,511,516));
  curveVertex(map(x,0,width,470,495), map(y,0,height,424,424));
  curveVertex(map(x,0,width,490,517), map(y,0,height,422,422));
  endShape();
  fill(235);
  beginShape(); // left shoulder
  curveVertex(map(x,0,width,111,139), map(y,0,height,420,415));
  curveVertex(map(x,0,width,141,165), map(y,0,height,383,376));
  curveVertex(map(x,0,width,173,203), map(y,0,height,391,393));
  curveVertex(map(x,0,width,149,173), map(y,0,height,450,450));
  curveVertex(map(x,0,width,111,139), map(y,0,height,420,415));
  curveVertex(map(x,0,width,141,165), map(y,0,height,383,376));
  curveVertex(map(x,0,width,173,203), map(y,0,height,391,393));
  endShape();
  beginShape(); // right shoulder
  curveVertex(map(x,0,width,441,470), map(y,0,height,398,405));
  curveVertex(map(x,0,width,477,507), map(y,0,height,382,379));
  curveVertex(map(x,0,width,508,534), map(y,0,height,420,416));
  curveVertex(map(x,0,width,469,495), map(y,0,height,443,447));
  curveVertex(map(x,0,width,441,470), map(y,0,height,398,405));
  curveVertex(map(x,0,width,477,507), map(y,0,height,382,379));
  curveVertex(map(x,0,width,508,534), map(y,0,height,420,416));
  endShape();
  fill(210);
  beginShape(); // neck
  curveVertex(map(x,0,width,289,319), map(y,0,height,381,392));
  curveVertex(map(x,0,width,281,322), map(y,0,height,293,309));
  curveVertex(map(x,0,width,312,352), map(y,0,height,292,305));
  curveVertex(map(x,0,width,321,347), map(y,0,height,389,395));
  curveVertex(map(x,0,width,289,319), map(y,0,height,381,392));
  curveVertex(map(x,0,width,281,322), map(y,0,height,293,309));
  curveVertex(map(x,0,width,312,352), map(y,0,height,292,305));
  endShape();
  fill(225);
  beginShape(); // head
  curveVertex(map(x,0,width,197,255), map(y,0,height,277,300));
  curveVertex(map(x,0,width,181,250), map(y,0,height,119,137));
  curveVertex(map(x,0,width,192,268), map(y,0,height,75,89));
  curveVertex(map(x,0,width,348,417), map(y,0,height,70,86));
  curveVertex(map(x,0,width,368,435), map(y,0,height,83,107));
  curveVertex(map(x,0,width,375,428), map(y,0,height,206,206));
  curveVertex(map(x,0,width,359,408), map(y,0,height,305,314));
  curveVertex(map(x,0,width,247,315), map(y,0,height,328,338));
  curveVertex(map(x,0,width,197,255), map(y,0,height,277,300));
  curveVertex(map(x,0,width,181,250), map(y,0,height,119,137));
  curveVertex(map(x,0,width,192,268), map(y,0,height,75,89));
  endShape();
  fill(190);
  beginShape(); // head top
  curveVertex(map(x,0,width,177,251), map(y,0,height,79,94));
  curveVertex(map(x,0,width,272,323), map(y,0,height,61,61));
  curveVertex(map(x,0,width,367,436), map(y,0,height,69,88));
  curveVertex(map(x,0,width,244,376), map(y,0,height,85,125));
  curveVertex(map(x,0,width,177,251), map(y,0,height,79,94));
  curveVertex(map(x,0,width,272,323), map(y,0,height,61,61));
  curveVertex(map(x,0,width,367,436), map(y,0,height,69,88));
  endShape();
  fill(235);
  beginShape(); // beacon
  curveVertex(map(x,0,width,227,320), map(y,0,height,64,82));
  curveVertex(map(x,0,width,247,338), map(y,0,height,25,37));
  curveVertex(map(x,0,width,283,370), map(y,0,height,26,36));
  curveVertex(map(x,0,width,297,387), map(y,0,height,63,83));
  curveVertex(map(x,0,width,261,359), map(y,0,height,71,100));
  curveVertex(map(x,0,width,227,320), map(y,0,height,64,82));
  curveVertex(map(x,0,width,247,338), map(y,0,height,25,37));
  curveVertex(map(x,0,width,283,370), map(y,0,height,26,36));
  endShape();
  fill(250);
  beginShape(); // left eye
  curveVertex(map(x,0,width,194,287), map(y,0,height,176,197));
  curveVertex(map(x,0,width,213,314), map(y,0,height,148,170));
  curveVertex(map(x,0,width,236,336), map(y,0,height,173,193));
  curveVertex(map(x,0,width,214,315), map(y,0,height,205,224));
  curveVertex(map(x,0,width,194,287), map(y,0,height,176,197));
  curveVertex(map(x,0,width,213,314), map(y,0,height,148,170));
  curveVertex(map(x,0,width,236,336), map(y,0,height,173,193));
  endShape();
  beginShape(); // right eye
  curveVertex(map(x,0,width,284,376), map(y,0,height,172,191));
  curveVertex(map(x,0,width,307,398), map(y,0,height,144,164));
  curveVertex(map(x,0,width,339,417), map(y,0,height,171,188));
  curveVertex(map(x,0,width,315,396), map(y,0,height,197,219));
  curveVertex(map(x,0,width,284,376), map(y,0,height,172,191));
  curveVertex(map(x,0,width,307,398), map(y,0,height,144,164));
  curveVertex(map(x,0,width,339,417), map(y,0,height,171,188));
  endShape();
  fill(121,87,22);
  beginShape(); // left pupil
  curveVertex(map(x,0,width,207,308), map(y,0,height,177,203));
  curveVertex(map(x,0,width,205,310), map(y,0,height,168,189));
  curveVertex(map(x,0,width,218,324), map(y,0,height,167,190));
  curveVertex(map(x,0,width,220,321), map(y,0,height,177,203));
  curveVertex(map(x,0,width,207,308), map(y,0,height,177,203));
  curveVertex(map(x,0,width,205,310), map(y,0,height,168,189));
  curveVertex(map(x,0,width,218,324), map(y,0,height,167,190));
  endShape();
  beginShape(); // right pupil
  curveVertex(map(x,0,width,303,394), map(y,0,height,173,199));
  curveVertex(map(x,0,width,302,394), map(y,0,height,162,184));
  curveVertex(map(x,0,width,319,404), map(y,0,height,162,185));
  curveVertex(map(x,0,width,319,404), map(y,0,height,171,200));
  curveVertex(map(x,0,width,303,394), map(y,0,height,173,199));
  curveVertex(map(x,0,width,302,394), map(y,0,height,162,184));
  curveVertex(map(x,0,width,319,404), map(y,0,height,162,185));
  endShape();
  fill(190);
  beginShape(); // nose
  curveVertex(map(x,0,width,238,351), map(y,0,height,209,238));
  curveVertex(map(x,0,width,247,353), map(y,0,height,185,212));
  curveVertex(map(x,0,width,260,364), map(y,0,height,184,211));
  curveVertex(map(x,0,width,262,375), map(y,0,height,209,239));
  curveVertex(map(x,0,width,238,351), map(y,0,height,209,238));
  curveVertex(map(x,0,width,247,353), map(y,0,height,185,212));
  curveVertex(map(x,0,width,260,364), map(y,0,height,184,211));
  endShape();
  fill(167);
  beginShape(); // left upper eyelid
  curveVertex(map(x,0,width,191,283), map(y,0,height,169,189));
  curveVertex(map(x,0,width,216,317), map(y,0,height,138,160));
  curveVertex(map(x,0,width,240,340), map(y,0,height,166,190));
  curveVertex(map(x,0,width,216,317), map(y,0,height,158,180));
  curveVertex(map(x,0,width,191,283), map(y,0,height,169,189));
  curveVertex(map(x,0,width,216,317), map(y,0,height,138,160));
  curveVertex(map(x,0,width,240,340), map(y,0,height,166,190));
  endShape();
  beginShape(); // right upper eyelid
  curveVertex(map(x,0,width,280,371), map(y,0,height,164,187));
  curveVertex(map(x,0,width,309,398), map(y,0,height,136,159));
  curveVertex(map(x,0,width,339,421), map(y,0,height,162,186));
  curveVertex(map(x,0,width,309,398), map(y,0,height,156,175));
  curveVertex(map(x,0,width,280,371), map(y,0,height,164,187));
  curveVertex(map(x,0,width,309,398), map(y,0,height,136,159));
  curveVertex(map(x,0,width,339,421), map(y,0,height,162,186));
  endShape();
  beginShape(); // left lower eyelid
  curveVertex(map(x,0,width,194,289), map(y,0,height,189,214));
  curveVertex(map(x,0,width,237,333), map(y,0,height,189,213));
  curveVertex(map(x,0,width,215,313), map(y,0,height,211,230));
  curveVertex(map(x,0,width,194,289), map(y,0,height,189,214));
  curveVertex(map(x,0,width,237,333), map(y,0,height,189,213));
  curveVertex(map(x,0,width,215,313), map(y,0,height,211,230));
  endShape();
  beginShape(); // right lower eyelid
  curveVertex(map(x,0,width,286,374), map(y,0,height,183,209));
  curveVertex(map(x,0,width,340,418), map(y,0,height,182,208));
  curveVertex(map(x,0,width,315,391), map(y,0,height,202,228));
  curveVertex(map(x,0,width,286,374), map(y,0,height,183,209));
  curveVertex(map(x,0,width,340,418), map(y,0,height,182,208));
  curveVertex(map(x,0,width,315,391), map(y,0,height,202,228));
  endShape();
  fill(90);
  if (mouthNum==-1) {mouthNum = prevMouthNum;} // delays the "O" 
  // mouth in "orange" which otherwise looks like it's happening during
  // the previous word
  switch(mouthNum) { // determined in draw()
    case 0: 
      beginShape(); // rest mouth -- slightly open
      curveVertex(map(x,0,width,236,333), map(y,0,height,256,278));
      curveVertex(map(x,0,width,261,360), map(y,0,height,253,276));
      curveVertex(map(x,0,width,291,383), map(y,0,height,255,279));
      curveVertex(map(x,0,width,260,360), map(y,0,height,260,282));
      curveVertex(map(x,0,width,236,333), map(y,0,height,256,278));
      curveVertex(map(x,0,width,261,360), map(y,0,height,253,276));
      curveVertex(map(x,0,width,291,383), map(y,0,height,255,279));
      endShape();
      break;
   case 1:
      beginShape(); // etc mouth -- for most consonants
      curveVertex(map(x,0,width,232,329), map(y,0,height,255,277));
      curveVertex(map(x,0,width,257,363), map(y,0,height,250,275));
      curveVertex(map(x,0,width,296,386), map(y,0,height,254,277));
      curveVertex(map(x,0,width,260,363), map(y,0,height,263,287));
      curveVertex(map(x,0,width,232,329), map(y,0,height,255,277));
      curveVertex(map(x,0,width,257,363), map(y,0,height,250,275));
      curveVertex(map(x,0,width,296,386), map(y,0,height,254,277));
      endShape();
      break;
   case 2: 
      beginShape(); // AI mouth
      curveVertex(map(x,0,width,229,323), map(y,0,height,256,277));
      curveVertex(map(x,0,width,256,365), map(y,0,height,239,265));
      curveVertex(map(x,0,width,297,387), map(y,0,height,254,277));
      curveVertex(map(x,0,width,255,365), map(y,0,height,280,302));
      curveVertex(map(x,0,width,229,323), map(y,0,height,256,277));
      curveVertex(map(x,0,width,256,365), map(y,0,height,239,265));
      curveVertex(map(x,0,width,297,387), map(y,0,height,254,277));
      endShape();   
      break;
//    case 3: // not used by these 6 words
//      beginShape(); // WQ mouth
//      curveVertex(map(x,0,width,243,354), map(y,0,height,266,291));
//      curveVertex(map(x,0,width,254,368), map(y,0,height,258,282));
//      curveVertex(map(x,0,width,268,377), map(y,0,height,267,290));
//      curveVertex(map(x,0,width,255,368), map(y,0,height,277,300));
//      curveVertex(map(x,0,width,243,354), map(y,0,height,266,291));
//      curveVertex(map(x,0,width,254,368), map(y,0,height,258,282));
//      curveVertex(map(x,0,width,268,377), map(y,0,height,267,290));
//      endShape();
//      break;
   case 4: 
      beginShape(); // O mouth
      curveVertex(map(x,0,width,239,349), map(y,0,height,257,280));
      curveVertex(map(x,0,width,251,367), map(y,0,height,240,266));
      curveVertex(map(x,0,width,269,379), map(y,0,height,256,280));
      curveVertex(map(x,0,width,254,366), map(y,0,height,278,301));
      curveVertex(map(x,0,width,239,349), map(y,0,height,257,280));
      curveVertex(map(x,0,width,251,367), map(y,0,height,240,266));
      curveVertex(map(x,0,width,269,379), map(y,0,height,256,280));
      endShape(); 
      break;
   case 5: 
      beginShape(); // E  mouth
      curveVertex(map(x,0,width,229,325), map(y,0,height,253,275));
      curveVertex(map(x,0,width,260,366), map(y,0,height,244,269));
      curveVertex(map(x,0,width,307,391), map(y,0,height,251,274));
      curveVertex(map(x,0,width,257,363), map(y,0,height,269,294));
      curveVertex(map(x,0,width,229,325), map(y,0,height,253,275));
      curveVertex(map(x,0,width,260,366), map(y,0,height,244,269));
      curveVertex(map(x,0,width,307,391), map(y,0,height,251,274));
      endShape();
      break;
//   case 6: // not used
//      beginShape(); // FV mouth
//      curveVertex(map(x,0,width,232,330), map(y,0,height,251,275));
//      curveVertex(map(x,0,width,258,362), map(y,0,height,244,269));
//      curveVertex(map(x,0,width,296,387), map(y,0,height,250,275));
//      curveVertex(map(x,0,width,258,364), map(y,0,height,252,276));
//      curveVertex(map(x,0,width,232,330), map(y,0,height,251,275));
//      curveVertex(map(x,0,width,258,362), map(y,0,height,244,269));
//      curveVertex(map(x,0,width,296,387), map(y,0,height,250,275));
//      endShape();
//      break;
   case 7:
      beginShape(); // MBP mouth
      curveVertex(map(x,0,width,232,331), map(y,0,height,255,277));
      curveVertex(map(x,0,width,258,366), map(y,0,height,254,278));
      curveVertex(map(x,0,width,296,386), map(y,0,height,254,277));
      curveVertex(map(x,0,width,258,365), map(y,0,height,256,280));
      curveVertex(map(x,0,width,232,331), map(y,0,height,255,277));
      curveVertex(map(x,0,width,258,366), map(y,0,height,254,278));
      curveVertex(map(x,0,width,296,386), map(y,0,height,254,277));
      endShape();
      break;
   case 8: 
      beginShape(); // L mouth
      curveVertex(map(x,0,width,238,334), map(y,0,height,258,280));
      curveVertex(map(x,0,width,256,367), map(y,0,height,235,262));
      curveVertex(map(x,0,width,287,380), map(y,0,height,260,283));
      curveVertex(map(x,0,width,256,365), map(y,0,height,273,294));
      curveVertex(map(x,0,width,238,334), map(y,0,height,258,280));
      curveVertex(map(x,0,width,256,367), map(y,0,height,235,262));
      curveVertex(map(x,0,width,287,380), map(y,0,height,260,283));
      endShape();
      fill(150);
      beginShape(); // tongue
      curveVertex(map(x,0,width,244,348), map(y,0,height,247,271));
      curveVertex(map(x,0,width,256,366), map(y,0,height,235,262));
      curveVertex(map(x,0,width,275,374), map(y,0,height,247,273));
      curveVertex(map(x,0,width,273,349), map(y,0,height,259,282));
      curveVertex(map(x,0,width,244,348), map(y,0,height,247,271));
      curveVertex(map(x,0,width,256,366), map(y,0,height,235,262));
      curveVertex(map(x,0,width,275,374), map(y,0,height,247,273));
      endShape();
     break;
//   case 9:  // not used
//      beginShape(); // U mouth
//      curveVertex(map(x,0,width,239,349), map(y,0,height,259,286));
//      curveVertex(map(x,0,width,255,366), map(y,0,height,249,275));
//      curveVertex(map(x,0,width,276,380), map(y,0,height,257,287));
//      curveVertex(map(x,0,width,256,366), map(y,0,height,269,296));
//      curveVertex(map(x,0,width,239,349), map(y,0,height,259,286));
//      curveVertex(map(x,0,width,255,366), map(y,0,height,249,275));
//      curveVertex(map(x,0,width,276,380), map(y,0,height,257,287));
//      endShape();
//      break;
  }
}

void setXY() { // the x,y coordinates control the movement of the robot's head 
  if (betweenSentences) {
    int currtime = millis();
    x = int(map(currtime,startTime,waitress,xkitchen,xtable));
    y = int(map(currtime,startTime,waitress,ykitchen,ytable));
  } else {
    x = x + xspeed;
    if (x>width) {xspeed = int(random(-5,-8));}
    if (x<0) {xspeed = int(random(4,6));}
    y = y + yspeed;
    if (y>height) {yspeed = int(random(-2,-4));}
    if (y<0) {yspeed = int(random(2,4));}
  }
}

void stop() {
   // borrowed from Minim
   for (int i=0; i<6; i++) {
     word[i].close();
   }
   super.stop(); // necessary cleanup
}



