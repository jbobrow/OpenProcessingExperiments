
/*
 * Creative Coding
 * Week 3, 03 - using sin(), cos(), dist() to make a dynamic pattern
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change background color.
 * Press and hold the left mouse button to change color.
 * Use presentation mode( sketch menu > Present or press the shift-comand-r keys together)
 * Press "esc" key to stop running the sktech
 * experiment with changing the value of num and distanceMargin in setup
 * c- clear
 * r- randomise
 * s- write parameters and image
 *
 * A variation on Richard Lyall's orbitals
 *   Randomise the number of centres
 *
 * Add json and controls to allow us to reproduce an animation
 */
 
JSONObject json;

int     num, numCentres, centreNum, startFrame;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] centrex;       // x-position of point
float[] centrey;       // y-position
float[] speed;   // speed
float[] phase;   // phase
float[] divisor; // radius of the orbit for each circle
float[][] centresarr; // the array of centres
 
float distanceMargin;
float rowHeight;
 
// background colour
float red;
float green;
float blue;
float drag;
 
 
void setup() {
 
  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  size(800, 800);
 
  drag = 1;
 
  // change each value below for different visual
  num = 20;
  
  rowHeight = height/(num-1); // height of each row
 
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  centrex = new float[num];
  centrey = new float[num];
  speed = new float[num];
  phase = new float[num];
  divisor = new float[num];
  centresarr = new float[num][num];  //numCentres would be more efficient but probably a list then
  startFrame = 0;
  
  //If you want to import source data from a previously saved json file
  //set parameterSource to the filename 
  String parameterSource = "";
  
  if (parameterSource != "") {
    readData(parameterSource);
  } else {
    randomise();
  }
  
  red = 0;
  blue = 0;
  green = 0;
   
  background(255);
}
 
 
void draw() {
  // don't clear the screen each frame by calling background()
  //background(128);
  
  for (int i=0; i<num; i++) {
 
    // populate x values
    // we use startFrame to allow us to always reset to start of sketch on 0
    float rads = radians((frameCount-startFrame)*speed[i] );
 
    if (i%2 == 1) { // odd
      x[i] = centrex[i] + sin(rads + phase[i])* width/divisor[i];
    } else { // even
      x[i] = centrex[i] + cos(rads + phase[i])* width/divisor[i];
    }
 
    //populate y values
    
    float rads2 = radians(frameCount*speed[i] );
 
    if (i%2 == 1) { // odd
      y[i] = centrey[i] + cos(rads + phase[i])* width/divisor[i];
    } else { // even
      y[i] = centrey[i] + sin(rads + phase[i])* width/divisor[i];
    }
 
    fill(0);
    //ellipse(x[i],y[i],1,1);
 
    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance > rowHeight && distance < rowHeight + distanceMargin) {
 
        stroke(0, 20);
        line(x[i], y[i], x[i+1], y[i+1]);
 
        //stroke(255);
        point(x[i], y[i]);
        point(x[i+1], y[i+1]);
      }
    }
  }
 
  if (mousePressed) {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
 
    fill(red, green, blue, 10);
    noStroke();
    rect(0, 0, width, height);
  }
}
 
// Randomise drawing parameters
void randomise() {  
  numCentres = int(random(1,num/2));    // how many centres should we have
  distanceMargin = random(50,300);

  for (int i=0; i<numCentres; i++) {
    centresarr[i][0]=random(distanceMargin,width-distanceMargin);
    centresarr[i][1]=random(distanceMargin,height-distanceMargin);
  }
    
  for (int i=0; i<num; i++) {
    divisor[i] = random(2, 10);
    speed[i] = random(0.2,2);
  }
   
    //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    //if (centreNum==numCentres) centreNum=0;
    centreNum = int(random(0,numCentres));

    centrex[i] = centresarr[centreNum][0];      //width/2;
    centrey[i] = centresarr[centreNum][1];      //width/2;
    //println(i + "  :  " + x[i] + "  :  " + y[i]);
    speed[i] = random(0.2,2); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
    divisor[i] = random(0.5, 10);
  }
  
  startFrame=frameCount;

}
 
void keyReleased() {
  switch (key) {
  case 'c':
    clear();
    startFrame=frameCount;
    
    background(255);
    break;
  case 's':
    writeData();
    break;
  case 'r':
    randomise(); // put each circle on a new orbit
    break;
  case 'x':
     
    break;
  }
 
  if (keyCode == UP) {
    if (drag < 0.9) {
      drag += 0.05;
      println ("Pen drag = " + drag);
    }
  }
  if (keyCode == DOWN) {
    if (drag > 0.05) {
      drag -= 0.05;
      println ("Pen drag = " + drag);
    }
  }
}


//write Data to JSON fileand take snapshot
void writeData() {
  int thisFC = frameCount;

  json = new JSONObject();
  
  json.setInt("numCentres", numCentres);
  
  for (int i=0; i<numCentres; i++) {
    json.setFloat("Centre" + i + ".x",centresarr[i][0]);
    json.setFloat("Centre" + i + ".y",centresarr[i][1]);
  }

  json.setFloat("distanceMargin", distanceMargin);

  for (int i=0; i<num; i++) {
    json.setFloat("centrex." + i,centrex[i]);
    json.setFloat("centrey." + i,centrey[i]);
    json.setFloat("speed." + i,speed[i]);
    json.setFloat("phase." + i,phase[i]);
    json.setFloat("divisor." + i,divisor[i]);
  }

  try {
    saveJSONObject(json, "data/w3_03" + thisFC +".json");     
  }
  catch (Exception e) {
    println("File is not saved due to errors"+e.toString());
  }
  
  //now take snapshot
  saveFrame("data/w3_03" + thisFC + ".png");    
}


//read json data
void readData(String rdFileName) {
  json = new JSONObject();
  json = loadJSONObject(rdFileName);
  
  numCentres = json.getInt("numCentres");
  
  for (int i=0; i<numCentres; i++) {
    centresarr[i][0]=json.getFloat("Centre" + i + ".x");
    centresarr[i][1]=json.getFloat("Centre" + i + ".y");
  }

  distanceMargin=json.getFloat("distanceMargin");

  for (int i=0; i<num; i++) {
    centrex[i]=json.getFloat("centrex." + i);
    centrey[i]=json.getFloat("centrey." + i);
    speed[i]=json.getFloat("speed." + i);
    phase[i]=json.getFloat("phase." + i);
    divisor[i]=json.getFloat("divisor." + i);
  }    
}





