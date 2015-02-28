
 /****************************************************************
 * Sarah Ngo
 * Scott Fritz
 * Patrick Coats
 * 
 * CS 171 
 * Spring 2012
 *
 * Cambridge Car Crashes
 * Domain Task: Allow user to identify dangerous intersections
 *
 ***************************************************************/

// Size of screen
int width = 969;
int height = 700;

// Size of map
int mapWidth = 827;
int mapHeight = 599;

// Map lat and long
float mapGeoLeft   = -71.13431811332703;
float mapGeoRight  =  -71.10579;
float mapGeoTop    =  42.38638484239088;
float mapGeoBottom =  42.37101;

// this sets the size of the mouse circle
int scopeSize = 50;
// this changes the dot size when there is mouse-over
int hoverSize = 1; 

// map scaling
float scaleFactor = .303;
float verticalOffset = 244;
float horizontalOffset = 250;
float mapScreenWidth, mapScreenHeight;

// boolean variables for filtering
boolean show07; 
boolean show08; 
boolean show09; 
boolean showClear; 
boolean showCloudy; 
boolean showFoggy; 
boolean showRainy; 
boolean showSleeting; 
boolean showSnowy; 
boolean showWindy; 
boolean showMotor; 
boolean showStationary; 
boolean showMovable; 
boolean showCyclist; 
boolean showPedestrian; 
boolean showAnimal; 

// Prep for image
PImage bg;
int a;

// Set fonts for title
PFont title; 
PFont subtitle; 

// variables for the key
int buttonx; 
int buttony; 

// store the data in lists
int[] id;  // crash id number 
int[] days; // for the date that the crash occurred
int[] months; // for the date that the crash occurred
int[] years; // for the date that the crash occurred
String[] times; // time of day
String[] severity; // was it fatal or not?
int[] vehicles; // for number of vehicles involved
int[] nonfatal; // number of non-fatal injuries
int[] fatal; // fatal injuries
String[] type; // type of crash
String[]light; // how dark was it?
String[] weather; // the weather and road conditions
float[] xcoords; // x-coordinates of crash
float[] ycoords; // y-coordinates of crash
String[] intersection; // nearest intersection to where crash occured

void setup() 
{
  size(969, 700);
  frameRate(30);
  bg = loadImage("Cambridge_map.jpg");
  title = createFont("Franklin Gothic Book", 30, true);
  subtitle = createFont("Franklin Gothic Book", 17, true);
  
  // Set scaling
  mapScreenWidth  = mapWidth*scaleFactor;
  mapScreenHeight = mapHeight*scaleFactor;
  
  readData(); 
  // Prep to show all of the data at start up
  show07 = true; 
  show08 = true; 
  show09 = true; 
  showClear = true; 
  showCloudy = true; 
  showFoggy = true;
  showRainy = true; 
  showSleeting = true; 
  showSnowy = true;
  showWindy = true; 
  showMotor = true; 
  showStationary = true; 
  showMovable = true; 
  showCyclist = true; 
  showPedestrian = true; 
  showAnimal = true; 
}

/*
 * Reads data for map
 */
void readData() {
  Table data = new Table("Cambridge_allthree.csv"); 
  
  // initialize strings to hold data
  int numRows = data.getRowCount();
  
  id = new int[numRows];
  days = new int[numRows];
  months = new int[numRows];
  years = new int[numRows];
  times = new String[numRows];
  severity = new String[numRows];
  vehicles = new int[numRows]; 
  nonfatal = new int[numRows]; 
  fatal = new int[numRows]; 
  type = new String[numRows]; 
  light = new String[numRows]; 
  weather = new String[numRows]; 
  xcoords = new float[numRows]; 
  ycoords = new float[numRows];
  intersection = new String[numRows];
  
  // fill strings with data
  for (int i = 0; i < numRows; i++) {
    id[i] = data.getInt(i,1);
    days[i] = data.getInt(i,2);
    months[i] = data.getInt(i,3);
    years[i] = data.getInt(i,4);
    times[i] = data.getString(i,5);
    severity[i] = data.getString(i,6);
    vehicles[i] = data.getInt(i,7);
    nonfatal[i] = data.getInt(i,8);
    fatal[i] = data.getInt(i,9);
    type[i] = data.getString(i,10);
    light[i] = data.getString(i,11);
    weather[i] = data.getString(i,12);
    xcoords[i] = data.getFloat(i,16);
    ycoords[i] = data.getFloat(i,15);
    intersection[i] = data.getString(i, 14);
  }
}

