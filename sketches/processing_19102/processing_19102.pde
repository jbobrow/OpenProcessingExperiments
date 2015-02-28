
/*
Processing Tag Cloud Demo, using
MCavallo's OpenCloud Library
>> http://opencloud.mcavallo.org/
>> http://sourceforge.net/users/mcavallo

Developed using Processing 1.2.1, http://processing.org/
Using the text from Dr. Suess's "Green Eggs and Ham".
Press the mouse to see the words reorganized. 

To recompile this Processing sketch: 
(1) In your sketch folder, create a folder called "code".
Inside the code folder, place the "opencloud.jar" file which comes in:
http://sourceforge.net/projects/opencloud/files/OpenCloud/0.2/opencloud.zip
(2) In your sketch folder, create a folder called "data". 
Put the "green_eggs_and_ham.txt" file there.
*/

import org.mcavallo.opencloud.*;

Cloud  cloud;
String greenEggsAndHam[];
float  maxWordDisplaySize = 60.0;

//================================================================
void setup() {
  size (400,300); 

  // create a tagCloud object
  cloud = new Cloud(); // create cloud 
  cloud.setMaxWeight(maxWordDisplaySize); // max font size 
  cloud.setMaxTagsToDisplay (50);

  // Load the text file
  greenEggsAndHam = loadStrings("green_eggs_and_ham.txt"); 
  int nLines = greenEggsAndHam.length;
  for (int i=0; i<nLines; i++) {
    int nChars = greenEggsAndHam[i].length();
    if (nChars > 0) {
      String lineWords[] = split(greenEggsAndHam[i], " ");
      int nLineWords = lineWords.length;
      for (int j=0; j<nLineWords; j++) {
        String aWord = lineWords[j];

        // simple filter to remove trailing punctuation
        if (aWord.endsWith(".") || aWord.endsWith(",") || aWord.endsWith("!") || aWord.endsWith("?")) {
          aWord = aWord.substring(0, aWord.length()-1);
        }
        cloud.addTag(new Tag(aWord));
      }
    }
  }
}

//================================================================
void draw() {
  background(0);

  List tags = cloud.tags();
  int nTags = tags.size();
  if (!mousePressed) {
    // Sort the tags in reverse order of size.
    tags = cloud.tags(new Tag.ScoreComparatorDesc());
  } 
  
  float xMargin = 30;
  float ySpacing = 40;
  float xPos = xMargin; // initial x position
  float yPos = 60;      // initial y position
  for (int i=0; i<nTags; i++) {

    // Fetch each tag and its properties.
    // Compute its display size based on its tag cloud "weight";
    // Then reshape the display size non-linearly, for display purposes. 
    Tag aTag = (Tag) tags.get(i);
    String tName = aTag.getName();
    float tWeight = (float) aTag.getWeight();
    float wordSize =  maxWordDisplaySize * ( pow (tWeight/maxWordDisplaySize, 0.6));
    
    // Draw the word
    textSize(wordSize);
    fill ((i%2)*255,160,(1-(i%2))*255); // alternate blue and orange words.
    text (tName, xPos,yPos);

    // Advance the writing position.
    xPos += textWidth (tName) + 2.0;
    if (xPos > (width - (xMargin*2))) {
      xPos  = xMargin;
      yPos += ySpacing;
    }
  }
}


