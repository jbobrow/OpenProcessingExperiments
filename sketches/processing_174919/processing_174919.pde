
/*  Brain/Sync
5/28/13 JRI (jiversen@ucsd.edu)
Interactive installation to demonstrate concepts of network simulation.
*/

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/63796*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
 Network Excit v0.1
 Click to excitate the network
*/

/*
 5/28/13 JRI (jiversen@ucsd.edu) Adapt for use in interactive interpersonal synchronization installation "Brain/Sync"
 --Add MIDI control--
 1) each node associated with a midi note
 2) note on, flashes the node
 3) note on also excites links flowing out from that node
 4) we track running correlation among midi streams and use this to modulate link strength. Nodes (people) who are tapping
   in sync with each other will be joined by progressively stronger links. Thus the group's synchronization dynamics are
   visualized.
 
 TODO: modify node positions dynamically: position closer as correlatin increase. On pulse, vibrate links leading out from a node
 */

//import java.math.*;

import rwmidi.*;
import org.apache.commons.math.complex.*;

float e = 0.5; // excitation rate, later should be activate by mouse 

boolean pressed = false;

int n=6;
PVector[] points = new PVector[n];
Seuron[] seurons = new Seuron[n];
float[][] corr = new float[n][n];

int[] noteToPadMap = new int[128]; //FIXME: this will map MIDI note to node
int[] padNotes = { //MIDI note numbers for each node
  65,66,67,68,69,70
};

int[] links = new int[n];

MidiInput input;

float corrWindowLength = 5.0; //calculate correlations over the last 5 seconds

void setup () {
  size(1024, 768);
  colorMode(HSB, 360, 1, 1);
  color[] padColors = {
    color(0, 1, 1), color(60, 1, 1), color(120, 1, 1), color(180, 1, 1), color(240, 1, 1), color(300, 1, 1)
  };
  background(0, 0, 0);

  float[] origin = {
    width/2, height/2
  };
  for (int i = 0; i < n; i++) {
    points[i] = getCirclePoint(n, i, width/3f, origin);
  }

  //init MIDI--this is currently hard coded for my setup. MIDISPORT used for installation, but midikeys used for testing
  //MIDISPORT
  //input = RWMidi.getInputDevices()[1].createInput(this);
  
  //MIDI Keys
  input = RWMidi.getInputDevices()[0].createInput(this);
  
  //init noteMap
  for (int i = 0; i < padNotes.length; i++) {
    noteToPadMap[padNotes[i]] = i+1;
  }

  //set up nodes
  for (int i = 0; i < n; i++) {
    seurons[i] = new Seuron(padColors[i], points[i].x, points[i].y, 60, 16, 0);
  }

  //TEST Eventseries
  /*
  Eventseries es = new Eventseries();
  es.add(1f);
  es.add(1.5f);
  es.add(2f);
  es.add(3f);
  es.add(4f);
  es.add(5f);
  println("init: size of times: " + es.times.length);

  println("Eventseries length: " + es.insert);
  float[] ess = es.getEventsAfter(2);
  println("Events after: " + ess.length);
  */
  
  //TEST circmean
  //float[] temp = {-.5, .45, -.45};
  //println("cm=" + circstd_rp(temp));
}

//MIDI handler
void noteOnReceived(Note note) {
  float now = millis() / 1000.0;
  if (note.getVelocity() > 0) { //only handle note on events
    int pad = noteToPadMap[note.getPitch()];
    if (pad > 0) { //note is mapped to a pad
      //println("note on " + note.getPitch() + " pad: " + pad );
      seurons[pad-1].flashState = 1;
      seurons[pad-1].appendTime(now);
      //update correlations
      updateCorrelations(pad-1, now-corrWindowLength); //recalc other streams' correlations with this one
    } 
    else {
      //println("note on " + note.getPitch() + " NO pad" );
    }
  }
}

//recalculate correlation of one node with the rest
void updateCorrelations(int i, float winStart) {
  float[] followerTimes = seurons[i].events.getEventsAfter(winStart);
  if (followerTimes.length == 0) return; //should be impossible

  //println("==updateCorrelations== for node " + i );
  for (int j=0; j<n; j++) {
    if (j != i) {
      float[] leaderTimes = seurons[j].events.getEventsAfter(winStart);
      if (leaderTimes.length == 0) {
        corr[i][j]=0.0;
      } else {
        corr[i][j] = calcCorr(leaderTimes, followerTimes);
        println("corr(" + i + "," + j + ")=" + corr[i][j]);
      }
    }
  }
}

