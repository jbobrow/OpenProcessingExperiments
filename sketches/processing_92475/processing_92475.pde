
/*
This book is here to help you get your job done. In general, you may use the 
code in this book in your programs and documentation. You do not need to contact 
us for permission unless you�re reproducing a significant portion of the code. 
For example, writing a program that uses several chunks of code from this book 
does not require permission. Selling or distributing a CD-ROM of examples from 
O�Reilly books does require permission. Answering a question by citing this book 
and quoting example code does not require permission. Incorporating a significant
amount of example code from this book into your product�s documentation does 
require permission.

We appreciate, but do not require, attribution. An attribution usually includes
the title, author, publisher, and ISBN. For example: �Visualizing Data, First 
Edition by Ben Fry. Copyright 2008 Ben Fry, 9780596514556.�

If you feel your use of code examples falls outside fair use or the permission
given above, feel free to contact us at permissions@oreilly.com.
*/
import java.util.regex.*;
import java.text.*;
import java.util.Date;

int teamCount = 51;
String[] teamNames; 
String[] teamCodes;
HashMap teamIndices;
  
static final int ROW_HEIGHT = 15;
static final float HALF_ROW_HEIGHT = ROW_HEIGHT / 4.0f;

static final int SIDE_PADDING = 870;
static final int TOP_PADDING = 60;

SalaryList salaries;
StandingsList standings;
SalaryList income;
  
StandingsList[] season;
Integrator[] standingsPosition;

SalaryList[] incomeSeason;
Integrator[] incomePosition;

PImage[] logos;
float logoWidth;
float logoHeight;

PFont labelfont;
PFont descriptionfont; 
PFont headerfont;
PFont dFont;
PFont textblurb;
PFont descriptionfont10; 

PShape usa;
HashMap stateNames;
String[] states;
//StandingsList[] stateAbortion;
//StandingsList abortions;
//StandingsList[] stateIncome;

int b1x, b2x, by; // Position of buttons
String currentShow;

  
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
  

String firstDateStamp = "20070101";
String lastDateStamp = "20110101";
String todayDateStamp;

static final long MILLIS_PER_DAY = 24 * 60 * 60 * 1000 *365; // per year

// The number of days in the entire season. 
int dateCount;
// The current date being shown.
int dateIndex;
// Don't show the first 10 days, they're too erratic. 
int minDateIndex = 0;  
// The last day of the season, or yesterday, if the season is ongoing.
// This is the maximum date that can be viewed.
int maxDateIndex;

// This format makes "20070704" from the date July 4, 2007.
DateFormat stampFormat = new SimpleDateFormat("yyyyMMdd");
// This format makes "4 July 2007" from the same.
DateFormat prettyFormat = new SimpleDateFormat("d MMMM yyyy");

// All dates for the season formatted with stampFormat.
String[] dateStamp;
// All dates in the season formatted with prettyFormat.
String[] datePretty;

void setupDates() {
  try {
    Date firstDate = stampFormat.parse(firstDateStamp);
    long firstDateMillis = firstDate.getTime();
    Date lastDate = stampFormat.parse(lastDateStamp);
    long lastDateMillis = lastDate.getTime();
    //Date date = new Date(firstDateMillis);

    // Calculate number of days by dividing the total milliseconds 
    // between the first and last dates by the number of milliseconds per day
    
    // TODO - hardcode this for our data?
    dateCount = (int) 12;
      //((lastDateMillis - firstDateMillis) / MILLIS_PER_DAY) + 1;  
    //println(dateCount);  
    maxDateIndex = dateCount;
    dateStamp = new String[dateCount];
    datePretty = new String[dateCount];

    todayDateStamp = year() + nf(month(), 2) + nf(day(), 2);
    // Another option to do this, but more code
    //Date today = new Date(); 
    //String todayDateStamp = stampFormat.format(today);
      
    for (int i = 0; i < dateCount; i++) {
      Date date = new Date(firstDateMillis + MILLIS_PER_DAY*i);

      datePretty[i] = prettyFormat.format(date);
      dateStamp[i] = stampFormat.format(date);
      // If this value for 'date' is equal to today, then set the previous 
      // day as the maximum viewable date, because it means the season is 
      // still ongoing. The previous day is used because unless it is late 
      // in the evening, the updated numbers for the day will be unavailable 
      // or incomplete.
      if (dateStamp[i].equals(todayDateStamp)) {
        maxDateIndex = i-1;
      }
    }
  } catch (ParseException e) {
    die("Problem while setting up dates", e);
  }
}  


// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .


public void setup() {
  size(1350, 925);
    
  setupTeams();
  setupDates();
  //setupSalaries();
  // Load the standings after the salaries, because salary 
  // will be used as the tie-breaker when sorting.
  setupStandings();
  setupRanking();
  //setupLogos();
  setupStates();
  
  descriptionfont = createFont("vitesselightitalic.ttf", 12);
  dFont = createFont("vitesselightitalic.ttf", 10);
  headerfont = createFont("vitessebook.ttf", 30);
  labelfont = createFont("eurostileltstdboldcn.ttf", 12);
  textblurb = createFont("vitesselight.ttf", 10);
  descriptionfont10 = createFont("vitesselightitalic.ttf", 10);
  
  textFont(descriptionfont);

  frameRate(15);
  // Use today as the current day
  setDate(maxDateIndex);
  
  // Load map
  usa = loadShape("usa-wikipedia.svg");
  currentShow = "a";
}
  

void setupTeams() {
  // Equivalent to income level abreviation to 
  // income level full title
  String[] lines = loadStrings("teams.tsv");
  //String[] test = loadStrings("states.tsv");
    
  teamCount = lines.length;
  teamCodes = new String[teamCount];
  teamNames = new String[teamCount];
  states = new String[teamCount];
  teamIndices = new HashMap();
    
  for (int i = 0; i < teamCount; i++) {
    String[] pieces = split(lines[i], TAB);
    //String[] testp = split(test[i], TAB);
    teamCodes[i] = pieces[0];
    teamNames[i] = pieces[1];
    states[i] = pieces[2];
    teamIndices.put(teamCodes[i], new Integer(i));
  }
}
  
  
int teamIndex(String teamCode) {
  // Equivalent to finding income level index
  Integer index = (Integer) teamIndices.get(teamCode);
  return index.intValue();
}


void setupSalaries() {
  // Equivalent to income level abreviation to 
  // income level in dollars
  String[] lines = loadStrings("residences.tsv");
  salaries = new SalaryList(lines);
}


/*
void setupStandings() {
  season = new StandingsList[maxDateIndex + 1];
  for (int i = minDateIndex; i <= maxDateIndex; i++) {
    String[] lines = acquireStandings(dateStamp[i]);
    season[i] = new StandingsList(lines);
  }
}
*/
  

void setupStandings() {
  // Equivalent to income level abbreviation to
  // abortion rate
  String[] lines = loadStrings("occurence.tsv");
  int dataCount = lines.length/ teamCount;
  //println(lines.length);
  int expectedCount = (maxDateIndex-minDateIndex)+1;
  if (dataCount < expectedCount) {
    println("Found " + dataCount + " entries in the data file, " +
            "but was expecting " + expectedCount + " entries.");
    maxDateIndex = minDateIndex + dataCount - 1;
  }
  season = new StandingsList[maxDateIndex + 1];
  
  for (int i = 0; i < dataCount; i++) {
    String[] portion = subset(lines, i*teamCount, teamCount);
    season[i+minDateIndex] = new StandingsList(portion);
  }
}
  

void setupRanking() {
  standingsPosition = new Integrator[teamCount];
  incomePosition = new Integrator[teamCount];
  for (int i = 0; i < teamCodes.length; i++) {
    standingsPosition[i] = new Integrator(i);
    incomePosition[i] = new Integrator(i);
  }
}
  

