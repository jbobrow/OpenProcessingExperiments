
//This is a prototype of the AR section of the InterActive Antarctica Project. This is a proof of concept demonstrating the basic goal of the reacTIVision table and was 
//adapted from a previous program that was developed for an Advanced Interactive Multimedia Devlopment course in 2008.
//
//This is the second iteration of the InterAntarctica prototype. 
//
// * Map of Antarctica has been changed to a map of the Southern Hemisphere.
// * Antarctica is now composed of multiple ice shelves assembled together, as opposed to a single image.
// * Markers have been reduced from four to two and changed from orange to turquoise.
// * Marker interaction is now based on picking up the marker (clicking on it) instead of moving it.
// * Interacting with the markers now affects the ice shelves, with bad markers breaking up the ice and lowering the opacity (melting) and good markers reversing this.
// * C02 filter has been removed.
// * Marker borders have been removed. Marker and map halves have exchanged places. 
// * Markers have been separated into distinct good and bad sections (tables).
// * Extraneous comments from the previous skeleton the iteration was built on have been removed. 
//
//Saturday, March 28

//There are 10 image files - 9 images of the ice shelves and 1 image of the world map. There is also 1 font file. 

//Independent parameters.
int x1, y1;                           //The x- and y-coordinates
PFont font;
PImage a,b,c,d,e,f,g,h,i,main;          
int warmth = 255;                     //Controls the alpha value of the ice shelves
String coorx, coory, coora;           //Used for debugging purposes. Provides feedback as to the X, Y and Alpha values. 

//Arrays imported from an external data source. Input data later when I have the real stuff. For now, use dummy data.
String [] descript = {"Good", "Bad"};       //The description of each item. 
int [] goodbad = {0,1};                               //Flags whether or not the item is good or bad. 0 is good, 1 is bad.
int [] move = {0,0};                                  //Has the item moved or not? 0 is stationary, 1 is movement. 
int [] x = {1000,1000};                             //Store the random X coordinate. X remains static for each loop then. 
int [] y = {200,600};                             //Store the random Y coordinate. Y remains static for each loop then. 
float [] imgx = {290,322,362,386,439,315,348,386,406};
float [] imgy = {322,342,301,340,329,381,371,362,403};
float [] oix = {290,322,362,386,439,315,348,386,406};            //Original image x values.
float [] oiy = {322,342,301,340,329,381,371,362,403};            //Original image y values.

//Control arrays.
int [] v = {0,0,0,0,0};                              //Duplicate array to reset the visitor count each loop.
int [] lx = {55,230,55,230,0};                            //Store the last X coordinate
int [] ly = {200,200,400,400,0};                            //Store the last Y coordinate


void setup() {
  size(1200, 800); 
  background(255); 
  smooth(); 
    main = loadImage("map.png");                     //Map of antarctica
    a = loadImage("ice1.png");                       //I can't remember how to load this in a FOR loop.
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
    font = loadFont("ArialMT-18.vlw");
}


void draw() {
  background(255);
  image(main, 0, 0);                         //The map of the world.
  tint(255,warmth);                          //All ice shelves share the same alpha value. 
    image(a, imgx[0], imgy[0]);              //Individual ice shelf images. 
    image(b, imgx[1], imgy[1]);
    image(c, imgx[2], imgy[2]);
    image(d, imgx[3], imgy[3]);
    image(e, imgx[4], imgy[4]);
    image(f, imgx[5], imgy[5]);
    image(g, imgx[6], imgy[6]);
    image(h, imgx[7], imgy[7]);
    image(i, imgx[8], imgy[8]);
  tint(255,255); 
  strokeWeight(1);
  line(805,0,805,800);
  line(805,400,1200,400);
    patterns();                               //Call the patterns function.
    warming();                                //Update the movement and transparency. 
  if (mousePressed == true) {                 //If the mouse is pressed, call the movement function.
    movement(mouseX, mouseY);
  }
}


void patterns() {
  for (int i = 0; i < goodbad.length; i++) {        //Run through the array, selecting the X and Y coordinates for each entry to draw a circle. 
    pushMatrix();
    noStroke();
    translate(x[i],y[i]);                           //Move to the X and Y location for the selected entry. 
    fill(64, 224, 208);
    ellipse(0, 0, 64, 64);                          //Create the primary circle, in orange. 
    stroke(0);
    popMatrix();                                    //Return to default orientation. 
  }
  mouseover();                                      //Call the mouseover function.
}


void mouseover () {
  for (int i = 0; i < descript.length; i++) {           //Perform this check for each circle pattern. Is the mouse over the circle?
    if (dist(mouseX, mouseY, x[i], y[i]) < 64 / 2) {    //Perform locally; no boolean variable for atomicity. Only lasts as long as mouseover is present. 
      textFont(font);
      fill(0);
      coorx = Integer.toString(x[i]);                   //Convert variables to strings. This is strictly for debugging purposes. 
      coory = Integer.toString(y[i]); 
      coora = Integer.toString(warmth); 
      text(descript[i]+" X:"+coorx+" Y:"+coory+" A:"+warmth, x[i], y[i]+9);            //Fetch the Descript string for each corresponding entry and display it. 
      } 
    }
}


void mousePressed() {
  for (int i = 0; i < descript.length; i++) {           //If the mouse is pressed and the mouse is over an object, set the movement to 1.
    if (dist(mouseX, mouseY, x[i], y[i]) < 64 / 2) {     
      move[i] = 1; 
    }
  } 
}


void mouseReleased() {
  for (int i = 0; i < descript.length; i++) {           //If the mouse is released and the mouse is over an object, set the movement to 0,
    if (dist(mouseX, mouseY, x[i], y[i]) < 64 / 2) {    
      move[i] = 0; 
    }
  } 
}


void movement(float mx, float my){
    for (int i = 0; i < descript.length; i++) {         //Perform this check for each circle pattern. 
      if (dist(mx, my, x[i], y[i]) < 64 / 2) {          //If the mouse is over a node, change that node's X and Y values to that of the mouse. 
        lx[i] = x[i];                                   //Update the historical X and Y arrays. 
        ly[i] = y[i];
          if (mouseX < 837) { x[i] = 837; }               //Throttle X axis movement. Circles cannot be moved past the mid point border. 
      else { x[i] = mouseX; }
        y[i] = mouseY; }
    }
    if (y[0] > 368) { y[0] = 368; }                     //Prevent the circles from crossing the dividing line. 
    if (y[1] < 432) { y[1] = 432; }
}


void warming(){                                          //Check if the move variable is flagged. If it is, the alpha variable will decrease, and the objects will be moved.
  for (int i = 0; i < move.length; i++) {
    if (move[i] == 1) {
      if (goodbad[i] == 0) {                             //If the item is moving, and it is a good item, decrease the alpha channel.
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
      else if (goodbad[i] == 1) {                         //If the item is moving, and it is a bad item, increase the alpha channel.
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
     if (imgx[2] > 372) { imgx[1] = 372; } 
     if (imgy[2] < 271) { imgy[1] = 271; }    
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