//find correlation between two timeseries
// measure: how stable is relative phase?
float calcCorr(float[] leaderTimes, float[] followerTimes) {
  float start, end;
  float[] rp = new float[followerTimes.length];
  int index = 0;
  
  if (leaderTimes.length < 2) return 0;
  if (followerTimes.length < 2) return 0;
  /*
  print("lead: ");
  printvec(leaderTimes);
  print("foll: ");
  printvec(followerTimes);
  */
  
  for (int i = 0; i<leaderTimes.length-1; i++) {
    start = leaderTimes[i];
    end = leaderTimes[i+1];
    //find follower events within this interval
    for (int j = 0; j<followerTimes.length; j++) {
      if (followerTimes[j] >= start && followerTimes[j] <end) {
      //println("  " + index + ": " + followerTimes[j] + " in [" + start + "," + end + "]");
      rp[index] = (followerTimes[j] - start) / (end-start);
      if (rp[index] > 0.5) rp[index] -= 1; //make [-.5 .5] frpm [0 1]
      index++;
    }
    }
  }
  
  if (index == 0) return 0.0;
  //println("index=" + index);
  
  //extract only good values
  float[] goodrp = new float[index];
  for (int i=0; i<index; i++) {
   goodrp[i] = rp[i]; 
  }
  
  //println("#rp=" + goodrp.length);
  //discount correlation as number of analyzed taps builds up
  if (goodrp.length < 3) return 0;
  float discount = min(1, goodrp.length/6.0);
  
  return circstd_rp(goodrp) * discount;

}

// calculate circular standard deviation of relative phase as measure of goodness of correlation
//  This is measured as the normalized resultant of the sum of relative phase vectors--this approaches one
//  as relative phase vectors align.
//  intuition: synchronized processes will have a relatively fixed phase relationship
float circstd_rp(float[] vector) {
  PVector mean = new PVector(0,0);
  PVector thisVector = new PVector(0,0);
  
  // add relative phase vectors
  for (int i=0; i<vector.length; i++) {
    //thisVector = PVector.fromAngle(2*PI*vector[i]);
    thisVector.x = cos(2*PI*vector[i]);
    thisVector.y = sin(2*PI*vector[i]);
    mean.add(thisVector);
  }
  mean.div(vector.length); //normalize by number of rp vectors
  return mean.mag();
}

//helper funciton
void printvec(float[] vector) {
  print("[");
 for (int i=0; i<vector.length; i++) {
   print(vector[i] + " ");
 } 
   println("]");
}



void draw () {
  smooth();
  strokeWeight(1);
  colorMode(HSB, 360, 1, 1);
  //refresh display (fade out)
  fill(0, 0, 0);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  //adjust node positions

  // display all
  edges();
  neurons();
  
  //discount correlations
  for (int i=0; i<n; i++) {
   for (int j=0; j<n; j++) {
    corr[i][j] *= 0.98;
    } 
  }
  
  //pause for 5 seconds to allow a screen shot
  if (mousePressed) {
    println("Freezing for 5 sec");
    delay(5000);
  }

}

// set the node position
void setNodePosition(PVector newxy, int node) {
  points[node].x = newxy.x;
  points[node].y = newxy.y;
}

// draw edges based on current pairwise correlations
void edges () {
  // go!
  for (int i = 0; i < n; i++) {
    int a = 0;
    for (int j = i; j < n; j++) {
      if ( j != i ) {

        if (corr[i][j] > 0.25 ) { // if close then draw line
          a++;
          int parts = 20;
          float excitation = pow(corr[i][j], 4)*5*(seurons[i].flashState + seurons[j].flashState)+0.1;
          scribble(points[i].x, points[i].y, points[j].x, points[j].y, seurons[i].c, seurons[j].c, parts, excitation);
        }
      }
    }

    links[i] = a;
  }
}

void neurons () {

  // for each node
  for (int i = 0; i < n; i++) {
    //fill(255, 80);
    //strokeWeight(1);
    float x = points[i].x;
    float y = points[i].y;

    //draw a neuron    
    seurons[i].display();

    //debug
    //println("draw seuron " + i + ", c=" + seurons[i].c + ", r=" + seurons[i].r);
  }
}


/* 
 scribble function plots lines between end points, 
 determined by steps and scribVal arguments. scribVal determines how 'excited' the line is. Color fades from c1 to c2.
 */

