
// set up for dropdown list making
import controlP5.*;

// initiate IP5 for dropdown lists and scale effects
ControlP5 controlP5;

DropdownList p1;
DropdownList p_xaxis;
DropdownList p_yaxis;

Range rangedot;

Collect table;
int bg_color = 50;
PFont font;
int plot_x1, plot_x2, plot_y1, plot_y2;
float plot_width, plot_height, xrange, yrange;
int steps = 10;
float[][] datapoints;
float[] ellipseradius;
float scaleradius;


  
/*
| Statistics available for comparison. 
*/
String[][] axes = {
  {"Points Per Game", "ppg"},
  {"Games Started", "gs"},
  {"Field Goal Percentage", "fgp"},
  {"Minutes Per Game", "mpg"},
  {"Total Number of Games", "g"},
  {"Three Point Percentage", "threepp"},
  {"Offensive Rebounds", "offr"},
  {"Defensive Rebounds", "defr"},
  {"Rebounds per Game", "rpg"},
  {"Assists per Game", "apg"},
  {"Steals per Game", "spg"},
  {"Blocks per Game", "bpg"},
  {"Turnovers per Game", "to"},
  {"Personal Fouls per Game", "pf"}
};

//set global dotmin dotmax for easy scaling
float dotmin;
float dotmax;

// currently chosen statistic for x and y axis, respectively, also z axis for circle size
int[] axis_choice = {0, 2, 1};

float[] x_axis_area, y_axis_area;


void setup() {
  size(1200, 700);
  table = new Collect("all_players.tsv");
  controlP5 = new ControlP5(this);
  // initiate scale & dropdowns in setup func
  makeDropdown();
  makeScale();
}

// initiate scale function
void makeScale(){
    // presets for passing in figure size
   int w = (int) (width * 0.8);
   int h = (int) (height * 0.75);
   int listlen = (int) (w/5);
   
    plot_x1 = (width - w) / 2;
    plot_y1 = (height - h) / 2;
    plot_x2 = plot_x1 + w;
    plot_y2 = plot_y1 + h;
   
   // get the info for size of dots
   String[] z_size = axes[axis_choice[2]];
   int z_index = table.fieldIndex(z_size[1]);
     
   ellipseradius = new float[table.numRows];
   for (int i = 0; i < ellipseradius.length; i++) {
       ellipseradius[i] = table.getFloatAt(i, z_index); // value of dot
   }
   
    // get min and max for actual initiating
    dotmin = min(ellipseradius);
    dotmax = max(ellipseradius);
 
  // put in value, min, max, minpreset, maxpreset, xcoord, ycord, length,height)
   rangedot = controlP5.addRange("Dot Size",dotmin,dotmax,dotmin,dotmax, plot_x1+listlen,plot_y1-3,listlen*4,15);
  
}

// initiate dropdown menu
void makeDropdown(){
  
  // presets for positioning
  int w = (int) (width * 0.8);
  int h = (int) (height * 0.75);

  plot_x1 = (width - w) / 2;
  plot_y1 = (height - h) / 2;
  plot_x2 = plot_x1 + w;
  plot_y2 = plot_y1 + h;
  
  // length is 1/5 of graph length
  int listlen = (int) (w/5);
  
  //list for point size
  p1 = controlP5.addDropdownList("point_size",plot_x2-listlen,plot_y1-10,listlen,500);
  // list for x-axis choice
  p_xaxis = controlP5.addDropdownList("x-axis",plot_x1+listlen,plot_y1-10,listlen,500);
  // list for y-axis choice
  p_yaxis = controlP5.addDropdownList("y-axis",(int)(plot_x1+listlen*2.5),plot_y1-10,listlen,500);
  // customize each one to populate with actual info
  customize1(p1);
  customize1(p_xaxis);
  customize1(p_yaxis);
}


