
import controlP5.*;
import com.onformative.yahooweather.*;

final int stateNormal = 0;
final int stateInput  = 1;
final int stateEdit   = 2;
final int getNewColor = 3;
int state;

int updateInterval = 10000;

ArrayList<DraggableB> notes = new ArrayList();
int selected;
int editNote=-1;
int colorChangeNote=-1;

int xPosForNewNote = 500 + 70;
int yPosForNewNote = 100;

float temperatureValue;

ControlP5 cp5;
Textfield myTextfield;
YahooWeather weather;

String textValue = "";
String weekdayToday;
String weekdayTomorrow;
String temperatureUnit = "c";

PFont font = createFont("Arial", 13, true);
PFont minuteFont;
PFont hourFont;
PFont normal;
PFont normal15;
PFont normal35;
PFont normal25;
PFont normal20;
PFont normalBold25;
PFont normalBold35;

boolean zoomState = false;
boolean intInit = false;

void setup() {
  size(1000, 600);
  smooth(8);


  //frame.removeNotify();
  //frame.setUndecorated(true); //This are for taking out the Windows frame
  //frame.setResizable(true);

  rectMode(CENTER);

  minuteFont = loadFont("ArialMT-130.vlw");
  hourFont = loadFont("Arial-MTBold-130.vlw");
  normal = loadFont("ArialMT-18.vlw");
  normal15 = loadFont("ArialMT-15.vlw");
  normal35 = loadFont("ArialMT-35.vlw");
  normal25 = loadFont("ArialMT-25.vlw");
  normalBold25 = loadFont("Arial-BoldMT-25.vlw");
  normalBold35 = loadFont("Arial-BoldMT-35.vlw");
  normal20 = loadFont("ArialMT-20.vlw");

  weather = new YahooWeather(this, 872551, "c", updateInterval);
  weather.update();
  temperatureValue = weather.getTemperature();

  cp5 = new ControlP5(this);
  myTextfield  = cp5.addTextfield("input")
    .setPosition(width/2 + 70, 20)
      .setSize(300, 20)
        .setFont(normal15)
          .setFocus(false)
            .setColor(color(255));  
  myTextfield.hide();
}

