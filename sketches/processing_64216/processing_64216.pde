
/* litmus5_cover
   Version: 1.0, 2012-06-17
   
   Code to generate the cover image for Litmus Paper issue 5, 17 June 2012
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676
   
   *** This version is not interactive, to experiment you will need to download
   *** (I had some problem with the WordCram code, and will upload interactive
   *** version when it is fixed)

   Acknowledgement:
   * WordCram library [www.wordcram.org] by Dan Bernier
*/

import wordcram.*;

ArrayList wordsList;

void setup() {
  size(800, 800);
  smooth();

//Create the Word array from loaded frequency table of phrases
//this code derived from: http://forum.processing.org/topic/import-text-file-as-an-array
  String lines[] = loadStrings("tweets-word-frequency-final-edited.csv");
  wordsList = new ArrayList();
  for(int i = 0; i < lines.length; i++){
      String values[] = split(lines[i], "\t");
      wordsList.add( new Word(values[0], int(values[1])));
  }
  
  noLoop();
  
}

void draw() {

  //need to refresh tweetwords on every draw
  //because WordCram modifies it
  Word tweetwords[];
  tweetwords = new Word[wordsList.size()];
  wordsList.toArray(tweetwords);
  
  background(255);

  //draw the wordcram
  new WordCram(this)
  .fromWords(tweetwords)
  .withColors( color(56,146,187), color(0) )
  .withFonts("Lucida Sans Regular","Lucida Sans Demibold")
  //.withPlacer(Placers.centerClump())
  //.withPlacer(Placers.wave())  
  .withPlacer(avoidSquare())
  .withWordPadding(2)
  .sizedByWeight(10, width/12)
  .angledBetween(0,2*PI)  
  .drawAll();

  //draw the 'microchip'..
  stroke(0);
  strokeWeight(5);
  fill(255);
  //..the boundary square
  rect(3*width/8,3*width/8,width/4,width/4);
  strokeWeight(1);
  stroke(56,146,187);
  //..the circuit lines
  for (int i=1; i<25; i++) {
    line(3*width/8+(float(i)/25)*width/4, 3*width/8, 3*width/8+(float(i)/25)*width/4, 3*width/8+3*width/16);
  }
  for (int i=0; i<12; i++) {
    line(3*width/8+(float(i)/25)*width/4, 3*width/8+3*width/16, 3*width/8+(float(i+1)/25)*width/4, 3*width/8+4*width/16);
  }
  for (int i=13; i<26; i++) {
    line(3*width/8+(float(i)/25)*width/4, 3*width/8+3*width/16, 3*width/8+(float(i-1)/25)*width/4, 3*width/8+4*width/16);
  }
  
  //..the components
  stroke(0);
  fill(0);
  rect(width/2+0.5*width/16, 1.04*3*width/8, 1.2*width/16, width/8);
  rect(1.05*3*width/8,1.05*3*width/8,1.5*width/16,1.5*width/16);
  fill(56,146,187);
  rect(1.09*3*width/8,1.09*3*width/8,width/16,width/16);
  strokeWeight(10);
  line(3*width/8,3*width/8+3*width/16,3*width/8+width/4,3*width/8+3*width/16);
  line(width/2,3*width/8,width/2,3*width/8+width/4);
  ellipse(3*width/8+width/16,3*width/8+3*width/16,width/16,width/16);
  strokeWeight(2);
  stroke(56,146,187);
  for (int i=0; i<6; i++) {
    rect(width/2+0.37*width/16, 1.06*3*width/8+float(i)/7*width/7, 10, 7);
    rect(width/2+1.6*width/16, 1.06*3*width/8+float(i)/7*width/7, 10, 7);
  }
  
 println("finished");
 
 noLoop();
  
}

WordPlacer avoidSquare() {
  return new WordPlacer() {
    public PVector place(Word word, int rank, int wordCount,
                         int wordWidth, int wordHeight, 
                         int fieldWidth, int fieldHeight) {
      float x,y;
      float normalizedIndex = (float) rank / wordCount;
      float theta = normalizedIndex * 6 * TWO_PI;
      float radius = normalizedIndex * fieldWidth / 2f;
      float centerX = fieldWidth * 0.5f;
      float centerY = fieldHeight * 0.5f;
      
      x = centerX + cos(theta) * radius;
      y = centerY + sin(theta) * radius;
      
      if ((width/4 < x)&& (x<3*width/4) && (width/4 < y)&& (y<3*width/4)) {
          //println("changing radius:" + radius);
          radius = radius + 1.4*width/8 + 1.5*wordWidth;
          x = centerX + cos(theta) * radius;
          y = centerY + sin(theta) * radius;    
      }
      
      return new PVector(x, y);
    }
  };
}

/* //Not in use in this version
void keyPressed() {
  println("re-drawing...");
  redraw();
  loop();
}
*/