void setupLogos() {
  logos = new PImage[teamCount];
  for (int i = 0; i < teamCount; i++) {
    logos[i] = loadImage("small/" + teamCodes[i] + ".gif");
  }
  logoWidth = logos[0].width / 2.0f;
  logoHeight = logos[0].height / 2.0f;
}

void setupStates() {
  // Equivalent to income level abbreviation to
  // abortion rate
  String[] lines = loadStrings("residence.tsv");
  int dataCount = lines.length/ teamCount;
  int expectedCount = (maxDateIndex - minDateIndex) + 1;
  if (dataCount < expectedCount) {
    println("Found " + dataCount + " entries in the data file, " +
            "but was expecting " + expectedCount + " entries.");
    maxDateIndex = minDateIndex + dataCount - 1;
  }
  //stateAbortion = new StandingsList[maxDateIndex + 1];
  //stateIncome = new StandingsList[maxDateIndex + 1];
  
  incomeSeason = new SalaryList[maxDateIndex + 1];
  
  for (int i = 0; i < dataCount; i++) {
    //println(subset(lines, i*teamCount, teamCount));
    String[] portion = subset(lines, i*teamCount, teamCount);
    //stateAbortion[i+minDateIndex] = new StandingsList(portion);
    //stateIncome[i+minDateIndex] = new StandingsList(portion);
    incomeSeason[i+minDateIndex] = new SalaryList(portion);
  }
}
  
