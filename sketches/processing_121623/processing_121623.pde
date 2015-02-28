
String typing = "";
String convertMe = "";
String[] code = { 
  "null", "null", "null", "null"
};
String morseLetter = "";
String morseString = "";
String morseStringNew = "";
String morseStringNewNew = "";
int morseCursor = 50;
int light = 0;
int morseLong = 25;
int morseShort = 5;
int savedTime;
int totalTime = 0;
int[] timer = {
  0, 0, 0, 0
};
int pause = 0;
int pauseDelay = 30;
boolean[] go = {false, false, false, false};
  PFont fontBig;

void setup() {
  //if (frame != null) {
  //  frame.setResizable(true);
  //}
  size(1280, 720);
  //String portName = Serial.list()[0];
  //port = new Serial(this, "/dev/ttyACM0", 9600);
  //port.bufferUntil('.');
  PFont font;

  font = loadFont("UbuntuMono-Regular-48.vlw");
  fontBig = loadFont("UbuntuMono-Regular-199.vlw");
  textFont(font, 32);
  smooth();
}

void draw() {
  textSize(32);
  background(0);
  //background(2, 26, 5);
  fill(80, 222, 108);
  //textSize(35);
  text("Begin typing to encode message...", 50, 100);
  text(typing, 50, 150);
  //text(convertMe, 50, 200);
  textAlign(RIGHT);
  text(millis()*.001, width - 50, 100);
  textSize(16);
  text("Code Char. 1 Timer is " + timer[0], width-50, 200);
  text("Char 1 activity = " + go[0], width-50, 220);
  text("Code Char. 2 Timer is " + timer[1], width-50, 240);
  text("Char 2 activity = " + go[1], width-50, 260);
  text("Code Char. 3 Timer is " + timer[2], width-50, 280);
  text("Char 3 activity = " + go[2], width-50, 300);
  text("Code Char. 4 Timer is " + timer[3], width-50, 320);
  text("Char 4 activity = " + go[3], width-50, 340); 
  text("Delay is " + pause, width-50, 360);
  textAlign(LEFT);
  text(morseString, morseCursor, 250);
  text(morseStringNew, morseCursor, 270);
  text(morseStringNewNew, morseCursor, 290);
  
  




  
  
  
  if (go[0]) {
    if (timer[0] > 0) {
        light = 100;
     pause = pauseDelay;
     timer[0]--; 
      } 
    

    if (timer[0] <= 0) { 
      //light = -100;
      pause--;
      
      if (pause <= 0) {
      go[0] = false;
      go[1] = true;
      }
      

    }
  } 
  
  if (go[1]) {
    
    if (timer[1] > 0) {
        light = 100;
        pause = pauseDelay;
     timer[1]--; 
      } 
    

    if (timer[1] <= 0) {
            
      //light = -100;
      pause--;
      
      if ( pause <= 0) {
      go[1] = false;
      go[2] = true;
      timer[1] = 0;
    }

    }
  }   
  
  if (go[2]) {
    
    if (timer[2] > 0) {
        light = 100;
        pause = pauseDelay;
     timer[2]--; 
      } 
    

    if (timer[2] <= 0) {
      //light = -100;
      pause--;
      
      if (pause <= 0) {
      go[2] = false;
      go[3] = true;
      }
      
    } }
  
  if (go[3]) {
    
    if (timer[3] > 0) {
        light = 100;
        pause = pauseDelay;
     timer[3]--; 
      } 
    

    if (timer[3] <= 0) {
     
      //light = -100;
      pause--;
      
      if (pause <= 0) {
      go[3] = false;
      pause = 0;
      }
      
     
    } 
    }



if ((go[0] || go[1] || go[2] || go[3]) && pause <= 0 || pause >= pauseDelay - 2) {
    //textSize(200);
      textFont(fontBig, 199);
    text(morseLetter, 100, 420);
    
  for (int i = 255; i > -1; i-=1) {
    noStroke();
    fill(255-i);
    ellipse(width/1.5, height/1.8, (light/2 + i), (light/2 + i));
  } 
}
}

