
/*
LearnMusicNotesJS
Simple ProcessingJS application for quizzing oneself on the grand staff music notes.

Code adapted from a working Processing-Android application.

James Schmitz
2014.04.06
*/

GrandStaff staff;

boolean showAnswer = false;

void setup(){
  size(500,650);
  
  staff = new GrandStaff();
}

void draw(){
  staff.drawGrandStaffAndNote();
  if (showAnswer) 
    staff.drawAnswer();  
}

void mouseClicked() {
  if (showAnswer) {
    staff.pickNote();
  }
  showAnswer = !showAnswer;
}

/*
GrandStaff Class
This draws a grand staff and one music note.
It can optionally display the letter name of the note.

Code adapted from a working Processing-Android application.

James Schmitz
2014.04.06
*/

public class GrandStaff {

  String[] trebleNotes = {"A","B","C","D","E","F","G","A","B","C","D","E","F","G","A","B","C"};
  String[] bassNotes   = {"E","D","C","B","A","G","F","E","D","C","B","A","G","F","E","D","C"};

  PImage staff;
  PFont font;
  int xOffset;
  int yOffset;
  int bassPosition;
  int treblePosition;
  
  int currentStaff;
  int currentNote;

  public GrandStaff() {
    staff = loadImage("500px-Grand_staff.svg.png");
    font = loadFont("LucidaTypewriterRegular.ttf");
    textFont(font, 100);
    
    // pick a note to start
    pickNote();
  }
  
  // ***** Public functions *****
  
  /*
  Select a new note.
  */
  void pickNote() {
    currentStaff = randomInt(0, 1);
    currentNote = newRandomInt(-2, 14, currentNote);
    currentState = 0;
  }

  /*
  Display the grand staff and the selected note.
  */
  void drawGrandStaffAndNote() {
    xOffset = 0;
    yOffset = (int) ((height - 640) / 2.);
        
    background(255);
    image(staff, adjustX(0), adjustY(50), 500, 500);
    bassPosition = 225;
    treblePosition = 225;

  if (currentStaff == 0)
    drawTrebleNote(currentNote, false, true); 
  else
    drawBassNote(currentNote, false, true);     
  }

  /*
  Display the name of the selected note.
  */
  void drawAnswer() {
    String answer;

    if (currentStaff == 0)
      answer = trebleNotes[currentNote+2];
    else
      answer = bassNotes[currentNote+2];

    text(answer, 0.7*width, height/2 + 30);
  }

  // ***** Private functions *****

  /*
  Display the selected note if it is on the treble staff.
  Figure out the coordinates of note and call drawNote for drawing.
  */
  void drawTrebleNote(int note, boolean flip) {
    fill(0);
    stroke(0);
    rectMode(CORNER);

    // draw extra lines if needed
    if (note <= 0) drawExtraLine(treblePosition - 42, 265);
    if (note <= -2) drawExtraLine(treblePosition - 42, 300);
    if (note >= 12) drawExtraLine(treblePosition - 42, 55);
    if (note >= 14) drawExtraLine(treblePosition - 42, 20);

    // draw note
    if((note <= 6 && !flip) || (flip && note > 6)) // up
      drawNote(treblePosition, 268-17.5*note, false);
    else  // down
      drawNote(treblePosition, 147-17.5*(note-7), true);
  }
  
  /*
  Display the selected note if it is on the bass staff.
  Figure out the coordinates of note and call drawNote for drawing.
  */
  void drawBassNote(int note, boolean flip) {
    fill(0);
    stroke(0);
    rectMode(CORNER);
    
    // draw extra lines if needed
    if (note <= 0) drawExtraLine(bassPosition - 42, 370);
    if (note <= -2) drawExtraLine(bassPosition - 42, 335);
    if (note >= 12) drawExtraLine(bassPosition - 42, 580);
    if (note >= 14) drawExtraLine(bassPosition - 42, 615);

    // draw note
    if((note <= 6 && !flip) || (flip && note > 6))  // down
      drawNote(bassPosition, 373+17.5*note, true);
    else  // up
      drawNote(bassPosition, 495+17.5*(note-7), false);    
  }

  /*
  Draw extra line if need-be.
  */
  void drawExtraLine(float x, float y) {
    rect(adjustX(x), adjustY(y), 85, 6, 4);
  }

  /*
  Draw note at (x,y) coordinates.
  */
  void drawNote(float x, float y, boolean rev) {
    ellipse(adjustX(x), adjustY(y), 56, 33);
    if (rev)
      rect(adjustX(x-28), adjustY(y), 6, 135);
    else
      rect(adjustX(x+22), adjustY(y), 6, -135);
  }

  float adjustX(float x) {
    return x + xOffset;
  }

  float adjustY(float y) {
    return y + yOffset;
  }
  
  int randomInt(int low, int high) {
    return floor(random(low, high + 1)); 
  }

  int newRandomInt(int low, int high, int old) {
    int r;
    do {
      r = floor(random(low, high + 1));
    } while (r == old);
    return r; 
  }

}