// customizing dropdown list 
void customize1(DropdownList ddl) {
  ddl.setBackgroundColor(color(0));
  ddl.setItemHeight(20);
  ddl.setBarHeight(20);
  // identify each list and have default be displayed
  if (ddl.name().equals("point_size")){
     ddl.captionLabel().set("Games Started");
  }
  if (ddl.name().equals("x-axis")){
     ddl.captionLabel().set("Points Per Game");
  }
  if (ddl.name().equals("y-axis")){
     ddl.captionLabel().set("Field Goal Percentage");
  }
  ddl.captionLabel().style().marginTop = 5;
  ddl.captionLabel().style().marginLeft = 5;
  ddl.valueLabel().style().marginTop = 3;
  // populate with all variable choices
  for(int i=0;i<axes.length;i++) {
    ddl.addItem(axes[i][0],i);
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255,128));
}

// this is to put action to selections on the dropdown list
void controlEvent(ControlEvent theEvent){
    if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    // theEvent.group().value() is the index number
    // listnum = 0 is the x-axis, listnum =1 is y-axis, listnum=2 is the circle size
       if (theEvent.group().name().equals("x-axis")){
         axis_choice[0] = (int)(theEvent.group().value());
       }
       if (theEvent.group().name().equals("y-axis")){
         axis_choice[1] = (int)(theEvent.group().value());
       }
       if (theEvent.group().name().equals("point_size")){
         axis_choice[2] = (int)(theEvent.group().value());
         // update scale every time variable is changed
         makeScale();
       }
  //  println(theEvent.group().value());
  } else if(theEvent.isController()) {


  }
  if(theEvent.controller().name().equals("Dot Size")) {
    // get info on dot size
    dotmin = theEvent.controller().arrayValue()[0];
    dotmax = theEvent.controller().arrayValue()[1];
  }
}


void draw() {
  background(bg_color);
  

  /*
  | IMPORTANT:
  | the next two lines determine the dimensions of the plot area
  */
  int w = (int) (width * 0.8);
  int h = (int) (height * 0.7);
  
  
  
  /**
  | Set choice of axes, first and third statistics by default
  */
  String[] x_axis = axes[axis_choice[0]];
  String[] y_axis = axes[axis_choice[1]];
  String[] z_size = axes[axis_choice[2]];
  
  /*
  | Start Drawing here.
  | Change these methods if necessary, clearly
  | commenting where any changes have been made
  */
  drawPlotArea(w, h);
  drawTitle("Career Stats for the NBA 2011");
  drawAxesLabels("< "+x_axis[0]+" >", "< "+y_axis[0]+" >");
  drawGridlines(x_axis[1], y_axis[1]);
  plotDataPoints(x_axis[1], y_axis[1], z_size[1]);
  cursorMode();
  inspectDataPoints();
  
  //create layer for labels for dropdown boxes instructions:
  fill(255,20,147); textSize(12);
  textAlign(LEFT);
  text("Choose Variables:",plot_x1,plot_y1-35);
  textAlign(RIGHT);
  text("X-Axis", (int)(plot_x1+w/5-5),plot_y1-35);
  text("Y-Axis", (int)(plot_x1+(w/5)*2.5-5),plot_y1-35);
  text("Point Size", (int)(plot_x2-w/5-5), plot_y1-35);
  
  //create another layer for labels for choosing ranges of the categories
  textAlign(LEFT);
  text("Set Scale (Min:Max) by Dragging:",plot_x1,plot_y1-10);
 
}



/*
| IMPORTANT:
| alter this method to change positioning of plot area
*/
void drawPlotArea(int w, int h) {

  plot_x1 = (width - w) / 2;
  plot_y1 = (height - h) / 2;
  plot_x2 = plot_x1 + w;
  plot_y2 = plot_y1 + h;
  rectMode(CORNERS);
  stroke(0);
  fill(30);
  rect(plot_x1, plot_y1, plot_x2, plot_y2);

  // set dimensions for later use
  plot_width = plot_x2 - plot_x1;
  plot_height = plot_y2 - plot_y1;
  
}
//create title
void drawTitle (String t) {
  fill(29, 145, 192);
  textAlign(CENTER);
  textSize(28);
  text(t, width/2, plot_y1/2-5);
}

void drawAxesLabels (String x_axis, String y_axis) {
  textSize(14);
  
  // axis labels are centered between adjacent edge of plot area and window
  text(x_axis, width/2, (height+plot_y2)/2);
  verticalText(y_axis, -height/2, plot_x1/2);
  
  // record areas where axes lie
  x_axis_area = new float[] { (height+plot_y2)/2-7, (height+plot_y2)/2+7 };
  y_axis_area = new float[] { plot_x1/2-7, plot_x1/2+7 };
}

