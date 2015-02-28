
/*
Sean Thompson
 11/19/10
 
 This code produces a virtual key board that plays notes, and draws them on the music staff using the key board. 
 The middle row of letters, "A" through "'" are the white keys. Black keys are played using the row of letters above it. 
 The MIDI instrument can be changed using the serial value from a potentiometer wired up with an Arduino. 
 The Arduino code is commented out at the bottom. 
 */


import arb.soundcipher.*;
//import processing.serial.*;

WhiteKey [] whiteKey;               // Create arrays for the White keys, black keys, and notes
BlackKey [] blackKey;
Note [] noteArray; 

float origin = 0;

PFont myFont;
PImage leftStaff, rightStaff, note, note2;
int pressCounter = 0; 
SoundCipher sc1 = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);
SoundCipher sc3 = new SoundCipher(this);
SoundCipher sc4 = new SoundCipher(this);
SoundCipher sc5 = new SoundCipher(this);
SoundCipher sc6 = new SoundCipher(this);
SoundCipher sc7 = new SoundCipher(this);
SoundCipher sc8 = new SoundCipher(this);

//Serial myPort;  // Create object from Serial class
int serial;     // Data received from the serial port

void setup () {   

  background (255);  
  size (900, 450);                  // The code it setup to allow easy changing of the window size 
  strokeWeight (2);                 // (Not perfect, some adjustments needed, but it keeps it in the ballpark)
  frameRate (10); 
  myFont = createFont ("LiHeiPro-30", 30); 
  textFont (myFont); 
  leftStaff = loadImage ("staff1.png");          // Load the images for the music notatation at the bottom
  rightStaff = loadImage ("staff2.png");
  note = loadImage ("note.png"); 
  note2 = loadImage ("note2.png");
  whiteKey = new WhiteKey [11];
  blackKey = new BlackKey [8];
  noteArray = new Note [1000]; 
//  String portName = Serial.list()[0];
//  myPort = new Serial(this, portName, 9600);

  for (int i = 0; i < 11; i ++) {                // Populate the array with the White keys
    whiteKey[i] = new WhiteKey (origin);
    origin += (width/11)+.75;
  } 

  blackKey[0] = new BlackKey ((width/22.05)*1.5);      // Black keys are not evenly spaced, so I had to do them individually
  blackKey[1] = new BlackKey ((width/22.05)*3.5);      // the (width/22) might have to be slightly adjusted if window size changed. 
  blackKey[2] = new BlackKey ((width/22.05)*5.5);
  blackKey[3] = new BlackKey ((width/22.05)*9.5);
  blackKey[4] = new BlackKey ((width/22.05)*11.5);
  blackKey[5] = new BlackKey ((width/22.05)*15.5);
  blackKey[6] = new BlackKey ((width/22.05)*17.5);
  blackKey[7] = new BlackKey ((width/22.05)*19.5);

  for (int i = 0; i < 1000; i ++) {              // Populate the array with 1000 notes 
    noteArray[i] = new Note ();
  }
}