void draw() {
  strokeWeight(1);
  background(255);
  strokeCap(ROUND);
  stroke(190);


  frame.setTitle("Current Notes");

  line(25, height/2 - 100, width/2 - 50, height/2 - 100);
  line(width/2, 25, width/2, height - 25);

  try {

    String weatherCondition = weather.getWeatherCondition();

    fill(108, 190, 255);
    textFont(minuteFont, 130);
    text(int(temperatureValue), width/2 - 480, height/2 + 60);

    fill(#7BC8A4);
    textFont(normalBold35, 35);
    text(weather.getCityName() + ", " + weather.getCountryName(), width/2 - 480, height/2 - 55);

    if (mouseX >= width/2 - 300 - 55/2 && mouseX <= width/2 - 300 + 55/2 && mouseY >= height/2 + 45 - 45/2 && mouseY <= height/2 + 45 + 45/2) {

      fill(240);
      stroke(240);
      rect(width/2 - 300, height/2 + 45, 55, 45);

      if (mousePressed) {
        if (temperatureUnit == "c") {
          delay(500);
          temperatureValue = temperatureValue*9/5 + 32;
          temperatureUnit = "f";
        } else {
          delay(500);
          temperatureValue = (temperatureValue - 32)*5/9;
          temperatureUnit = "c";
        }
      }
    }

    noFill();
    stroke(108, 190, 255);
    strokeWeight(3); 
    ellipse(width/2 - 315, height/2 + 40, 15, 15);
    strokeWeight(1);

    fill(108, 190, 255);
    textFont(font, 40);
    text(temperatureUnit.toUpperCase(), width/2 - 305, height/2 + 60);

    noStroke();
    fill(108, 190, 255);
    textFont(normalBold35, 35);
    text(weather.getWeatherCondition(), 20, 415);

    textFont(normal20, 18);
    text("Humidity: " + weather.getHumidity() + "%", 20, 455);


    text("Pressure: " + int(weather.getPressure()*0.75006375541921) + " mmHg", 20, 488);
    //text("Wind speed: " + weather.getWindSpeed() + " km/h", 20, 521);
    text("Sunrise at " + weather.getSunrise(), 20, 521);
    text("Sunset at " + weather.getSunset(), 20, 554);

    textFont(normal25, 25);
    text("Wind direction ", 290, 415);

    strokeWeight(3);
    stroke(108, 190, 255);
    fill(230);
    ellipse(370, 510, 100, 100);

    pushMatrix();
    translate(370, 510);
    rotate(weather.getWindDirection());
    fill(108, 190, 255);
    stroke(108, 190, 255);
    arc(1, 1, 100, 100, radians(150), radians(210), PIE);
    popMatrix();

    textFont(normal15, 15);
    text("N", 365, 450);
    text("S", 365, 580);
    text("E", 365 + 65, 890/2 + 70);
    text("V", 300, 890/2 + 70);
    fill(255);
    ellipse(370, 510, 70, 70);

    strokeWeight(1);
  }
  catch(NullPointerException npe) {
    textFont(font, 25);
    fill(108, 190, 255);
    text("No data to display at this time", width/2 - 425, height/2 + 100);
  }

  int naturalHour = hour();
  int clockHour = 0;
  int clockMinute = minute();
  int clockSecond = second();
  int clockDay = day();
  int clockMonth = month();
  String stringMonth = "";
  int clockYear = year();

  fill(108, 190, 255);

  if (naturalHour < 13) {
    clockHour = naturalHour;
  } else {

    switch (naturalHour) {
    case 13:
      clockHour = 1;
      break;
    case 14:
      clockHour = 2;
      break;
    case 15:
      clockHour = 3;
      break;
    case 16:
      clockHour = 4;
      break;
    case 17:
      clockHour = 5;
      break;
    case 18:
      clockHour = 6;
      break;
    case 19:
      clockHour = 7;
      break;
    case 20:
      clockHour = 8;
      break;
    case 21:
      clockHour = 9;
      break;
    case 22:
      clockHour = 10;
      break;
    case 23:
      clockHour = 11;
      break;
    }
  }

  textFont(hourFont, 130);

  if (clockHour < 10) {
    text("0" + clockHour, width/2 - 425, height/2 - 175);
  } else {
    text(clockHour, width/2 - 425, height/2 - 175);
  }

  if (naturalHour <= 12) {
    textFont(minuteFont, 20);
    text("PM", width/2 - 95, height/2 - 182);
    rect(width/2 - 80, height/2 - 215, 40, 25);
    fill(255);
    text("AM", width/2 - 95, height/2 - 207);
  } else {
    textFont(minuteFont, 20);
    fill(108, 190, 255);
    text("AM", width/2 - 95, height/2 - 207);
    rect(width/2 - 80, height/2 - 190, 40, 25);
    fill(255);
    text("PM", width/2 - 95, height/2 - 182);
  }

  fill(108, 190, 255);

  textFont(minuteFont, 130);

  text(":", width/2 - 285, height/2 - 175);

  if (clockMinute < 10) {
    text("0" + clockMinute, width/2 - 250, height/2 - 175);
  } else {
    text(clockMinute, width/2 - 250, height/2 - 175);
  }

  switch (clockMonth) {
  case 1: 
    stringMonth = "January"; 
    break;
  case 2: 
    stringMonth = "February"; 
    break;
  case 3: 
    stringMonth = "March"; 
    break;
  case 4: 
    stringMonth = "April"; 
    break;
  case 5: 
    stringMonth = "May"; 
    break;
  case 6: 
    stringMonth = "June"; 
    break;
  case 7: 
    stringMonth = "July"; 
    break;
  case 8: 
    stringMonth = "August"; 
    break;
  case 9: 
    stringMonth = "September"; 
    break;
  case 10: 
    stringMonth = "October"; 
    break;
  case 11: 
    stringMonth = "November"; 
    break;
  case 12: 
    stringMonth = "December"; 
    break;
  }
  String daySufix;

  if (clockDay == 1 || clockDay == 21 || clockDay == 31) {
    daySufix = "st";
  } else {
    if (clockDay == 2 || clockDay == 22) {
      daySufix = "nd";
    } else {
      if (clockDay == 3 || clockDay == 23) {
        daySufix = "rd";
      } else {
        daySufix = "th";
      }
    }
  }

  textFont(normal35, 35);

  text("Monday, " + clockDay + daySufix + " of " + stringMonth + " "
    + clockYear, width/2 - 435, height/2 - 130);
  textSize(13);

  buttonEllipse(width/2 + 50, 30, 20, color(255), color(108, 190, 255), true);

  for (int i = 0; i < notes.size (); i++) {
    DraggableB currNote = notes.get(i);
    currNote.update();
    currNote.display();
  }

  if (state == stateInput || state == stateEdit) 
    myTextfield.setFocus(true);
}

// --------------------------------------------------------

void mousePressed() {
  myTextfield.hide();
  myTextfield.setFocus(false);
  textValue = "";
  if (mousePressedNewNote()) {
    // check new note 
    commandNewNoteBefore();
  } else {
    // check notes
    for (int i = 0; i < notes.size (); i++) {
      DraggableB currNote = notes.get(i);
      if (currNote.over) {
        currNote.lock = true;
        currNote.xOffset = mouseX - currNote.posX;
        currNote.yOffset = mouseY - currNote.posY;
        selected=i; // store index
        return;
      } else {
        currNote.lock = false;
      }
    }
  }
  zoomState = false;
} 

boolean mousePressedNewNote() {
  return dist(mouseX, mouseY, width/2 + 50, 30) < 15;
}

void mouseDragged() {
  if (selected != -1 && selected < notes.size()) {
    if (notes.get(selected).lock) {
      notes.get(selected).posX = mouseX - notes.get(selected).xOffset; 
      notes.get(selected).posY = mouseY - notes.get(selected).yOffset;
    }
  }
} 

void mouseReleased() {
  if (selected!=-1 && selected < notes.size()) {
    notes.get(selected).lock = false;
  }
}

void mouseClicked() {
  if (state == getNewColor) {
    state = stateNormal;
  } else {
    // check notes : menu ced
    for (int i = 0; i < notes.size (); i++) {
      DraggableB currNote = notes.get(i);
      char answer = currNote.buttonClicked();
      switch (answer) { 
      case '/':
        zoomState = false;
        break;
      case 'c':
        // color 
        state = getNewColor; 
        colorChangeNote = i;
        currNote = notes.get(colorChangeNote);
      case 'e':
        editNote = i;
        if (currNote.text != null) {
          commandEditNoteBefore(currNote.text) ;
        } else {
          commandEditNoteBefore("") ;
        } 
        return;
      case 'd':
        notes.remove(i);
        return;
      case 'z':
        zoomState = true;
        return;
      default : 
        // error
        break;
      }
    }
  }
}

void mouseMoved() {
  if (state == getNewColor) {
    DraggableB currNote = notes.get(colorChangeNote);

  }
}

// ---------------------------------------------------------

void commandNewNoteBefore() {
  myTextfield.show();
  myTextfield.setFocus(false);
  state = stateInput;
}

void commandNewNoteAfter(String strInput) {
  DraggableB currNote;
  currNote = new DraggableB(xPosForNewNote, yPosForNewNote, int(60*1.5), strInput);
  notes.add(currNote);
  xPosForNewNote += currNote.size + 80; 
  if (xPosForNewNote > width - 40) {
    xPosForNewNote = 500 + 70;
    yPosForNewNote += 100;
  }
}

//----

void commandEditNoteBefore(String strInput) {
  myTextfield.setValue(strInput);
  myTextfield.show();
  myTextfield.setFocus(true);
  state = stateEdit;
}

void commandEditNoteAfter(String strInput) {
  DraggableB currNote;
  currNote =  notes.get(editNote);
  currNote.text = strInput;
}

// =========================================
// for text input field 

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    // prepare next state  ----------------------------------------------
    textValue = theEvent.getStringValue();
    // hide text field 
    cp5.get(Textfield.class, "input").hide();
    // execute
    if (state==stateEdit)
      commandEditNoteAfter(textValue);
    else if  (state==stateInput)
      commandNewNoteAfter(textValue);
    // reset state 
    state = stateNormal;
  }
}

