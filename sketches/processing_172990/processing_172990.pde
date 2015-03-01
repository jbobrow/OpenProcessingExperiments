
/**
 * Graph and Date Functions. 
 * 
 */

UserClass _myClass;


void setup() {

  _myClass = new UserClass();
}

void draw() {

  if (!_myClass.classDone) {
    _myClass.doAction();
  }
  else {
    noLoop();
    //println("done");
  }
}

class UserClass { 

  String name      = "Ron Vonk";
  String birthDate = "03.09.1958";
  //String bioDate = "03.09.1958";
  String bioDate   = "22.11.2014";

  int    dayCount  = 0;
  int    bioDays   = 0;
  int    maxDays   = 34; 

  int    xmin, ymin, x0, y0;

  float  xTick, yTick;

  String[]  BioDate   = new String[maxDays];

  float[][] BioRythms = new float[maxDays][3];     // [0] = Physical, [1] = Sensitive, [2] = Cognitive

  String[]  BioNames  = new String[3];
  int[]     BioColors = new color[3];

  boolean   classDone = false;

  UserClass() {                             // we construct our class...

    setInstance("setup");
  }

  void doAction() {

    setInstance("action");

    if (dayCount < maxDays-1) {
      dayCount++;
      bioDays++;
    }
    else {
      classDone = true;   // end recursion, very important...
      drawGraph();
    }
  }  

  void setInstance(String mode) {

    if (mode.equals("setup")) {

      size(900, 540);

      xmin  = 50;
      ymin  = 30;

      x0    = xmin + xmin/2;
      y0    = height/2;

      BioNames[0] = "Physical";
      BioNames[1] = "Sensitive";
      BioNames[2] = "Cognitive";

      BioColors[0] = unhex("ffff0000");  // red   = (255,0,0)
      BioColors[1] = unhex("ff00ff00");  // green = (0,255,0)
      BioColors[2] = unhex("ff0000ff");  // blue  = (0,0,255)

      setupGraph();

      bioDays = daysFromDate(bioDate) - daysFromDate(birthDate);
    }
    else {

      BioDate[dayCount] = dateFromDays(bioDays + daysFromDate(birthDate)); 

      for (int type = 0; type < 3; type++) {

        BioRythms[dayCount][type] = sin(2*PI*bioDays/(23+type*5));
      }
    }

    //setContext();

    //s(depth);
  }

  void setupGraph() {

    frameRate(25);

    background(#000000);
    stroke(#ffffff);
    smooth();

    PFont font; 
    font = createFont("Arial", 12); 
    textFont(font);
    textAlign(CENTER); 

    fill(0);
    rect(0, 0, width-1, height-1);

    //rect(xmin, ymin, width-2*xmin, height-2*ymin);   // this defines our drawing region...

    fill(#ffffff);

    text("B I O R I T H M - D I A G R A M for " + name + " born " + birthDate + " (dd.mm,yyyy, diagram starts at " + bioDate + ")", width/2, ymin);

    line(xmin, ymin, xmin, height-ymin);   // this is our y-axis, set range, and place ticks...

    for (int tick = -10; tick < 11; tick++) {

      yTick =  y0 - tick*(y0-ymin)/11;

      if (tick%10 == 0) {
        text(str(tick/10), xmin-10, yTick);
      }
      line(xmin-2, yTick, xmin+2, yTick);
    }

    line(xmin, y0, width-xmin, y0);        // this is our x-axis, set range, and place ticks...

    for (int tick = 0; tick < maxDays; tick++) {

      xTick =  x0 + tick*(width-2*xmin)/(maxDays);

      //text(str(tick), xTick, y0+20);     // we replace this with day numbers from bioDate

      line(xTick, y0-2, xTick, y0+2);
    }  

    for (int type = 0; type < 3; type++) {

      int xType = width/2+(type-1)*width/4;
      int yType = height-ymin;

      text(BioNames[type], xType, yType+16);
      stroke(BioColors[type]);
      line(xType-30, yType, xType+30, yType);
    }  
    //setInstance();
  }

  void drawGraph() {

    for (int type = 0; type < 3; type++) {

      stroke(BioColors[type]);

      float xCP = x0;
      float yCP = y0 - BioRythms[0][type]*10*(y0-ymin)/11;

      text(split(BioDate[0], ".")[0], x0, y0+20);

      for (dayCount = 1; dayCount < maxDays; dayCount++) {

        xTick =  x0 + dayCount*(width-2*xmin)/(maxDays);
        yTick =  y0  - BioRythms[dayCount][type]*10*(y0-ymin)/11;

        text(split(BioDate[dayCount], ".")[0], xTick, y0+20);

        line(xCP, yCP, xTick, yTick);

        xCP = xTick;
        yCP = yTick;
      }
    }
  }

  int daysFromDate(String date) {

    String[] datefield = split(date, ".");

    int _day   = int(datefield[0]);
    int _month = int(datefield[1]);
    int _year  = int(datefield[2]);

    if (_month == 1 || _month == 2) {
      _year--;
      _month += 12;
    }
    _month++;  

    return int(365.25*_year) + int(30.6001*_month) + _day;
  }  

  String dateFromDays(int days) {

    String _d = "";
    String _m = "";

    int _year  = int((days-122.1)/365.25);
    int _month = int((days-int(_year*365.25))/30.6001);
    int _day   = days - int(365.25*_year) - int(30.6001*_month);

    if (_month == 14 || _month == 15) {
      _month -= 12;
    }
    _month--;

    if (_month == 1 || _month == 2) {
      _year++;
    }
    if (_day < 10) {
      _d = "0";
    }
    _d = _d + str(_day) + ".";

    if (_month < 10) {
      _m = "0";
    }
    _m = _m + str(_month) + ".";

    return _d + _m + str(_year);
  }
}



