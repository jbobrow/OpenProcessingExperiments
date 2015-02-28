
//CSE 174H

//Primitive Digital Clock
//A Processing Sketch by
//Jeremy Beard

//I made a clock that is displayed by rectangles

//The screen will be divided up into
//3 vertical rectangles
//One for hour, minute, second

//The rectangles will grow vertically larger
//as time goes on


//INSTRUCTIONS FOR CLOCK THEMES/PERSONALIZATION
//Press the spacebar to toggle the digital clock readout
//Press "p" to toggle the display of "AM" or "PM"
//Press "d" for the Day Theme 
//Press "n" for the Night Theme
//Press "r" for the Red Theme
//Press "g" for the Green Theme
//Press "b" for the Blue Theme

//Enjoy!

final int TOOLBAR_SIZE = 70;
boolean digitalReadoutOn = true;
boolean displayAMPM = true;


boolean nightTheme = true;
int clockBackground = 90;
int textColor = 255;

boolean blueTheme = true;
boolean greenTheme = false;
boolean redTheme = false;
color hourRectColor = color (0, 0, 255, 150);
color minuteRectColor = color (0, 100, 255, 150);
color secondRectColor = color (0, 175, 255, 150);

void setup() {
  noCursor();
  //size(300, screenHeight - TOOLBAR_SIZE);
  size(300, 500); //screenHeight i guess didn't work with 
                  //OpenProcessing...there goes my constant.
  
  
  //Creates font. I'm still just following instructions 
  //When it comes to knowing how to do fonts
  PFont font;
  font = createFont("Courier New", 64, true);
  textFont(font, 64);
}



void draw() {
  noStroke();
  
  fill(clockBackground, 20);
  rect(0, 0, width, height);

  drawHour();
  drawMinute();
  drawSecond();
  
  switchDigitalReadout();
  switchNightDayTheme();  
  switchColorTheme();
    
}






void drawHour() {

  //draws hour rectangle
  //if hour=13, then it resets to 1
  //screenHeight

  float hourIncrement = (height / 12);
  int h = hour();

  rectMode(CORNERS);
  fill(hourRectColor);
  rect(0, 0, width / 3, 
      (h%12 + 1) * hourIncrement); //with each hour, the 
      //rectSize will increase
      //h%12 + 1 was used because 12:00 would be 0:00 and thus
      //would have no rect width. 
}





void drawMinute() {

  //draws minute rectangle
  //I'm not sure why I had to use 58.9 instead of 60 for the 
  //minute/second increment. It's weird

  float minuteSecondIncrement = (height / 58.9);
  int m = minute();

  fill(minuteRectColor);    
  rect(width / 3, 0, 2 * width / 3, 
  (m * minuteSecondIncrement));
}






void drawSecond() {

  //draws second rectangle
  //again, I'm not sure why 58.9 had to be used instead of 60
  float minuteSecondIncrement = (height / 58.9);
  int s = second();

  fill(secondRectColor);    
  rect(2 * width / 3, 0, width, 
  (s * minuteSecondIncrement));
}



void switchDigitalReadout() {
  if (digitalReadoutOn) 
    drawDigitalReadout();
  
  if (displayAMPM) 
    drawAMPM();
  
}




void switchNightDayTheme() {
  if (nightTheme) 
    drawNightTheme();
  
  else if (!nightTheme) 
    drawDayTheme();
  
}




void switchColorTheme() {
  if (redTheme) 
    drawRedTheme();
  
  else if (greenTheme) 
    drawGreenTheme();
  
    else if (blueTheme) 
      drawBlueTheme();
  
    
}




void drawDigitalReadout() {
  /*In all of the following text displays,
  the text will stay centered regardless of screenWidth changes.
  Notice that in each text(), the second parameter is the x-coord
  of the text. In each case, you will notice that the text
  stays centered.*/
  
  //println(second());
  //The line above was used for development purposes

  fill(textColor, 255);

  

  //Draws Digital readout
  //2 nested if-thens were used for 
  //digits 1-9 to have a 0 in front
  //ex. 6:09.05 instead of 6:9.5
  if (minuteLessThanTen()) {
    
    if (secondsLessThanTen()) {
      text((hour()%12) + ":0" + minute() + ".0" + second(), 
      (width/2) - 150, 
      height - 100);
    }
    
    else
    text((hour()%12) + ":0" + minute() + "." + second(), 
        (width/2) - 150, 
        height - 100);
  }
  
  
  else 
  if (!minuteLessThanTen()) {
    
    if (secondsLessThanTen()) {
      text((hour()%12) + ":" + minute() + ".0" + second(), 
      (width/2) - 150, 
      height - 100);
    }
    
    else
    text((hour()%12) + ":" + minute() + "." + second(), 
    (width/2) - 150, 
    height - 100);
  }  
}



boolean minuteLessThanTen() {
  return minute() < 10;
}
  
  
boolean secondsLessThanTen() {
  return second() < 10;
}




void drawAMPM() {
  //Displays "AM" or "PM"
  fill(textColor, 255);
  if (hour() < 12) 
    text("AM", (width/2) - 45, height - 50);
  
  else
  text("PM", (width/2) - 45, height - 50);
}




void drawNightTheme() {
  clockBackground = 90;
  textColor = 255;
}


void drawDayTheme() {
  clockBackground = 245;
  textColor = 30;
}
  

void drawRedTheme() {
  hourRectColor = color (255, 0, 0, 150);
  minuteRectColor = color (255, 100, 0, 150);
  secondRectColor = color (255, 175, 0, 150);
}



void drawGreenTheme() {
  hourRectColor = color (0, 255, 0, 150);
  minuteRectColor = color (0, 255, 100, 150);
  secondRectColor = color (0, 255, 175, 150);
}



void drawBlueTheme() {
  hourRectColor = color (0, 0, 255, 150);
  minuteRectColor = color (0, 100, 255, 150);
  secondRectColor = color (0, 175, 255, 150);
}



//The Switcher that makes it all happen =]
void keyPressed() {
  
  //Digital Readout Switcher
  if (keyCode == 32)   //spacebar
    digitalReadoutOn = !digitalReadoutOn;
  
  if (keyCode == 80)    //"p" key
    displayAMPM = !displayAMPM;
  
  
  //Night/Day Theme Key Switcher
  if (keyCode == 78)    //"n" key
    nightTheme = true;
  
  if (keyCode == 68)    //"d" key
    nightTheme = false;
  
  
  //Color Theme Switcher
  if (keyCode == 82) {  //"r" key
    redTheme = true;
    greenTheme = false;
    blueTheme = false;
  }
  if (keyCode == 71) {   //"g" key
    redTheme = false;
    greenTheme = true;
    blueTheme = false;
  }
  if (keyCode == 66) {  //"b" key
    redTheme = false;
    greenTheme = false;
    blueTheme = true;
  }
}

