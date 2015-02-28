
// INSTRUCTIONS:
// To initialize, press any key.
// To answer questions, press "A" if the first statement is most like you, or "L" for the second phrase.
// to skip, press any other key.


// This program was written for the Social Psychology Symposium. It is a measure (disclaimer: not scientifically tested)
// of three qualities: Left vs. Right brain thinking, Extraversion, and practical vs. idealistic thinking.
// You can run the program by yourself, or gather data from a big group; there is no "end" to the study, as it will just loop when it
// runs out of questions. Each question studies one of the three traits, and, according to the answers, either lowers or raises
// the amount of the corresponding color in the RGB scale that determines the bird's color.
// Here are the "results", based on bird color:

// Red: 
// Right Brain
// Extroverted
// Romantic

// Green: 
// Left Brain
// Introverted
// Romantic

// Blue:
// Left Brain
// Extroverted
// Realistic

// Yellow: 
// Right Brain
// Introverted
// Romantic

// Pink/Purple:
// Right Brain
// Extroverted
// Realistic

// Light Blue:
// Left Brain
// Introverted
// Realistic

// White:
// Right Brain
// Introverted
// Realistic

// Black:
// Left Brain
// Extroverted
// Romantic

// The RGB scale's questions (arrays) are coded as follows: 
// Red is Right Brain vs. Left Brain
// Green is Introvert vs. Extrovert
// Blue is Realistic vs. Romantic


// Future development: How can I make the bird not erase the question?


int nextQuestion = 0;
int redSoFar = 0;
int greenSoFar = 0;
int blueSoFar = 0;

int soManyReds = 16;
int soManyGreens = 18;
int soManyBlues = 12;

int redAmount = 127;
int greenAmount = 127;
int blueAmount = 127;

float x;
float y;
float rightTip = 0;
float easing = 0.02;
int direction = 1;

long blinktimer = 0;
int blinkInterval = 100;



String[] Red = {"Risk   ((or))    Security?", "Essays   ((or))    Multiple Choice?", "Art    ((or))    science?", "Literature   ((or))    Math?", "Instincts   ((or))    Maps?", "Color   ((or))    Shape?", "Stochastic   ((or))    Linear?", "Paint   ((or))    Poetry?", "Novelty   ((or))    Familiarity?", "Spontaneous Trip   ((or))    Planned Vacation?", "Pictionary   ((or))    Chess?", "Draw Something   ((or))    Words with Friends?", "Big Picture   ((or))    Details?", "1 Picture = 1000 words   ((or))   1 Word = 1000 pictures?", "Discussion section   ((or))    Results section?", "Inventor   ((or))    Detective?", "Constructionist Psychology   ((or))    Reductionist Psychology?"};
String redWord = "3";

String[] Green = {"Coldplay    ((or))    Ke$ha?", "Rural    ((or))    Urban?", "Back of Classroom    ((or))    Front of Classroom?", "Buddha    ((or))    Jesus?", "Books    ((or))    Parties?", "One Good Friend    ((or))    Many Varied Contacts?", "Jogging    ((or))    Soccer?", "Pac-Man    ((or))    Hungry Hungry Hippos?", "Independence    ((or))    Interdependence?", "Lone Wolf    ((or))    Social Butterfly?", "Type B Personality    ((or))    Type A Personality?", "Money    ((or))    Fame?", "Focused    ((or))    Multitasking?", "Writer    ((or))    Politician?", "Thinking > Talking    ((or))    Talking < Thinking?", "Comfort    ((or))    Fashion?", "Behind the Camera    ((or))    In Front of the Camera?", "Psychology    ((or))    Sociology?", "Cats    ((or))    Dogs?"};
String greenWord = "2";

String[] Blue = {"Working hard    ((or))    Hardly working?", "Nonfiction    ((or))    Fiction?", "Money    ((or))    Love?", "Da Vinci    ((or))    Picasso?", "Beer    ((or))    Wine?", "Realistic    ((or))    Romantic?", "Marry for Convenience    ((or))    Wait for Love?", "Coffee    ((or))    Tea?", "New York    ((or))    California?", "Smart    ((or))    Sexy?", "Science    ((or))    Philosophy?", "Actions > Ideas    ((or))    Ideas > Actions?", "Speed    ((or))    Perfection?"};
String blueWord = "1";







void setup ( ) {
 
 size (700, 400);
 background (0, 0, 0); 
 textAlign (CENTER);
 textSize (30);
}







void draw ( ) {
 
 

 if (millis() - blinktimer >= blinkInterval) {
      if (keyPressed) {
     
     
        background (0, 0, 0);
        
        if (nextQuestion == 0) {  
          text (redWord, 350, 200);
          redWord = Red[redSoFar];
          redSoFar += 1;
          if (key == 'a' || key == 'A') {
            redAmount += 10;
          }
          if (key == 'l' || key == 'L') {
            redAmount -= 10;
          }
    
        }
        if (nextQuestion == 1) {  
          text (greenWord, 350, 200);
          greenWord = Green[greenSoFar];
          greenSoFar += 1;
          if (key == 'a' || key == 'A') {
            greenAmount += 10;
          }
          if (key == 'l' || key == 'L') {
            greenAmount -= 10;
          }
    
        }
        if (nextQuestion == 2) {  
          text (blueWord, 350, 200);
          blueWord = Blue[blueSoFar];
          blueSoFar += 1;
          if (key == 'a' || key == 'A') {
            blueAmount += 10;
          }
          if (key == 'l' || key == 'L') {
            blueAmount -= 10;
          }
    
        }
        
          
        if (redSoFar > soManyReds) { 
          redSoFar = 0;
        }
        if (greenSoFar > soManyGreens) { 
          greenSoFar = 0;
        }
        if (blueSoFar > soManyBlues) { 
          blueSoFar = 0;
        }
    
    
          
          
        nextQuestion += 1;
        if (nextQuestion > 2) {
          nextQuestion = 0;
        }
          
     blinktimer = millis();      
    }  
    
 }  
  
  fill (0, 0, 0);
  triangle (x-30, y+rightTip-5,  x+50, y+50,   x-50, y+50);  // up wing
  triangle (x-80, y-30,          x-70, y-15,   x-120, y-20);  // head
  triangle (x-50, y+50,          x-20, y+40,   x-80, y-30);  // neck
  triangle (x, y,                x+50, y+50,   x-50, y+50);  // body
  triangle (x+50, y+50,          x+30, y+30,   x+100, y-20);  // tail
  triangle (x+40, y+rightTip,    x+50, y+50,   x-50, y+50);  // down wing

  
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += ((targetY - y) * easing) - 0.5*direction;
  rightTip += 2*direction;
  
  if (rightTip > 140 || rightTip < -50) {
    direction = -direction;
  }

  

  fill (redAmount, greenAmount, blueAmount);
  stroke (0, 0, 0, 100);
  triangle (x-30, y+rightTip-5,  x+50, y+50,   x-50, y+50);  // up wing
  triangle (x-80, y-30,          x-70, y-15,   x-120, y-20);  // head
  triangle (x-50, y+50,          x-20, y+40,   x-80, y-30);  // neck
  triangle (x, y,                x+50, y+50,   x-50, y+50);  // body
  triangle (x+50, y+50,          x+30, y+30,   x+100, y-20);  // tail
  triangle (x+40, y+rightTip,    x+50, y+50,   x-50, y+50);  // down wing
  

  
  fill (255, 255, 255);
}



// "No pressure, no diamonds."
// - Mary Case


