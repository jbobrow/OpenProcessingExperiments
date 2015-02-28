
/*
Short term visitor arrivals to Australia
 by Carmel McGinley
 based on design and code created by Mitchell Whitelaw 
  for his Met Temp Graph (Sydney) sketch - http://www.openprocessing.org/visuals/?visualID=6631

Source data
Australian Bureau of Statistics
3401.0 - Overseas Arrivals and Departures, Australia, Aug 2010
http://www.abs.gov.au/ausstats/abs@.nsf/mf/3401.0

*/

//declare the global variables
String[] data_in;  //array to hold data file
float[][] pax;   //2d array for each cell in table
float[] mth_averages;  //monthly averages
float[] year_totals; //yearly totals
float oall_ave;  //average across all cells
float year_average;  //yearly average
int numyears = 0;    //number of years initialised to 0
float yearscale = 100000.0;  //??scale for years
float lineGraphY;  //how far down the line chart should be drawn
int selYear = 0;  //selected year
int firstYear;    //place to store the first year in the file
int marginX = 50;  //set an x margin
int marginY = 70;
int labelTextY = 50;
int labelLineY = 40;
int circleScale = 120;
PFont font;
String[] monthnames = {"jan","feb","mar","apr","may","jun","jul","aug","sept","oct","nov","dec"};
 
void setup(){
  size(800,650);
  //load the csv file
  lineGraphY = height-30;
  data_in = loadStrings("CircleArrivalsAll.csv");
  //determine number of years the length of the data file (no headers)
  numyears = data_in.length;
  //initalise the pax 2d array to have 12 columns and row equal to the length of the file
  pax = new float[numyears][12];
  //declare an array to hold the monthly averages
  mth_averages = new float[12];
  //declare an array to hold the yearly totals
  year_totals = new float[numyears];
  //run the parse data function to get the data
  parseData();
  //load the font
  font = createFont("Arial",36);
  smooth();

}
 
void draw(){
  background(0);
  textFont(font,12);
  fill(150);
  textAlign(RIGHT);
  text("Short Term Vistor Arrivals to Australia", width-20, 20);
  textFont(font,10);
  text("Data source: ABS Publication 3401.0", width-20, 35);
  textFont(font,14);
  fill(255,255);
  textAlign(CENTER);
  
  //draw the year line chart
    //work out x position for label based on the selected year and total number of years
    float yearX = marginX+(((width-2*marginX)*selYear)/(numyears-1));
    //print the year label by adding the selected year to the first year
    //place at yearX from above and 50px below the lineGraphY position
    text(selYear+firstYear,yearX,620);
    //put the labels on the line chart at the bottom
    //text(round(year_average[selYear]/1000)+"k",yearX,lineGraphY-marginY);
    text(nf((year_totals[selYear])/1000000,1,3)+" mil",yearX,520);
    //set the stroke to white
    stroke(255,100);
    //draw the line that appears with the label
      //x position is dependent on selected year and first year in the file
      //y position is 40px above the lineGraphY position to 30px below
    line(yearX,600,yearX,530);
    //finally draw the data line
    drawYears(lineGraphY);
    
  //draw the circle chart
    translate(400,250);  //move the workspace
    stroke(200);         //make the stoke very light
    fill(100);           //make the fill very light
    monthLabels();       //call the monthLabels function to draw the labels around the circle
    noFill();            //turn the fill off
        
    //draw the time series spiral
    stroke(255,80);
    beginShape();
    for (int y=0; y<numyears; y++){   //step through each year
        for (int m=0; m<12; m++){    //loop through each month
          float theta = (TWO_PI/12.0)*m - HALF_PI;
          float diff = circleScale + (pax[y][m]/10000);    
          vertex(cos(theta)*diff,sin(theta)*diff);
        }
    }
    endShape();
    
    //draw the months for the selected year
    strokeWeight(1);
    stroke(255,255);    
    beginShape();
    for (int m=0; m<12; m++){    //loop through each month
      float theta = (TWO_PI/12.0)*m - HALF_PI;
      float diff = circleScale + pax[selYear][m]/10000;     
      vertex(cos(theta)*diff,sin(theta)*diff);
    }
    if (selYear < numyears-1) {
    float diff1 = circleScale + pax[selYear+1][0]/10000;   
    vertex(cos(-HALF_PI)*diff1,sin(-HALF_PI)*diff1);
    }
    endShape();
    
    //draw the averages for each month as red filled circles
    fill(255,0,0);
    noStroke();
    drawMonthPoints(mth_averages);
    noFill();
}  //end the draw function



