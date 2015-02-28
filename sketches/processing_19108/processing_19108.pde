
/*
Processing Tag Cloud Demo of SubRip Subtitles.
Visualization of subtitles from "Star Wars" Episode IV.
See: 
 */

import org.mcavallo.opencloud.*;

Cloud  cloud;
String srtFilename = "star_wars_iv_a_new_hope.srt";
float  maxWordDisplaySize = 40.0;

// Important booleans which modify how we will perform the parsing. 
boolean bStripItalicChars   = true;  // Remove <i> and </i>
boolean bStripOtherChars    = true;  // Remove initial hyphens and ellipses 
boolean bStripMusicChars    = true;  // Remove #, indicating music
boolean bStripStagingChars  = false; // Remove brackets [ and ], indicating instructions
boolean bConvertToLowerCase = true;  // Convert all subtitles to lowercase

String rawSRTLines[];
int    nRawSRTLines;
int    nSubtitles;
Vector subtitleVector;


//-----------------------------------------------------------
// Different codes for subtitles.

int SUBTITLE_TYPE_SPEECH  = 0;
int SUBTITLE_TYPE_MUSIC   = 1; 
int SUBTITLE_TYPE_STAGING = 2;
int SUBTITLE_TYPE_ITALIC  = 3;
String typeStrs[] = {
  "SPEECH", "MUSIC", "STAGING", "ITALIC"
};

//-----------------------------------------------------------
// This class contains a single Subtitle: what was said when.
class SubtitleUnit {
  int    subtitleNumber;
  int    subtitleType;
  float  startTime;
  float  endTime;
  String subtitleText;

  void print() {
    String typeStr = typeStrs[subtitleType];
    println(subtitleNumber + "\t" + typeStr + "\t" + startTime + "\t" + endTime + "\t" + subtitleText);
  }
}


