
/*
Extracts data from Cumulus log files and displays a graph 
of Temperature, Rain, Pressure in a 820x400 window.
Press 's' to save image as a jpg
Press 'w' in monthly display mode for wind
press 'i' in daily display mode for internal temp
press 'x' to exit

Written by Geo Meadows
www.mecol.co.uk/weather/

V1.01 21Mar2013 - Display monthly overview of Temp, Rain, Pressure
V2.01 28Mar2013 - Day chrts added
V2.02 03Apr2013 - Wind direction added
 */

// *** user variables set here ***
String locn = "Blakedown";    // name for weather station
String mon = "Mar";           // log file month - 3 chars, leading uppercase
String yr = "13";             // log file year, 2 digits only
int hs = 6;                  // no. of file entries per hour eg. 3 means every 20mins
float poffset = 30;           // pressure correction factor, mB to add to log value
int fields = 25;              // data fields per log entry
float rainfactor = 1;      //divide by this if rain in mm
// *** end of user variables ***

Record[] records;
String[] lines;
int recordCount;
PFont body;
PImage img;
int xoff = 30;      //left had margin
int screenWidth = 820;
int screenHeight = 400;
int maxnum = 31*24*hs;    // max number of lines of data
int startingEntry = 1;    // Display from this entry number
boolean dispday = false;  // select day or month display
int daynum = 1;           // day of month to display
boolean internal = false; // display internal temp
boolean dispwind = false; // display wind direction

/////////////////////////////////////////////////////////////
void setup() {
  size(820, 400);
  body = loadFont("ArialMT-48.vlw");
  textFont(body); 
  img = loadImage("windir4.png");
  lines = loadStrings(mon+yr + "log.txt");
  println(mon+yr + "log.txt");
  println("file size = " + lines.length);  //number of entries(lines) in log
 
  records = new Record[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String[] pieces = split(lines[i], ','); // Load data into an array called 'pieces'
    if (pieces.length == fields) {
      records[recordCount] = new Record(pieces);
      recordCount++;
    }
  }
  if (recordCount != records.length) {
    records = (Record[]) subset(records, 0, recordCount);
  }
  noLoop();
}