void draw() {
  
  background(bg);
  
  // draw rectangle for the date/time/fatality info for each data point
  noStroke(); 
  fill(220); 
  rectMode(CORNERS); 
  rect((width-200), (height-10), (width-10), height-150);

  inspectDataPoints(); // check for mousing over
  drawButtons(); // draw key
  drawTitle(); // draw title
  drawData(); // draw data points
  
  // draw eyeglass
  fill(0,0,0,0);
  stroke(0);
  strokeWeight(1.5);
  ellipse(mouseX, mouseY, scopeSize, scopeSize);
}  

/*
| Check for mousing over
*/

void inspectDataPoints() {
  
  //Set up variables
  String s = "";
  int cnt = 0;
  int fat = 0;
  int nonFat = 0;
  int mouseSize = 10;
  String intersect = "";
  
  // show the statistics for the relevant car crash
  for (int i = 0; i < id.length; i++) {  
    PVector p = geoToPixel(new PVector(xcoords[i],ycoords[i]));
    // if mouse is within hover radius of 5 points. 
    if (dist(p.x, p.y, mouseX, mouseY) < scopeSize/2 ) { 
        
        if (  ( ((years[i]==2007)&&(show07==true)) || 
                ((years[i]==2008)&&(show08==true)) || 
                ((years[i]==2009)&&(show09==true)) )   &&
              ( ((weather[i].equals("Clear"))&&(showClear==true)) || 
                ((weather[i].equals("Cloudy"))&&(showCloudy==true)) || 
                ((weather[i].equals("Fog"))&&(showFoggy==true)) ||
                ((weather[i].equals("Rain"))&&(showRainy==true)) ||
                ((weather[i].equals("Sleet"))&&(showSleeting==true)) ||
                ((weather[i].equals("Snow"))&&(showSnowy==true)) || 
                ((weather[i].equals("Windy"))&&(showWindy==true)) )   &&
              ( ((type[i].equals("A"))&&(showMotor==true)) ||
                ((type[i].equals("B"))&&(showStationary==true)) ||
                ((type[i].equals("C"))&&(showMovable==true)) ||
                ((type[i].equals("D"))&&(showCyclist==true)) ||
                ((type[i].equals("E"))&&(showPedestrian==true)) ||
                ((type[i].equals("F"))&&(showAnimal==true)) )   ) { 
          smooth(); noStroke(); fill(200,0,0); 
          ellipse(776, 585, 7, 7); 
          fill(255,141,0); ellipse(776, 605, 7, 7); 
          cnt++;
          fat += fatal[i];
          nonFat += nonfatal[i];     
        }
    }
    
    if (dist(p.x, p.y, mouseX, mouseY) < mouseSize ) { 
        
        if (  ( ((years[i]==2007)&&(show07==true)) || 
                ((years[i]==2008)&&(show08==true)) || 
                ((years[i]==2009)&&(show09==true)) )   &&
              ( ((weather[i].equals("Clear"))&&(showClear==true)) || 
                ((weather[i].equals("Cloudy"))&&(showCloudy==true)) || 
                ((weather[i].equals("Fog"))&&(showFoggy==true)) ||
                ((weather[i].equals("Rain"))&&(showRainy==true)) ||
                ((weather[i].equals("Sleet"))&&(showSleeting==true)) ||
                ((weather[i].equals("Snow"))&&(showSnowy==true)) || 
                ((weather[i].equals("Windy"))&&(showWindy==true)) )   &&
              ( ((type[i].equals("A"))&&(showMotor==true)) ||
                ((type[i].equals("B"))&&(showStationary==true)) ||
                ((type[i].equals("C"))&&(showMovable==true)) ||
                ((type[i].equals("D"))&&(showCyclist==true)) ||
                ((type[i].equals("E"))&&(showPedestrian==true)) ||
                ((type[i].equals("F"))&&(showAnimal==true)) )   ) {
          
          //Store name of intersection        
          intersect = intersection[i];          
        }
     }        
  }
  
  // create text to write to the text box
  if (cnt > 0)
  { 
    if (cnt == 1)
      s+= "1 accident\n";
    else
      s+= cnt + " accidents\n";
    if (fat == 1) 
      s+= "1 fatal injury\n";
    else
      s+= fat + " fatal injuries\n";
    if (nonFat == 1)
      s+= "1 nonfatal injury\n";
    else
      s+= nonFat + " nonfatal injuries\n";
   }
  s+= intersect; 
  fill(0);
  textAlign(LEFT); 
  textSize(13);
  
  // Make the text wrap around
  text(s, 785, 560, 955, 690);
}
  
