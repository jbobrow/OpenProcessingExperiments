
import guru.ttslib.*;
TTS tts = new TTS();

int currentScreen;
int r = 0;
int g = 0;
int b = 0;

boolean red = false;
boolean yel = false;
boolean ind = false;
boolean grn = false;
boolean blu = false;
boolean prp = false;
boolean wht = false;
boolean org = false;
boolean speak = true;

void setup(){
  size(displayWidth, displayHeight);
}

void draw(){
  switch(currentScreen) {
    case 0: drawWhtScreen(); break;
    case 1: drawRedScreen(); break;
    case 2: drawOrgScreen(); break;
    case 3: drawYelScreen(); break;
    case 4: drawGrnScreen(); break;
    case 5: drawBluScreen(); break;
    case 6: drawIndScreen(); break;
    case 7: drawPrpScreen(); break;
    default: background(0); break;
 } 
}

void mousePressed(){
  tts.speak("Switch");
  r = 0; g = 0; b = 0;
  red = false; 
  yel = false; 
  grn = false; 
  ind = false; 
  blu = false; 
  prp = false; 
  wht = false;
  org = false;
  speak = true;
  currentScreen++;
  if (currentScreen > 7) {
    currentScreen = 0;
  }
}

void keyPressed(){
  if (key == ENTER){
    speak = true;
  }
}

void drawRedScreen(){
  background(r, 0, 0);
  frameRate(60);
  if (!red){
    r = r + 1;
  }
 if (r > 255){
  red = true;
  if (speak){
    tts.speakLeft("Red is the color of blood");
    tts.speakRight("rubies,");
   tts.speakLeft(" and apples. ");
   tts.speak("This is your life force and represents stability. ");
  tts.speakRight("Focusing on the color red will help you alleviate feelings of frustration,");
 tts.speak(" anger, ");
tts.speakLeft(" and raw passion.");
    speak = false; 
  }
 } 
  if (red){
    r = r - 1;
  }
 if (r == 0){
  red = false;
 }
}

void drawOrgScreen(){
  background(r, g, 0);
  frameRate(30);
  if (!org && g < 127){
    r = r + 2;
    g = g + 1;
  }
  if ( g == 127){
    org = true;
    if (speak){
      tts.speakLeft("Orange is the color of oranges.");
     tts.speakRight(" Focusing on the color orange will help you with issues involving sensuality,");
    tts.speakLeft(" relationships, ");
    tts.speakRight("physical pleasure,");
   tts.speakLeft(" emotional self-expression");
  tts.speak(" and creativity.");
      speak = false;
    }
  }
  if (org){
    r = r - 2;
    g = g - 1;
  }
  if (r == 0 && g == 0){
    org = false;
  }
}


void drawGrnScreen(){
  background(0, g, 0);
  frameRate(60);
  if (!grn){
    g = g + 1;
  }
  if (g > 255){
    grn = true;
    if (speak){
      tts.speakLeft("Green is the color of grass.");
     tts.speakRight(" Focusing on the color green stimulates peace, ");
     tts.speak("love ");
     tts.speakLeft("and nurturing.");
      speak = false;
    }
  }
  if (grn){
    g = g - 1;
  }
  if (g == 0){
    grn = false;
  }
}

void drawBluScreen(){
  background(0, 0, b);
  frameRate(60);
  if (!blu){
    b = b + 1;
  }
  if (b > 255){
    blu = true;
    if (speak){
      tts.speakLeft("Blue is the color of sky. ");
      tts.speakRight("Focusing on the color blue helps you with your self-expression");
      tts.speak("and confidence.");
      speak = false;
    }  
  }
  if (blu){
    b = b - 1;
  }
  if (b == 0){
    blu = false;
  }
}

void drawYelScreen(){
  background(r, g, 0);
  frameRate(60);
  if (!yel){
    r = r + 1;
    g = g + 1;
  }
 if (r > 255 && g > 255){
  yel = true;
  if (speak){
    tts.speakLeft("Yellow is the color of gold,");
   tts.speakRight(" butter, ");
   tts.speakLeft("or ripe lemons. ");
   tts.speakRight("Focusing on the color yellow will affect your happiness, ");
   tts.speak("optimism ");
   tts.speakRight("and thought processes.");
    speak = false;
  }
 }
  if (yel){
    r = r - 1;
    g = g - 1;
  }
 if (r == 0 && g == 0){
  yel = false;
 }
 loop();
}

void drawIndScreen(){
  background(r, 0, b);
  frameRate(30);
  if (!ind && r < 127){
    r = r + 1;
    b = b + 2;
  }
 if (r == 127){
  ind = true;
  if (speak){
    tts.speakLeft("Indigo is the color of the indigo plant.");
   tts.speakRight(" Focusing on the color indigo increases your intuition ");
   tts.speak("and your peace of mind.");
    speak = false;
  }
 } 
  if (ind){
    r = r - 1;
    b = b - 2;
  }
 if (r == 0 && b == 0){
  ind = false;
 }
}

void drawPrpScreen(){
  background(r, 0, b);
  frameRate(60);
  if (!prp){
    r = r + 1;
    b = b + 1;
  }
 if (r > 255 && b > 255){
  prp = true;
  if (speak){
    tts.speakLeft("Purple is the color of royalty. ");
    tts.speakRight("Focusing on the color purple helps you align with");
    tts.speak("universal consciousness.");
    speak = false;
  }
 } 
  if (prp){
    r = r - 1;
    b = b - 1;
  }
 if (r == 0 && b == 0){
  prp = false;
 }
}

void drawWhtScreen(){
  background(r, g, b);
  frameRate(60);
  if (!wht){
    r = r + 1;
    g = g + 1;
    b = b + 1;
  }
 if (r > 255 && g > 255 && b > 255){
  wht = true;
  if (speak){
    tts.speakLeft("White is the color of milk and fresh snow." );
    tts.speakRight("Focus on each color as it becomes fully saturated. ");
    tts.speak("Saturate your mind with the energy each color represents.");
    tts.speakLeft("Breathe slowly and deeply.");
   tts.speakRight(" Take at least two deep breaths and try to match the rhythm of the breath to the color saturation.");
   tts.speakLeft("Press the ENTER key to repeat the instructions for any color.");
   tts.speak("When you are ready, click the mouse anywhere to switch colors.");
    speak = false;
  }
 } 
  if (wht){
    r = r - 1;
    g = g - 1;
    b = b - 1;
  }
 if (r == 0 && g == 0 && b == 0){
  wht = false;
 }
}


