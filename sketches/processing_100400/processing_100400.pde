
/*
  ==========================================================================
    BEFORE YOU START
  --------------------------------------------------------------------------
  1.Download and install "controlP5" library from here: 
    http://www.sojamo.de/libraries/controlP5/#installation
  --------------------------------------------------------------------------
  2.Download and install JSON Library from here:
    http://www.blprnt.com/processing/json.zip
  ==========================================================================
    GLOBAL VARIABLES AVAILABLE TO YOU
  --------------------------------------------------------------------------
    META:
    count: total# of earthquakes of your query
    numberOfElements: total# of detailed reports provided (#of JSON objects)
  --------------------------------------------------------------------------
    EACH EARTHQUAKE:
    src[], eqid[], timedate[], region[], lat[], lon[], magnitude[], depth[]
    Sketch by Hakan Uzumcu, Mason Gross School of the Arts. 
    Thanks to Ahmet Atif AKin of Pagan Studio. 
    2012.
  ==========================================================================
*/

import controlP5.*;
import org.json.*;

ControlP5 controlP5;
DropdownList p1, p2, p3, p4;

String baseURL = "http://www.seismi.org/api";
String[] src, eqid, timedate, region;
float[] lat, lon, magnitude, depth;
int numberOfElements, count;
String inputY = "";
String inputM = ""; 
String inputMM = ""; 
String inputL = "";
String summary = "SEISMI earthquake data: http://www.seismi.org/";
int cnt = 0;
PFont f;


void setup() {
  
  //application window size
  size(820,600);
  
  //font setting
  f = loadFont("AndaleMono-11.vlw");
  colorMode(HSB);

  //setup UI Controls
  controlP5 = new ControlP5(this);
  p1 = controlP5.addDropdownList("list-p1",20,36,60,80);
  customize(p1);
  p2 = controlP5.addDropdownList("list-p2",90,36,60,80);
  customize(p2);
  p3 = controlP5.addDropdownList("list-p3",160,36,100,120);
  customize(p3);
  p4 = controlP5.addDropdownList("list-p4",270,36,100,120);
  customize(p4);
  controlP5.addButton("show",0,380,20,80,16);
}


void draw() {
  
  
  PImage b;
// Images must be in the "data" directory to load correctly
b = loadImage("japan2.jpg");
image(b, 0, 0);
  
  //set background color
  //background(255);
  
  //draw a horizontal line in the middle
  stroke(192);

  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  noStroke();
  
  //draw summary text at the bottom of the screen
  fill(0);  
  textFont(f,10);
  noSmooth();
  text(summary,20,(height-20));
  smooth();
  
  //draw data, if there's any returned earthquakes
  if (numberOfElements != 0) {
    float distance = (width - 20)/numberOfElements; // new variable to calculate distance from a bar to next
  
    for (int i = 0; i < numberOfElements; i++) {
      //println(depth[i]);
      println(magnitude[i]);
      //draw magnitude bar
      fill(255,0,0);
      float mappedMag = map(magnitude[i], 4, 8, 0, height/6); 
      //rect ( 10+i*distance, height/2-mappedMag, 1, mappedMag);  
      
      //draw depth bar
      fill(125);
      float mappedDepth = map(depth[i], 0, 300, 0, height/2); 
     // rect ( 10+i*distance, height/2, 1, mappedDepth);  
      
      //draw DAMAGE
      fill(255,255,0);
      float damage = map(magnitude[i]/depth[i], -.2, 7, 0, 360);
      float mappedLat= map (lat[i],46,30,0,600);
      float mappedLon =map (lon[i],125,153,0,820);
      color hakan = color (damage,255,255,185);
      fill(hakan);
      stroke(0);
      strokeWeight(.4);
      ellipse (mappedLon, mappedLat, mappedMag, mappedMag);
      
      //draw MAP
      fill(0,0,255);
      //float dots = map(lat[i], lon[i], .01, 12, 0, 180);
      
    }
  }
  
} // end of draw