void keyPressed() {
  if (keyCode == ENTER ) {
    convertMe = typing;
  } 

  if (keyCode == BACKSPACE && typing.length() > 0) {
    typing = typing.substring(0, typing.length() - 1);
    morseString = morseString.substring(0, morseString.length() - 4);
  }
  else {
    typing = typing + key;
  }

  switch(keyCode) {
  case 'A': 
    code[0] = ".";
    code[1] = "-";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'B': 
    code[0] = "-";
    code[1] = ".";
    code[2] = ".";
    code[3] = ".";
    break;
  case 'C': 
    code[0] = "-";
    code[1] = ".";
    code[2] = "-";
    code[3] = ".";
    break;
  case 'D': 
    code[0] = "-";
    code[1] = ".";
    code[2] = ".";
    code[3] = " ";
    break;
  case 'E': 
    code[0] = ".";
    code[1] = " ";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'F': 
    code[0] = ".";
    code[1] = ".";
    code[2] = "-";
    code[3] = ".";
    break;
  case 'G': 
    code[0] = "-";
    code[1] = "-";
    code[2] = ".";
    code[3] = " ";
    break;
  case 'H': 
    code[0] = ".";
    code[1] = ".";
    code[2] = ".";
    code[3] = ".";
    break;
  case 'I': 
    code[0] = ".";
    code[1] = ".";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'J': 
    code[0] = ".";
    code[1] = "-";
    code[2] = "-";
    code[3] = "-";
    break;
  case 'K': 
    code[0] = "-";
    code[1] = ".";
    code[2] = "-";
    code[3] = " ";
    break;
  case 'L': 
    code[0] = ".";
    code[1] = "-";
    code[2] = ".";
    code[3] = ".";
    break;
  case 'M': 
    code[0] = "-";
    code[1] = "-";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'N': 
    code[0] = "-";
    code[1] = ".";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'O': 
    code[0] = "-";
    code[1] = "-";
    code[2] = "-";
    code[3] = " ";
    break;
  case 'P': 
    code[0] = ".";
    code[1] = "-";
    code[2] = "-";
    code[3] = ".";
    break;
  case 'Q': 
    code[0] = "-";
    code[1] = "-";
    code[2] = ".";
    code[3] = "-";
    break;
  case 'R': 
    code[0] = ".";
    code[1] = "-";
    code[2] = ".";
    code[3] = " ";
    break;
  case 'S': 
    code[0] = ".";
    code[1] = ".";
    code[2] = ".";
    code[3] = " ";
    break;
  case 'T': 
    code[0] = "-";
    code[1] = " ";
    code[2] = " ";
    code[3] = " ";
    break;
  case 'U': 
    code[0] = ".";
    code[1] = ".";
    code[2] = "-";
    code[3] = " ";
    break;
  case 'V': 
    code[0] = ".";
    code[1] = ".";
    code[2] = ".";
    code[3] = "-";
    break;
  case 'W': 
    code[0] = ".";
    code[1] = "-";
    code[2] = "-";
    code[3] = " ";
    break;
  case 'X': 
    code[0] = "-";
    code[1] = ".";
    code[2] = ".";
    code[3] = "-";
    break;
  case 'Y': 
    code[0] = "-";
    code[1] = ".";
    code[2] = "-";
    code[3] = "-";
    break;
  case 'Z': 
    code[0] = "-";
    code[1] = "-";
    code[2] = ".";
    code[3] = ".";
    break;

  default:             // Default executes if the case labels
    println("None");   // don't match the switch parameter
    break;
  }

  morseLetter = code[0] + code[1] + code[2] + code[3];
  //morseString += morseLetter;
  
  if (morseString.length() < 70) {
    morseString += morseLetter;
  }
  
  if (morseString.length() >= 70 && morseStringNew.length() < 70) {
    morseStringNew += morseLetter; 
  }
  
  if (morseStringNew.length() >= 70 && morseStringNewNew.length() < 70) {
    morseStringNewNew += morseLetter; 
  }
  if (typing.length() > 50) {
   typing = ""; 
   morseString = "";
   morseStringNew = "";
   morseStringNewNew = "";
  }
  
  
  go[0] = true;
  
 //   for (int i = 0; i < 4; i++) {
  if (code[0] == "-") {
   timer[0] = morseLong; //length of timer for lines 
  }
  if (code[0] == ".") {
   timer[0] = morseShort; 
  }
  if (code[0] == " ") {
   timer[0] = 0; 
  }
  
  
  if (code[1] == "-") {
    timer[1] = morseLong;
  }
  if (code[1] == ".") {
    timer[1] = morseShort;
  }
  if (code[1] == " ") {
    timer[1] = 0;
  }  
  if (code[2] == "-") {
    timer[2] = morseLong;
  }
  if (code[2] == ".") {
    timer[2] = morseShort;
  }
  if (code[2] == " ") {
    timer[2] = 0;
  }  
  
  if (code[3] == "-") {
    timer[3] = morseLong;
  }
  if (code[3] == ".") {
    timer[3] = morseShort;
  }
  if (code[3] == " ") {
    timer[3] = 0;
  }
  
  
}