public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}

// ===============================================================

class DraggableB { //classBegin
  int posX;
  int posY;
  int xOffset;
  int yOffset;

  int size;
  int halfSize;

  int alphaValue = 0;
  int alphaValueBtt = 0;
  int closeAlpha = 0;
  int editAlpha = 0;
  int zoomAlpha = 0;
  int alphaValueND = 70;

  boolean over;
  boolean lock;
  boolean colorPressed = false;

  String text=""; 
  int xValue=0;

  color colorNote = color(255, 198, 93);

  DraggableB(int tempX, int tempY, int tempSize, String tempText) {
    posX = tempX;
    posY = tempY;
    size = tempSize;
    halfSize = size/2;
    text = tempText;
  }

  void update() {
    if (mouseX >= posX - halfSize && mouseX <= posX + halfSize && 
      mouseY >= posY - halfSize && mouseY <= posY + halfSize) {
      over = true;  
      if (!lock) {
        noStroke();
        fill(colorNote); //paleYellow
      } else {
        fill(colorNote); //paleYellow
      } // else
    } // if  
    else {
      stroke(0);
      fill(colorNote); // paleYellow
      over = false;
    }
    if (posX - (size + 28)/2 < width/2) {
      posX = width/2 + (size + 28)/2;
    }
  } //updateEnd

