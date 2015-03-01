




// for calendar
import java.util.*;
import java.util.Calendar;
import java.text.*;
import java.text.DateFormat;

//
// the states of the program like start 
// screen / pause screen / enter name screen
// we start by giving the states names.
// Those are consts. 
final int stateReadName = 0; // consts 
final int statePlayGame = 1;
// Then we assign one const to the current state. 
int state = stateReadName;   // current 

String birthdayString = "";

void setup() {
  size(720, 220);
}

void draw() {
  if (state==stateReadName) {
    background(0);
    fill(255);
    text("Type your birthday and press enter (e.g. 30.07.1991):", 20, 20);
    fill(255, 255, 0);
    text(birthdayString, 20, 50);
  }
  else if (state==statePlayGame) {
    background(0);
    fill((millis()+100)%255, (millis()+200)%255, millis()%255);
    ellipse(width-18, height-18, 20, 20);
    fill (255);
    text (birthdayString + " is your bday. Klick mouse to re-start.", 10, 12);
  }
}

void keyPressed() {
  if (state==stateReadName) {
    // what key was it?   ---
    if ( (key>='0'&&key<='9') || (key == '.' ) ) {
      if (birthdayString.length() < 10 ) {
        birthdayString+=key; // add this key to our name
      }
    } // Letter 
    else if (key==ENTER||key==RETURN) {
      // check input (more checks needed)      
      int errorCode = 0; // all ok
      if (birthdayString.length()!=10) errorCode = 1; // length is wrong  
      if (!isThisDateValid(birthdayString, "dd.MM.yyyy")) errorCode = 2; // length is wrong
      switch(errorCode) {
      case 0: 
        // go on to game
        state = statePlayGame;
        String myDay = birthdayString.substring(0, 2); 
        String myMonth = birthdayString.substring(3, 5); 
        String myYear = birthdayString.substring(6, 10); 
        println ("You birthday is  "+birthdayString+". \n" + myDay + "-" + myMonth + "--" + myYear);
        makeAnAppointment(int(myYear), int(myMonth), int(myDay));
        break; 
      case 1: 
        println ("wrong length");
        // birthdayString="";
        break; 
      case 2: 
        println ("not a date ");
        // birthdayString="";
        break;
      default:
        println ("Big mistake - unknown errorCode - 174"); 
        break;
      } // switch
    } // ENTER
    else if (key==BACKSPACE) {
      if (birthdayString.length()>0) {
        birthdayString=birthdayString.substring(0, birthdayString.length()-1);
      }
    } // BACKSPACE
    else { 
      println ("Unknow key "+ key);
    } // else
    // end of check for keys ---
  } // if state
}

void makeAnAppointment(int year, int month, int day) {

  println ( year + "//" + month + "//" + day ) ;

  Calendar cal = Calendar.getInstance();

  cal.set(year, month-1, day, 0, 0);
  Date bornOn = cal.getTime();

  Calendar cal1 = Calendar.getInstance();
  cal1.set(year(), month()-1, day(), hour(), minute());
  Date todayIs = cal1.getTime();

  println ( cal.compareTo (cal1)  );
  println ( todayIs.compareTo (bornOn)  );
}

boolean isThisDateValid(String dateToValidate, String dateFromat) {

  if (dateToValidate == null) {
    return false;
  }

  SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
  sdf.setLenient(false);

  try {

    //if not valid, it will throw ParseException
    Date date = sdf.parse(dateToValidate);
    println(date);
  } 
  catch (ParseException e) {

    e.printStackTrace();
    return false;
  }

  return true;
}

void mousePressed() {
  // return to enter name
  if (state==statePlayGame) {
    state=stateReadName;
  }
}
//


