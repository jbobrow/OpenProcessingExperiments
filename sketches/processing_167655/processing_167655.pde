




// for calendar
import java.util.*;
import java.util.Calendar;
import java.text.*;
import java.text.DateFormat;

final int normal = 0;
final int help   = 1;
int state = normal;

ArrayList <Appointment> appointments = new ArrayList();

// a list of the days 
final String[] daysWeek = { 
  "MO", "TU", "WE", "TH", "FR", "SA", "SU"
};

// and months
final String[] monthsNames = { 
  "January", "February", "March", "April", "May", "June", "July", 
  "August", "September", "October", "November", "December"
};

// the grid 
Cell[][] cells = new Cell[7][6];

// a font 
PFont font1;

// month and year (not now but as seen in the grid) 
int currMonth = month();
int currYear = year();

// ---------------------------------------------------------

void setup() {
  size(800, 800);

  init1();

  font1  = createFont("Arial", 20);
  textFont(font1);

  //
  makeAnAppointment( 2014, 10, 13, 
  12, 12, 
  14, 12, 
  "Meeting 17", 
  "John and Jack"  ) ;

  makeAnAppointment( year(), month(), day(), 
  12, 12, 
  14, 12, 
  "Meeting 17", 
  "Mary and Sue"  ) ;

  // --------------------------------------------------
  for (Appointment app1 : appointments) {
    app1.displayPrintln();
  } // for

  println ("----------------------------- ");
  println ("Use mouse click. ");
  println ("Use keyboard: cursor, Pg Up and Pg Down. ");
  println ("Plus in a day means appointment (click with mouse). ");
  println ("The red day is today. ");
  println ("----------------------------- ");

  background(0);
} // func 

void draw() {
  background(0);

  // the states: 
  switch (state) {

  case normal: 
    manageStateNormal();
    break;

  case help:
    text ("HELP  ", 30, 80);
    text ("works with direct window in processing IDE---------------- ", 30, 100);
    text ("Use mouse: click into a day. ", 30, 120);
    text ("Use keyboard: F1, cursor, - and + (month), Pg Up and Pg Down (year). ", 30, 140);
    text ("The Plus + sign in a day means appointment (click with mouse). ", 30, 160);
    text ("The red day is today. ", 30, 180);
    text ("Click mouse ----------------------------- ", 30, 200);
    break;

  default:
    println ("Error149");
    break;
  } // switch
} // func draw

void manageStateNormal() {

  // headline one 
  fill(0, 255, 0);
  text ( monthsNames [currMonth-1] + " " + currYear, 
  cells[0][ 0 ].x, 
  cells[0][ 0 ].y - 80 ); 

  int dayAsInt; 

  //  dayAsInt =  dow (1, currMonth, currYear  ) ; 
  //  dayAsInt--;
  //  if (dayAsInt<0) 
  //    dayAsInt=6;  
  //  text ("1st day in month "
  //    + currMonth 
  //    + " ("
  //    + monthsNames [currMonth-1] 
  //    + ") in year " 
  //    + currYear 
  //    + " is "
  //    + daysWeek [ dayAsInt ], 
  //  cells[0][ 0 ].x, 
  //  cells[0][ 0 ].y + 580 ); 

  // big rect behind the grid
  fill(111);
  noStroke();
  rectMode(CORNER);
  rect(cells[0][ 0 ].x-40, cells[0][ 0 ].y-70, 
  cells[ 6][ 5 ].x-cells[0][ 0 ].x+80, cells[ 6][ 5 ].y - cells[0][ 0 ].y +120, 
  7);

  // draw the week days (headline two)
  for (int i = 0; i < cells.length; i++) {
    fill(0, 255, 0);
    text (daysWeek[i], cells[i][ 0 ].x-13, cells[i][ 0 ].y-33);
  }  

  // draw the grid 
  for (int i = 0; i < cells.length; i++) {
    for (int j = 0; j < cells[i].length; j++) {
      cells[i][ j].show();
    }
  }
  // show date today and time now
  fill(0, 255, 0);
  dayAsInt =  dow ( day(), month(), year() ) ; 
  dayAsInt--;
  if (dayAsInt<0) 
    dayAsInt=6;  

  text(  nf( month(), 2 ) 
    +"/" +  nf( day(), 2 ) 
    +"/" +  year()
    +" - " +  nf(hour(), 2) 
    +":" + nf( minute (), 2)  
    +" - " + daysWeek [ dayAsInt ], 
  cells[0][ 0 ].x, 
  cells[0][ 0 ].y + 480 ); 

  // help line
  text( "Use F1 - Click mouse on a day or click - and + on the keyboard.", 
  cells[0][ 0 ].x, 
  cells[0][ 0 ].y + 620 );
}

