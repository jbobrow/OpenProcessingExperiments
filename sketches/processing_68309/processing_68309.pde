
/**
 BusBoard
 Copyright August 2012 - Robin Camp
 Software Version: 1.0.2
 Released: August 26, 2012
 SGU Schedule Version: 2012 Fall Term (released as separate file)
 */


int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
float zoom = 1.5;


//int x = 30;
PFont fontA;
PFont fontB;
PFont fontC;
PFont fontD;
PImage Title;

int TerminalBarHt = 176;
int ColumnTitleBarHt = 217;
int ScheduleListHt = 250;


int[]item;
int[][] formattedItem;
int NumberOfItems = 0;
int dayOfWeek = 1;
int   UnifiedScheduled= 0;
int   UnifiedReal= 0;
int KeepHeight;
int LastRow=0;
int Update =1;

int ScheduledHr = 6;
int ScheduledMin = 00;
String Destination = "Grand Anse";
String Route = "A";
int RouteColor = #6495ED;
int timetil=0;

void setup() 
{
  size(940, 780);
  background(255);
  centerX = 0;
  centerY = 0;  
  cursor(HAND);
  smooth();

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("ArialNarrow-BoldItalic-48.vlw");
  fontB= loadFont("ArialNarrow-Bold-48.vlw");
  fontC= loadFont("ArialNarrow-48.vlw");
  fontD= loadFont("ACaslonPro-Italic-30.vlw");
  
  Title = loadImage("BusBoardTitle.jpg");

  // Set the font and its size (in units of pixels)
  GetSchedule(1);
  textFont(fontB, 60);
}