void draw() {
  background(40);
  float av; 
  float lastrainav = 0;
  float lasttempav = 0;
  float lastpresav = 0;

  fill(200); 
  textSize(11);
  text(mon, width-48,12);
  text("20"+yr, width-26,12);
  text("CumlogDisplay of " + mon + " 20" + yr + " log for " + locn + " Weather Station",3,height-4);
  
  fill(250,50,0);
  text("Temp",1,5+height/2-33*5);
  text("+30ºC",1,5+height/2-30*5);
  text("+20ºC",1,5+height/2-20*5);
  text("+10ºC",1,5+height/2-10*5);
  text("0ºC",12,5+height/2);
  text("-10ºC",3,5+height/2+10*5);
  stroke(200,0,0);     // colour for temp grid
  line(xoff,height/2-30*5,width,height/2-30*5);
  line(xoff,height/2-20*5,width,height/2-20*5);      
  line(xoff,height/2-10*5,width,height/2-10*5);
  line(xoff,height/2,width,height/2);
  line(xoff,height/2+10*5,width,height/2+10*5);  
  fill(150,200,200); 
  text("Rain",4,height-20-60);
  text("0.5in",4,height-20-50+3);
  stroke(100,155,155);   // colour for rain grid
  line(xoff,height-19,width,height-19);
  line(xoff,height-20-50,width,height-20-50);
  fill(50,250,50); 
  textSize(11);
  text("1000mB",width-46,height/2-2);
  text("980mB",width-40,height/2+48);
  text("1020mB",width-46,height/2-52);
  text("Pressure",width-46,height/2-66);
  
  if (!dispday) {  
      for (int i = 0; i < maxnum-2*hs; i+=hs) {
        if (i < recordCount-hs) {      
          if (i%(24*hs) == 0) {      //day boundry?  
            strokeWeight(1);
            stroke(64,64,64);       //colour for vertical grid
            line(xoff+i/hs,0,xoff+i/hs,height-18);
            fill(190);
            textSize(11);
            text(1+i/(24*hs), 6+xoff+i/hs, 12);
    //Display daily av wind direction
            if (dispwind && (i<records.length-hs*24)) {
            fill(255,255,0);
            text("Wind Dir", width-46,height-120); 
              av=0;                  //reset daily average
              for (int j=0; j<hs*24; j++) {
                av = av + records[i+j].wind; 
                }              
              av = int(av/hs/24);
       //       println(i/hs/24 + "  " + av + "  " + radians(av));
              pushMatrix();
              translate(xoff+12+i/hs,height-120);
              rotate(-radians(av));
              image(img,-8,-10);
              popMatrix();
              }
          }
          strokeWeight(1);   
          
    //Display daily Temperature            
          stroke(255,0,0); 
          av = 0;                //reset hourly average 
          for (int j=0; j<hs; j++) { av = av + records[i+j].temp; }
          av = av/hs;
          if (i>0) {
            line(xoff+i/hs,height/2-lasttempav*5, xoff+i/hs,height/2-av*5);
          }
          lasttempav=av;      
          
    //Display daily Pressure 
         stroke(0,150,0);
         av = 0;                //reset hourly average 
         for (int j=0; j<hs; j++)  { av = av + records[i+j].press; } 
         av = av/hs/2;
         if (i>0) line(xoff+i/hs,height/2-lastpresav*5, xoff+i/hs,height/2-av*5);
         lastpresav=av;      
          
    //Display daily Rainfall accumulated over each day  
          stroke(100,155,155);
          av=0;                  //reset hourly average
          for (int j=0; j<hs; j++) {av = av + records[i+j].rain; }              
          av = av/hs;
          if (i>0) line(xoff+i/hs,height-20-lastrainav*100, xoff+i/hs,height-20-av*100);
          lastrainav = av;
          av=0; 
          
 
        }    
      }
    }
    else     //Display values for one day
        {            
      int k=0;
      int absi=0;
      lasttempav=0; 
      lastpresav=0; 
      lastrainav=0;
      float lastintern=0; 
      fill(190);
      textSize(11); 
      text("hrs", width-200,12);
      text(daynum, width-62,12);      
     
      for (int i = (daynum-1)*hs*24; i < daynum*hs*24+1; i++) {
        if (i<records.length) {
          if (absi>0) {
          stroke(255,50,50);
          line(xoff+absi, height/2-lasttempav*5, xoff+absi+24/hs, height/2-records[i].temp*5);
          stroke(0,150,0);
          line(xoff+absi,height/2-lastpresav*2.5, xoff+absi+24/hs,height/2-records[i].press*2.5);
          stroke(100,155,155);
          line(xoff+absi,height-20-lastrainav*100, xoff+absi+24/hs,height-20-records[i].rain*100);  
          if (internal) {
          fill(155,55,55);
          text("Internal Temp Display ON", width-130,40);          
          stroke(155,50,50);
          line(xoff+absi, height/2-lastintern*5, xoff+absi+24/hs, height/2-records[i].intern*5);
            }         
          }
          lasttempav = records[i].temp;
          lastpresav = records[i].press;
          lastrainav = records[i].rain;
          lastintern = records[i].intern;
          absi +=24/hs;
          if (i%hs == 0) {            // on the hour?                      
              strokeWeight(1);
              stroke(64,64,64);       // colour for vertical grid
              line(xoff+k*24,0,xoff+k*24,height-18);
              fill(190);
              text(k, xoff+k*24-2, 12); 
              k++;
          }
        }  
      } 
    } 
  }

void keyPressed() {
  switch (key) {
  case 's': saveFrame(mon+yr +".jpg");
  break;
  case 'd': dispday = true; redraw();
  break;
  case 'm': dispday = false; redraw();
  break;
  case 'i': internal = !internal; redraw();
  break;
  case 'w': dispwind = !dispwind; redraw();
  break;
  case '>': if (daynum<31) daynum++; redraw();
  break;
  case '<': if (daynum>1) daynum--; redraw();
  break;
  case 'x': exit();
  break;
  }
}
class Record {
  String date;
  String time;
  float temp;
  float rain; 
  float press;
  float intern;
  float wind;

  public Record(String[] pieces) {
    date = pieces[0];
    time = pieces[1];
    temp = float(pieces[2]);
    rain = float(pieces[9])/rainfactor;
    press = float(pieces[10])-1000+poffset;
    intern = float(pieces[12]);
    wind = float(pieces[7]);
  }
}

/* Cumulus fields in log file
00: Date in the form dd/mm/yy or dd-mm-yy
01: Current time
02: Current temperature
03: Current humidity
04: Current dewpoint
05: Current wind speed
06: Recent (10-min) high gust
07: Average wind bearing
08: Current rainfall rate
09: Total rainfall today so far
10: Current sea level pressure
11: Total rainfall counter
12: Inside temperature
13: Inside humidity
14: Current gust (i.e. 'Latest')
15: wind chill
16: Heat index
17: UV Index
18: Solar Radiation
19: Evapotranspiration
20: Annual Evapotranspiration
21: Apparent temperature
22: Current theoretical max solar radiation
23: Hours of sunshine so far today
24: Current Wind bearing
25: RG-11 rain today
*/