/*
| Draw Data points
*/

void drawData() {
 
  // find each car crash from the correct years
  for (int i = 0; i <  id.length; i++) {  
    if (  ( ((years[i]==2007)&&(show07==true)) || 
            ((years[i]==2008)&&(show08==true)) || 
            ((years[i]==2009)&&(show09==true)) )   &&
          ( ((weather[i].equals("Clear"))&&(showClear==true)) || 
            ((weather[i].equals("Cloudy"))&&(showCloudy==true)) || 
            ((weather[i].equals("Fog"))&&(showFoggy==true)) ||
            ((weather[i].equals("Rain"))&&(showRainy==true)) ||
            ((weather[i].equals("Sleet"))&&(showSleeting==true)) ||
            ((weather[i].equals("Snow"))&&(showSnowy==true)) || 
            ((weather[i].equals("Windy"))&&(showWindy==true)) )   &&
          ( ((type[i].equals("A"))&&(showMotor==true)) ||
            ((type[i].equals("B"))&&(showStationary==true)) ||
            ((type[i].equals("C"))&&(showMovable==true)) ||
            ((type[i].equals("D"))&&(showCyclist==true)) ||
            ((type[i].equals("E"))&&(showPedestrian==true)) ||
            ((type[i].equals("F"))&&(showAnimal==true)) )   )  { 
      // draw the data
      ellipseMode(CENTER);
      noStroke(); 
      smooth();
      
      // if the car crash had a fatality, color it red; if not, blue
      if (severity[i].equals("fatal"))
        fill(200,0,0);
      else if (severity[i].equals("non-fatal"))
        fill(255,141,0,130); 
      else fill(0,153,153,130);
      
      // size of ellipse depends on the number of people injured/killed in the crash
      PVector p = geoToPixel(new PVector(xcoords[i],ycoords[i]));
      if (dist(p.x,p.y,mouseX,mouseY)< (scopeSize/2)) {
        hoverSize = 2;   
      }
      
      // size of ellipse depends on number of people injured/killed in the accident
      ellipse(p.x, p.y, (((fatal[i]*8)+(nonfatal[i]*3)+4)*hoverSize), (((fatal[i]*8)+(nonfatal[i]*3)+4)*hoverSize) );
      hoverSize = 1; 
    }   
  }  
}    
 
/*
 * Draws the Title at the top to indicate which semester is being shown
 */ 
void drawTitle() {
  fill(0); textAlign(LEFT, BASELINE); textSize(30); strokeWeight(4); 
  text("Cambridge Car Crashes", 7, 30);  
  textSize(18); fill(50); 
  text("\n2007-2009", 7, 30);  
}

/*
 * Draw buttons for the key
 */