void draw() {
  textFont(fontC, 32);
  int row=0;

  if (mousePressed == true && mouseX>908 && mouseY<254 && mouseY>205 && centerY>0) {
    centerY = centerY - 560;
      delay(150);
    println("Center Y " + centerY);
    Update=1;
    
  }
  if (mousePressed == true && mouseX>908 && mouseY>725 && mouseY<800 && centerY>=0 && centerY< LastRow-700) {
    centerY = centerY + 560;
      delay(150);
    println("Center Y " + centerY);
    Update=1;
   
  }
  KeepHeight = -centerY;
  translate(centerX, -centerY);
  
//Reduce the number of times the app updates data and reprints screen (only at the top of the minute)
if(second()==0|| Update==1){
  Update=0;
  
   background(#f6f6f6); 
  //Code below displays buses leaving between 02:15:00 and 23:59:59, and after the current time.
  for (int bus = 0;bus<NumberOfItems;bus++) {
    GetSchedule(bus);
    UnifiedScheduled=ScheduledHr*60 + ScheduledMin;
    UnifiedReal=hour()*60 + minute();
    if (UnifiedReal>134 && UnifiedReal<1440 && UnifiedScheduled > UnifiedReal && timetil<1440) {
      fill(#ff8c00 );
      if (ScheduledHr < 10) {
        text("0", 0, row * 35 + ScheduleListHt);
        text(ScheduledHr, 16, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledHr, 0, row * 35 + ScheduleListHt);
      }
      text( ":", 34, row * 35 + ScheduleListHt);
      if (ScheduledMin < 10) {
        text("0", 45, row * 35 + ScheduleListHt);
        text(ScheduledMin, 61, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledMin, 45, row * 35 + ScheduleListHt);
      }
      fill( RouteColor);
      text(Destination, 180, row * 35 + ScheduleListHt);
      text(Route, 520, row * 35 + ScheduleListHt);
      fill(#ff8c00);

      if (UnifiedScheduled>=UnifiedReal) {
        timetil = UnifiedScheduled-UnifiedReal;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      else {
        timetil = UnifiedScheduled-UnifiedReal+1440;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      row++;
    }
  }

  //Code below this point displays buses that leave between 00:00:00 and 02:14:59, and after the current time before.
  for (int bus = 0;bus<NumberOfItems;bus++) { 
    GetSchedule(bus);
    UnifiedScheduled=ScheduledHr*60 + ScheduledMin;
    UnifiedReal=hour()*60 + minute();
    if (UnifiedReal>=0  && UnifiedReal< 135 && UnifiedScheduled > UnifiedReal && UnifiedScheduled <136) {
      fill(#ff8c00 );
      if (ScheduledHr < 10) {
        text("0", 0, row * 35 + ScheduleListHt);
        text(ScheduledHr, 16, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledHr, 0, row * 35 + ScheduleListHt);
      }
      text( ":", 34, row * 35 + ScheduleListHt);
      if (ScheduledMin < 10) {
        text("0", 45, row * 35 + ScheduleListHt);
        text(ScheduledMin, 61, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledMin, 45, row * 35 + ScheduleListHt);
      }
      fill( RouteColor);
      text(Destination, 180, row * 35 + ScheduleListHt);
      text(Route, 520, row * 35 + ScheduleListHt);
      fill(#ff8c00);

      if (UnifiedScheduled>=UnifiedReal) {
        timetil = UnifiedScheduled-UnifiedReal;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      else {
        timetil = UnifiedScheduled-UnifiedReal+1440;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      row++;
      // }
    }
  }
  for (int bus = 0;bus<NumberOfItems;bus++) { 
    GetSchedule(bus);
    UnifiedScheduled=ScheduledHr*60 + ScheduledMin;
    UnifiedReal=hour()*60 + minute();
    if (UnifiedReal>134 && UnifiedReal<1440 && timetil<1440 && UnifiedScheduled<136) {
      fill(#ff8c00 );
      if (ScheduledHr < 10) {
        text("0", 0, row * 35 + ScheduleListHt);
        text(ScheduledHr, 16, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledHr, 0, row * 35 + ScheduleListHt);
      }
      text( ":", 34, row * 35 + ScheduleListHt);
      if (ScheduledMin < 10) {
        text("0", 45, row * 35 + ScheduleListHt);
        text(ScheduledMin, 61, row * 35 + ScheduleListHt);
      }
      else {
        text(ScheduledMin, 45, row * 35 + ScheduleListHt);
      }
      fill( RouteColor);
      text(Destination, 180, row * 35 + ScheduleListHt);
      text(Route, 520, row * 35 + ScheduleListHt);
      fill(#ff8c00);

      if (UnifiedScheduled>=UnifiedReal) {
        timetil = UnifiedScheduled-UnifiedReal;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      else {
        timetil = UnifiedScheduled-UnifiedReal+1440;
        int hrs = timetil/60;
        text( hrs, 700, row * 35 + ScheduleListHt);
        text( "hr", 745, row * 35 + ScheduleListHt);
        text( timetil-hrs*60, 800, row * 35 + ScheduleListHt);
        text( "min", 845, row * 35 + ScheduleListHt);
      }
      row++;
      // }
    }
  }
  LastRow = row*35;
  fill(#ff8c00);
  rect(0, row*35+ScheduleListHt-26, 1020, 33);
  fill(60);
  text("No more scheduled buses for period of "+ month() +"/"+(day()-1)+"/"+year()+ " to "+month() +"/"+day()+"/"+year(), 45, row * 35 + ScheduleListHt);
}
  fill(#f6f6f6);
  rect(0, -1 - KeepHeight, 940, 176);
  image(Title, 120, 0 - KeepHeight);
  fill(0);
  rect(0, TerminalBarHt-40-KeepHeight, 1020, 56);
  textFont(fontB, 40);  
  fill(#ff8c00);
  text("True Blue Departures", 5, TerminalBarHt-KeepHeight);
  if (hour()<10) {
    text("0", 735, TerminalBarHt-KeepHeight);
    text(hour(), 755, TerminalBarHt-KeepHeight);
  }
  else {
    text(hour(), 735, TerminalBarHt-KeepHeight);
  }
  text( ":", 775, TerminalBarHt-KeepHeight);
  if (minute()<10) {
    text("0", 795, TerminalBarHt-KeepHeight);
    text(minute(), 815, TerminalBarHt-KeepHeight);
  }
  else {
    text(minute(), 795, TerminalBarHt-KeepHeight);
  }
  text( ":", 835, TerminalBarHt-KeepHeight);
  if (second()<10) {
    text("0", 855, TerminalBarHt-KeepHeight);
    text(second(), 875, TerminalBarHt-KeepHeight);
  }
  else {
    text(second(), 855, TerminalBarHt-KeepHeight);
  }
  fill(0);
  rect(-1, ColumnTitleBarHt - 32 - KeepHeight, 1020, 32);
  textFont(fontA, 32);
  fill(#f6f6f6);
  text("Scheduled", 5, ColumnTitleBarHt - KeepHeight);
  text("Destination", 180, ColumnTitleBarHt - KeepHeight);
  text("Route", 520, ColumnTitleBarHt - KeepHeight);
  text("Time to Departure", 695, ColumnTitleBarHt - KeepHeight);
  fill(0);
  textFont(fontA, 60);
  text("^", 910, 269-KeepHeight);
  textFont(fontB, 50);
  text("v", 910, 770-KeepHeight);
  
//ABOUT SECTION **********************************************************************************************
    fill(0);
  ellipse(905, 20-KeepHeight, 30, 30);
  textFont(fontB, 40);  
  fill(255);
  textFont(fontD,30);
  text("i", 900, 29-KeepHeight);
  
  if (mouseX> 890 && mouseX<920 && mouseY<35 && mouseY>5) {
  fill(255);
  rect(0,0, 940,800-KeepHeight);
  textFont(fontA, 24);
  fill(150);
  text("About this program", 5, 30-KeepHeight);
  textFont(fontA, 18);
  text("BusBoard.app",5, 65-KeepHeight);
  text("Copyright August 2012 – Robin Camp", 5, 89-KeepHeight);
  text("Software Version: 2.0.0", 5, 113-KeepHeight);
  text("Released: August 27, 2012", 5, 137-KeepHeight);
  text("SGU Bus Schedule File Version: 2012.Fall.WeekdaySch, 2012.Fall.WeekendSch", 5, 161-KeepHeight);
  text("More information available at:", 5, 197-KeepHeight);
  text("http://BusBoard.WordPress.com", 5, 215-KeepHeight);
  Update=1;
  }
}

void GetSchedule(int x) {
  String[] Schedule;
  Calendar c = Calendar.getInstance();
  dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
  UnifiedReal=hour()*60 + minute();

  if (dayOfWeek==2 && UnifiedReal<135 ) {
    Schedule = loadStrings("2012.Fall.WeekendSch.txt");
  }
  else if (dayOfWeek==7 && UnifiedReal<135) {
    Schedule = loadStrings("2012.Fall.WeekdaySch.txt");
  }
  else if (dayOfWeek==1 ||dayOfWeek==7) {
    Schedule = loadStrings("2012.Fall.WeekendSch.txt");
  }
  else {
    Schedule = loadStrings("2012.Fall.WeekdaySch.txt");
  }  
  NumberOfItems= Schedule.length;
  item = int(split(Schedule[x], '\t'));

  int rt = item[0];
  ScheduledHr = item[1];
  ScheduledMin = item[2];
  timetil = item[3];

  if (rt==1) {
    Destination = "Grand Anse";
    Route = "A";
    RouteColor = #6495ED;
  }
  if (rt==2) {
    Destination = "L'Anse Aux Epines";
    Route = "B";
    RouteColor = #B22222;
  }
  if (rt==3) {
    Destination = "Mont Toute";
    Route = "C";
    RouteColor = #238E23;
  }
  if (rt==4) {
    Destination = "True Blue Inn";
    Route = "D";
    RouteColor = #CD7F32;
  }
  if (rt==5) {
    Destination = "Point Saline/Frequente";
    Route = "E";
    RouteColor = #9400D3;
  }
  if (rt==6) {
    Destination = "Grand View Inn";
    Route = "-";
    RouteColor = 0;
  }
  if (ScheduledHr>hour()) {
    timetil = ScheduledHr*60+ScheduledMin-hour()*60-minute();
  }
  else {
    timetil = ScheduledHr*60+ScheduledMin-hour()*60-minute()+1440;
  }

  item[3] = timetil;
}

/*void mousePressed() {
 offsetX = mouseX-centerX;
 offsetY = mouseY-centerY;
 }*/


void keyPressed() {
  // zoom
  if (keyCode == UP) zoom += 0.05;
  if (keyCode == DOWN) zoom -= 0.05;
}


