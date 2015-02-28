
/** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
 *  Introduction to Computational Arts : Processing : Final Project
 *  
 *  For this work I am attempting to convey a fleeting visual experience of 
 *    which remnants are still visible as the environment continues to be 
 *    altered.  I am not trying to say anything specific here.  Rather, I am 
 *    interested in creating an emotion or experience that gives the sense of 
 *    movement and change.
 *
 *  The user interface is kept minimal.  Since this work is stereoscopic and 
 *    displayed in a crossed-eye format I thought it best to use simple commands
 *    that will still allow the user to view the animation while making subtle 
 *    changes, or saving the frame.
 *
** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


/** USER INPUT * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
 *
 *  Best viewed with eyes crossed.
 *
 *  save frame        : 's' || 'S'
 *  draw ellipse      : 'd' || 'D'
 *  change fill color : ' '
 *
/** END USER INPUT * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


/** GLOBAL VARIABLES * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// background related
int numBackGroundFrames = 34; // number of background images
PImage[] bgImages = new PImage[numBackGroundFrames]; // create image array
// operate on background images
int moveUP = 0; // stretch up
int moveOUT = 0; // stretch out
int bHOMulti = 1; // floorline thickness
float goldRatio = 1.6180339887498948482; // for composition
float beginHorizon; // placement of horizon
float beginHorizonOffset; // offset of moving lines for horizon/floor
float horizonThickness = 1; // floor line width
int loopCheck; // draw floorlines this many times
// ellipse variables
int radius; // size
float r, g, b; // fill
int displacement; // disparity
// (720 - 20) = 700 - (beginHorizon - 10) == ????
// (640 - 20) = 620 / goldRatio == ????
float diameterMin, diameterMax;
/** END GLOBAL VARIABLES * * * * * * * * * * * * * * * * * * * * * * * * * * **/


/** SETUP * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void setup(){
  size(1280, 720);
  background(0);
  frameRate(24);  
  noStroke();
  smooth();
  beginHorizon = height / goldRatio;
  diameterMin = 620 / goldRatio; // diameter range min
  diameterMax = 700 - (beginHorizon - 10); // diameter range max
  // load background images
  for(int i = 0; i < numBackGroundFrames; i++){
    String imageName = "imgs/glitch/glitch_201402_" + nf(i, 2) + ".jpg";
    bgImages[i] = loadImage(imageName); 
  }
}/** END SETUP * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **/




/** DRAW * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **/
void draw(){
  drawBackground( ); // draw the background  
  drawHorizon( ); // draw horizon
  drawBorders( ); // draw borders
}/** END DRAW * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **/




/** FUNCTION FOR DRAWING SHAPE * * * * * * * * * * * * * * * * * * * * * * * * */
void drawEllipse(float disp, float rad) {
  fill(r, g, b);
  // left frame -> right eye
  ellipse(width/4 - disp, beginHorizon, rad, rad);
  // right frame -> left eye
  ellipse((width/4)*3 + disp, beginHorizon, rad, rad);
}/** END FUNCTION FOR DRAWING SHAPE * * * * * * * * * * * * * * * * * * * * *  **/


/** KEYPRESSED ('S'||'s' to save; 'd'||'D' to add img; ' ' to change color) * * */
void keyPressed() {
  // - - - - - - - - SAVE FRAME - - - - - - - - //
  if (key == 's' || key == 'S') {
    saveFrame("data/saved_images/finalProject_" + nf(frameCount, 4) + ".jpg");
  }// - - - - - - - - END SAVE FRAME - - - - - - - - //
  
  // - - - - - - - - SELECT COLOR - - - - - - - - //
  if (key == ' ') {
    // randomly select fill integers
    r = random(255);
    g = random(255);
    b = random(255);
  }// - - - - - - - - END SELECT COLOR - - - - - - - - //
  
  // - - - - - - - - ADD ELLIPSE - - - - - - - - //
  if (key == 'd' || key == 'D') {
    radius = int(random(diameterMin/4, diameterMax*2)); // randomly select ellipse radius
    displacement = int(random(-10, 10)); // random select displacement
    drawEllipse(displacement, radius); // draw the image
    drawFloorLines(127, 127, 11); // draw the floor lines
  }// - - - - - - - - END ADD ELLIPSE - - - - - - - - //
}/** END KEYPRESSED ('S'||'s' to save; 'd'||'D' to add img; ' ' to change color)*/