void drawButtons() {
  
  textAlign(LEFT, BASELINE);
  
  // draw key box for weather conditions
  fill(220); 
  rectMode(CORNERS); 
  rect((width-375), (height-650), (width-275), (height-600));
  fill(30); textFont(subtitle); text("Weather", width-355, height-620); 
  fill(220); 
  rectMode(CORNERS); 
  rect((width-375), (height-595), (width-275), (height-400));
  
  // box contents
  fill(30); textSize(13); text("Clear", width-345, height-570);
  text("Cloudy", width-345, height-545);
  text("Foggy", width-345, height-520);
  text("Rainy", width-345, height-495);
  text("Sleeting", width-345, height-470);
  text("Snowy", width-345, height-445);
  text("Windy", width-345, height-420);
  
  // ellipses for buttons with fill that changes color based on whether or not that option is clicked
  if (showClear==true)
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-575, 9, 9);
  if (showCloudy==true) 
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-550, 9, 9); 
  if (showFoggy==true)
    fill(0); 
  else fill(250);
  ellipse(width-360, height-525, 9, 9); 
  if (showRainy==true)
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-500, 9, 9); 
  if (showSleeting==true)
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-475, 9, 9); 
  if (showSnowy==true)
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-450, 9, 9); 
  if (showWindy==true)
    fill(0); 
  else fill(250); 
  ellipse(width-360, height-425, 9, 9); 
  
  // draw "type of accident" box
  fill(220); 
  rectMode(CORNERS); 
  rect((width-250), (height-650), (width-25), (height-600));
  fill(30); textFont(subtitle); text("Type of Collision", width-195, height-620); 
  fill(220); 
  rectMode(CORNERS); 
  rect((width-250), (height-595), (width-25), (height-425));
  
  // box contents
  fill(30); textSize(14); text("Collision with motor vehicle", width-220, height-570);
  text("Collision with stationary object", width-220, height-545);
  text("Collision with movable object", width-220, height-520);
  text("Collision with cyclist", width-220, height-495);
  text("Collision with pedestrian", width-220, height-470);
  text("Collision with animal", width-220, height-445);
  
  // buttons next to each filter option
  if (showMotor==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-575, 9, 9);
  if (showStationary==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-550, 9, 9);
  if (showMovable==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-525, 9, 9);
  if (showCyclist==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-500, 9, 9);
  if (showPedestrian==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-475, 9, 9);
  if (showAnimal==true)
    fill(0); 
  else fill(250); 
  ellipse(width-235, height-450, 9, 9);
   
   // draw buttons for the year
   buttonx = width-900; // set x and y coordinates of where the dates will sit
   buttony = height-130;
   smooth(); 
   fill(0); 
   textAlign(CENTER); 
   textSize(19);
   text("2007", buttonx, buttony);
   text("2008", buttonx + 100, buttony); 
   text("2009", buttonx + 200, buttony);
    
   strokeWeight(0.8); smooth(); stroke(200); 
   line(buttonx, buttony+30, buttonx+100, buttony+30);  
   line(buttonx, buttony+30, buttonx+200, buttony+30); 
   
   // ellipses as selection options next to each year - color changes if it's clicked
   noStroke(); 
   if (show07==true)
     fill(20); 
   else fill(220);   
   ellipse(buttonx, buttony+30, 18, 18);  
 
   if (show08==true)
     fill(20); 
   else fill(220); 
   ellipse(buttonx+100, buttony+30, 18, 18); 
   
   if (show09==true)
     fill(20); 
   else fill(220); 
   ellipse(buttonx+200, buttony+30, 18, 18); 
   
   // draw key at the bottom
   textAlign(LEFT); textSize(15); fill(0,0,0); text("= fatal crash", 30, height-10);
   text("= non-fatal crash", 165, height-10); 
   text("= no injuries", 325, height-10); 
   textSize(15); text("Dot Size = number of injuries + fatalities", 450, height-10); 
   textSize(18); text("CS171 SPRING 2012", 780, 30); 
   textSize(12); text("Use UP and DOWN keys \n  to change scope size", 805, 520); 
   smooth(); noStroke(); fill(200,0,0); ellipse(15,height-15,15,15);
   fill(255,141,0); ellipse(150,height-15,15,15); 
   fill(0,153,153); ellipse(310,height-15,15,15); 
}

