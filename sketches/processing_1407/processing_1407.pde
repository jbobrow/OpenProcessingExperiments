
// InterAntarctica Prototype, version 0.3.2
//
// * Background has been changed to black. Debugging text has been changed to white. 
// * Marker interaction has been restored to movement rather than clicking. 
// * Markers are now color coded, with tangerine for bad markers and turquoise for good markers. 
// * Interacting with the markers now will also raise the sea levels of the countries. 
// * Tables have been removed. Markers are now placed directly on top of the map. 
// * Fixed an issue that was preventing ice shelf movement from throttling correctly. 
// * Sketch size has been reduced to 800x800 from 900x800.
//
// Sunday, April 05.

//There are 11 image files - 9 images of the ice shelves and 2 images of the world map. There is also 1 font file. 

//Independent parameters.
PFont font;
PImage a,b,c,d,e,f,g,h,i,main,risen;          
int warmth = 255;                     //Controls the alpha value of the ice shelves
String coorx, coory, coora;           //Used for debugging purposes. Provides feedback as to the X, Y and Alpha values so they can be output as text.

//Arrays imported from an external data source. Input data later when I have the real stuff. For now, use dummy data.
String [] descript = {"Good", "Bad"};                 //The description of each item. 
int [] goodbad = {0,1};                               //Flags whether or not the item is good or bad. 0 is good, 1 is bad.
int [] x = {260,693};                                 //Store the X and Y coordinate. X remains static for each loop then. Defines the markers.
int [] y = {196,494};
float [] imgx = {290,322,362,386,439,315,348,386,406};           //X and Y values of the ice shelves. 
float [] imgy = {322,342,301,340,329,381,371,362,403};

//Control arrays.
int [] lx = {260,693};                               //Store the last X and Y coordinates.
int [] ly = {196,494};
float [] oix = {290,322,362,386,439,315,348,386,406};            //Original image X and Y values.
float [] oiy = {322,342,301,340,329,381,371,362,403};
int [] move = {0,0};                                  //Has the item moved or not? 0 is stationary, 1 is movement. 



void setup() {
  size(800, 800); 
  background(0); 
  smooth(); 
    main = loadImage("map_normal.png");                     //Map of the world at normal sea level.
    risen = loadImage("map_risen.png");                     //Map of the world at risen sea levels.
    a = loadImage("ice1.png");                              //I can't remember how to load this in a FOR loop.
    b = loadImage("ice2.png");
    c = loadImage("ice3.png");
    d = loadImage("ice4.png");
    e = loadImage("ice5.png");
    f = loadImage("ice6.png");
    g = loadImage("ice7.png");
    h = loadImage("ice8.png");
    i = loadImage("ice9.png");
  arraycopy(x, lx);                           //Update the last X and Y arrays. 
  arraycopy(y, ly);
  arraycopy(imgx, oix);                       //Update the historical X and Y values for the images.            
  arraycopy(imgy, oiy);
    font = loadFont("ArialMT-18.vlw");        //Font used to provide textual feedback for debugging.
}


