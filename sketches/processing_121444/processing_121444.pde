
//BCI Sketch
//Brian Abbott

//ITEC3450
//Due: 20 November 2013

String neurosky[];

String[] neuName = {"[poorSignalLevel]", 
                    "[rawEeg]", 
                    "[poorSignalLevel, eegPower, eSense]"};

radialGraph rawEegGraph; 
radialGraph attentionGraph;
radialGraph meditationGraph;
radialGraph deltaGraph;
radialGraph thetaGraph;
radialGraph lowAlphaGraph;
radialGraph highAlphaGraph;
radialGraph lowBetaGraph;
radialGraph highBetaGraph;
radialGraph lowGammaGraph;
radialGraph highGammaGraph;

lineGraph rawEegLGraph; 
lineGraph attentionLGraph;
lineGraph meditationLGraph;
lineGraph deltaLGraph;
lineGraph thetaLGraph;
lineGraph lowAlphaLGraph;
lineGraph highAlphaLGraph;
lineGraph lowBetaLGraph;
lineGraph highBetaLGraph;
lineGraph lowGammaLGraph;
lineGraph highGammaLGraph;

SignalStrength signalS;

int counterI = 0;
int spGr = (1000/7);
int hiGr = (450);

void setup() {
  size(1000, 700);
  frameRate(512);
  background(255);
  neurosky = loadStrings("data/neurosky.json");
  rawEegGraph = new radialGraph(spGr*1, hiGr, 0, #A33434, "rawEeg"); 
  attentionGraph = new radialGraph(spGr*2, hiGr, 0, #4EBEE3, "attention"); 
  meditationGraph = new radialGraph(spGr*3, hiGr, 0, #71C969, "meditation"); 
  deltaGraph = new radialGraph(spGr*4, hiGr, 0, #DCF032, "delta"); 
  thetaGraph = new radialGraph(spGr*5, hiGr, 0, #F032C0, "theta"); 
  lowAlphaGraph = new radialGraph(spGr*6, hiGr+150, 0, #91C4CF, "lowAlpha"); 
  highAlphaGraph = new radialGraph(spGr*1, hiGr+150, 0, #BFE67C, "highAlpha"); 
  lowBetaGraph = new radialGraph(spGr*2, hiGr+150, 0, #F09826, "lowBeta"); 
  highBetaGraph = new radialGraph(spGr*3, hiGr+150, 0, #459663, "highBeta"); 
  lowGammaGraph = new radialGraph(spGr*4, hiGr+150, 0, #E8A0C5, "lowGamma"); 
  highGammaGraph = new radialGraph(spGr*5, hiGr+150, 0, #BAADAD, "highGamma"); 
  
  rawEegLGraph = new lineGraph(#A33434, neurosky.length); 
  attentionLGraph = new lineGraph(#4EBEE3, neurosky.length); 
  meditationLGraph = new lineGraph(#71C969, neurosky.length); 
  deltaLGraph = new lineGraph(#DCF032, neurosky.length); 
  thetaLGraph = new lineGraph(#F032C0, neurosky.length); 
  lowAlphaLGraph = new lineGraph(#91C4CF, neurosky.length); 
  highAlphaLGraph = new lineGraph(#BFE67C, neurosky.length); 
  lowBetaLGraph = new lineGraph(#F09826, neurosky.length); 
  highBetaLGraph = new lineGraph(#459663, neurosky.length); 
  lowGammaLGraph = new lineGraph(#E8A0C5, neurosky.length); 
  highGammaLGraph = new lineGraph(#BAADAD, neurosky.length); 
  
  signalS = new SignalStrength();
}

void parseJSON(String in) {
  JSONObject neuroskyJSON = JSONObject.parse(in); 
  String neuString = neuroskyJSON.keys().toString();
  int neuNumber;
  if (neuString.equals(neuName[0])) {
    int signalStr = neuroskyJSON.getInt("poorSignalLevel");
    signalS.update(signalStr);
  }
  else if(neuString.equals(neuName[1])) {
    neuNumber = neuroskyJSON.getInt("rawEeg");
    rawEegGraph.update(neuNumber); 
    rawEegLGraph.update(neuNumber);
  } 
  else if(neuString.equals(neuName[2])) {
    JSONObject eSenseJSON = neuroskyJSON.getJSONObject("eSense");
    JSONObject eegPowerJSON = neuroskyJSON.getJSONObject("eegPower");
    
    int signalStr = neuroskyJSON.getInt("poorSignalLevel");
    signalS.update(signalStr);
    
    int attNum = eSenseJSON.getInt("attention");
    attentionGraph.update(attNum);
    attentionLGraph.update(attNum);
    
    int medNum = eSenseJSON.getInt("meditation");
    meditationGraph.update(medNum);
    meditationLGraph.update(medNum);

    int deltaNum = eegPowerJSON.getInt("delta");
    deltaGraph.update(deltaNum);
    deltaLGraph.update(deltaNum);
    
    int thetaNum = eegPowerJSON.getInt("theta");
    thetaGraph.update(thetaNum);
    thetaLGraph.update(thetaNum);

    int lowAlphaNum = eegPowerJSON.getInt("lowAlpha");
    lowAlphaGraph.update(lowAlphaNum);
    lowAlphaLGraph.update(lowAlphaNum);

    int highAlphaNum = eegPowerJSON.getInt("highAlpha");
    highAlphaGraph.update(highAlphaNum);
    highAlphaLGraph.update(highAlphaNum);

    int lowBetaNum = eegPowerJSON.getInt("lowBeta");
    lowBetaGraph.update(lowBetaNum);
    lowBetaLGraph.update(lowBetaNum);

    int highBetaNum = eegPowerJSON.getInt("highBeta");
    highBetaGraph.update(highBetaNum);
    highBetaLGraph.update(highBetaNum);
    
    int lowGammaNum = eegPowerJSON.getInt("lowGamma");
    lowGammaGraph.update(lowGammaNum);
    lowGammaLGraph.update(lowGammaNum);

    int highGammaNum = eegPowerJSON.getInt("highGamma");
    highGammaGraph.update(highGammaNum);
    highGammaLGraph.update(highGammaNum);

  } 
}

void draw() {
  if (counterI < neurosky.length) {
    parseJSON(neurosky[counterI]);
    rawEegGraph.drawGraph();
    attentionGraph.drawGraph();
    meditationGraph.drawGraph();
    deltaGraph.drawGraph();
    thetaGraph.drawGraph();
    lowAlphaGraph.drawGraph();
    highAlphaGraph.drawGraph();
    lowBetaGraph.drawGraph();
    highBetaGraph.drawGraph();
    lowGammaGraph.drawGraph();
    highGammaGraph.drawGraph();
    
    rawEegGraph.isOver(mouseX, mouseY);
    attentionGraph.isOver(mouseX, mouseY);
    meditationGraph.isOver(mouseX, mouseY);
    deltaGraph.isOver(mouseX, mouseY);
    thetaGraph.isOver(mouseX, mouseY);
    lowAlphaGraph.isOver(mouseX, mouseY);
    highAlphaGraph.isOver(mouseX, mouseY);
    lowBetaGraph.isOver(mouseX, mouseY);
    highBetaGraph.isOver(mouseX, mouseY);
    lowGammaGraph.isOver(mouseX, mouseY);
    highGammaGraph.isOver(mouseX, mouseY);
    
    rawEegLGraph.drawGraph();
    attentionLGraph.drawGraph();
    meditationLGraph.drawGraph();
    deltaLGraph.drawGraph();
    thetaLGraph.drawGraph();
    lowAlphaLGraph.drawGraph();
    highAlphaLGraph.drawGraph();
    lowBetaLGraph.drawGraph();
    highBetaLGraph.drawGraph();
    lowGammaLGraph.drawGraph();
    highGammaLGraph.drawGraph();
    
    signalS.drawSignal();

    counterI++;
  }
  else {
    counterI = 0;
  }
}
class lineGraph {
  
  int theValue = 0;
  int prevValue = 0;
  color lineColor;
  int theLength;
  
  int theI = 0;
  int prevI = 0;
  
  int maxValue = 0;
  int minValue = 0;
    
  lineGraph(color col, int neuLength) {
    //constructor for line graph, grabs the color and total length of the document
    //println(neuLength);
    lineColor = col;
    theLength = neuLength;
  }
  
  void update(int value) {
    //updates value, checks to see if new max or min value is created
    prevValue = theValue;
    theValue = value;
    if (value > maxValue) {
      maxValue = value;
    }
    else if (value < minValue) {
      minValue = value;
    }
    else {
      value = value;
    }
  }
    
  void drawGraph() {
    //sets the previous and new I counter to draw line
    prevI = theI;
    theI = theI + 1;

    //println("maxValue :" + maxValue);
    //println("minValue: " + minValue);
    
    //maps values so that it fits within the height of graph
    float newPrevValue = map(prevValue, minValue, maxValue, 380, 0);
    float newValue = map(theValue, minValue, maxValue, 380, 0);    
    //println("previous: " + newPrevValue);
    //println("new: " + newValue);
    
    //maps I so that it fits within width of the window
    float newI = map(theI, 0, theLength, 0, 1000);
    float newPrevI = map(prevI, 0, theLength, 0, 1000);
    //println("the I: " +  newI);
    //println("previous I: " +  newPrevI);
    
    //draws each line   
    pushStyle();
    stroke(lineColor);
    strokeWeight(1);
    line(newPrevI, newPrevValue, newI, newValue);
    popStyle();
  }
}
class radialGraph {
  
  int xLocation;
  int yLocation;
  float graphValue = 0;
  float maxValue;
  float minValue;
  color graphColor;
  float range = abs(maxValue - minValue);
  String graphName = "";
  boolean isMouseOver = false;
  boolean isMedOrAtt = false;
  
  float graphStop;
  float mapValue;
  
  int diameter = 100;
  
  boolean hasValues = false;

  radialGraph(int xLoc, int yLoc, float graVal, color gColor, String name) {
    xLocation = xLoc;
    yLocation = yLoc;
    graphValue = graVal;
    graphColor = gColor;
    graphName = name;
    if (name.equals("attention") || name.equals("meditation")) {
      isMedOrAtt = true;
    }
  }
  
  void update(float graVal) {
    
    graphValue = graVal;
    
    if (maxValue < graphValue) {
      maxValue = graphValue;
    }
    else if (minValue > graphValue) {
      minValue = graphValue;
      mapValue = map(graphValue, minValue, maxValue, 0, 1); 
    }
    else {
      graphValue = graphValue;
      mapValue = map(graphValue, minValue, maxValue, 0, 1); 
    }
  }
  
  void drawGraph() {
    fill(255);
    ellipse(xLocation, yLocation, diameter, diameter);
    graphStop = mapValue;
    stroke(#CCCCCC);
    noFill();
    ellipse(xLocation, yLocation, diameter, diameter);
    noStroke();
    fill(graphColor);
    arc(xLocation, yLocation, diameter, diameter, 0, radians(360*graphStop));
    fill(255);
    stroke(#CCCCCC);
    ellipse(xLocation, yLocation, diameter/2, diameter/2);
    fill(0);
    textAlign(CENTER);
    text(graphName, xLocation, yLocation);
    showMaxMin(isMouseOver);
    if (isMedOrAtt == true) {
      pushStyle();
      pushMatrix();
      
      float sixtyValue = 0;
      if (maxValue - minValue != 0) {
        sixtyValue = (60 / Math.abs(maxValue - minValue));
      }
      println(sixtyValue);
      stroke(#CCCCCC);
      strokeWeight(3);
      translate(xLocation, yLocation);
      rotate(radians(360*sixtyValue));
      line(0, 0, 50,  0);
      
      popMatrix();
      popStyle();
    }
  }
  
  void isOver(float xValue, float yValue) {
    if (xValue > xLocation - 50 && 
        xValue < xLocation + 50 && 
        yValue > yLocation - 50 && 
        yValue < yLocation + 50) {
      isMouseOver = true;
    }
    else {
      isMouseOver = false;
    }
  }
  
  void showMaxMin(boolean hover) {
      if (isMouseOver) {
        pushStyle();
        rectMode(CENTER);
        fill(255);
        rect(xLocation, yLocation + 75, 100, 40); 
        fill(0);
        text("MAX: " + Math.round(maxValue), xLocation, yLocation+73);
        text("MIN: " + Math.round(minValue), xLocation, yLocation+90);
        popStyle();
      }
      else {
        pushStyle();
        rectMode(CENTER);
        fill(255);
        noStroke();
        rect(xLocation, yLocation + 75, 110, 45); 
        popStyle();
      }
  }
}
class SignalStrength {
  
  int value = 200;
  
  SignalStrength() {
  }
  
  void update(int newValue) {
    value = newValue;
  }
  
  void drawSignal() {
    if (value == 200) {
      pushStyle();
      fill(#FF0000);
      ellipse((1000/7)*6, 450, 100, 100);
      fill(0);
      textAlign(CENTER);
      text("Bad Signal \nStrength", (1000/7)*6, 450);
      popStyle();
    }
    else if (value < 200 && value > 100) {
      pushStyle();
      fill(#E7A64A);
      ellipse((1000/7)*6, 450, 100, 100);
      fill(0);
      textAlign(CENTER);
      text("Medium Siglan \nStrength", (1000/7)*6, 450);
      popStyle();
    }
    else {
      pushStyle();
      fill(#4FE74A);
      ellipse((1000/7)*6, 450, 100, 100);
      fill(0);
      textAlign(CENTER);
      text("Good Signal \nStrength", (1000/7)*6, 450);
      popStyle();
    }
  }
}