public void draw() {
  background(255);
  smooth();
  //update(mouseX, mouseY);

  translate(-40,0);
  drawDateSelector();
  
  // Buttons
  if (currentShow == "a") {
    //fill(255,255,255);
    //strokeWeight(1);
    //line(320,107.5, 335,123.5);
      // DIAGANOL
  line(320,107.5, 335,122.5);
  line(320,122.5,335,107.5);
  } else {
    fill(0);
  }
  b1x = 300;
  by = 50;
  rectMode(CORNER); // default
  // SQUARE
  line(320,107.5,320,122.5);
  line(335,107.5,335,122.5);
  line(320,107.5,335,107.5);
  line(320,122.5,335,122.5);
  

  
  //rect(320,107.5,15,15);
  fill(0);
  textFont(dFont);
  textAlign(LEFT, CENTER);
  text("Rate of Abortion\nBy State of Residence", b1x+50, by+65);
  
  if (currentShow == "i") {
    //fill(255,255,255);
      // DIAGANOL
  line(510,107.5,525,122.5);
  line(510,122.5,525,107.5);
  } else {
    fill(0);
  }
  b2x = b1x+200;
  rectMode(CORNER); // default
  //rect(510,107.5,15,15);
  // SQUARE
  line(510,107.5,510,122.5);
  line(525,107.5,525,122.5);
  line(510,107.5,525,107.5);
  line(510,122.5,525,122.5);
  

  fill(0);
  textAlign(LEFT, CENTER);
  text("Rate of Abortion\nBy State of Occurrence", b2x+40, by+65);
  
  // Map
  translate(-25, TOP_PADDING+30);
  //shape(usa, 0, 0);
  for (int i = 0; i < teamCount; i++) {
    
    float abortionRate = Float.parseFloat(standings.getTitle(i));
    float incomeRate = (income.getValue(i));
    
    PShape state = usa.getChild(states[i]);
    PShape istate = usa.getChild(states[i]);
    istate.disableStyle();
    state.disableStyle();
    stroke(255);
    strokeWeight(1);
    if (currentShow == "a") {
      colorState(state, abortionRate, true);
    }
    if (currentShow == "i") {
      colorState(istate, incomeRate, false);
    }
  }
  
  fill(0);
  // Text Explanation
  
  
  textFont(headerfont);
  textAlign(LEFT, CENTER);
  fill(221,66,38);
  text("ABORTION RATE ", 120, usa.height+160);
  
  textFont(textblurb);
  textAlign(LEFT, CENTER);
  fill(109,110,113);
  text("BY THE STATE OF \nOCCURRENCE VS. RESIDENCE", 380, usa.height+163);
  
  text("Since abortion was legalized as part of                                                    abortion legislation has varied from state to state.  This legislation determines", 120, usa.height+208);
  textFont(descriptionfont10);
  text("Roe vs. Wade (1973)", 309, usa.height+208);
  textFont(textblurb);
  text("the ease with which residents of a certain state can obtain a termination of their pregnancy.                                                                                               further ", 120, usa.height+208+ROW_HEIGHT);
  textFont(descriptionfont10);
  text("Planned Parenthood vs. Casey (1992)", 565, usa.height+208+ROW_HEIGHT);
  textFont(textblurb);
  text("enabled states to limit access to abortion and since then a greater divergence of laws can be seen throughout the nation. This data shows ", 120, usa.height+208+2*ROW_HEIGHT);
  text("the relationship between the abortions which occur in a particular state, and the number of residents of that state seeking an abortion. ", 120, usa.height+208+3*ROW_HEIGHT);
  text("As of 2012, the following states have between 13 and 21 legislative restrictions on abortions: Oklahoma, Utah, Indiana, Kansas, South Carolina,", 120, usa.height+208+4*ROW_HEIGHT); 
  text("Arizona, Louisianna, Missouri, Virginia, Nebraska, Mississippi, Arkansas, North Dakota, Ohio, Wisconsin, Alabama, Idaho, South Dakota, ", 120, usa.height+208+5*ROW_HEIGHT); 
  text("Kentucky, Michigan, Pennsylvania, Texas. Restrictions include: Parental consent, Limitations of public financing, ultrasound requirements.", 120, usa.height+208+6*ROW_HEIGHT);

  // Sidebar
  
  translate(SIDE_PADDING+10, TOP_PADDING-50);
  
  boolean updated = false;
  for (int i = 0; i < teamCount; i++) {
    if (standingsPosition[i].update() && incomePosition[i].update()) {
      updated = true;
    }
  }
  if (!updated) {
    noLoop();
  }
  
  
  textFont(labelfont);
  textAlign(RIGHT, CENTER);
  text("ABORTION RATE\nSTATE OF RESIDENCE", 50, -20);
  
  textAlign(LEFT, CENTER);
  text("ABORTION RATE\nSTATE OF OCCURRENCE", 380, -20);
  
  translate(0, 10);

  for (int i = 0; i < teamCount; i++) {
    //float standingsY = standings.getRank(i)*ROW_HEIGHT + HALF_ROW_HEIGHT;
    float standingsY = standingsPosition[i].value * (ROW_HEIGHT) + HALF_ROW_HEIGHT;

    //image(logos[i], 0, standingsY - logoHeight/2, logoWidth, logoHeight);
    
    //descriptionfont = createFont("vitesselightitalic.ttf", 12);
    textFont(descriptionfont);  
    textAlign(RIGHT, CENTER);
    text(teamNames[i], 50, standingsY);

    textAlign(RIGHT, CENTER);
    //fill(128);
    text(standings.getTitle(i), 90, standingsY);

    //float weight = map(salaries.getValue(i), 
   //                    salaries.getMinValue(), salaries.getMaxValue(), 
    //                   0.25f, 6);
    float weight = map(income.getValue(i), income.getMinValue(), income.getMaxValue(), 0.25f, 6);
    strokeWeight(weight);
      
    float salaryY = income.getRank(i)*(ROW_HEIGHT) + HALF_ROW_HEIGHT;
    //float salaryY = incomePosition[i].value*(ROW_HEIGHT) + HALF_ROW_HEIGHT;
    if (salaryY >= standingsY) {
      stroke(109,110,113);  // Blue for positive (or equal) difference.
      // Blue for rate of abortion that is higher rank than
      // rank of income level
    } else {
      stroke(221,66,38);   // Red for wasting money.
    }
      
    line(100, standingsY, 325, salaryY);

    fill(128);
    textAlign(LEFT, CENTER);
    text(income.getTitle(i), 335, salaryY);
    textAlign(LEFT, CENTER);
    text(teamNames[i], 380, salaryY);
  }
}

  
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