// draw grid lines
void drawGridlines (String xfield, String yfield) {
  // find range (rounded to nearest ten)
  xrange =  ceil(table.columnMax(table.fieldIndex(xfield)));
  yrange =  ceil(table.columnMax(table.fieldIndex(yfield)));

  // steps defined at top of document, default 10
  float x_step_size = plot_width / steps;
  float y_step_size = plot_height / steps;

  for (int n = 1; n <= steps; n++) {

    float x = plot_x1 + n * x_step_size;
    float y = plot_y2 - n * y_step_size;

    stroke(0);

    // draw grid lines
    line(plot_x1, y, plot_x2, y);
    line(x, plot_y1, x, plot_y2);

    // test all variables 
    
    // label grid lines as well
     // truncate to just 1 decimal point 
      String ylab = str(truncate((n * yrange)/steps,1));
      String xlab = str(truncate((n * xrange)/steps,1));
      int countx = 0; int county=0;
      // get rid of excesssive zeros
      for (int i=1; i<=steps;i++){
        float ytemp = (n * yrange)/steps;
        float xtemp = (n * xrange)/steps;
        if ((ytemp*10)%10 == 0){
          county++;
        }
        if ((xtemp*10)%10 == 0){
          countx++;
        }
      }
      
      if (countx==10){
         xlab = str(int((n * xrange)/steps));
      }
      if (county==10){
         ylab = str(int((n * yrange)/steps));
      }
      
      text(ylab, plot_x1-15, y );
      text(xlab, x, plot_y2+15 );
    
  }
}


// plots column x against column y with regards to ellipse size z
void plotDataPoints (String x, String y, String z) {
  ellipseradius = new float[table.numRows];
  datapoints = new float[table.numRows][5];

  int x_index = table.fieldIndex(x);
  int y_index = table.fieldIndex(y);
  int z_index = table.fieldIndex(z);
  for (int i = 0; i < datapoints.length; i++) {
    
    // load datapoints for each row
    datapoints[i][0] = table.getFloatAt(i, x_index); // value of x
    datapoints[i][1] = table.getFloatAt(i, y_index); // value of y
    datapoints[i][2] = plot_x1 + (datapoints[i][0]/xrange) * plot_width; // x-coord on plot
    datapoints[i][3] = plot_y2 - (datapoints[i][1]/yrange) * plot_height; // y-coord on plot
    
   
    ellipseradius[i] = table.getFloatAt(i, z_index); // value of z
    
    // plot datapoint
    //fill(255);
    // get rid of stroke and make color transparent
    stroke(100);
    fill(0,191,255,191);
    /*
    | IMPORTANT:
    | arguments 3 and 4 determine ellipse size
    */
    
    // figure out ellipse size based on z string
    // map size of radius to predetermined max and min's.
    float scaledradius = map(ellipseradius[i],min(ellipseradius),max(ellipseradius),5,30);
     // repeat this for easier access in list outside for near() function
    datapoints[i][4] = scaledradius;
    
    // only plot those within desired range
    if (ellipseradius[i] >=dotmin && ellipseradius[i]<=dotmax){
       ellipse(datapoints[i][2], datapoints[i][3], scaledradius, scaledradius);
    }
    // draw a legend to define scales of the circles
    legend();
    
  }
  
}

