
import arb.soundcipher.*;

  int[][] mRules = {
// Measure:  1    2    3    4    5    6    7    8    9    10    11    12    13    14    15    16    // Dice Rolls
      {96,  22,  141, 41,  105, 122, 11,  30,  70,  121,  26, 9, 112, 49, 109, 14},      // 2
      {32,  6,   128, 63,  146, 46,  134, 81,  117, 39,   126, 56, 174, 18, 116, 83},      // 3
      {69,  95,  158, 13,  153, 55,  110, 24,  66,  139,  15, 132, 73, 58, 145, 79},      // 4
      {40,  17,  113, 85,  161, 2,   159, 100, 90,  176,  7, 34, 67, 160, 52, 170},      // 5
      {148, 74,  163, 45,  80,  97,  36,  107, 25,  143,  64, 125, 76, 136, 1, 93},      // 6
      {104, 157, 27,  167, 154, 68,  118, 91,  138, 71,   150, 29, 101, 162, 23, 151},    // 7
      {152, 60,  171, 53,  99,  133, 21,  127, 16,  155,  57, 175, 43, 168, 89, 172},      // 8
      {119, 84,  114, 50,  140, 86,  169, 94,  120, 88,   48, 166, 51, 115, 72, 111},      // 9
      {98,  142, 42,  156, 75,  129, 62,  123, 65,  77,   19, 82, 137, 38, 149, 8},      // 10
      {3,   87,  165, 61,  135, 47,  147, 33,  102, 4,    31, 164, 144, 59, 173, 78},      // 11
      {54,  130, 10,  103, 28,  37,  106, 5,   35,  20,   108, 92, 12, 124, 44, 131}      // 12
  };
  
  int[][] tRules = {
// Measure:  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32    // Dice Rolls
      {72, 6,  59, 25, 81, 41, 89, 13, 36,  5, 46, 79, 30, 95, 19, 66},  // 1
      {56, 82, 42, 74, 14, 7,  26, 71, 76, 20, 64, 84,  8, 35, 47, 88},  // 2
      {75, 39, 54, 1,  65, 43, 15, 80, 9,  34, 93, 48, 69, 58, 90, 21},  // 3
      {40, 73, 16, 68, 29, 55, 2,  61, 22, 67, 49, 77, 57, 87, 33, 10},  // 4
      {83, 3,  28, 53, 37, 17, 44, 70, 63, 85, 32, 96, 12, 23, 50, 91},  // 5
      {18, 45, 62, 38, 4,  27, 52, 94, 11, 92, 24, 86, 51, 60, 78, 31}  // 6
  };
      
  SCScore score = new SCScore();
    
  float tempo = 180;
    
  int counter = 0;
  
  public void setup() {
    noLoop();
    
    score.tempo(tempo);
    score.addCallbackListener(this);
    score.addCallback(6, 1);

    score.play(-1);
  }
  
  public void draw() {
    if (counter < 16) {
      int r = (int) random(mRules.length - 1);
      try {
	    InputStream is = createInput("M" + mRules[r][counter] + ".mid");
	    score.addMidiStream(is);
	} catch (Exception ioe) {
	    System.out.println("SoundCipher IO error: in playMidiFile(): " + ioe.getMessage());
	}
//      score.addMidiFile("M" + mRules[r][counter] + ".mid");
            
      println(r + " " + counter + " " + mRules[r][counter]);
    }
    else
    if (counter < 32) {
      int r = (int) random(tRules.length - 1);
      try {
	    InputStream is = createInput("T" + tRules[r][counter] + ".mid");
	    score.addMidiStream(is);
	} catch (Exception ioe) {
	    System.out.println("SoundCipher IO error: in playMidiFile(): " + ioe.getMessage());
	}
//      score.addMidiFile("T" + tRules[r][counter - 16] + ".mid");
            
      println(r + " " + counter + " " + mRules[r][counter]);
    }
    else {
      score.stop();
      return;
    }
    
    counter++;
    
    score.play();
  }
  
  public void handleCallbacks(int callbackID) {
    score.empty();  
    score.addCallback(6, 1);
    score.update();
    redraw();
  }
  
  public void keyPressed() {
    score.stop();
    score.empty();
    score.addCallback(6, 1);
    score.update();
    counter = 0;
    redraw();
  }

