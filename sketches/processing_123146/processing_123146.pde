
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="DefconBackground.png"; */

PImage bg;
PFont f1;
PFont f2;
int s = second();
int y = 1945;
int mo;
int totalNuke = 0;
float NukeX;
float NukeY;
float savedTimeYear = millis();
float savedTimeMonth = millis();
float startTimeYear;
float totalTimeYear;
float totalTimeMonth = 1000;
float diamNew;
float diamExist;
float diamDecay = 1;
float savedTime;
boolean detAlternator = true;
boolean pulse = false;
String month;

void setup() {
  size(1280, 800);
  bg = loadImage("DefconBackground.png");
  background(bg);
  f1 = createFont("Arial",28,false); // Arial, 16 point, anti-aliasing on
  f2 = createFont("Arial",36,false);

  if (second() == 0) { //Safeguard against fringe case start time
    startTimeYear = 200;//1000;
    //println(startTimeYear);
  } else {
    startTimeYear = (second()/5) * 1000;
    //println(startTimeYear);
  }
  
  totalTimeYear = 12000 - startTimeYear; //60000 - startTimeYear;
  //println(totalTimeYear);
  
  //Set initial month based on current second passed in current minute when game was started
  if (s >= 0 && s <= 4) {
    mo = 1;
  } else if (s >= 5 && s <= 9) {
    mo = 2;
  } else if (s >= 10 && s <= 14) {
    mo = 3;
  } else if (s >= 15 && s <= 19) {
    mo = 4;
  } else if (s >= 20 && s <= 24) {
    mo = 5;
  } else if (s >= 25 && s <= 29) {
    mo = 6;
  } else if (s >= 30 && s <= 34) {
    mo = 7;
  } else if (s >= 35 && s <= 39) {
    mo = 8;
  } else if (s >= 40 && s <= 44) {
    mo = 9;
  } else if (s >= 45 && s <= 49) {
    mo = 10;
  } else if (s >= 50 && s <= 54) {
    mo = 11;
  } else if (s >= 55 && s <= 59) {
    mo = 12;
  }

}