  void display() {

    ////////////////////////////////////////

    if (intInit) {
      alphaValue = 0;
      alphaValueBtt = 0;
      intInit = false;
    }

    if (zoomState) {
      fill(0);
      text(text, width/2, height/2);
    }

    boolean alphaMode = false;

    if (mouseX >= posX - (size + 28)/2 && mouseX <= posX + (size + 28)/2 && mouseY >= posY - size/2 && mouseY <= posY + size/2) {
      alphaMode = true;
    } else {
      if ((mouseX < posX + 16 - (size + 66)/2 || mouseX > posX + 16 + (size + 66)/2) || (mouseY < posY - (size + 6)/2 || mouseY > posY + (size + 6)/2)) {
        alphaMode = false;
      } else {
        alphaMode = true;
      }
    }

    if (alphaMode) {
      alphaValue = min(alphaValue + 2, 70);
      alphaValueND = min(alphaValueND + 2, 100);
      alphaValueBtt = min(alphaValue + 30, 255);
    } else {
      alphaValue = max(alphaValue - 2, 0);
      alphaValueND = max(alphaValueND - 2, 0);
      alphaValueBtt = max(alphaValue - 30, 0);
    }
    stroke(150, alphaValue);
    fill(170, alphaValue);
    rect(posX + 16, posY, size + 66, size + 6);

    ////////////////////////////////////////

    //fill(246, 255, 129);
    fill(colorNote);
    stroke(210, 50);
    rect(posX, posY, size + 28, size);

    noStroke();
    fill(5);

    if (text != null) {
      textFont(normal15, 15);
      text(text, posX + 2, posY + 5, size + 20, size); //NOTE DISPLAY -- MODIFICA RAPID -- URGENTA!
    }

    noStroke();
    fill(190, alphaValueBtt);

    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+80-20/2 && mouseY <= posY-(size+3)/2+80+20/2) {
      closeAlpha = min(closeAlpha + 10, 255);
      fill(255, 100, 100, closeAlpha);
      rect(posX + (size + 28)/2 + 18, posY - (size + 3)/2 + 80, 25, 20, 1);
      fill(240);
      textFont(normal, 18);
      text("x", posX + (size + 28)/2 + 14, posY - (size + 3)/2 + 86);
    } else {
      closeAlpha = max(closeAlpha - 10, 0);
      fill(255, 100, 100, closeAlpha);
      rect(posX + (size + 28)/2 + 18, posY - (size + 3)/2 + 80, 25, 20, 1);  
      if (alphaMode) {
        fill(255);
        textFont(normal, 18);
        text("x", posX + (size + 28)/2 + 14, posY - (size + 3)/2 + 86);
      }
    }

    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+34-20/2 && mouseY <= posY-(size+3)/2+34+20/2) {
      editAlpha = min(editAlpha + 10, 255);
      fill(75, 255, 154, editAlpha);
      rect(posX + (size + 28)/2 + 18, posY - (size + 3)/2 + 34, 25, 20, 1);
      fill(240);
      textFont(normal, 18);
      text("...", posX + (size + 28)/2 + 10, posY - (size + 3)/2 + 34);
    } else {
      editAlpha = max(editAlpha - 10, 0);
      fill(75, 255, 154, editAlpha);
      rect(posX + (size + 28)/2 + 18, posY - (size + 3)/2 + 34, 25, 20, 1);  
      if (alphaMode) {
        fill(255);
        textFont(normal, 18);
        text("...", posX + (size + 28)/2 + 10, posY - (size + 3)/2 + 34);
      }
    }

    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+11-20/2 && mouseY <= posY-(size+3)/2+11+20/2) {
      zoomAlpha = min(zoomAlpha + 10, 255);
      //alphaValueND = min(alphaValueND + 10, 255);
      fill(colorNote);
      noStroke();
      rect(posX+(size+28)/2+18, posY-(size+3)/2+11, 25, 20);
    } else {
      zoomAlpha = max(zoomAlpha - 10, 0);
      //alphaValueND = max(alphaValueND - 3, 70);
      if (alphaMode) {
        fill(colorNote, alphaValue + alphaValueND);
        stroke(190, zoomAlpha);
        rect(posX+(size+28)/2+18, posY-(size+3)/2+11, 25, 20);
      }
    }
    fill(colorNote, zoomAlpha);
    stroke(190, zoomAlpha);
    rect(posX+(size+28)/2+18, posY-(size+3)/2+11, 25, 20);

    if ((mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+11-20/2 && mouseY <= posY-(size+3)/2+11+20/2) && mousePressed) {
      if (mousePressed) {
        delay(200);
        colorPressed = true;
      }
    }
    if (colorPressed) {
      if (colorNote == color(#FFC65D)) {
        //  delay(30);
        colorNote = color(#F16745);
      } else {
        if (colorNote == color(#F16745)) {
          // delay(30);
          colorNote = color(#7BC8A4);
        } else {
          if (colorNote == color(#7BC8A4)) {
            //  delay(30);
            colorNote = color(#4CC3D9);
          } else {
            if (colorNote == color(#4CC3D9)) {
              // delay(30);
              colorNote = color(#93648D);
            } else {
              if (colorNote == color(#93648D)) {
                // delay(30);
                colorNote = color(#FFC65D);
              }
            }
          }
        }
      }
    }
    colorPressed = false;
  }
  //
  char buttonClicked() { //charBegin
    xValue +=1;
    if (dist(mouseX, mouseY, xValue, posY + 2 - 2 ) < 4) return 'c';
    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+11-20/2 && mouseY <= posY-(size+3)/2+11+20/2) return 'm';
    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+34-20/2 && mouseY <= posY-(size+3)/2+34+20/2) return 'e';
    if (mouseX >= posX+(size+28)/2+18-25/2 && mouseX <= posX+(size+28)/2+18+25/2 && mouseY >= posY-(size+3)/2+80-20/2 && mouseY <= posY-(size+3)/2+80+20/2) return 'd';
    return '/';
  }
}

float scale = 20;

void buttonEllipse(int posX, int posY, int size, color colorOut, color colorIn, boolean function) {

  boolean touch;

  if (function == true) {
    fill(colorOut);
    stroke(180);
    ellipse(posX, posY, size, size);

    if (mouseX >= posX - size/2 && mouseX <= posX + size/2 && mouseY >= posY - size/2 && mouseY <= posY + size/2) {
      fill(colorIn);
      stroke(180);
      ellipse(posX, posY, scale, scale);
      touch = true;
      scale = min(scale + 4, 20);
    } else {
      fill(colorIn);
      stroke(180);
      ellipse(posX, posY, scale, scale);
      touch = false;
      scale = max(scale - 4, 0);
    }
  } else {
    loop();
  }
}