/* SEISMI API ------------------------------------------------------------*/
void requestEqs(String y, String m, String mm, String l) {

  //form query URL
  String yearmonth = "";
  if (y.length() > 0) { 
    if (m.length() > 0) {
      yearmonth = "/" + y + "/" + m;
    }
    else {
      yearmonth = "/" + y;
    }
  }
  String request = baseURL + "/eqs" + yearmonth + "?min_magnitude=" + mm + "&limit=" + l;

  //request JSON
  String result = join( loadStrings( request ), "");
  
  //Parse JSON, store values into arrays
  try {
    JSONObject eqsData = new JSONObject(join(loadStrings(request), ""));
    JSONArray earthquakes = eqsData.getJSONArray("earthquakes");
    count = eqsData.getInt("count");
    
    numberOfElements = earthquakes.length();
    
    src = new String[numberOfElements];
    eqid = new String[numberOfElements];
    timedate = new String[numberOfElements];
    region = new String[numberOfElements];
    lat = new float[numberOfElements];
    lon = new float[numberOfElements];
    magnitude = new float[numberOfElements];
    depth = new float[numberOfElements];
    
    // loop through arrays 
    for (int i = 0; i < numberOfElements; i++) {
      JSONObject entry = earthquakes.getJSONObject(i);
      src[i] = entry.getString("src");
      eqid[i] = entry.getString("eqid");
      timedate[i] = entry.getString("timedate");
      region[i] = entry.getString("region");
      lat[i] = Float.parseFloat(entry.getString("lat"));
      lon[i] = Float.parseFloat(entry.getString("lon"));
      magnitude[i] = Float.parseFloat(entry.getString("magnitude"));
      depth[i] = Float.parseFloat(entry.getString("depth"));
      
      //print each entry
      println ("Entry# "+ i + " (" + eqid[i] + ")");
      println ("Source Station: " + src[i] + " | Time: " + timedate[i]);
      println ("Coordinate: " + lat[i] + ", " + lon[i] + " | Magnitude: " + magnitude[i] + " | Depth: " + depth[i]);
      println ("Region: " + region[i]);
      println ("-----------------------------------------------------");
    }
    //print summary message
    println ("Done putting into arrays.");
    println ("Query URL: " + request + "\n\n");
    summary ="Amount of earthquakes for request: " + count + "     List of earthquakes retrieved: " + numberOfElements + " entries.";
    println (summary);

  }
  catch (JSONException e) {
    println ("There was an error parsing the JSONObject.");
  }
  
}



/* UI functions ------------------------------------------------------------*/

void customize(DropdownList ddl) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255,128));
  if (ddl == p1){
     ddl.captionLabel().set("year");
     ddl.addItem("2013", 2013);
     ddl.addItem("2012", 2012);
     ddl.addItem("2011", 2011);
     ddl.addItem("2010", 2010);
     ddl.setHeight(100);
  }
  if (ddl == p2){
     ddl.captionLabel().set("month");
     ddl.addItem("January", 1);
     ddl.addItem("February", 2);
     ddl.addItem("March", 3);
     ddl.addItem("April", 4);
     ddl.addItem("May", 5);
     ddl.addItem("June", 6);
     ddl.addItem("July", 7);
     ddl.addItem("August", 8);
     ddl.addItem("September", 9);
     ddl.addItem("October", 10);
     ddl.addItem("November", 11);
     ddl.addItem("December", 12);
     ddl.setHeight(260);
  }
  if (ddl == p3){
     ddl.captionLabel().set("Minimum Magnitude");
     ddl.addItem("No Minimum Mag", 0);
     for(int i = 4 ; i <= 8 ; i++) {
       ddl.addItem("Richter scale "+i,i);
     }
     ddl.setHeight(280);
  }
  if (ddl == p4){
     ddl.captionLabel().set("Limit Results");
     ddl.addItem("Show all results", 0);
     for(int i = 1 ; i <= 9 ; i++) {
       ddl.addItem("Limit Results to "+ (i*100), (i*100));
     }
     ddl.setHeight(220);
  }
}

public void show(int theValue) {
  requestEqs(inputY, inputM, inputMM, inputL);
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    if (theEvent.group().name() == "list-p1"){
      inputY = "" + int(theEvent.group().value());
      println ("Dropdown: Year set to " + inputY);
    }
    if (theEvent.group().name() == "list-p2"){
      inputM = "" + int(theEvent.group().value());
      if (inputM.length() < 2) {
      }
      println ("Dropdown: Month set to " + inputM);
      if (inputM == "0") { inputM = ""; }
    }
    if (theEvent.group().name() == "list-p3"){
      inputMM = "" + int(theEvent.group().value());
      println ("Dropdown: Minimum magnitude set to " + inputMM);
      if (inputMM == "0") { inputMM = ""; }
    }
    if (theEvent.group().name() == "list-p4"){
      inputL = "" + int(theEvent.group().value());
      println ("Dropdown: Minimum magnitude set to " + inputL);
      if (inputL == "0") { inputL = ""; }
    }
  } else if(theEvent.isController()) {
    //println(theEvent.controller().name());
  }
}