// ---------------------------------------------------------

void mousePressed() {
  // 
  if (state==normal) {
    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        if (cells[i][j].nearMouse()) {
          // show text  
          if (cells[i][j].letter.equals(""))
            println ("no valid day");
          else 
            println (currYear  
            + "/" 
            +  currMonth + "/" 
            + cells[i][j].letter);
          if (cells[i][j].hasAppointment()) { 
            Appointment currApp=cells[i][j].getAppointment();
            currApp.displayPrintln();
          }
          // quit the function 
          return;
        }
      }
    }
  } // if 
  else
  { 
    state = normal;
  } // else
} /// func 

void keyPressed() {
  if (state==normal) {
    keyPressedForStateNormal ();
  } // if
  //
} // func 

void keyPressedForStateNormal () {
  //
  if (!(key==CODED)) {
    // not CODED -----------------------------------

    // change month 
    if (key=='-')
      currMonth--;
    else if (key=='+')
      currMonth++;
    else if (key>='1'&&key<='9') {
      // month (Jan to Sept)
      currMonth=key-48;
    }  
    else {
      // do nothing
    }
  }

  else 

  {

    // if (key==CODED) { --------------------------------------------
    //
    switch (keyCode) {

    case java.awt.event.KeyEvent.VK_F1:
      // help
      state = help;
      break;

    case java.awt.event.KeyEvent.VK_PAGE_UP:
      currYear ++;
      break;

    case java.awt.event.KeyEvent.VK_PAGE_DOWN:
      currYear --;
      break;

    case UP:
      currMonth++;
      break;

    case DOWN:
      currMonth--;
      break;

    case LEFT:
      //
      break;

    case RIGHT:
      //
      break;

    default:
      // do nothing 
      break;
    } // switch
  }

  // ---------------

  // prev year? 
  if (currMonth<=0) {
    currMonth=12;
    currYear--;
  }
  // next year?
  else if (currMonth>12) {
    currMonth=1;
    currYear++;
  }

  init1() ;
  //
}

// ---------------------------------------------------------

void init1() {

  // make grid

  int dayAsInt =  dow (1, currMonth, currYear  ) ; 

  dayAsInt--;
  if (dayAsInt<0) 
    dayAsInt=6;  

  // define the grid (k is an increment and shows the day)
  int k = - dayAsInt + 1;

  int daysOfMonth = daysOfMonth(); 

  String textFromK;

  for (int j = 0; j < cells[1].length; j++) {
    for (int i = 0; i < cells.length; i++) {

      textFromK = str(k);
      if (k<1 || k>daysOfMonth)
        textFromK="";

      cells[i][ j] = new Cell( 158 + i*(width/10), 
      158 + j*(height/10), 
      textFromK);

      k++;
    }
  }
} // func 

// Wikipedia.org/wiki/Zeller's_congruence
// by Gotoloop
int dow(int d, int o, int y) {
  // day of the week - int for a list like 
  // Sun, Mon etc. (we use here Mon, Tue...)
  if (o < 3) {
    o += 12;
    y--;
  }

  return ( d + (int) ((o + 1)*2.6) + y + (y>>2)
    + (y/100 | 0)*6 + ~~(y/400) + 6 ) % 7;
}

int daysOfMonth() {

  // Create a calendar object and set year and moth
  Calendar mycal = new GregorianCalendar(currYear, currMonth-1, 1);

  // Get the number of days in that month
  int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28

  // Try month in a leap year
  // mycal = new GregorianCalendar(2000, Calendar.FEBRUARY, 1);
  // daysInMonth= mycal.getActualMaximum(Calendar.DAY_OF_MONTH);     // 29

  return daysInMonth;
}