void draw() {
  background(0);
    noTint();
  image(risen, 0, 0);                       
    tint(255,warmth);                        //This controls the transparency of the overlaid map. Lowering it will reveal the risen sea level map. 
  image(main, 0, 0);                         //The map of the world.
      tint(255,warmth);                      //All ice shelves share the same alpha value. 
    image(a, imgx[0], imgy[0]);              //Individual ice shelf images. Coordinates are currently hard coded in. Might be possible to have them all work off a common variable.
    image(b, imgx[1], imgy[1]);
    image(c, imgx[2], imgy[2]);
    image(d, imgx[3], imgy[3]);
    image(e, imgx[4], imgy[4]);
    image(f, imgx[5], imgy[5]);
    image(g, imgx[6], imgy[6]);
    image(h, imgx[7], imgy[7]);
    image(i, imgx[8], imgy[8]);
  noTint(); 
    patterns();                               //Draw the circles.
    warming();                                //Update the movement and transparency. 
  if (mousePressed == true) {                 //If the mouse is pressed, call the movement function. Moves the circles and checks against historical movement. 
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
}


void patterns() {
  for (int i = 0; i < goodbad.length; i++) {          //Run through the array, selecting the X and Y coordinates for each entry to draw a circle. 
    pushMatrix();
      noStroke();
      translate(x[i],y[i]);                           //Move to the X and Y location for the selected entry. 
      if (goodbad[i] == 0) {
        fill(64, 224, 208, 215); }
      else if (goodbad[i] == 1) {
        fill(242, 133, 0, 215); }        
      ellipse(0, 0, 64, 64);                          //Create the primary circle, in orange. 
      stroke(0);
    popMatrix();                                      //Return to default orientation. 
  }
  mouseover();                                        //Mouseover function is purely foor debugging purposes. Displays text information. 
}


void mouseover () {
  for (int i = 0; i < descript.length; i++) {           //Perform this check for each circle pattern. Is the mouse over the circle?
    if (dist(mouseX, mouseY, x[i], y[i]) < 64 / 2) {    //Perform locally; no boolean variable for atomicity. Only lasts as long as mouseover is present. 
      textFont(font);
      fill(255);
      coorx = Integer.toString(x[i]);                   //Convert variables to strings. This is strictly for debugging purposes. 
      coory = Integer.toString(y[i]); 
      coora = Integer.toString(warmth); 
      text(descript[i]+" - X:"+coorx+" Y:"+coory+" A:"+warmth, 10, 20);            //Fetch the Descript string for each corresponding entry and display it. 
      } 
    }
}


void movement(float mx, float my){ 
    for (int i = 0; i < descript.length; i++) {         //Perform this check for each circle pattern.  
      if (dist(mx, my, x[i], y[i]) < 64 / 2) {          //If the mouse is over a node, change that node's X and Y values to that of the mouse.  
        lx[i] = x[i];                                   //Update the historical X and Y arrays.  
        ly[i] = y[i]; 
      if (mouseX > 868) { x[i] = 868; }                 //Throttle X axis movement. Circles cannot be moved past the defined points.
        else if (mouseX < 32) { x[i] = 32; }
        else { x[i] = mouseX; } 
      if (mouseY > 768) { y[i] = 768; }                 //Throttle Y axis movement. 
        else if (mouseY < 50) { y[i] = 50; }
        else { y[i] = mouseY; }
      }
    }
}

 
void warming(){                                            //Check if the move variable is flagged. If it is, the alpha variable will decrease, and the objects will be moved.
  for (int i = 0; i < move.length; i++) {
    if (move[i] == 1) {
      if (goodbad[i] == 0) {                               //If the item is moving, and it is a good item, decrease the alpha channel.
        warmth = warmth + 3;
        imgx[0] = imgx[0] + 0.5;                           //Move the ice shelves. These values have been calculated manually and will only work with these particular arrays.
        imgy[0] = imgy[0] + 0.3; 
        imgx[1] = imgx[1] + 0.2;
        imgy[1] = imgy[1] + 0.5; 
        imgx[2] = imgx[2] - 0.1;
        imgy[2] = imgy[2] + 0.3; 
        imgx[3] = imgx[3] - 0.1;
        imgy[3] = imgy[3] + 0.1; 
        imgx[4] = imgx[4] - 0.4;
        imgy[4] = imgy[4] + 0.1; 
        imgx[5] = imgx[5] + 0.3;
        imgy[5] = imgy[5] - 0.2;  
        imgx[6] = imgx[6] + 0.1;
        imgy[6] = imgy[6] - 0.5;  
        imgx[7] = imgx[7] - 0.1;
        imgy[7] = imgy[7] - 0.2;  
        imgx[8] = imgx[8] - 0.4;
        imgy[8] = imgy[8] - 0.5;    
     }
      else if (goodbad[i] == 1) {                          //If the item is moving, and it is a bad item, increase the alpha channel.
        warmth = warmth - 3; 
        imgx[0] = imgx[0] - 0.5;                           //Move the ice shelves. These values have been calculated manually and will only work with these particular arrays.
        imgy[0] = imgy[0] - 0.3; 
        imgx[1] = imgx[1] - 0.2;
        imgy[1] = imgy[1] - 0.5;
        imgx[2] = imgx[2] + 0.1;
        imgy[2] = imgy[2] - 0.3;  
        imgx[3] = imgx[3] + 0.1;
        imgy[3] = imgy[3] - 0.1; 
        imgx[4] = imgx[4] + 0.4;
        imgy[4] = imgy[4] - 0.1;
        imgx[5] = imgx[5] - 0.3;
        imgy[5] = imgy[5] + 0.2;  
        imgx[6] = imgx[6] - 0.1;
        imgy[6] = imgy[6] + 0.5;  
        imgx[7] = imgx[7] + 0.1;
        imgy[7] = imgy[7] + 0.2;    
        imgx[8] = imgx[8] + 0.4;
        imgy[8] = imgy[8] + 0.5;    
     }
       if (warmth > 256) {                                //Prevent the alpha value exceeding 0 or 256.
         warmth = 255; }
       else if (warmth < 0) {                             //If we are modifying the alpha channel by 3, we can assume there are 85 iterations before it hits the threshold.
         warmth = 1; }      
     if (imgx[0] > oix[0]) { imgx[0] = oix[0]; }          //Prevent the ice shelves from moving beyond their original locations. 
     if (imgy[0] > oiy[0]) { imgy[0] = oiy[0]; }          //Again, all of this has been calculated specifically for this data.  
     if (imgx[0] < 240) { imgx[0] = 240; } 
     if (imgy[0] < 292) { imgy[0] = 292; }      
     if (imgx[1] > oix[1]) { imgx[1] = oix[1]; }
     if (imgy[1] > oiy[1]) { imgy[1] = oiy[1]; }
     if (imgx[1] < 302) { imgx[1] = 302; } 
     if (imgy[1] < 292) { imgy[1] = 292; }    
     if (imgx[2] < oix[2]) { imgx[2] = oix[2]; }
     if (imgy[2] > oiy[2]) { imgy[2] = oiy[2]; }
     if (imgx[2] > 372) { imgx[2] = 372; } 
     if (imgy[2] < 271) { imgy[2] = 271; }    
     if (imgx[3] < oix[3]) { imgx[3] = oix[3]; }
     if (imgy[3] > oiy[3]) { imgy[3] = oiy[3]; }
     if (imgx[3] > 396) { imgx[3] = 396; } 
     if (imgy[3] < 330) { imgy[3] = 330; } 
     if (imgx[4] < oix[4]) { imgx[4] = oix[4]; }
     if (imgy[4] > oiy[4]) { imgy[4] = oiy[4]; }
     if (imgx[4] > 479) { imgx[4] = 479; } 
     if (imgy[4] < 319) { imgy[4] = 319; } 
     if (imgx[5] > oix[5]) { imgx[5] = oix[5]; }
     if (imgy[5] < oiy[5]) { imgy[5] = oiy[5]; }
     if (imgx[5] < 285) { imgx[5] = 285; } 
     if (imgy[5] > 401) { imgy[5] = 401; } 
     if (imgx[6] > oix[6]) { imgx[6] = oix[6]; }
     if (imgy[6] < oiy[6]) { imgy[6] = oiy[6]; }
     if (imgx[6] < 338) { imgx[6] = 338; } 
     if (imgy[6] > 421) { imgy[6] = 421; } 
     if (imgx[7] < oix[7]) { imgx[7] = oix[7]; }
     if (imgy[7] < oiy[7]) { imgy[7] = oiy[7]; }
     if (imgx[7] > 396) { imgx[7] = 396; } 
     if (imgy[7] > 382) { imgy[7] = 382; } 
     if (imgx[8] < oix[8]) { imgx[8] = oix[8]; }
     if (imgy[8] < oiy[8]) { imgy[8] = oiy[8]; }
     if (imgx[8] > 446) { imgx[8] = 446; } 
     if (imgy[8] > 453) { imgy[8] = 453; } 
    }
  }
}  

