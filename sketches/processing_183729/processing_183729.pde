
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// Project #1
// 4/28/14

//********************************************************
// Declare classes
Graph myGraph;
int [][][] myDataSet; // [year][reason for removal from waiting list][organ]

// Define color palette
color colBack;
color colLines;
color colText;
color colTimeline;
color colOnGraph;

// Define global variables
int numYears; // number of years charted
int numReasons; // waiting list removal reasons
int numOrgans; // number of organ categories
boolean timelineDrag; // whether timeline is being dragged
boolean hoverReasons; // show reasons for removal overlay
PFont myFont;
PFont myFontB;
PFont myFontBB;

//********************************************************
void setup(){
  size(800,800);
  
  // Define color palette
  colBack = color(255);
  colLines = color(255);
  colText = color(0);
  colTimeline = color(150);
  colOnGraph = color(255);
  
  // Initialize global variables
  numYears = 10;
  numReasons = 10;
  numOrgans = 5;
  timelineDrag = false;
  hoverReasons = false;
  
  // Define instances of classes
  myGraph = new Graph(numOrgans);
  myDataSet = new int[numYears][numReasons][numOrgans];
  
  // Import data
  String [ ] dataLines = loadStrings("OrganTransplantData.csv"); // each line of data
  String [ ] tempDataStrings = new String[numOrgans+2]; // each item of data per row, as a string (reason, year, 8 organs)
  int tempYearIndex;
  int tempReasonIndex;
  
  // Split each line into strings of data 
  for(int i=0; i<dataLines.length; i++){
    tempDataStrings = split(dataLines[i], ',');
    tempYearIndex = yearToIndex(int(tempDataStrings[1]));
    tempReasonIndex = reasonLineToIndex(i);
    
    // parse each line of data into the appropriate year, reason, and organ
    for(int j=2; j<tempDataStrings.length; j++){
      myDataSet[tempYearIndex][tempReasonIndex][j-2] = int(tempDataStrings[j]);
    }
  }

  // format text
  myFont = createFont("Archer-Book",12);
  myFontB = createFont("Archer-Semibold",12);
  myFontBB = createFont("Archer-Bold",12);
  textFont(myFont);
}
  
//********************************************************
void draw(){
  // Declare local variables
  int yearIndex = getYearIndexSlider();
  
  // Draw background
  noStroke();
  fill(colBack);
  rect(0,0,width,height);
  
  // Graph data
  for(int i=0; i<numOrgans; i++){
    myGraph.myPieChart[i].DrawPieBackground(yearIndex);
  }
  myGraph.DrawRadialLines();
  graphData(yearIndex);
  
  // Draw graph grid lines
  myGraph.DrawRings();
  
  // Add organ labels
  myGraph.DrawLabels(yearIndex);
  
  // Show reasons for removal overlay on hover
  if(hoverReasons){
    myGraph.showReasonsOverlay();
  }
  
  // Center of graph
  myGraph.DrawCenter(yearIndex);
  // !!!! WORKS but formatting messed up
  
  // Add timeline
  myGraph.Timeline();
  
  
}

//********************************************************
void graphData(int yearIndex){
  // declare local variables
  int totalRemovalsThisYear = 0;
  float tempAngle = 0;
  
  // for each pie slice, calculate all removals in the indicated year
  for(int i=0; i<numOrgans; i++){
    myGraph.myPieChart[i].calculateRemovals(yearIndex);
    totalRemovalsThisYear += myGraph.myPieChart[i].totalYearOrgRemovals;
  }
  
  // for each pie slice, indicate the starting angle and angle width
  for(int i=0; i<numOrgans; i++){
    myGraph.myPieChart[i].calculateAngles(tempAngle, totalRemovalsThisYear);
    tempAngle += myGraph.myPieChart[i].angleWidth;
  }

  // Draw pie chart
  myGraph.DrawSlices(yearIndex);
}