void draw () {                            // The draw function
  sc1.instrument = serial;
  sc2.instrument = serial;
  sc3.instrument = serial;
  sc4.instrument = serial;
  sc5.instrument = serial;
  sc6.instrument = serial;
  sc7.instrument = serial;
  sc8.instrument = serial;

  for (int i = 0; i < 11; i ++) {         // This for loop implements the display and fading functions for the white keys
    whiteKey[i].display ();
    whiteKey[i].fade ();
  }
  fill (0); 
  text ("a", 10, 290);                    // Draw the letters on the white keys for a visual aid to the player
  text ("s", (width/11)+10, 290); 
  text ("d", 2*(width/11)+10, 290); 
  text ("f", 3*(width/11)+10, 290); 
  text ("g", 4*(width/11)+10, 290); 
  text ("h", 5*(width/11)+10, 290); 
  text ("j", 6*(width/11)+10, 290); 
  text ("k", 7*(width/11)+10, 290); 
  text ("l", 8*(width/11)+10, 290); 
  text (";", 9*(width/11)+10, 290); 
  text ("'", 10*(width/11)+10, 290); 


  for (int i = 0; i < 8; i ++) {          // This for loop implements the display and fading functions for the black keys
    blackKey[i].display ();
    blackKey[i].fade ();
  }
  fill (255);
  text ("w", 1.5*(width/22.05)+5, 27);    // Dra the letters on the black keys for a visual aid to the player
  text ("e", 3.5*(width/22.05)+5, 27);
  text ("r", 5.5*(width/22.05)+5, 27);
  text ("y", 9.5*(width/22.05)+5, 27);
  text ("u", 11.5*(width/22.05)+5, 27);
  text ("o", 15.5*(width/22.05)+5, 27);
  text ("p", 17.5*(width/22.05)+5, 27);
  text ("[", 19.5*(width/22.05)+5, 27);

  image (leftStaff, width-(width*.99), height*.683);       // This block dispalys the "sheet music" under the key board  
  image (rightStaff, width*.92, height*.683);              // (lines will have to be adjusted if screen size changed, the staffs will be right though)
  strokeWeight (1); 
  line (width-(width*.93), 330, width*.93, 330); 
  line (width-(width*.93), 340, width*.93, 340); 
  line (width-(width*.93), 350, width*.93, 350);
  line (width-(width*.93), 361, width*.93, 361);
  line (width-(width*.93), 371, width*.93, 371);
  line (width-(width*.93), 397, width*.93, 397);
  line (width-(width*.93), 407, width*.93, 407);
  line (width-(width*.93), 417, width*.93, 417);
  line (width-(width*.93), 427, width*.93, 427);
  line (width-(width*.93), 438, width*.93, 438);
  strokeWeight (2);

  if (keyPressed == true && key == 'a') {              // If statments implement the proper createNote function for each key.             
    pressCounter += 1;                                 // I tried to do this with a for loop, but had trouble getting the proper 
    noteArray[pressCounter].createNote ();             // note spacing for some reason. 
  }
  if (keyPressed == true && key == 'w') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 's') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'e') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 'd') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'r') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 'f') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'g') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'y') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 'h') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'u') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 'j') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'k') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'o') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 'l') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == 'p') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == ';') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }
  if (keyPressed == true && key == '[') {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote2 (); 
  }
  if (keyPressed == true && key == 39) {                          
    pressCounter += 1;    
    noteArray[pressCounter].createNote (); 
  }

  fill (0, 0, 255);                          // Draw the blue nuber in the top right corner to indicate the instrument number. 
  text (serial, width-62, 27); 
}

class WhiteKey {                             // The class for the White keys

  float xPosition; 
  float wkcolor = 255; 

  WhiteKey (float origin) {                  // Constructor
    xPosition = origin;
  }

  void display () {                          // The display function
    fill (wkcolor); 
    beginShape (); 
    vertex (xPosition, 0); 
    vertex (xPosition, height*2/3);
    vertex (xPosition + width/11, height*2/3); 
    vertex (xPosition + width/11, 0); 
    endShape ();
  }

  void fade () {                      // This function causes the key to change color and fade when pressed
    char[] keyHit = {
      'a', 's', 'd', 'f', 'g', 'h',
      'j', 'k', 'l', ';', 39                            };
    if (keyPressed == true) {
      for (int i = 0; i < keyHit.length; i ++) {
        if ( key == keyHit[i]) {
          whiteKey[i].wkcolor = 1;
        }
      }
    }
    if (wkcolor <= 255)
      wkcolor += 8;
  }
}

class BlackKey {                    // The class for the Black keys

  float xPos;
  int bkcolor = 0; 

  BlackKey (float origin) {         // Constructor
    xPos = origin;
  }

  void display () {                 // The display function
    fill (bkcolor); 
    beginShape (); 
    vertex (xPos, 0);
    vertex (xPos, height*.467);
    vertex (xPos + width/22, height*0.467);
    vertex (xPos + width/22, 0);
    endShape ();
  }

  void fade () {                    // This function causes the key to change color and fade when pressed
    char[] keyHit = {
      'w', 'e', 'r', 'y', 'u', 'o',
      'p', '['                                };
    if (keyPressed == true) {
      for (int i = 0; i < keyHit.length; i ++) {
        if ( key == keyHit[i]) {
          blackKey[i].bkcolor = 250;
        }
      }
    }
    if (bkcolor > 0) 
      bkcolor -= 10; 
  }
}