/*
| allows user to select which filtering options to display
*/
void cycle_filters (char filters) {
  switch (filters) {
    
    case'z':
      if (showClear==false)
        showClear=true;
      else showClear=false;   
    break;
    
    case'y':
      if (showCloudy==false)
        showCloudy=true;
      else showCloudy=false; 
    break;
    
    case'x':
      if (showFoggy==false)
        showFoggy=true;
      else showFoggy=false; 
    break;
    
    case'w':
      if (showRainy==false)
        showRainy=true;
      else showRainy=false; 
    break;
    
    case'v':
      if (showSleeting==false)
        showSleeting=true;
      else showSleeting=false; 
    break;
    
    case'u':
      if (showSnowy==false)
        showSnowy=true;
      else showSnowy=false; 
    break;
    
    case't':
      if (showWindy==false)
        showWindy=true;
      else showWindy=false; 
    break;
    
   // cases for the years
    case'7':
      if (show07==false)
        show07=true;
      else show07=false; 
    break;
    
    case'8':
      if (show08==false)
        show08=true;
      else show08=false; 
    break;
    
    case'9':
      if (show09==false)
        show09=true;
      else show09=false; 
    break; 
    
    // filters for collision type
    case'a':
      if (showMotor==false)
        showMotor=true;
      else showMotor=false; 
    break; 
    
    case'b':
      if (showStationary==false)
        showStationary=true;
      else showStationary=false; 
    break; 
    
    case'c':
      if (showMovable==false)
        showMovable=true;
      else showMovable=false; 
    break; 
    
    case'd':
      if (showCyclist==false)
        showCyclist=true;
      else showCyclist=false; 
    break; 
    
    case'e':
      if (showPedestrian==false)
        showPedestrian=true;
      else showPedestrian=false; 
    break; 
    
    case'f':
      if (showAnimal==false)
        showAnimal=true;
      else showAnimal=false; 
    break; 

    }
    
    drawData(); 
}

/*
| This method uses global variables called
| choiceX and choiceY for data used on the x- and y-axes. 
*/

void mouseClicked () { 
  // filter by weather  
  if ( dist(width-360, height-575, mouseX, mouseY) < 15)
    cycle_filters('z'); 
  if ( dist(width-360, height-550, mouseX, mouseY) < 15)
    cycle_filters('y'); 
  if ( dist(width-360, height-525, mouseX, mouseY) < 15)
    cycle_filters('x'); 
  if ( dist(width-360, height-500, mouseX, mouseY) < 15)
    cycle_filters('w'); 
  if ( dist(width-360, height-475, mouseX, mouseY) < 15)
    cycle_filters('v'); 
  if ( dist(width-360, height-450, mouseX, mouseY) < 15)
    cycle_filters('u'); 
  if ( dist(width-360, height-425, mouseX, mouseY) < 15)
    cycle_filters('t'); 
    
  // filter by year
  if ( dist(buttonx, buttony+30, mouseX, mouseY) < 25)
    cycle_filters('7'); 
  if ( dist(buttonx+100, buttony+30, mouseX, mouseY) < 25)
    cycle_filters('8'); 
  if ( dist(buttonx+200, buttony+30, mouseX, mouseY) < 25)
    cycle_filters('9'); 
    
  // filter for the type of accident
  if ( dist(width-235, height-575, mouseX, mouseY) < 15)
    cycle_filters('a'); 
  if ( dist(width-235, height-550, mouseX, mouseY) < 15)
    cycle_filters('b'); 
  if ( dist(width-235, height-525, mouseX, mouseY) < 15)
    cycle_filters('c'); 
  if ( dist(width-235, height-500, mouseX, mouseY) < 15)
    cycle_filters('d'); 
  if ( dist(width-235, height-475, mouseX, mouseY) < 15)
    cycle_filters('e'); 
  if ( dist(width-235, height-450, mouseX, mouseY) < 15)
    cycle_filters('f'); 
    
}

// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
    return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft) + horizontalOffset,
                       mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom)+verticalOffset);
}


/*
| This allows to change the scope or size of the hour glass
| by using the Up and Down keys
*/

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      scopeSize += 2; 
    } 
    else if (keyCode == DOWN) {
      scopeSize -= 2; 
    }
  }
}