void draw() {
  float passedTimeYear = millis() - savedTimeYear;
  float passedTimeMonth = millis() - savedTimeMonth;
 
  //Cycle through years at rate of 5 years per min, or one year per 12 seconds
  if (passedTimeYear > totalTimeYear) {
    y += 1;
    savedTimeYear = millis();
    totalTimeYear = 12000;//60000;
    //background(bg);//optional flag for yearly reset
    //println(totalTimeYear);
  }

  //Cycle through and reset months
  if (passedTimeMonth > totalTimeMonth) {
    mo += 1;
    savedTimeMonth = millis();
    //totalTimeYear = 12000;
    if (mo >= 13) {
      mo = 1;
    }
  }

  //Switch month
  switch(mo) {
    case (1):
    month = "January";
    break;
    case (2):
    month = "February";
    break;
    case (3):
    month = "March";
    break;
    case (4):
    month = "April";
    break;
    case (5):
    month = "May";
    break;
    case (6):
    month = "June";
    break;
    case (7):
    month = "July";
    break;
    case (8):
    month = "August";
    break;
    case (9):
    month = "September";
    break;
    case (10):
    month = "October";
    break;
    case (11):
    month = "November";
    break;
    case (12):
    month = "December";
    break;
  }
  
  //GUI text for month, year, and total nukes
  textFont(f1,28);  
  textAlign(RIGHT);
  stroke(0);
  fill(0);
  rect(1030,50,240,40);
  rect(1030,720,240,70);
  fill(255); 
  text(month + " " + y,1265,80);
  textFont(f2,60); 
  text(totalNuke,1260,772);

  /*//////////Begin sequence of 2053 nuclear detonations (random placement)//////////*/
  if (mo == 1 && y == 1945 && detAlternator == true) {
    background(bg);
    totalNuke = 0;
    detAlternator = false;
  } 
  
  //1945 USA
  if (mo == 7 && y == 1945 && detAlternator == false) {
    NukeInstance(); //1
    detAlternator = true;
  } 
  
  if (mo == 8 && y == 1945 && detAlternator == true) {
    NukeInstance(); //2
    NukeInstance(); //3
    detAlternator = false;
  }
  
  //1946
  if (mo == 7 && y == 1946 && detAlternator == false) {
    NukeInstance(); //4
    detAlternator = true;
  } 
  if (mo == 8 && y == 1946 && detAlternator == true) {
    NukeInstance(); //5
    detAlternator = false;
  } 
  
  //1948
  if (mo == 4 && y == 1948 && detAlternator == false) {
    NukeInstance(); //6
    detAlternator = true;
  } 
  if (mo == 5 && y == 1948 && detAlternator == true) {
    NukeInstance(); //7
    detAlternator = false;
  } 
  
  //1949 Soviets
  if (mo == 9 && y == 1949 && detAlternator == false) {
    NukeInstance(); //8
    detAlternator = true;
  } 
  
  //1951////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1951 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  //Generics - 2040 more nukes by 47 more years (45 over 40 years (1800), 30 over 6 years, 60 over 1 year
  if (mo == 2 && y == 1951 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1951 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1951 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1951 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1951 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1951 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1951 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1951 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1951 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1951 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1951 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1952////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1952 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1952 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1952 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1952 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1952 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1952 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1952 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1952 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1952 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1952 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1952 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1952 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1953////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1953 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1953 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1953 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1953 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1953 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1953 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1953 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1953 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1953 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1953 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1953 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1953 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1954////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1953 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1953 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1953 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1953 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1953 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1953 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1953 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1953 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1953 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1953 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1953 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1953 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1955////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1955 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1955 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1955 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1955 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1955 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1955 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1955 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1955 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1955 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1955 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1955 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1955 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1956////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1956 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1956 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1956 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1956 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1956 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1956 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1956 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1956 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1956 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1956 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1956 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1956 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1957////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1957 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1957 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1957 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1957 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1957 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1957 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1957 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1957 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1957 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1957 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1957 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1957 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1958////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1958 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1958 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1958 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1958 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1958 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1958 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1958 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1958 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1958 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1958 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1958 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1958 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1959////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1959 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1959 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1959 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1959 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1959 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1959 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1959 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1959 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1959 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1959 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1959 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1959 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1960////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1960 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1960 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1960 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1960 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1960 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1960 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1960 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1960 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1960 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1960 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1960 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1960 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
    //1961////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1961 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  //Generics - 2040 more nukes by 47 more years (45 over 40 years (1800), 30 over 6 years, 60 over 1 year
  if (mo == 2 && y == 1961 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1961 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1961 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1961 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1961 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1961 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1961 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1961 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1961 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1961 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1961 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1962////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1962 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1962 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1962 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1962 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1962 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1962 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1962 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1962 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1962 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1962 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1962 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1962 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1963////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1963 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1963 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1963 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1963 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1963 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1963 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1963 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1963 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1963 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1963 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1963 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1963 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1964////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1964 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1964 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1964 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1964 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1964 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1964 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1964 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1964 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1964 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1964 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1964 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1964 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1965////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1965 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1965 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1965 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1965 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1965 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1965 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1965 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1965 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1965 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1965 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1965 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1965 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1966////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1966 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1966 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1966 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1966 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1966 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1966 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1966 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1966 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1966 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1966 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1966 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1966 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1967////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1967 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1967 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1967 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1967 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1967 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1967 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1967 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1967 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1967 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1967 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1967 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1967 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1968////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1968 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1968 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1968 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1968 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1968 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1968 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1968 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1968 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1968 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1968 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1968 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1968 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1969////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1969 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1969 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1969 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1969 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1969 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1969 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1969 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1969 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1969 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1969 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1969 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1969 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
  //1970////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1970 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    NukeInstance(); //12
    NukeInstance(); //13
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1970 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    NukeInstance(); //17
    NukeInstance(); //18
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1970 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    NukeInstance(); //22
    NukeInstance(); //23
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1970 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    NukeInstance(); //27
    NukeInstance(); //28
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1970 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    NukeInstance(); //32
    NukeInstance(); //33
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1970 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    NukeInstance(); //37
    NukeInstance(); //38
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1970 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    NukeInstance(); //42
    NukeInstance(); //43
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1970 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    NukeInstance(); //47
    NukeInstance(); //48
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1970 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    NukeInstance(); //52
    NukeInstance(); //53
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1970 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    NukeInstance(); //57
    NukeInstance(); //58
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1970 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    NukeInstance(); //62
    NukeInstance(); //63
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1970 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    NukeInstance(); //67
    NukeInstance(); //68
    detAlternator = true;
  } 
  
    //1971////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1971 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  //Generics - 2040 more nukes by 47 more years (45 over 40 years (1800), 30 over 6 years, 60 over 1 year
  if (mo == 2 && y == 1971 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
   
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1971 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
   
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1971 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1971 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1971 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1971 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1971 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
   
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1971 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1971 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1971 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1971 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
   
    detAlternator = true;
  } 
  
  //1972////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1972 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
  
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1972 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1972 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
   
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1972 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1972 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1972 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1972 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
  
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1972 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1972 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1972 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1972 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
 
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1972 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
   
    detAlternator = true;
  } 
  
  //1973////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1973 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
   
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1973 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
   
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1973 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1973 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
  
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1973 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31

    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1973 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1973 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1973 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1973 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1973 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1973 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1973 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1974////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1974 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1974 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
 
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1974 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
   
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1974 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1974 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1974 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1974 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
   
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1974 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
   
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1974 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1974 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1974 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1974 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1975////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1975 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
 
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1975 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1975 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1975 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
  
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1975 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1975 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1975 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1975 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
 
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1975 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1975 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1975 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1975 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1976////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1976 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1976 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
 
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1976 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1976 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1976 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31

    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1976 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1976 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1976 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
 
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1976 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
 
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1976 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1976 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1976 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
  
    detAlternator = true;
  } 
  
  //1977////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1977 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
 
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1977 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
 
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1977 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
  
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1977 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1977 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1977 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
 
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1977 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1977 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1977 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1977 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1977 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
  
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1977 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
 
    detAlternator = true;
  } 
  
  //1978////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1978 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1978 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1978 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
 
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1978 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
   
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1978 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1978 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1978 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1978 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1978 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1978 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1978 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1978 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    
    detAlternator = true;
  } 
  
  //1979////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1979 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1979 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1979 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1979 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1979 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31

    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1979 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1979 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
  
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1979 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
   
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1979 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1979 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1979 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1979 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    
    detAlternator = true;
  } 
  
  //1980////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1980 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1980 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
  
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1980 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
 
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1980 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
   
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1980 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1980 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1980 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
   
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1980 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1980 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
  
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1980 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
 
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1980 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
  
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1980 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
 
    detAlternator = true;
  } 
  
  //1981////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1981 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
  
    detAlternator = false;
  } 
  
  //Generics - 2040 more nukes by 47 more years (45 over 40 years (1800), 30 over 6 years, 60 over 1 year
  if (mo == 2 && y == 1981 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1981 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1981 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1981 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1981 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1981 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
   
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1981 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1981 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1981 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1981 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
    
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1981 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
   
    detAlternator = true;
  } 
  
  //1982////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1982 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1982 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1982 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
   
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1982 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
  
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1982 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1982 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1982 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1982 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1982 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1982 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1982 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
 
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1982 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1983////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1983 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1983 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1983 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1983 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1983 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
 
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1983 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1983 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
 
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1983 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1983 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1983 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1983 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1983 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1984////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1984 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1984 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1984 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1984 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1984 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31

    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1984 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1984 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
 
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1984 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1984 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1984 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1984 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1984 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1985////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1985 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
 
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1985 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1985 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
   
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1985 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1985 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1985 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36

    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1985 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41

    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1985 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1985 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1985 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1985 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
 
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1985 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
    
    detAlternator = true;
  } 
  
  //1986////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1986 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1986 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
   
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1986 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
 
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1986 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1986 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1986 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1986 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
  
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1986 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46

    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1986 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
  
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1986 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1986 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
  
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1986 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
 
    detAlternator = true;
  } 
  
  //1987////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1987 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1987 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
 
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1987 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1987 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
  
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1987 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1987 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
  
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1987 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
  
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1987 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
 
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1987 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1987 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1987 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
  
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1987 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1988////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1988 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
  
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1988 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
  
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1988 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1988 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1988 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1988 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
  
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1988 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
  
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1988 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
  
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1988 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1988 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1988 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1988 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
 
    detAlternator = true;
  } 
  
  //1989////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1989 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
   
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1989 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
  
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1989 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1989 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1989 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1989 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1989 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
   
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1989 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
  
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1989 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
   
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1989 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
    
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1989 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
  
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1989 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1990////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1990 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
  
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1990 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1990 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1990 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
 
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1990 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
  
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1990 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1990 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
 
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1990 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
   
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1990 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51

    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1990 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56

    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1990 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1990 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1991////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1991 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11

    detAlternator = false;
  } 
  
  //Generics - 2040 more nukes by 47 more years (45 over 40 years (1800), 30 over 6 years, 60 over 1 year
  if (mo == 2 && y == 1991 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
 
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1991 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21

    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1991 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26

    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1991 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31

    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1991 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1991 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1991 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
 
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1991 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
  
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1991 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1991 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61

    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1991 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
   
    detAlternator = true;
  } 
  
  //1992////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1992 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
 
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1992 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
  
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1992 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
  
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1992 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
   
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1992 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1992 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1992 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1992 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1992 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1992 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
  
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1992 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1992 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66
  
    detAlternator = true;
  } 
  
  //1993////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1993 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
 
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1993 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16

    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1993 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
 
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1993 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
  
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1993 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
   
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1993 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
   
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1993 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1993 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1993 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    NukeInstance(); //51
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1993 && detAlternator == false) {
    NukeInstance(); //54
    NukeInstance(); //55
    NukeInstance(); //56
   
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1993 && detAlternator == true) {
    NukeInstance(); //59
    NukeInstance(); //60
    NukeInstance(); //61
   
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1993 && detAlternator == false) {
    NukeInstance(); //64
    NukeInstance(); //65
    NukeInstance(); //66

    detAlternator = true;
  } 
  
  //1994////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1994 && detAlternator == true) {
    NukeInstance(); //9
    NukeInstance(); //10
    NukeInstance(); //11
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1994 && detAlternator == false) {
    NukeInstance(); //14
    NukeInstance(); //15
    NukeInstance(); //16
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1994 && detAlternator == true) {
    NukeInstance(); //19
    NukeInstance(); //20
    NukeInstance(); //21
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1994 && detAlternator == false) {
    NukeInstance(); //24
    NukeInstance(); //25
    NukeInstance(); //26
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1994 && detAlternator == true) {
    NukeInstance(); //29
    NukeInstance(); //30
    NukeInstance(); //31
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1994 && detAlternator == false) {
    NukeInstance(); //34
    NukeInstance(); //35
    NukeInstance(); //36
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1994 && detAlternator == true) {
    NukeInstance(); //39
    NukeInstance(); //40
    NukeInstance(); //41
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1994 && detAlternator == false) {
    NukeInstance(); //44
    NukeInstance(); //45
    NukeInstance(); //46
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1994 && detAlternator == true) {
    NukeInstance(); //49
    NukeInstance(); //50
    
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1994 && detAlternator == false) {
    NukeInstance(); //54
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1994 && detAlternator == true) {
    NukeInstance(); //59
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1994 && detAlternator == false) {
    NukeInstance(); //64
    detAlternator = true;
  } 
  
  //1995////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1995 && detAlternator == true) {
    NukeInstance(); //9
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1995 && detAlternator == false) {
    NukeInstance(); //14
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1995 && detAlternator == true) {
    NukeInstance(); //19
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1995 && detAlternator == false) {
    NukeInstance(); //24
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1995 && detAlternator == true) {
    NukeInstance(); //29
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1995 && detAlternator == false) {
    NukeInstance(); //34
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1995 && detAlternator == true) {
    NukeInstance(); //39
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1995 && detAlternator == false) {
    NukeInstance(); //44
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1995 && detAlternator == true) {
    NukeInstance(); //49
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1995 && detAlternator == false) {
    NukeInstance(); //54
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1995 && detAlternator == true) {
    NukeInstance(); //59
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1995 && detAlternator == false) {
    NukeInstance(); //64
    detAlternator = true;
  } 
  
  //1996////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1996 && detAlternator == true) {
    NukeInstance(); //9
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1996 && detAlternator == false) {
    NukeInstance(); //14
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1996 && detAlternator == true) {
    NukeInstance(); //19
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1996 && detAlternator == false) {
    NukeInstance(); //24
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1996 && detAlternator == true) {
    NukeInstance(); //29
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1996 && detAlternator == false) {
    NukeInstance(); //34
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1996 && detAlternator == true) {
    NukeInstance(); //39
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1996 && detAlternator == false) {
    NukeInstance(); //44
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1996 && detAlternator == true) {
    NukeInstance(); //49
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1996 && detAlternator == false) {
    NukeInstance(); //54
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1996 && detAlternator == true) {
    NukeInstance(); //59
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1996 && detAlternator == false) {
    NukeInstance(); //64
    detAlternator = true;
  } 
  
  //1997////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1997 && detAlternator == true) {
    NukeInstance(); //9
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1997 && detAlternator == false) {
    NukeInstance(); //14
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1997 && detAlternator == true) {
    NukeInstance(); //19
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1997 && detAlternator == false) {
    NukeInstance(); //24
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1997 && detAlternator == true) {
    NukeInstance(); //29
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1997 && detAlternator == false) {
    NukeInstance(); //34
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1997 && detAlternator == true) {
    NukeInstance(); //39
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1997 && detAlternator == false) {
    NukeInstance(); //44
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1997 && detAlternator == true) {
    NukeInstance(); //49
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1997 && detAlternator == false) {
    NukeInstance(); //54
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1997 && detAlternator == true) {
    NukeInstance(); //59
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1997 && detAlternator == false) {
    NukeInstance(); //64
    detAlternator = true;
  } 
  
  //1998////////////////////////////////////////////////////////////////////////////////////////////////
  if (mo == 1 && y == 1998 && detAlternator == true) {
    NukeInstance(); //9
    detAlternator = false;
  } 
  
  if (mo == 2 && y == 1998 && detAlternator == false) {
    NukeInstance(); //14
    detAlternator = true;
  } 
  
  if (mo == 3 && y == 1998 && detAlternator == true) {
    NukeInstance(); //19
    detAlternator = false;
  } 
  
  if (mo == 4 && y == 1998 && detAlternator == false) {
    NukeInstance(); //24
    detAlternator = true;
  } 
  
  if (mo == 5 && y == 1998 && detAlternator == true) {
    NukeInstance(); //29
    detAlternator = false;
  } 
  
  if (mo == 6 && y == 1998 && detAlternator == false) {
    NukeInstance(); //34
    detAlternator = true;
  } 
  
  if (mo == 7 && y == 1998 && detAlternator == true) {
    NukeInstance(); //39
    detAlternator = false;
  } 
  
  if (mo == 8 && y == 1998 && detAlternator == false) {
    NukeInstance(); //44
    detAlternator = true;
  } 
  
  if (mo == 9 && y == 1998 && detAlternator == true) {
    NukeInstance(); //49
    detAlternator = false;
  } 
  
  if (mo == 10 && y == 1998 && detAlternator == false) {
    NukeInstance(); //54
    detAlternator = true;
  } 
  
  if (mo == 11 && y == 1998 && detAlternator == true) {
    NukeInstance(); //59
    detAlternator = false;
  } 
  
  if (mo == 12 && y == 1998 && detAlternator == false) {
    NukeInstance(); //64
    detAlternator = true;
  } 

  //Reset year back to 1945
  if (y > 1998) {
    y = 1945;
  }
}

void NukeInstance() {
  diamNew = random(7,40);
  NukeX = random(20, 1260); //width);
  NukeY = random(150, 680); //height);
  stroke(250,0,0);
  fill(200,0,0,70);
  ellipse(NukeX, NukeY, diamNew, diamNew);
  totalNuke += 1;
}