// create a sidebar for legend for circle sizes
void legend(){
  rectMode(CORNER);
  fill(bg_color);
  stroke(29, 145, 192);
  float leg_wid= (width-plot_x2)-20;
  float leg_len= plot_y2-plot_y1;
  rect(plot_x2+10,plot_y1,leg_wid,leg_len);
  fill(29, 145, 192); textAlign(CENTER);textSize(12);
  text("LEGEND", plot_x2+10+leg_wid/2,plot_y1+20);
  textSize(10); fill(255);
  text("Ellipse size \n scale \n\n METRIC \n"+axes[axis_choice[2]][0], plot_x2+10+leg_wid/2, plot_y1+20+30);
  line(plot_x2+10+10, plot_y1+120,plot_x2+leg_wid,plot_y1+120);
  line(plot_x2+10+10, plot_y1+122,plot_x2+leg_wid,plot_y1+122);
  // define maximum value and circle size
  text("Maximum value\n"+max(ellipseradius), plot_x2+10+leg_wid/2, plot_y1+20+125);
  fill(0,191,255,191);
  ellipse(plot_x2+10+leg_wid/2, plot_y1+20+170,30,30);
  fill(255);
  // make dotted line and arrows to connect between 
  dottedLine(plot_x2+10+leg_wid/2, plot_y1+20+200.0,plot_x2+10+leg_wid/2, plot_y1+20+280.0,5);
  arrowhead(plot_x2+10+leg_wid/2, plot_y1+20+190,radians(270),radians(45+180),true);
  arrowhead(plot_x2+10+leg_wid/2, plot_y1+20+290,radians(90),radians(45+90),true);
  // define minimum value and circle size
  fill(0,191,255,191); stroke(0);
  ellipse(plot_x2+10+leg_wid/2, plot_y1+20+300,5,5);
  fill(255);
  text("Minimum value\n"+ min(ellipseradius), plot_x2+10+leg_wid/2, plot_y1+20+320);
  stroke(29, 145, 192);
  line(plot_x2+10+10, plot_y1+365,plot_x2+leg_wid,plot_y1+365);
  line(plot_x2+10+10, plot_y1+367,plot_x2+leg_wid,plot_y1+367);
}


// make a dotted line from http://processing.org/discourse/yabb2/YaBB.pl?num=1219255354
// adapted to fit needs
void dottedLine(float x1, float y1, float x2, float y2, float steps){
  float len = pow((pow(x2-x1,2)+pow(y2-y1,2)),0.5);
  for(int i=0; i<=steps; i++) {
   float x = lerp(x1, x2, i/steps);
   float y = lerp(y1, y2, i/steps);
   noStroke();
   ellipse(x, y,2,len/steps-2);
 }
}
// draw an arrow from http://openprocessing.org/sketch/7029
 
/*
 * Draws an arrow head at given location
 * x0 - arrow vertex x-coordinate
 * y0 - arrow vertex y-coordinate
 * lineAngle - angle of line leading to vertex (radians)
 * arrowAngle - angle between arrow and line (radians)
 * solid - true for a solid arrow, false for an "open" arrow
 */
void arrowhead(float x0, float y0, float lineAngle,
  float arrowAngle, boolean solid)
{
  float phi;
  float x2;
  float y2;
  float x3;
  float y3;
  final float SIZE = 8;
   
  x2 = x0 + SIZE * cos(lineAngle + arrowAngle);
  y2 = y0 + SIZE * sin(lineAngle + arrowAngle);
  x3 = x0 + SIZE * cos(lineAngle - arrowAngle);
  y3 = y0 + SIZE * sin(lineAngle - arrowAngle);
  if (solid)
  {
    triangle(x0, y0, x2, y2, x3, y3);
  }
  else
  {
    line(x0, y0, x2, y2);
    line(x0, y0, x3, y3);
  } 
}

/*
| IMPORTANT: FIXME DONE
| should allow user to see more information about a data point
| by mousing over it in the plot area.
| see near() method
*/
void inspectDataPoints () {
      int count = 0;
  for (int i = 0; i < datapoints.length; i++) {
    // if mouse is within hover radius of a point. note: 1 is VERY accurate
    //create counter so only one name is shown at once
    if (near(datapoints[i], mouseX, mouseY, 1) && count==0) {
      // if within range
      if (ellipseradius[i] >=dotmin && ellipseradius[i]<=dotmax){
        // create a specific white transparent box to make pink label stand out
        fill(255,255,255,80); rectMode(CENTER);noStroke();
        rect(datapoints[i][2],datapoints[i][3]-datapoints[i][4]/2-17,150,20);
         // show tooltip with first player name within range
        stroke(0); fill(255,20,147); textAlign(CENTER);textSize(16);
        text(table.getDataAt(i, table.fieldIndex("name")), datapoints[i][2],  datapoints[i][3]-datapoints[i][4]/2-10);

        fill(255,20,147);
            //highlight that specific ellipse
        ellipse(datapoints[i][2],datapoints[i][3],datapoints[i][4],datapoints[i][4]);
        // increase count once one point is found
        count++;
    }
  }
  }
}