void makeAnAppointment(int year, int month, int day, 
int hourFrom, int minuteFrom, 
int hourTo, int minuteTo, 
String what, 
String who ) {

  // this Appointment can only be within one day:

  // 2013, 3, 4, 12, 12, 14, 12 "Meeting 17",  "John and Jack"

  // and can not last from day A to day B


  Calendar cal = Calendar.getInstance();

  cal.set(year, month-1, day, hourFrom, minuteFrom);
  Date from1 = cal.getTime(); 

  cal.set(year, month-1, day, hourTo, minuteTo);
  Date to1   = cal.getTime();

  Appointment appointmentTest = new Appointment(from1, to1, 
  what, 
  who );
  appointments.add(appointmentTest);
} // func

// =====================================================

class Cell {

  float x;
  float y;
  String letter; 

  Cell(float x_, float y_, String  k ) {
    x = x_;
    y = y_;
    letter = k;
  } // constr

  void show() {
    rectMode(CENTER);
    stroke(39, 20, 1, 150);
    noFill();
    fill(222);
    rect(x, y, 55, 55, 7);
    // is it today? 
    if (letter.equals (str(day())) && 
      currMonth == month() && 
      currYear == year()  ) {
      // yes
      fill(255, 2, 2); // red
    } 
    else {
      // no 
      fill(0);   // black
    } 
    text (letter, x-8, y+8);
    if (hasAppointment()) {
      //
      text ("+", x+15, y+24);
    }
  } // method

  boolean hasAppointment() {
    for (Appointment app1 : appointments) {
      //app1.displayPrintln();
      //println (app1.getFromDayFromApp()+", "+app1.from.getMonth() +", "+app1.getFromYearFromApp() );
      if (letter.equals (trim(str(app1.getFromDayFromApp()))) && 
        currMonth == app1.from.getMonth()+1 && 
        currYear == app1.getFromYearFromApp()  ) {
        // yes
        // println("yes");
        fill(1, 255, 2); // color
        return true;
      } 
      else {
        // no
      }
    } // for
    fill(0);   // black
    return false;
  }

  Appointment getAppointment() {
    for (Appointment app1 : appointments) {
      //app1.displayPrintln();
      //println (app1.getFromDayFromApp()+", "+app1.from.getMonth() +", "+app1.getFromYearFromApp() );
      if (letter.equals (trim(str(app1.getFromDayFromApp()))) && 
        currMonth == app1.from.getMonth()+1 && 
        currYear == app1.getFromYearFromApp()  ) {
        // yes
        // println("yes");
        fill(1, 255, 2); // color
        return app1;
      } 
      else {
        // no
      }
    } // for
    fill(0);   // black
    return null;
  }

  boolean nearMouse () {
    // Is the mouse close ?
    // Can return true or false.
    float distToMouse = dist (x, y, mouseX, mouseY) ; 
    if  ( distToMouse < 55/2 ) {
      return true;
    }
    else {
      return false;
    }
  } // method
} // class 

// ========================================

class Appointment {

  // this represents one appointment
  //
  // see http://docs.oracle.com/javase/6/docs/api/java/util/Calendar.html
  // see http://docs.oracle.com/javase/6/docs/api/java/util/Date.html 
  // see http://docs.oracle.com/javase/6/docs/api/java/text/SimpleDateFormat.html

  Date from;
  Date to;
  String whatWhere;
  String who;

  SimpleDateFormat sdf = new SimpleDateFormat();
  DateFormat df = DateFormat.getDateInstance(DateFormat.LONG);
  // DateFormat dfHour = DateFormat.getDateInstance(java.text.DateFormat.HOUR0_FIELD);

  Appointment (Date from_, Date to_, 
  String whatWhere_, 
  String who_)
  {
    //
    from        = from_;
    to          = to_;
    whatWhere   = whatWhere_;
    who         = who_;
  } // constr

  void displayPrintln()
  {
    // simple print
    print("From " + sdf.format(from) );
    println(" to " + sdf.format(to));
    //    println (from);
    //    println (to);
    print (whatWhere);
    println (" with " + who);
    //   print("From " + (from) );
  } // method

  int getFromYearFromApp() {  

    Calendar cal = Calendar.getInstance();

    cal.setTime (from);

    // Calendar.

    return cal.get(Calendar.YEAR);
  }

  int getFromDayFromApp() {  

    Calendar cal = Calendar.getInstance();

    cal.setTime (from);

    // Calendar.

    return cal.get(Calendar.DAY_OF_MONTH );
  }

  //
} // class
//