void scribble(float x1, float y1, float x2, float y2, color c1, color c2, int steps, float scribVal) {

  float xStep = (x2-x1)/steps;
  float yStep = (y2-y1)/steps;
  colorMode(HSB, 360, 1, 1);  //color cStep = color( (red(c1)-red(c2))/steps, (green(c1) - green(c2))/steps, (blue(c1)-blue(c2))/steps); //FIXME, doesn't properly account for circularity of hue
  float cStep = (hue(c2)-hue(c1))/steps;
  strokeWeight( scribVal*2 );

  for (int i = 0; i<steps; i++) {
    if (i<steps-1) {
      color cplot = color((hue(c1)+cStep*i) % 360, .5, 1);
      stroke(cplot);
      line(x1, y1, x1+=xStep+random(-scribVal, scribVal), y1+=yStep+random(-scribVal, scribVal));
    } 
    else {
      // attach to destination point
      line(x1, y1, x2, y2);
    }
  }
}

// make (x,y) position equally spaced around a circle
PVector getCirclePoint(int numPoints, int curPoint, float radius, float[] origin) {

  PVector xy = new PVector(origin[0]+radius*cos(2*(float)Math.PI*curPoint/numPoints), 
  origin[1]+radius*sin(2*(float)Math.PI*curPoint/numPoints));
  return xy;
}

// 5/28/13 JRI (jiversen@ucsd.edu)
//  simple vector of event times that lets you retrieve a vector of events that occurred within the last n seconds.
//  This is used to support relative-phase calculation of tapping time series across multiple individuals
public class Eventseries {

  float[] times;
  int insert;

  Eventseries() {
    times = new float[4096];
    insert = 0; 
  }
  
  void add(float time) {
    times[insert] = time;
    insert++;
   //if (insert > times.length) insert=0; //wrap
  }

  float[] getEventsAfter(float since) {
  int first = 0;
  int last = max(0,insert-1);
    
    if (insert == 0) return new float[0];
    
    //work backwards in event list until find time before our cutoff
    for (int i=last; i>=0; i--) {
      if ( times[i] < since ) {
        first = i + 1;
        break;
      }
    }
    int nPoints = last-first+1;
    float[] returnArray = new float[nPoints];
    int j = 0;
    for (int i=first; i<=last; i++) {
       returnArray[j++] = times[i]; 
    }
    
    //println("getEventsAfter: " + since + "(n=" + returnArray.length + ")");
    return returnArray;
  }
  
}

// Seuron(color, centreX, centreY, radius, number of vertex, excitation)
// 5/28/13 JRI (jiversen@ucsd.edu)
//  Enhanced to enable a decaying flash, as well as store of past event time series
//  a flash is initialized by setting flashState to 1.
public class Seuron {

  color c;
  float cx, cy, r, v, e, flashState;
  Eventseries events;

  // default values
  Seuron() {
    c = color(255);
    cx = width/2;
    cy= width/2;
    r= width/4; //radius
    v= 36; //number of vertex
    flashState = 0; //counts down to zero to determine length of flash
    events = new Eventseries();
    
    //register mouse events PApplet
    //app.registerMouseEvent(this);
  }

  //constructor
  Seuron(color tempC, float tempCX, float tempCY, float tempR, float tempV, float tempE ) {
    c = tempC; //color;
    cx = tempCX; //center X;
    cy= tempCY; //center Y;
    r= tempR; //radius
    v=tempV; //number of vertex
    e=tempE; // excitation rate
    flashState = 0;
    events = new Eventseries();
  }

  void display() {

    strokeWeight(1);
    colorMode(HSB, 360, 1, 1); //hsb
    // both radius and color depend on flash state: larger radius and desaturated colors gradually relax back to
    //  starting values
    color cplot = color(hue(c), saturation(c)*(1-flashState), brightness(c));
    float rplot = r + r*flashState;
    
    stroke(cplot);
    fill(cplot);

    // begin drawing a new shape
    beginShape();
    
    ellipseMode(CENTER);
    ellipse(cx,cy,rplot,rplot);

    endShape(CLOSE);
    
    if (flashState > 0) { 
      flashState -= 0.1;
    } else {
      flashState = 0;
    }
  }
  
  void appendTime(float time) {
    events.add(time);
    //println("appendTime: " + time + " (len=" + events.insert+1 + ")");
  }

}


