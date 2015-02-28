
// Snow boxes - November 2009, Noah Larsen, @earlatron

//library for exporting pdf uncomment this line, beginRecord line, and endRecord line to generate pdf on run
//import processing.pdf.*;

// Setup sketch
void setup() {
  // Sets size of sketch
  size(640, 480);
  smooth();
  //Start recording for pdf - import, beginRecord, endRecord must be uncommented to run
  //Be sure to change file name each run, otherwise and overwrite wil
  //beginRecord(PDF, "sketch_01.pdf");
}

// Start Drawing
void draw() {
  // Sets color of background. Randomizes RGB values
  background(random(150, 255), random(0, 75), random(0, 75));
  
  //Draws a scattered bunch of white dots all over screen as backdrop.
   for(int j=1; j<10000; j+=1) {
     // random starting point for x - these are not global variables and terminate after loop is run.
     float x_point = random(0, 640);
     // random starting point for y - these are not global variables and terminate after loop is run.
     float y_point = random(0, 480);
     // sets end point variable for x
     float x_end_point = x_point+1;
     // sets end point variable for y
     float y_end_point = y_point+1;
     // sets stroke color to white
     stroke(255);
     // Draws a two point lines
     line(x_point, y_point, x_end_point, y_end_point);
     // stops animation, creating static image.
     noLoop();
   }
   
   //draws 19 boxes full of white dots
   for(int j=1; j<20; j+=1) {
     // random starting point for x
     float x_var = random(0, 640);
     // random starting point for y
     float y_var = random(0, 480);
     // random end point for x
     float x_end = x_var+random(30, 300);
     //random end point for y
     float y_end = y_var+random(30, 300);
     // start of sub loop, draws 10,000 dots, or one pixel lines
     for(int i=1; i<10000; i+=1) {
       // selects staring point for x based on random set variables above
       float x_point =  random(x_var, x_end);
       // selects staring point for y based on random set variables above
       float y_point =  random(y_var, y_end);
       // sets end point variable for x
       float x_end_point = x_point+1;
       // sets end point variable for y
       float y_end_point = y_point+1;
       // sets color of stroke to white
       stroke(255);
       // Draws a two point line
       line(x_point, y_point, x_end_point, y_end_point);
       // Stops animation, creating static drawing
       noLoop();
     }
   }
  //End recording for pdf - import, beginRecord, endRecord must be uncommented to run
 //endRecord();
}

