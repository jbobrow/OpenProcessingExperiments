

// Simulate the timing lights used in Toastmasters
// Written by Charles Cave

PFont bigfont;
PFont smallfont;

int startTime;
int elapsTime;
int elapsMin, elapsSec;

int gT; // green time (seconds) 
int yT; // amber time (seconds)
int rT; // red time (seconds)
int dT; // disqualified time  (seconds)
String timertype;

boolean Running = false;

void draw() {
   noStroke();
   int w = 200;    // set up geometry of the three timing lights
   int h = 130;    // circles of width w
   int x1 = 160;   // green light at (x1, h)
   int x2 = 400;   // amber light at (x2, h)
   int x3 = 640;   // red light   at (x3, h)
   
   background(255);
   
   fill(220); // timing lights initially this colour
   stroke(0);   // with a black circular outline
   ellipse(x1,h, w, w);
   ellipse(x2,h, w, w);
   ellipse(x3,h, w, w);
   
   textSize(12);
   textFont(smallfont);   
   fill(20);
   text(timertype , width/2, height - 20);  // display small caption
   
   // check for keys to start the timer. A menu of options is
   // displayed from the timertype variable set in initialisation
   if (keyPressed) {
      if (key == 't') {      // a short time for testing the program
         Running = true;
         startTime = millis();
         gT = 10;
         yT = 15;
         rT = 20;
         dT = 25;
         timertype = "Test - 10 - 15 - 20 seconds  25 warning";
      }
       if (key == '1') {  
         Running = true;
         startTime = millis();
         gT = 30;
         yT = 45;
         rT = 60;
         dT = 75;
         timertype = "1 minute - 30/45/60 seconds";
      }
       if (key == '2') { // Table Topics competitions
         Running = true;
         startTime = millis();
         gT = 60;
         yT = 90;
         rT = 120;
         dT = 150;
         timertype = "1 - 2 minutes 1/1.5/2";
      }
       if (key == '6') {  // icebreaker speech
         Running = true;
         startTime = millis();
         gT = 240;
         yT = 300;
         rT = 360;
         dT = 390;
         println("4 - 6 minutes");
         timertype = "4 - 6 minutes - 4/5/6";
      }
      if (key == '7') { // Competition speeches
         Running = true;
         startTime = millis();
         gT = 300;
         yT = 360;
         rT = 420;
         dT = 450;
         println("5 - 7 minutes");
         timertype = "5 - 7 minutes - 5/6/7";
      }
   }
   
   if (Running != true) { 
     return; 
   }
   
   // display timer 
   elapsTime = (millis() - startTime)/1000;
   elapsMin = elapsTime / 60;
   elapsSec = elapsTime - 60 * elapsMin;
   fill(0);
   textSize(96);
   textFont(bigfont); 
   text(paddedNumber(elapsMin) + ":" + paddedNumber(elapsSec) , width/2, height - 50);
   
   if ((elapsTime >= gT) && (elapsTime < yT)) { // green light
       fill(92, 200, 67);   
       ellipse(x1,h, w, w);
     }
   
    if ((elapsTime >= yT) && (elapsTime < rT)) {  // amber light
    fill(255, 243, 63);
    ellipse(x2,h, w, w);
   } 
   
   if ((elapsTime >= rT ) && (elapsTime < dT)) {    // red light
     fill(237, 63, 28);
     ellipse(x3,h, w, w);
   } 
  
     if (elapsTime >= dT) {  // flashing red
       fill(246,24,40, 50);
       if ((elapsTime % 2) == 1) {
        rect(5,5, width - 5, height - 5 );   
       }
     } 
}

////////////////////////////
String paddedNumber(int num) {
   // converts a number between 0 and 60 to a string with leading zero
   String prefix;
   if (num < 10) {
      prefix = "0";
  } else {
      prefix = "";
  }
  return prefix + num;
}

///////////////
void setup() {
  size(800, 400);
  smooth();
  frameRate(5);
  bigfont = loadFont("Tahoma-128.vlw"); 
  smallfont = loadFont("Verdana-12.vlw");
  timertype= "Enter Red light time in minutes: 2 (TT Competition) 6 (Icebreaker) 7 (Int/Hum speech)";
  textAlign(CENTER);
  ellipseMode(CENTER);

}