void colorState(PShape state, float abortionRate, boolean abortion) {
  color c2;
  color c1;
  float inter;
  if (abortion) {
    c2 = color(109,110,113);
    c1 = color(255);
    inter = map(abortionRate, 0, 45, 0, 1);
  } else {
    c2 = color(221,66,38);
    c1 = color(255);
    inter = map(abortionRate, 0, 50, 0, 1);
  }
  color c = lerpColor(c1, c2, inter);
  fill(c);
  shape(state,0,0);
}


void update(int x, int y) {
  if (overCircle(320, 107,15)) {
    currentShow = "a";
  } if (overCircle(510, 107, 15)) {
    currentShow = "i";
  }
}

boolean overCircle(int x, int y, int diameter) {
  //line(320,107.5, 335,122.5);
  //line(510,107.5,525,122.5);
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter*2 ) {
    return true;
  } else {
    return false;
  }
}

//.........

int dateSelectorX;
int dateSelectorY = 30;

// Draw a series of lines for selecting the date
void drawDateSelector() {
  dateSelectorX = (width - dateCount*93)/2;
  
  DateFormat testFormat = new SimpleDateFormat("yyyy");
  String[] dateTest = new String[dateCount];
  
  dateTest[0] = "1984";
  dateTest[1] = "1985";
  dateTest[2] = "1987";
  dateTest[3] = "1988";
  dateTest[4] = "1991";
  dateTest[5] = "1992";
  dateTest[6] = "1996";
  dateTest[7] = "1999";
  dateTest[8] = "2000";
  dateTest[9] = "2004";
  dateTest[10] = "2005";
  dateTest[11] = "2007";

  
  //(datePretty);

  strokeWeight(1);
  for (int i = 0; i < dateCount; i++) {
    int x = dateSelectorX + i*60;
    for (int y = 0; y < 12; y++) {
      stroke(0);
      if (i != dateCount-1){
      int w = x+ y*5;
      fill(221,66,38);
      line(w, 0, w, 7);}
    }

    // If this is the currently selected date, draw it differently
    if (i == dateIndex) {
      stroke(0);
      line(x, 0, x, 13);
      textAlign(CENTER, TOP);
      text(dateTest[dateIndex], x, 15);

    } else {
      // If this is a viewable date, make the line darker
      if ((i >= minDateIndex) && (i <= maxDateIndex)) {
        stroke(128);  // Viewable date
      } else {
        stroke(204);  // Not a viewable date
      }
      line(x, 0, x, 7);
    }
  }
}


void setDate(int index) {
  dateIndex = index;
  standings = season[dateIndex];
  //abortions = stateAbortion[dateIndex];
  income = incomeSeason[dateIndex];
  //println(income);
  //in = incomeSeason[dateIndex];
  //update(mouseX, mouseY);

  for (int i = 0; i < teamCount; i++) {
    standingsPosition[i].target(standings.getRank(i));
    incomePosition[i].target(income.getRank(i));
  }
  // Re-enable the animation loop
  loop();
}

void mouseMoved() {
  update(mouseX, mouseY);
}

void mousePressed() {
  handleMouse();
}
  
void mouseDragged() {
  handleMouse();
}
  
void handleMouse() {
  if (mouseY < dateSelectorY) {
    int date = (mouseX - dateSelectorX)/60;
    setDate(constrain(date, minDateIndex, maxDateIndex));
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      int newDate = max(dateIndex - 1, minDateIndex);
      setDate(newDate);

    } else if (keyCode == RIGHT) {
      int newDate = min(dateIndex + 1, maxDateIndex);
      setDate(newDate);
    }
  }
}


// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .


/*
String[] acquireStandings(String stamp) {
  int year = int(stamp.substring(0, 4));
  int month = int(stamp.substring(4, 6));
  int day = int(stamp.substring(6, 8));
  return acquireStandings(year, month, day);
}
  

String[] acquireStandings(int year, int month, int day) {
  String filename = year + nf(month, 2) + nf(day, 2) + ".tsv";
  String path = dataPath(filename);
  File file = new File(path);
  if (!file.exists()) {
    println("Downloading standings file " + filename);
    PrintWriter writer = createWriter(path);

    String base = "http://mlb.mlb.com/components/game" + 
      "/year_" + year + "/month_" + nf(month, 2) + "/day_" + nf(day, 2) + "/";

    // American League (AL)
    parseWinLoss(base + "standings_rs_ale.js", writer);
    parseWinLoss(base + "standings_rs_alc.js", writer);
    parseWinLoss(base + "standings_rs_alw.js", writer);

    // National League (NL)
    parseWinLoss(base + "standings_rs_nle.js", writer);
    parseWinLoss(base + "standings_rs_nlc.js", writer);
    parseWinLoss(base + "standings_rs_nlw.js", writer);

    writer.flush();
    writer.close();
  }
  return loadStrings(filename);
}

  
void parseWinLoss(String filename, PrintWriter writer) {
  String[] lines = loadStrings(filename);
  Pattern p = Pattern.compile("\\s+([\\w\\d]+):\\s'(.*)',?");

  String teamCode = "";
  int wins = 0;
  int losses = 0;

  for (int i = 0; i < lines.length; i++) {
    Matcher m = p.matcher(lines[i]);

    if (m.matches()) {
      String attr = m.group(1);
      String value = m.group(2);

      if (attr.equals("code")) {
        teamCode = value;
      } else if (attr.equals("w")) {
        wins = parseInt(value);
      } else if (attr.equals("l")) {
        losses = parseInt(value);
      }

    } else {
      if (lines[i].startsWith("}")) {
        // this is the end of a group, write these values
        //println(team + " " + wins + "-" + losses);
        //set(teamIndex(teamCode), wins, losses);
        writer.println(teamCode + TAB + wins + TAB + losses);
      }
    }
  }
}
*/
  
  
//. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

  
class SalaryList extends RankedList {
    
  SalaryList(String[] lines) {
    super(teamCount, false);
    
    for (int i = 0; i < teamCount; i++) {
      String pieces[] = split(lines[i], TAB);
        
      // First column is the team 2-3 digit team code.
      int index = teamIndex(pieces[0]);
        
      // Second column is the salary as a number. 
      value[index] = parseFloat(pieces[1]);
        
      // Make the title in the format $NN,NNN,NNN
      float salary = (float) value[index];
      title[index] = Float.toString(salary);
    }
    update();
  }
}

  
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .


class StandingsList extends RankedList {
    
  StandingsList(String[] lines) {
    super(teamCount, false);
      
    for (int i = 0; i < teamCount; i++) {
      String[] pieces = split(lines[i], TAB);
      int index = teamIndex(pieces[0]);
      float wins = parseFloat(pieces[1]);
      //int losses = parseInt(pieces[2]);
        
      value[index] = (float) wins; // (float) (wins+losses);
      title[index] = Float.toString(wins); // + "\u2013"; //+ losses;
    }
    update();
  }

  float compare(int a, int b) {
    // First compare based on the record of both teams
    float amt = super.compare(a, b);
    // If the record is not identical, return the difference
    if (amt != 0) return amt;

    // If records are equal, use salary as tie-breaker. 
    // In this case, a and b are switched, because a higher
    // salary is a negative thing, unlike the values above.
    return amt; //income.compare(a, b);
  }
}