//********************************************************
int getYearIndexSlider(){
  // find out what year the timeline knob is on
  
  // declare local variables
  int yearIndex;
  int yearSpacing;
  float timeline;
  
  yearSpacing = 360/numYears;
  timeline = myGraph.timelineAngle;
  
  // calculate year
  if(timeline>=0){
    // bottom half
    if(timeline<yearSpacing){
      yearIndex = yearToIndex(2006);
    }else if(timeline<(yearSpacing*2)){
      yearIndex = yearToIndex(2007);
    }else if(timeline<(yearSpacing*3)){
      yearIndex = yearToIndex(2008);
    }else if(timeline<(yearSpacing*4)){
      yearIndex = yearToIndex(2009);
    }else{
      yearIndex = yearToIndex(2010);
    }
  }else{
    // top half
    if(timeline>-yearSpacing){
      yearIndex = yearToIndex(2005);
    }else if(timeline>-(2*yearSpacing)){
      yearIndex = yearToIndex(2014);
    }else if(timeline>-(3*yearSpacing)){
      yearIndex = yearToIndex(2013);
    }else if(timeline>-(4*yearSpacing)){
      yearIndex = yearToIndex(2012);
    }else{
      yearIndex = yearToIndex(2011);
    }
  }
  
  return yearIndex;
}

//********************************************************
int yearToIndex(int yearAsNum){
  // declare local variables
  int yearAsIndex; // index number in array of a particular year
  
  // convert a year to the index number
  yearAsIndex = 10-(yearAsNum-2004);
  return yearAsIndex;
}
//********************************************************
int reasonLineToIndex(int excelLineNum){
  // declare local variables
  int reasonIndex; // index number in array of a particular year
  
  // convert the line number in the excel spreadsheet to a reason index number
  reasonIndex = floor(excelLineNum/numYears);
  
  return reasonIndex;
}

//********************************************************
String indexToReason(int reasonIndex){
  // convert reason index number to string
  String reason = "";
  
  switch(reasonIndex){
    case 0:
      reason = "Deceased Donor Transplant";
      break;
    case 1:
      reason = "Living Donor Tranplant";
      break;
    case 2:
      reason = "Transplanted Abroad";
      break;
    case 3:
      reason = "Died During Transplant";
      break;
    case 4:
      reason = "Too Sick For Tranplant";
      break;
    case 5:
      reason = "Patient Died Waiting";
      break;
    case 6:
      reason = "Condition Improved";
      break;
    case 7:
      reason = "Unable to Contact Patient";
      break;
    case 8:
      reason = "Patient Refused Transplant";
      break;
    case 9:
      reason = "Other";
      break;
  }
  
  return(reason);
    
}
//********************************************************
void mousePressed(){

  // check for mouse click on timeline pointer target area
  if(dist(mouseX,mouseY,myGraph.timelineX,myGraph.timelineY) <= myGraph.timelineTarget/2){
   timelineDrag = true;
  }
}

//********************************************************
void mouseDragged(){
  
  // check whether timeline is being dragged
  if(timelineDrag){
    // drag timeline
    myGraph.DragTimeline();
  }
}
//********************************************************
void mouseReleased(){
  
  // release timeline
  timelineDrag = false;
}
//********************************************************
void mouseMoved(){
  // declare local variables
  float centerDist;
  
  // check for hovering
  
  // hover reasons
  centerDist = dist(mouseX,mouseY,width/2,height/2);
  if(centerDist<myGraph.outerDiameter/2 && centerDist>myGraph.innerDiameter/2){
    // show hover reasons
    hoverReasons = true;
  }else{
    hoverReasons = false;
  }
}
//********************************************************
public class Graph {
  // Declare variables
  public float x;
  public float y;
  public float outerDiameter;
  public float innerDiameter;
  public float timelineDiam;
  public float timelineAngle;
  public float timeline0;
  public float timelineX;
  public float timelineY;
  public float timelineTarget;
  public float ringWidth;
  public PieSlice [ ] myPieChart;
  