class Note {                            // The class for the music notes

  float xPosition = width - (width*.9);  
  int counter = 0;

  Note () {                             // Constructor

  }

  void display (int y) {                // The display function for regular notes
    image (note, xPosition, y); 
  }
  void display2 (int y) {               // The display function for sharp notes
    image (note2, xPosition, y);
  }

  void createNote () {                  // This function decides which White key was pressed and assaigns an 
    char[] keyHit = {                   // appropriate Y value so it is drawn on the right part of the "sheet music"
      'a', 's', 'd', 'f', 'g', 'h',
      'j', 'k', 'l', ';', 39                            };
    int[] y = {
      367, 362, 357, 352, 344, 336,
      331, 326, 320, 315, 310                            }; 

    if (keyPressed == true) {
      counter += 1; 
      for (int i = 0; i < keyHit.length; i ++) {
        if ( key == keyHit[i]) {
          noteArray[counter].moveNote ();
          noteArray[counter].display (y[i]);
        }
      } 
    }
  }
  void createNote2 () {                  // This function decides which Black key was pressed and assaigns an 
    char[] keyHit = {                    // appropriate Y value so it is drawn on the right part of the "sheet music"
      'w', 'e', 'r', 'y',
      'u', 'o', 'p', '['         };
    int[] y = {
      367, 362, 357, 344, 
      336, 326, 320, 315            }; 

    if (keyPressed == true) {
      counter += 1; 
      for (int i = 0; i < keyHit.length; i ++) {
        if ( key == keyHit[i]) {
          noteArray[counter].moveNote2 (); 
          noteArray[counter].display2 (y[i]);
        }
      }
    }
  }

  void moveNote () {                  // this function moves the X position of the notes across the screen 
    xPosition += 18;                  // and resets the screen once the sheet is full 
    if (xPosition > width*.9) {
      xPosition = width - (width*.9); 
      background (255); 
    }
  }
  void moveNote2 () {                  // this function moves the X position of the notes across the screen 
    xPosition += 24;                   // and resets the screen once the sheet is full 
    if (xPosition > width*.9) {
      xPosition = width-(width*.9); 
      background (255); 
    }
  }
}

void keyPressed () {                    // The key pressed function causse the proper note to be played when the key is pressed.

  int volume = 127;          //A control variable to change volume
  float duration = 1.5;         //A control variable to change note duration.

  if (key == 'a') {
    sc1.playNote (53, volume, duration);
  }
  if (key == 'w') {
    sc2.playNote (54, volume, duration);
  }
  if (key == 's') {
    sc3.playNote (55, volume, duration);
  }
  if (key == 'e') {
    sc4.playNote (56, volume, duration);
  }
  if (key == 'd') {
    sc5.playNote (57, volume, duration);
  }
  if (key == 'r') {
    sc6.playNote (58, volume, duration);
  }
  if (key == 'f') {
    sc7.playNote (59, volume, duration);
  }
  if (key == 'g') {
    sc8.playNote (60, volume, duration);
  }
  if (key == 'y') {
    sc1.playNote (61, volume, duration);
  }
  if (key == 'h') {
    sc2.playNote (62, volume, duration);
  }
  if (key == 'u') {
    sc3.playNote (63, volume, duration);
  }
  if (key == 'j') {
    sc4.playNote (64, volume, duration);
  }
  if (key == 'k') {
    sc5.playNote (65, volume, duration);
  }
  if (key == 'o') {
    sc6.playNote (66, volume, duration);
  }
  if (key == 'l') {
    sc7.playNote (67, volume, duration);
  }
  if (key == 'p') {
    sc8.playNote (68, volume, duration);
  }
  if (key == ';') {
    sc1.playNote (69, volume, duration);
  }
  if (key == '[') {
    sc2.playNote (70, volume, duration);
  }
  if (key == 39) {
    sc3.playNote (71, volume, duration);
  }

}

//int sensorPin = A0; 
//int sensorValue = 0; 
//int outputValue = 0; 
//
//void setup () {
//  Serial.begin (9600); 
//}
//
//void loop () {
//  sensorValue = analogRead (sensorPin); 
//  outputValue = map(sensorValue, 0, 1023, 0, 127);
//  Serial.println(outputValue); 
//  delay (1000); 
//}







