
/**************

 This is a Processing parser for .SRT files, a widely used subtitle text file format.
 .SRT file information is obtained from: http://en.wikipedia.org/wiki/SubRip
 
 The SubRip file format is "perhaps the most basic of all subtitle formats."
 SubRip files are named with the extension .srt, 
 and contain formatted UTF-8 plain text. 
 The time format used is hours:minutes:seconds,milliseconds. 
 The decimal separator used is the comma, 
 since the program was written in France; 
 the line break used is the CR+LF pair. 
 Subtitles are numbered sequentially, starting at 1. 
 The format for an .SRT subtitle is: 
 
 Subtitle number
 Start time --> End time
 Text of subtitle (one or more lines)
 Blank line
 
 These are parsed into a series of SubtitleUnit data structures
 and stored in the Java Vector, subtitleVector. 
 (See class definition for SubtitleUnit below.)
 
 The program includes a method, createExportFileForMaxMSPCollObjectFromCertainWord(),
 which exports a text/data file suitable for importing into Max/MSP's "coll" object. 
 With this, Max/MSP can be directed to extract all of the clips from a movie which 
 e.g. contain a certain word. 
 
***************/

//-----------------------------------------------------------
// Which .SRT file should we load (from the sketch's "data" folder)?
String srtFilename = "star_wars_iv_a_new_hope.srt";

// Some words to search for in the subtitles. 
String searchTerms[] = {
  "princess", "planet", "fighter", "droid"
};

//-----------------------------------------------------------
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


//-----------------------------------------------------------
void setup() {
  size(400,210);
  noLoop();

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

  // Now we have a Vector of dialogue units. Print them out.
  printAllSubtitleUnits();
  
  // This is commented out for now, but it works. 
  // It creates an edit list for MaxMSP of all of the cips containing the word "princess":
  // createExportFileForMaxMSPCollObjectFromCertainWord ("princess", false);
}


//=============================================
void draw() {

  background (180);

  float  vSpacing = 40;
  float  vOffset  = 60;
  int maxOccasionsOfAnyTerm = 0; 
  for (int i=0; i<searchTerms.length; i++) {
    int nOccasions = countAllSubtitleUnitIDsWithCertainWord (searchTerms[i]); 
    if (nOccasions > maxOccasionsOfAnyTerm) { 
      maxOccasionsOfAnyTerm = nOccasions;
    }
  }

  fill(0,0,0);
  text("SubRip subtitle file:  " + srtFilename, 10, 20);
  text("Occurrence counts for select words:", 10, 35);
  
  for (int i=0; i<searchTerms.length; i++) {
    String searchTerm = searchTerms[i];
    int nOccasions = countAllSubtitleUnitIDsWithCertainWord (searchTerm); 
    float barWidth = map(nOccasions, 0,maxOccasionsOfAnyTerm, 0, width-20);
    fill(0,0,0);
    text(searchTerm + ": " + nOccasions, 10, vOffset+vSpacing*i); 
    fill(255,255,255); 
    rect(10, vOffset+5+vSpacing*i, barWidth, 10);
  }
}


//=============================================
void printAllSubtitleUnits() {
  for (int i=0; i<subtitleVector.size(); i++) {
    SubtitleUnit SU = (SubtitleUnit) subtitleVector.elementAt(i);
    SU.print();
  }
}


//=============================================
int countAllSubtitleUnitIDsWithCertainWord (String searchTerm) {
  int nTimes = 0;
  for (int i=0; i<subtitleVector.size(); i++) {
    SubtitleUnit SU = (SubtitleUnit) subtitleVector.elementAt(i);
    String subtitleText = SU.subtitleText;
    subtitleText = subtitleText.toLowerCase();
    if (subtitleText.indexOf(searchTerm.toLowerCase()) > -1) {
      nTimes++;
    }
  }
  return nTimes;
}


//=============================================
void createExportFileForMaxMSPCollObjectFromCertainWord (String searchTerm, boolean bAtBeginningOfLineOnly) {

  // Exports an output file suitable for input to MaxMSP's "coll" object.
  // This object takes data in the following format:
  // ID comma space startTime space endTime semicolon
  // For example:
  // 1, 293.333 298.666; 

  PrintWriter maxMspOutput;
  int nOccasions = 0;
  searchTerm = searchTerm.toLowerCase();

  String maxMspOutputFilename = srtFilename + "_forMaxMSP_" + searchTerm + ".txt";
  maxMspOutput = createWriter(maxMspOutputFilename); 
  println("Exporting " + maxMspOutputFilename + " for MaxMSP's [coll] object."); 


  for (int i=0; i<subtitleVector.size(); i++) {
    SubtitleUnit SU = (SubtitleUnit) subtitleVector.elementAt(i);
    if (SU.subtitleType != SUBTITLE_TYPE_STAGING) {
      String subtitleText = SU.subtitleText;
      subtitleText = subtitleText.toLowerCase();

      boolean bFound = (bAtBeginningOfLineOnly) ? 
        (subtitleText.startsWith(searchTerm)) : 
        (subtitleText.indexOf(searchTerm) > -1);
      if (bFound) {
        String stringForMaxMSP = 
          SU.subtitleNumber + ", " + 
          nf(SU.startTime,1,3) + " " + 
          nf(SU.endTime,1,3) + ";";
        maxMspOutput.println (stringForMaxMSP);
        println(subtitleText);
        nOccasions ++;
      }
    }
  }

  println("Output contains " + nOccasions + " occurrences of '" + searchTerm + "'."); 
  maxMspOutput.flush(); // Writes the remaining data to the file
  maxMspOutput.close(); // Finishes the file
}