  // CONSTRUCTOR
  //********************************************************
  public Graph(int numSlices){
    x = width/2;
    y = height/2;
    outerDiameter = height-150;
    innerDiameter = 300;
    ringWidth = (outerDiameter - innerDiameter) / (numReasons);
    timelineDiam = outerDiameter + (2*ringWidth);
    timeline0 = -90;
    timelineAngle = timeline0;
    timelineX = width/2+(timelineDiam/2*cos(radians(-timelineAngle)));
    timelineY = height/2-(timelineDiam/2*sin(radians(-timelineAngle)));
    timelineTarget = 60;
    myPieChart = new PieSlice[numSlices];
    
    // Initialize myPieChart
    myPieChart[0] = new PieSlice("KIDNEY",0,color(201,32,39));
    myPieChart[1] = new PieSlice("LIVER",1,color(227,120,24));
    myPieChart[2] = new PieSlice("PANCREAS",2,color(227,190,50));
    myPieChart[3] = new PieSlice("HEART",3,color(4,130,115));
    myPieChart[4] = new PieSlice("LUNG",4,color(94,93,125));
  }
  
  // METHODS
  //********************************************************
  public void DrawRings(){
    // draw concentric rings
    noFill();
    stroke(colLines);
    for(int i=0; i<numReasons+2; i++){
      ellipse(x,y,innerDiameter+(ringWidth*i),innerDiameter+(ringWidth*i));
    }
  }
  //********************************************************
  public void DrawRadialLines(){
    // drawRadiaLines
    stroke(colLines);
    for(int i=0; i<100; i++){
      pushMatrix();
        translate(myGraph.x,myGraph.y);
        rotate(((float)i/100*2*PI)+timelineAngle);
        line(0,0,myGraph.outerDiameter,0);
      popMatrix();
    }
  }
  //********************************************************
  public void DrawSlices(int yearIndex){
    // draw all pie slices
    for(int i=0; i<myPieChart.length; i++){
      myPieChart[i].DrawBarGraph(yearIndex);
    }
    
    // fill center
    fill(colBack);
    stroke(colLines);
    ellipse(x,y,innerDiameter,innerDiameter);
  }
  //********************************************************
  public void DrawLabels(int yearIndex){
    // declare local variables
    float tempAngle;
    
    // format text
    textSize(12);
    textAlign(CENTER);
    fill(colText);
    
    for(int i=0; i<numOrgans; i++){      
      // find angle from center
      tempAngle = myPieChart[i].angleStart+(myPieChart[i].angleWidth/2);
    
      // add outer organ label text
      pushMatrix();
        translate(x,y);
        rotate(radians(tempAngle));
        translate(outerDiameter/2+3,0);
        rotate(radians(90));
        text(myPieChart[i].orgTitle,0,0);
      popMatrix();
    }
  }
  //********************************************************
  public void DrawCenter(int yearIndex){

    // format text
    textAlign(CENTER,CENTER);
    fill(colText);
    rectMode(CENTER);
    
    // declare local variables
    String title = "Organ Transplant Waiting List";
    
    float titleSpacing = (innerDiameter/2)+10;
    float grandTotPatients = 0;
    
    int myYear = (2004+(10-yearIndex));
    
    // figure out total number of patients
    for(int i=0; i<numOrgans; i++){
      grandTotPatients += myPieChart[i].totalYearOrgRemovals;
    }
    String subTitle = "Reasons "+int(grandTotPatients)+" Patients were Removed";
    
    // title
    textSize(24);
    text("Organ Transplant", width/2,height/2-36-18);
    text("Waiting List",width/2,height/2-36+18);
    //text(title,width/2,height/2-36,titleSpacing*1.5,titleSpacing);
    textSize(16);
    text("Reasons Patients were Removed",width/2,height/2+58);
    //textSize(12);
    //text("("+int(grandTotPatients)+" Patients)", width/2,height/2+103);
    textFont(myFontB);
    textSize(48);
    text(myYear,width/2,height/2+14);
    rectMode(CORNER);
    textFont(myFont);
    
    stroke(0);
    line(x-100,y-34,x+100,y-34);
}
  //********************************************************
  public void Timeline(){
    // declare local variables
    float angleSpacing;
    float angle0;
    float rotAngle;
    float yearNum;
    
    // drawa outer ring
    stroke(colTimeline,50);
    noFill();
    ellipse(width/2,height/2,timelineDiam,timelineDiam);
    
    // format text
    fill(colTimeline);
    textSize(14);
    
    // draw timeline years
    angleSpacing = 360/numYears;
    angle0 = angleSpacing;
    
    for(int i=0; i<numYears; i++){
      yearNum = 2004+(10-i);
      rotAngle = angle0-(i*angleSpacing);
      
      pushMatrix();
        translate(width/2,height/2);
        rotate(radians(rotAngle));
        translate(0,-timelineDiam/2-20);
        text(int(yearNum),0,0);
      popMatrix();
    }
    
    // timeline pointer    
    pushMatrix();
      translate(width/2,height/2);
      rotate(radians(timelineAngle));
      // fill
      noStroke();
      fill(colBack);
      beginShape();
        vertex(timelineDiam/2+1,-11);
        vertex(timelineDiam/2+11,0);
        vertex(timelineDiam/2+1,11);
        vertex(timelineDiam/2-11,0);
      endShape();
      // outline
      stroke(colTimeline,50);
      beginShape();
        vertex(timelineDiam/2,-10);
        vertex(timelineDiam/2+10,0);
        vertex(timelineDiam/2,10);
      endShape();
    popMatrix();

  }
  //********************************************************
  public void DragTimeline(){
    // drag the timeline
    
    // declare local variables
    float newAngleTrig; //radians
    
    // calculate new timeline angle
    newAngleTrig = atan2(mouseY-(height/2),mouseX-(width/2));
    timelineAngle = degrees(newAngleTrig);
    timelineX = width/2+(timelineDiam/2*cos(radians(-timelineAngle)));
    timelineY = height/2-(timelineDiam/2*sin(radians(-timelineAngle)));
  }
  //********************************************************
  public void showReasonsOverlay(){
    // declare local variables
    float overlayWidth = radians(10); //radians on either side
    float mouseAngle;
    
    // find rounded mouse angle (nearest radial line)
    mouseAngle = atan2(mouseY-(height/2),mouseX-(width/2))-overlayWidth*1.75;
    
    // show white overlay
    noStroke();
    fill(255,255,255,150);
    arc(x,y,outerDiameter,outerDiameter,mouseAngle-overlayWidth*2,mouseAngle+overlayWidth*2);
    
    // show reasons
    textAlign(CENTER,CENTER);
    fill(0);

    for(int i=0; i<numReasons; i++){
      float centerDist = dist(mouseX,mouseY,width/2,height/2);
      
      if(centerDist<(myGraph.outerDiameter/2-((i)*ringWidth/2)) && centerDist>(myGraph.outerDiameter/2-((i+1)*ringWidth/2))){
        textFont(myFontB);
        textSize(14);
      }else{
        textFont(myFont);
        textSize(10);
      }
      
      pushMatrix();
        translate(width/2,height/2);
        rotate(mouseAngle+PI/2);  
        translate(0,(-outerDiameter/2+((i+.5)*ringWidth/2)));
        if(mouseAngle>0){
          rotate(PI);
        }
        text(indexToReason(i),0,0);
      popMatrix();
    }
    
    textFont(myFont);
    
  }
  //********************************************************
}
class PieSlice {
  // Declare Variables
  public String orgTitle;
  public int orgIndex;
  public float angleZero;
  public float angleStart;
  public float angleWidth;
  public int totalYearOrgRemovals;
  public color colBackSlice;
  
