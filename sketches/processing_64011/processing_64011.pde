
/* litmus1_cover
   Version: 1.0, 2012-06-13
   
   Code to generate the cover image for Litmus Paper issue 1, 13 June 2012
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676
   
   *** This version is not interactive, to experiment you will need to download
   *** (I had some problem with the WordCram code, and will upload interactive
   *** version when it is fixed)

   Acknowledgements:
   * WordCram library [www.wordcram.org] by Dan Bernier
   * Code to mask the tiling-as-brain behind the ellipse is based on:
       http://processing.org/discourse/beta/num_1229687224.html 
*/

import wordcram.*;

Word festivalprogwords[];
PImage brain;
PGraphics pgTexture;
PGraphics pgMask;
PGraphics pgShape;

void setup() {
  size(800,800);
  smooth();

  //All this code is creating an elliptical mask so that
  //the tiling-as-brain fills up the ellipse
  PImage brain = loadImage("tiling-as-brain.png");
  pgMask = createGraphics(width, height, JAVA2D);
  pgShape = createGraphics(width, height, P2D);
  // Make tiled texture
  pgTexture = createGraphics(width, height, JAVA2D);
  pgTexture.beginDraw();
  for (int x = 0; x < width; x += brain.width)
  {
    for (int y = 0; y < height; y += brain.height)
    {
      pgTexture.image(brain, x, y);
    }
  }
  pgTexture.endDraw();

  //Create the Word array from loaded frequency table of phrases
  //this code derived from: http://forum.processing.org/topic/import-text-file-as-an-array
  String lines[] = loadStrings("CF_frequencycount_test.csv");
  ArrayList words_tmp = new ArrayList();
  for(int i = 0; i < lines.length; i++){
      String values[] = split(lines[i], ",");
      words_tmp.add( new Word(values[0], int(values[1])));
  }
  festivalprogwords = new Word[words_tmp.size()];
  words_tmp.toArray(festivalprogwords);
  
  //print names of all fonts available...
  //println(PFont.list());
  
  noLoop();
}

void draw() {
  
  //make the display blank
  background(255);
  //pgShape.background(255);
  
  new WordCram(this)
    .fromWords(festivalprogwords)
    .withColors( color(241, 91, 86), color(0) )
    .withFonts("Lucida Sans Regular","Lucida Sans Demibold")
    .withPlacer(onParabola())
    .angledBetween(-PI/3,PI/4)
    .sizedByWeight(10, width/12)
    .drawAll();
  
   
  // draw "head" as ellipse
  strokeWeight(5);
  fill(255);
  ellipse(2*width/3,2*height/3, width/5, width/4);
 
  //draw "brain" inside the ellipse
  //(all this code is required to mask the brain image by an ellipse)
  pgMask.background(0);
  pgMask.fill(255);
  pgMask.noStroke();
  pgMask.beginDraw();
  pgMask.ellipse(2*width/3,2*height/3, width/5, width/4);
  pgMask.endDraw();
  PImage piMask = pgMask.get(0, 0, width, height);
  pgShape.image(pgTexture, 0, 0);
  pgShape.mask(piMask);
  image(pgShape, 0, 0);
  
 
  //print words that were not displayed and reason why
  //Word[] skippedWords = wordCram.getSkippedWords();
  //println(skippedWords); 
  
  //println("finished");
  noLoop();
}

/* NOT IN USE IN THIS VERSION
void mousePressed() {
  println("re-drawing...");
  redraw();
}

void keyPressed() {
  println("re-drawing...");
  redraw();
}
*/

WordPlacer onParabola() {
  return new WordPlacer() {
    public PVector place(Word word, int rank, int wordCount,
                         int wordWidth, int wordHeight, 
                         int fieldWidth, int fieldHeight) {
      //float x = word.weight * (2*fieldWidth/3-wordWidth);
      float x = random(1)* (2*fieldWidth/3-wordWidth);
      float y = 0.5*sq(x/17);
      return new PVector(x, y);
    }
  };
}                           