//================================================================
void setup() {
  size (640,640); 

  String commonWords[] = loadStrings("100MostCommonWords.txt");
  DictionaryFilter commonWordFilter = new DictionaryFilter(commonWords);
  
  // create a tagCloud object
  cloud = new Cloud(); // create cloud 
  cloud.setMaxWeight(maxWordDisplaySize); // max font size 
  cloud.setMaxTagsToDisplay (212);
  cloud.addOutputFilter (commonWordFilter);


  subtitleVector = new Vector();
  rawSRTLines    = loadStrings(srtFilename);
  nRawSRTLines   = rawSRTLines.length;

  if (nRawSRTLines > 0) {
    String prevLine = rawSRTLines[0];
    String currLine = "";
    for (int i=1; i<nRawSRTLines; i++) {
      currLine = rawSRTLines[i];
      int indexOfArrowChars = currLine.indexOf("-->");

      if (indexOfArrowChars > -1) {
        // if we're here, then currLine is a timecode line, and prevline is an ID line
        int subtitleType   = SUBTITLE_TYPE_SPEECH;
        int subtitleID     = Integer.parseInt (prevLine.trim());
        String startString = currLine.substring (0, indexOfArrowChars);
        String endString   = currLine.substring (indexOfArrowChars+4, currLine.length());
        startString        = startString.trim();
        endString          = endString.trim();

        // Extract and compute the start and end timestamps of the subtitle.
        int sH = Integer.parseInt( startString.substring(0,2));
        int sM = Integer.parseInt( startString.substring(3,5));
        int sS = Integer.parseInt( startString.substring(6,8));
        int sL = Integer.parseInt( startString.substring(9,12));
        float startTimeInSeconds = 60*60*sH + 60*sM + sS + sL/1000.0;

        int eH = Integer.parseInt( endString.substring(0,2));
        int eM = Integer.parseInt( endString.substring(3,5));
        int eS = Integer.parseInt( endString.substring(6,8));
        int eL = Integer.parseInt( endString.substring(9,12));
        float endTimeInSeconds = 60*60*eH + 60*eM + eS + eL/1000.0;

        // Subtitles might be on several lines. Search ahead to find the end.
        String subtitle = "";
        int lineNumberToStartFrom = i;
        String futureLine = currLine;
        while ((lineNumberToStartFrom<(nRawSRTLines-1)) && (futureLine.length() != 0)) {
          lineNumberToStartFrom++;

          futureLine = rawSRTLines[lineNumberToStartFrom];
          subtitle += futureLine + " ";
        }

        // Cleanup phase: clean the text.
        subtitle = subtitle.trim();
        if (bConvertToLowerCase) {
          subtitle = subtitle.toLowerCase();
        }

        //----------------------------------------
        if (subtitle.startsWith("#")) {
          subtitleType = SUBTITLE_TYPE_MUSIC;
        }
        if (subtitle.startsWith("[")) {
          subtitleType = SUBTITLE_TYPE_STAGING;
        }
        if (subtitle.startsWith("<i>")) {
          subtitleType = SUBTITLE_TYPE_ITALIC;
        }

        //----------------------------------------
        if (bStripItalicChars) {
          if (subtitle.startsWith("<i>")) {
            subtitle = subtitle.substring(3, subtitle.length());
          }
          if (subtitle.endsWith("</i>")) {
            subtitle = subtitle.substring(0, subtitle.length()-4);
          }
        }
        if (bStripOtherChars) {
          if (subtitle.startsWith("-")) {
            subtitle = subtitle.substring(1, subtitle.length());
          }
          if (subtitle.startsWith("...")) {
            subtitle = subtitle.substring(3, subtitle.length());
          }
        }
        if (bStripMusicChars) {
          if (subtitle.startsWith("#")) {
            subtitle = subtitle.substring(1, subtitle.length());
          }
          if (subtitle.endsWith("#")) {
            subtitle = subtitle.substring(0, subtitle.length()-1);
          }
        }
        if (bStripStagingChars) {
          if (subtitle.startsWith("[")) {
            subtitle = subtitle.substring(1, subtitle.length());
          }
          if (subtitle.endsWith("]")) {
            subtitle = subtitle.substring(0, subtitle.length()-1);
          }
        }
        // One more trim for good luck.
        subtitle = subtitle.trim();

        //----------------------------------------
        // Create a new Subtitle containing the above data, 
        // and append it to the Vector of subtitles. 

        SubtitleUnit SU = new SubtitleUnit();
        SU.subtitleNumber = subtitleID;
        SU.subtitleType   = subtitleType;
        SU.startTime      = startTimeInSeconds;
        SU.endTime        = endTimeInSeconds;
        SU.subtitleText   = subtitle;

        subtitleVector.addElement(SU); 
        nSubtitles++;
      }
      prevLine = currLine;
    }
  }


  for (int i=0; i<subtitleVector.size(); i++) {
    SubtitleUnit SU = (SubtitleUnit) subtitleVector.elementAt(i);
    String subtitleText = SU.subtitleText;
    String subtitleWords[] = split(subtitleText, " ");
    
    int nSubtitleWords = subtitleWords.length;
    for (int j=0; j<nSubtitleWords; j++) {
      String aWord = subtitleWords[j];

      // simple filter to remove trailing punctuation
      if (aWord.endsWith(".") || aWord.endsWith(",") || aWord.endsWith("!") || aWord.endsWith("?")) {
        aWord = aWord.substring(0, aWord.length()-1);
      }
      cloud.addTag(new Tag(aWord));
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
  float ySpacing = 38;
  float xPos = xMargin; // initial x position
  float yPos = 60;      // initial y position
  for (int i=0; i<nTags; i++) {

    // Fetch each tag and its properties.
    // Compute its display size based on its tag cloud "weight";
    // Then reshape the display size non-linearly, for display purposes. 
    Tag aTag = (Tag) tags.get(i);
    String tName = aTag.getName();
    float tWeight = (float) aTag.getWeight();
    float wordSize =  175.0 * ( pow (tWeight/175.0, 0.8));

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


