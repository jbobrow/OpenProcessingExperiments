
//This is a prototype of the AR section of the InterActive Antarctica Project. This is a proof of concept demonstrating the basic goal of the reacTIVision table and was 
//adapted from a previous program that was developed for an Advanced Interactive Multimedia Devlopment course in 2008.
//
//The basic underlying premise is for the system to recognize 10 distinct markers, flagged as either positive or negative. Moving markers will affect a visualization of 
//global C02 levels, moving a positive marker will decrease the displayed C02 levels, while moving a bad marker will increase the displayed C02.
//
//This is achieved by using 2 arrays to record the current and past X and Y values of each distinct object. The 2 X and Y values are compared, and if they are different, 
//it can be assumed that the object has moved, and a third boolean array, will flag the object as having moved. 
//Another subroutine cycles through the movement array. If it finds an entry that has recorded movement, it will check this against whether or not the respective item that
//was moved is positive or negative. A positive movement will reduce the alpha channel variable of a rectangle overlaid on a map of Antarctica. A negative movement will 
//increase the alpha channel. 
//
//Friday, March 20

//This program requires 2 files - antarctica.jpg and ArialMT-18.vlw. Place them in the Data subdirectory.

//Independent parameters.
int x1, y1;                          // The x- and y-coordinates
//int diameter;                        // Dimension (width and height) of the circles
PFont font;
//color central_colour;
PImage b;             
int warmth = 128;                  //Controls the alpha value of the C02 map. 
String coorx, coory, coora;        //Used for debugging purposes. Provides feedback as to the X, Y and Alpha values. 



//Arrays imported from an external data source. Input data later when I have the real stuff. For now, use dummy data.
//int [] visitors = {17,17,17,17};              //Number of visitors per site. Determines number of circles.
String [] descript = {"Good", "Bad", "Good", "Bad"};       //The description of each item. 
int [] goodbad = {0,1,0,1};                               //Flags whether or not the item is good or bad. 0 is good, 1 is bad.
int [] move = {0,0,0,0};                                  //Has the item moved or not? 0 is stationary, 1 is movement. 
int [] x = {55,230,55,230};                             //Store the random X coordinate. X remains static for each loop then. 
int [] y = {200,200,400,400};                             //Store the random Y coordinate. Y remains static for each loop then. 

//Control arrays.
int [] v = {0,0,0,0,0};                              //Duplicate array to reset the visitor count each loop.
int [] lx = {55,230,55,230,0};                            //Store the last X coordinate
int [] ly = {200,200,400,400,0};                            //Store the last Y coordinate

void setup() {
  size(800, 600); 
  background(255); 
  fill(61, 92, 167, 175);   
  smooth(); 
  b = loadImage("antarctica.jpg");                     //Map of antarctica
//  for (int i = 1; i < visitors.length; i++) { //Cycle through the arrays and add new X and Y coordinates for each number of visitor entries there is.
//    x1 = int(random(0,400));
//    y1 = int(random(0,300));
//    x = append(x, x1); 
//    y = append(y, y1);
//    v = append(v, 10);                        //Fill array V with dummy data. This is to prevent an out of bounds exception error when copying the array.
//  }
//  arraycopy(visitors, v);                     //Duplicate visitor array. This is to reset the visitor count each loop so that the pattern remains constant. 
  arraycopy(x, lx);                           //Update the last X and Y arrays. 
  arraycopy(y, ly);
//  diameter = 64;
  font = loadFont("ArialMT-18.vlw");
}

void draw() {
  background(255);
  image(b, 288, 115);
  strokeWeight(1);
  line(275,0,275,600);
  fill(192,14,50,warmth);                        //The opacity of the rectangle covering the map is determined by the warmth variable. 
  rect(288, 115, 500, 460);
//  background(255);
//    lines();                                  //Call the lines function.
//  fill(61, 92, 167, 175);   
  //ellipse(width/2,height/2,125,125);          //Create the background circle.
    patterns();                               //Call the patterns function.
    warming();
  if (mousePressed == true) {                 //If the mouse is pressed, call the movement function.
    movement(mouseX, mouseY);
  }
  
  for (int i = 0; i < move.length; i++) {                  //Check the X and Y values against the historical X and Y values.
    if (x[i] != lx[i]) {                                   //If the values are not equal, movement has occured. Flag that object ID as having moved. 
      move[i] = 1; }
    else if (x[i] == lx[i]) {                              //The objects have not moved. Set the movement flag for that ID back to stationary. 
      move[i] = 0;
    }
    if (y[i] != ly[i]) {
      move[i] = 1; }
    else if (y[i] == ly[i]) {
      move[i] = 0;
    }
  }
 
//  for (int i = 0; i < move.length; i++) {                 //Used to debug whether or not movement was being recognized. 
//    if (move[i] == 1) {
//      print ("NODE " + i + " IS MOVING!"); }     
//    else if (move[i] ==0)  {
//      print ("NODE " + i + " IS NOT MOVING!"); }
//  }
}