//function to work out where to put the month averages
void drawMonthPoints(float[] _mths){  //the draw function requires 1 parameter
  for (int m=0; m<12; m++){    //loop through each month
    float theta = (TWO_PI/12.0)*m - HALF_PI;
    float diff = circleScale + _mths[m]/10000;    
    ellipse(cos(theta)*diff, sin(theta)*diff, 5, 5);
  }
}

//function to place the month names on the radial chart 
void monthLabels(){
  textFont(font,12);
  for (int m=0; m<12; m++){
    //calculate 12 evenly spaced points on the circumference of the circle
    float theta = (TWO_PI/12.0)*m - HALF_PI;
    text(monthnames[m],cos(theta)*200,sin(theta)*200);
  }   
}
 
//function to create the line chart at the bottom 
void drawYears(float _lineGraphY){
  stroke(255);
  noFill();
  //for each row (year) in the file
  strokeWeight(2);
  beginShape();
  for (int y=0; y<numyears; y++){
    //x point is evenly spaced across the 700px width allowed
    //y point is 560 - difference from average divided by yearscale
    vertex(marginX+(y*((width-2*marginX)/(numyears-1))),
           _lineGraphY-((year_totals[y])/yearscale));
  }
  endShape();
  strokeWeight(1);
  stroke(255,0,0);
  float tsaBase = _lineGraphY-(year_average)/yearscale;
  line(marginX,tsaBase,width-marginX,tsaBase);
}
 
//Function to load the data 
void parseData(){
  println(data_in.length);
  //do this for each row in the file (no headers)
  for (int i=0; i<data_in.length; i++){
    String[] row = split(data_in[i],',');
    // get the first year from the data file and store it
    if (i == 0) firstYear = int(row[0]);
    //??offsetting rows?? ask Mitchell
    float[] flrow = float(row);
    float[] trimrow = subset(flrow,1);
    pax[i] = trimrow;
    //
    for (int j=0; j<12; j++){
      mth_averages[j] += pax[i][j];  //j is the month and i is the year
    }

    year_totals[i] = totArray(pax[i]);    
    //   println(year_totals);
  }
  for (int j=0; j<12; j++){
    mth_averages[j]  = mth_averages[j]/(data_in.length);  // 19;//();
    //println(averages[j]);  //averages look okay
  }
  oall_ave = aveArray(mth_averages); 
  year_average = oall_ave*12;  
}

 
//allow left and right arrow keys to choose year 
void keyPressed(){
  if (keyCode == RIGHT){
    if (selYear == numyears-1) selYear = 0;
    else if (selYear < numyears-1) selYear = selYear+1;  //when moving right don't go further than num years
  }
  else if (keyCode == LEFT){                //when moving left don't go further than 0
    if (selYear == 0) selYear = numyears-1;
    else if (selYear > 0) selYear = selYear -1;
  }
}
 
//an array to assist in calculating averages
float aveArray(float[] A){
  float ave = 0;
  for (int i=0; i<A.length; i++){
    ave += A[i];
  }
  ave = ave/A.length;
  return ave;
}

//an array to assist in calculating totals
int totArray(float[] T){
  int tot = 0;
  for (int i=0; i<T.length; i++){
    tot += T[i];
  }
  return tot;
}