/*
| IMPORTANT: FIXME DONE
| should allow user to change the axes being plotted
| by clicking the appropriate axis label
| see mouseClicked() method
*/
void cycle_axis (char axis) {
  switch (axis) {
    case 'X':
      axis_choice[0] = (axis_choice[0] + 1) % axes.length;
      if (axis_choice[0] == axis_choice[1]) {
        axis_choice[0] = (axis_choice[0] + 1) % axes.length;
      }
    break;
    case 'Y':
      axis_choice[1] = (axis_choice[1] + 1) % axes.length;
      if (axis_choice[0] == axis_choice[1]) {
        axis_choice[1] = (axis_choice[1] + 1) % axes.length;
      }
    break;
  }
}

void mouseClicked () {
  // give ability to click within the whole axis area
  // for y axis
  if (mouseX >= y_axis_area[0] && mouseX <= y_axis_area[1]){
    cycle_axis('Y');
  }
  // for x axis
  else if (mouseY >= x_axis_area[0] && mouseY <= x_axis_area[1]){
    cycle_axis('X');
  }
}

void verticalText (String t, int x, int y) {
  pushMatrix(); // contain text transformation
  rotate(radians(270));
  // because we rotate 270, x becomes -y, y becomes x. think cartesian coordinates
  text(t, x, y);  
  popMatrix();
}

void cursorMode () {
  if (mouseX > plot_x1 && mouseX < plot_x2 && mouseY > plot_y1 && mouseY < plot_y2) {
    // mouse in plot area
    cursor(CROSS); // use crosshair
  }
  else if ((mouseX >= y_axis_area[0] && mouseX <= y_axis_area[1]) ||
      (mouseY >= x_axis_area[0] && mouseY <= x_axis_area[1])
  ) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}

// determines whether x and y are within a radius `rad`
// of data[2] and data[3] respectively
boolean near (float[] data, float x, float y, int rad) {
  // find coordinates of the data point in repect to the axes chosen
  float xcoord = data[2];
  float ycoord = data[3];
  float nearradius = data[4]/2;

  // see if the data is within range
  if (pow((pow(xcoord-x,2)+pow(ycoord-y,2)),0.5)<=nearradius){
    return true;
  }
  else {return false;}
}

//function to truncate numbers to fewer numbers after decimal point
float truncate( float x, int decimals ) {
    return round( x * pow(10.0f,decimals) ) / (pow(10.0f,decimals));
}


class Collect {
  
  int numRows;
  int numCols;
  String[] rowNames;
  
  // data stored as strings by default, convert where necessary
  String[][] data; 
  
  // Assumes properly formed TSV with no row names
  Collect (String filename) {
    
    String[] rows = loadStrings(filename);
    String[] columns = split(rows[0], TAB);
    this.rowNames = columns;
    this.numRows = rows.length - 1;
    this.numCols = columns.length;
    this.data = new String[this.numRows][this.numCols];
    
    for (int i = 1; i < rows.length; i++) {
      String[] rowColumns = split(rows[i], TAB);
      this.data[i-1] = rowColumns;
    }
  }
 
 String[] getColumnNames () { return this.rowNames; }
 
 String[][] getData () { return this.data; }
 
 String getDataAt (int row, int column) { return this.data[row][column]; }
 
 float getFloatAt(int row, int column) { return parseFloat(this.data[row][column]); }
 
 int fieldIndex (String field) {
   for (int index = 0; index < this.rowNames.length; index++) {
     String column = this.rowNames[index];
     if (column.equals(field)) { return index; }
   }
   return -1; // field not found in row names
 }
 
 // Determines the maximum numerical value in a column
 float columnMax (int column) {
   float cMax = parseFloat(this.data[0][column]);
   for (int i = 0; i < this.data.length; i++) {
     float value = parseFloat(this.data[i][column]);
     if (value > cMax) {
       cMax = value;
     }
   }
   return cMax;
 }
 
 float columnMin (int column) {
   float cMin = parseFloat(this.data[0][column]);
   for (int i = 0; i < this.data.length; i++) {
     float value = parseFloat(this.data[i][column]);
     if (value < cMin) {
       cMin = value;
     }
   }
   return cMin;
 }
 
}