void patterns() {
  for (int i = 0; i < goodbad.length; i++) {        //Run through the array, selecting the X and Y coordinates for each entry to draw a circle. 
    pushMatrix();
    translate(x[i],y[i]);                           //Move to the X and Y location for the selected entry. 
    fill(203,136,33, 175);
    ellipse(0, 0, 64, 64);              //Create the primary circle, in orange. 
    fill(61, 92, 167, 175);   
    
//      if (visitors[i] > 0) {                        //Check if there are visitors left.
//        for (int c = 0;c < 17;c++) {                //If so, there are 17 possible circles that can be placed in the first row.
//          rotate(0.37);
//          ellipse(42, 0, 15, 15);                   //Rotate and draw a circle. 
//          visitors[i] = visitors[i] - 1;            //Subract 1 from the visitor count. 
//            if (visitors[i] == 0) {  break;  }      //If no visitors left, break loop and stop. 
//        }
//      }
      
//      if (visitors[i] > 0) {
//        for (int c = 0;c < 21;c++) {                //21 possible circles in the second row.
//          rotate(0.3);
//          ellipse(57, 0, 15, 15);
//          visitors[i] = visitors[i] - 1;
//            if (visitors[i] == 0) {  break;  }
//        }
//      }
      
//      if (visitors[i] > 0) {
//        for (int c = 0;c < 30;c++) {                //30 possible circles in the second row.
//          rotate(0.21);
//          ellipse(73, 0, 15, 15);
//          visitors[i] = visitors[i] - 1;
//            if (visitors[i] == 0) {  break;  }
//        }
//      }
      
//      if (visitors[i] > 0) {
//        for (int c = 0;c < 35;c++) {                //35 possible circles in the second row.
//          rotate(0.18);
//          ellipse(89, 0, 15, 15);
//          visitors[i] = visitors[i] - 1;
//            if (visitors[i] == 0) {  break;  }
//       }
//     }
      
 //     if (visitors[i] > 0) {
//        for (int c = 0;c < 42;c++) {                //42 possible circles in the second row.
//          rotate(0.15);
//          ellipse(105, 0, 15, 15);
//          visitors[i] = visitors[i] - 1;
//            if (visitors[i] == 0) {  break;  }
//        }
//      }
    
//    if (visitors[i] == 0) { visitors[i] = v[i]; }   //If visitor count hits 0, reset using the corresponding V value so that the pattern will reset next loop. 
    popMatrix();                                    //Return to default orientation. 
  }
 
  mouseover();                                      //Call the mouseover function.
}

//void lines() {
//  for (int i = 0; i < x.length; i++) {              //Draw lines connecting the central circle and patterns. 
//    stroke(120,112,214,75);
//    strokeWeight(5);
//    line(width/2, height/2, x[i], y[i]);            //Connect to the center, and each X, Y coordinates for each entry. 
//    noStroke();
//  }
//}

void mouseover () {
  for (int i = 0; i < descript.length; i++) {           //Perform this check for each circle pattern. 
    if (dist(mouseX, mouseY, x[i], y[i]) < 64 / 2) {    //Perform locally; no boolean variable for atomicity. Only lasts as long as mouseover is present. 
      textFont(font);
      fill(0, 175);
      coorx = Integer.toString(x[i]); 
      coory = Integer.toString(y[i]); 
      coora = Integer.toString(warmth); 
      text(descript[i]+" X:"+coorx+" Y:"+coory+" A:"+warmth, x[i], y[i]+9);            //Fetch the Descript string for each corresponding entry and display it. 
      } 
    }
//  if (dist(mouseX, mouseY, width/2, height/2 ) < 125 / 2) {
//    textFont(font);
//    fill(0, 175);
//    text("Australia", width/2, height/2+18);       //Central circle is always pre-defined, so can be hard coded in. 
//  } 
}

void movement(float mx, float my){
    for (int i = 0; i < descript.length; i++) {         //Perform this check for each circle pattern. 
      if (dist(mx, my, x[i], y[i]) < 64 / 2) {          //If the mouse is over a node, change that node's X and Y values to that of the mouse. 
        lx[i] = x[i];                                   //Update the historical X and Y arrays. 
        ly[i] = y[i];
      if (mouseX > 240) {                               //Throttle X axis movement. Circles cannot be moved past the mid point border. 
        x[i] = 240; }
      else { x[i] = mouseX; }
        y[i] = mouseY;
      }
    }
}

void warming(){
  for (int i = 0; i < move.length; i++) {
    if (move[i] == 1) {
      if (goodbad[i] == 0) {                             //If the item is moving, and it is a good item, decrease the alpha channel.
       warmth = warmth - 1; }
      else if (goodbad[i] == 1) {                        //If the item is moving, and it is a bad item, increase the alpha channel.
       warmth = warmth + 1; }
      if (warmth > 256) {                                //Prevent the alpha value exceeding 0 or 256.
        warmth = 255; }
      else if (warmth < 0) {
        warmth = 1; }
    }
  }
}  