/** FUNCTION TO DRAW BORDERS * * * * * * * * * * * * * * * * * * * * * * * * * */
void drawBorders( ) {
  fill(0); // set to black
  rect(0, 0, width, 10); // top
  rect(0, 0, 10, height); // left
  rect(width/2 - 10, 0, 20, height); // center
  rect(width - 10, 0, 10, height); // right
  rect(0, height - 10, width, 10); // bottom
}/** END FUNCTION TO DRAW BORDERS * * * * * * * * * * * * * * * * * * * * * * **/


/** FUNCTION TO DRAW HORIZON * * * * * * * * * * * * * * * * * * * * * * * * * */
void drawHorizon( ) {
  // set variables
//  beginHorizon = height / goldRatio; // height of horizon on image
  beginHorizonOffset = goldRatio * (1 / goldRatio); // space between floor lines

  // draw the horizon objects
  fill(#FFFFFF, 7); // set floor color, white
  rect(0, height / goldRatio, width, height - (height / goldRatio)); // main floor persists
  fill(0, 100); // set line color, black
  rect(0, (height / goldRatio), width, 1); // main horizon persists
  // end draw the horizon objects
  
  drawFloorLines(14, 127, 1);
}/** END FUNCTION TO DRAW HORIZON * * * * * * * * * * * * * * * * * * * * * * **/


/** FUNCTION TO DRAW FLOORLINES * * * * * * * * * * * * * * * * * * * * * * * **/
void drawFloorLines(int transA, int transB, int run) {
  loopCheck = run;
  
  fill(0, transA); // set line color and transparency, black
  
  for (int i = 0; i <= loopCheck; i++) {
    // draw floor lines in moving pattern
    rect(0, beginHorizon + (bHOMulti * beginHorizonOffset), width, horizonThickness);
    if (frameCount % 5 == 0) {
      fill(0, transB);
      rect(0, beginHorizon + (bHOMulti * beginHorizonOffset), width, horizonThickness);
    } // end draw floor lines in moving pattern
    
    // adjust variables
    bHOMulti*=2; // increase the multiplier
    horizonThickness*=1.25;
    if (bHOMulti > 256) { // reset the multiplier
      bHOMulti = 1; 
      horizonThickness = 1;
    } // end adjust variables
  }
}/** END FUNCTION TO DRAW FLOORLINES * * * * * * * * * * * * * * * * * * * * * */


/** FUNCTION TO DRAW BACKGROUND * * * * * * * * * * * * * * * * * * * * * * * **/
void drawBackground( ) {
  // SET VARIABLES
  int randomFrame = int(random(1, numBackGroundFrames)) - 1; // get random frame
  int bgDisplacement = -10; // set the displacement value
  int topBGImgY = 0 - moveUP;
  float botBGImgY = beginHorizon + moveUP;
  float rightImgStretch = width/2 + moveOUT;
  
  // DRAW THE BACKGROUND IMAGES
  tint(255, 7); // set the transparency
  // leftPanel/rightEye
  image(bgImages[randomFrame], 0 - moveOUT - bgDisplacement, topBGImgY, rightImgStretch, botBGImgY);
  // rightPanel/leftEye
  image(bgImages[randomFrame], width/2 - moveOUT + bgDisplacement, topBGImgY, rightImgStretch, botBGImgY); 

  // ADJUST VALUES
  moveUP++;
  if (moveUP >= 340) {
    moveUP = 0;
  }
  moveOUT++;
  if (moveOUT >= 10) {
    moveOUT = 0;
  }
}/** END FUNCTION TO DRAW BACKGROUND * * * * * * * * * * * * * * * * * * * * * */