  // CONSTRUCTOR
  //********************************************************
  public PieSlice(String tempTitle, int tempIndex, color tempCol){
    orgTitle = tempTitle;
    orgIndex = tempIndex;
    angleZero = 0;
    angleStart = -90;
    angleWidth = 0;
    totalYearOrgRemovals = 0;
    colBackSlice = tempCol;
  }
  
  // METHODS
  //********************************************************
  public void calculateRemovals(int yearIndex){
    totalYearOrgRemovals = 0;
    
    // calculate all removals for this organ in the specified year
    for(int i=0; i<numReasons; i++){
      totalYearOrgRemovals += myDataSet[yearIndex][i][orgIndex];
    }
  }
  
  //********************************************************
  public void calculateAngles(float tempAngle, int totRemovals){
    angleStart = tempAngle+myGraph.timelineAngle-myGraph.timeline0;
    angleWidth = (float)totalYearOrgRemovals/totRemovals*360;
  }
  
  //********************************************************
  public void DrawPieBackground(int yearIndex){
    // local variables
    float aStart = radians(angleZero+angleStart);
    float aEnd = aStart+radians(angleWidth);
    float centerDist = dist(mouseX,mouseY,width/2,height/2);
    float ringWidth = myGraph.ringWidth;
    
    // fill background of slice
    noStroke();
    fill(colBackSlice,50);
    arc(myGraph.x,myGraph.y,myGraph.outerDiameter,myGraph.outerDiameter,aStart,aEnd);
    
    // figure out whether to highlight a ring
    for(int i=0; i<numReasons; i++){
      if(centerDist<(myGraph.outerDiameter/2-((i)*ringWidth/2)) && centerDist>(myGraph.outerDiameter/2-((i+1)*ringWidth/2))){
        fill(colBackSlice,50);
        arc(myGraph.x,myGraph.y,myGraph.outerDiameter-(i*ringWidth),myGraph.outerDiameter-(i*ringWidth),aStart,aEnd);
        fill(colBack);
        arc(myGraph.x,myGraph.y,myGraph.outerDiameter-((i+1)*ringWidth),myGraph.outerDiameter-((i+1)*ringWidth),aStart,aEnd);
        fill(colBackSlice,50);
        arc(myGraph.x,myGraph.y,myGraph.outerDiameter-((i+1)*ringWidth),myGraph.outerDiameter-((i+1)*ringWidth),aStart,aEnd);
      }
    }
  }
  //********************************************************
  public void DrawBarGraph(int yearIndex){
    // local variables
    float aStart = radians(angleZero+angleStart);
    float aEnd = aStart+radians(angleWidth);
    float bWidth;
    float bStart;
    float largestBarValue;
    float largestBarRatio;
    float largestBarNewValue;
    float scalingFactor;
    float lineAngle;
    
    // figure out largest bar and scaling factor
    largestBarValue = 0;
    largestBarRatio = .8;
    for(int i=0; i<numReasons; i++){
      if(myDataSet[yearIndex][i][orgIndex] > largestBarValue){
        largestBarValue = myDataSet[yearIndex][i][orgIndex];
      }
    }
    largestBarNewValue = largestBarRatio*totalYearOrgRemovals;
    //scalingFactor = largestBarNewValue/largestBarValue;
    scalingFactor = 1.75;
    
    // iterate row by row (outer to inner) and draw bars
    for(int i=0; i<numReasons; i++){
     
      // draw bar graph ring
      bWidth = (float)(myDataSet[yearIndex][i][orgIndex])/totalYearOrgRemovals*(aEnd-aStart)*scalingFactor; // in radians
      bStart = aEnd-bWidth; // in radians
      for(int j=1; j<myGraph.ringWidth; j++){
        stroke(colBackSlice,150);
        noFill();
        arc(myGraph.x,myGraph.y,myGraph.outerDiameter-(i*myGraph.ringWidth)-j-1,myGraph.outerDiameter-(i*myGraph.ringWidth)-j-1,bStart,aEnd);
      }
    }
  }
}


