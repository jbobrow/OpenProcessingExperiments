
/*
 THE EVENT MODE 
 In this tab we group all the functions that 
 draw the screens from appState1 to 10
 */

// BEGIN HOMESCREEN
// this function draws the main homescreen
// here the animation of the waves is called
// the timer for the countdown is run
// and the graphics are drawn
void homeAppstate1() {
  x1 = 0;
  x2 = 0;
  xA = 0;
  xB = 0;
  // we draw the main background image and the title
  image(myBackground1, 0, 0);
  image(title, 0, 0); 
  // we draw the main button
  image( training_Unselected, xA, xB);
  // call of the wave function
  waves();
  // y00, the variable that controlls the y position of the wave animation
  // when this value reaches 90 the countdown should start
  if (y00<=90) {
    // running is a boolean value that checks 
    // if the cuntdown is already running
    // when it is not we should inizialize the variable startTime
    // and set running to true
    if (running == false) {
      startTime = setTime;
      running = true;
    }
    // once running is set to true we declare a variable test 
    // that is the differece between startingTime 
    // and the current millisecond value
    if (running == true) {
      int test = startingTime - millis();
      // displayTime is the variable that will display in the countdown
      displayTime = startTime + test;
    }
    if (displayTime >= 0) {
      dHours = (displayTime / 1000 / 60/ 60);
      dMins = (displayTime / 1000 / 60) % 60;
      dSecs = (displayTime / 1000) % 60;
    }
    // after all the necessary proportion for hour, minutes and seconds
    // we draw the countdown text
    image(countdownBG, 0, 0);
    textFont (fontBlack);
    fill(0);
    textSize (90);
    textAlign(LEFT);
    text(nf(dHours, 2) + " HOURS", 100, 200);
    text( nf(dMins, 2) + " MINUTES", 100, 270);
    text( nf(dSecs, 2) + " SECONDS", 100, 340);
    // we reset the text characteristic to default for futer texts 
    textFont (font);
    fill(255);
    textSize (20);
    textAlign(CENTER);
  }
  else {
    displayTime = 45000;
  }
  // when the countdown comes to 0
  // we change the appstate to 2
  // and we record the current position of the waves 
  if (displayTime<=0) {
    appState=2;
    y00still=y00;
    pos00still=pos00;
  }
}// END HOMESCREEN


// BEGIN FIRST CALL SCREEN
void callAppstate2() {
  x1 = 0;
  x2 = 0;
  xA = 0;
  xB = 0;
  // in this appstate we start to play the audio file "call.mp3"
  player.play();
  // call the waveStill() function
  wavesStill();
  // draw interface and title
  image (call, 0, 0);
  image(title, 0, 0);
  image(answer_Fake, 0, 0);
  image(answer, 0, 0);
  image (decline_Fake, 0, 0);
  image (decline, 0, 0);
  // we draw the required texts
  textFont (font);
  fill(255);
  textSize (20);
  textAlign(CENTER);
  text ("ANSWER!", width/2, 212);
  textFont (font);
  fill(255);
  textSize (20);
  textAlign(CENTER);
  text ("And shout YEAH", 0, 220, 320, 100);
  text ("to participate", 0, 245, 320, 100);
}// END FIRST CALL SCREEN


// BEGIN SECOND CALL SCREEN
void callAppstate200() {
  x1 = 0;
  x2 = 0;
  xA = 0;
  xB = 0;
  // in this appstate we start to play the second audio file "voice.mp3"
  player1.play();
  // call the waveStill() function
  wavesStill();
  // draw interface and title
  image (call, 0, 0);
  image(title, 0, 0);
  image(closeCall, 0, 0);
  // we draw the required texts
  textFont (font);
  fill(255);
  textSize (20);
  textAlign(CENTER);
  text ("SAY YEAH!", width/2, 212);
  textFont (font);
  fill(255);
  textSize (20);
  textAlign(CENTER);
  text ("And you are ready", 0, 220, 320, 100);
  text ("to go!", 0, 245, 320, 100);
}// END SECOND CALL SCREEN


// BEGIN FIRST EVENT SCREEN
void event1Appstate3() {
  xG=0;
  xH=0;
  wavesStill();
  image(title, 0, 0);
  image(playRoute, xG, xH);
}// END FIRST EVENT SCREEN


//BEGIN SECOND EVENT SCREEN
// this appState starts a new timer 
// that is used for the stopwatch function
void event2Appstate4() {
  xG=0;
  xH=0;
  wavesStill();
  image(title, 0, 0);
  image(stopRoute, xG, xH);
  image(timerBG, 0, 0);
  // for the timer we need one variable
  // t that is inizialized at 0 and will have the value of the milliseconds
  int t = 0;
  // we also need three variables that are dependent from the t
  int thour;
  int tmin;
  int tsec;
  // the t varialble assumes the values of the current milliseconds
  // minus the ammount of milliseconds already went by
  t = millis() - startingTime;
  // we make the necessary proportion to transform 
  // the millisecond in seconds, minutes and hours
  tsec = (t/(1000)) - (60*minuti) ;
  tmin = minuti;
  thour = t/(60*60*1000);
  if (tsec >= 60) {
    minuti += 1;
  }
  if (minuti >= 60) {
    thour += 1;
  }
  // we then display the countdown in the style we want
  textFont (fontBlack);
  fill(0);
  textSize (48);
  textAlign(CENTER);
  text(nf(thour, 2) +" : "+nf(tmin, 2)+" : "+nf(tsec, 2), width/2, 155);
  // we reset the text styling for future texts
  textFont (font);
  fill(255);
  textSize (20);
  textAlign(CENTER);
}// END SECOND EVENT SCREEN


// BEGIN LOSER SCREEN
void eventLoserAppstate5() {
  image(eventLoser, 0, 0);
}// END LOSER SCREEN


// BEGIN WIN SCREEN
void eventWinAppstate6() {
  image(eventWin, 0, 0);
}// END WIN SCREEN


// BEGIN TRAINING MODE MENU
void trainingAppstate10() {
  x1 = 0;
  x2 = 0;
  xA = 0;
  xB = 0;
  xC=0;
  xD=0;
  xE=0;
  xF=0;
  // interface elements
  image(myBackground2, 0, 0);
  image(title, 0, 0);
  image( countdown_Unselected, x1, x2);
  image(yourRoute, xC, xD);
  image(moodRoute, xE, xF);
}


// BEGIN TRAINING GUI 
// This function draws all the basic elements 
//  of the trainign mode interface
//  so that we don't have to retype it averytime for every screen
void trainingGUI() {
  x1 = 0;
  x2 = 0;
  xA = 0;
  xB = 0;
  // interface Elements
  image(myBackground2, 0, 0);
  image(title, 0, 0);
  image( countdown_Unselected, x1, x2);
  fill(255, 255, 255);
}// END TRAINING GUI



// BEGIN STOP AUDIO FUNCTION
// This function closes the Minim library classes
void stop() {
  player.close();
  minim.stop();
  super.stop();
}// END STOP AUDIO FUNCTION


