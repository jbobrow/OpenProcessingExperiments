

//----------------------------------------------------------
// sketch:  RGB_Cube.pde    
// Rotate, Zoom and manipulate a RGB Test Cube.
//  v1.0  2011-12-12  initial release
//  v1.1  2011-12-22  input handling adapted for Android
//  v1.2  2012-01-11  small improvements
//  v1.3  2012-03-19  switch transparency
//  v1.4  2013-02-03  dynamic resolution, rotation speed improved
//  v1.5  2013-02-09  zoom slider addeed
//  v1.6  2013-03-25  android icons and menu button added
//  v1.7  2013-04-05  dynamic windows size (at browser)
// tested with OpenProcessing v1.5.1 and v2.0b6 .. v2.0b8
// note: The Icons are added for creating Android App.
// tags: RGB, cube, colors, 3D, P3D, Android, rotate, interactive
//----------------------------------------------------------
/**
This sketch creates an interactive RGB test cube.
Input handling was especially designed for Android phones.
Press mouse button to rotate or to zoom cube (at right side)
  i   toggle info
 +/-  zoom
 q/y  change cube resolution
 a/d  change cube size
  r   reset
  s   save "RGB_Cube.png"
  t   toggle transparent
  o   toggle rotation
  m   toggle smooth 
*/

String title = ">>> RGB-Cube v1.6 <<<";

// get screen size with processing v1.5.1
//int scrWidth  = screen.width;
//int scrHeight = screen.height;      

// get screen size with processing v2.0
//int scrWidth  = displayWidth;
//int scrHeight = displayHeight;      

int scrWidth  = 0;
int scrHeight = 0;      

color fillColor = color(222);  // light gray
color lineColor = color(88);   // dark gray

// cube data
int wm = 1000;   // rgb cube size
int dim = 6;     // rgb cube resolution
float gridSize = wm / dim;
float rescale = 0.75;      // 0.2 .. 1.0
float boxSize = gridSize * rescale;
// flags
boolean showInfo = true;   // true: draw information
boolean menuMode = false;  // true: draw menu buttons
boolean zoomMode = false;  // true: draw right slider
boolean doSmooth = true;
boolean showTrans = false;
// font & text
PFont font1;               // current font
int fontSize = 20;         // current fontsize
int lineHeigth = (fontSize*3)/2;  // current line height
// camera
float rotX = -3/4*PI;
float rotY = -PI/6;
float angleDelta = 0.002;
float rotAngle = -angleDelta;
int initDist = 1800;       // default camera distance
int distance = initDist;   // current camera distance
// buttons
int buttons = 8;           // number of buttons
int buttonSize = 70;       // default button size
int[] buttonX;             // button X positions 
int buttonY = 740;         // button Y position
int sliderX = 540;         // left top slider position 
int sliderY = 200;
// input
int inputKeyCode = 0;

//----------------------------------------------------------
void setup()   
{
  size(600, 800, P3D);

  //-- for Android Handys --
//  size(displayWidth, displayHeight, P3D); 
//  size(320, 480, P3D);   // LG Optimus L5 E610  
//  size(480, 800, P3D);   // Samsung Galaxy S & S2  
//  size(720, 1280, P3D);  // Samsung Galaxy S3 

  //orientation (PORTRAIT);   // only for Android
  //println(title);
  noStroke();
  //noSmooth();
  frameRate(30);
  distance = initDist;

  font1 = createFont("Agency FB Bold", fontSize);        // button text
  textFont(font1, fontSize);
}
//----------------------------------------------------------
void resize()
{
  scrWidth = width;
  scrHeight = height;
  //println("resize: " + width + "*" + height);
  // prepare buttons
  buttonSize = constrain (width / buttons, 40,90);
  buttonX = new int[buttons];
  for (int ni=0; ni<buttons; ni++)
    buttonX[ni] = round(ni*buttonSize); 
  buttonY = height - round(buttonSize) -1;
  sliderX = (width*80) / 100;  
}
//----------------------------------------------------------
void draw()
{
  if (width != scrWidth) resize();
  
  background(127);

  if (menuMode) drawButtons();
  if (zoomMode) drawZoomSlider();
    
  doRendering();
  
  fill(fillColor);
  textMode(SCREEN);  // only for v1.5.1
  
  // show text infos 
  if (frameCount == 200) 
    showInfo = false;
  if (showInfo)  
  {
    textAlign(LEFT);
    shadowText (title, 10, lineHeigth);
    shadowText ("screen: " + width + "*" + height, 10, 2*lineHeigth);
    //shadowText ("press +/- to change resolution", 10, 3*lineHeigth);
    //shadowText ("      a/q to change cube size", 10, 4*lineHeigth);
    //shadowText ("      r to reset view", 10, 5*lineHeigth);
    if (keyCode > 0)
      shadowText ("["+keyCode+"] "+key, 11,height-buttonSize-8);
    textAlign(RIGHT);
    shadowText (round(frameRate) + " fps", width - 10, lineHeigth);
  }
  if (zoomMode)
  {
    textAlign(RIGHT);
    shadowText ("distance=" + distance, sliderX, sliderY+6);
    textAlign(LEFT);
  }
}
//----------------------------------------------------------
void reset()
{
  dim = 6;
  gridSize = wm / dim;
  rescale = 0.75;
  boxSize = gridSize * rescale;
//  rotX = -3/4*PI;
  rotY = -PI/6;
  distance = initDist;
}
//----------------------------------------------------------
void shadowText(String txt, int x, int y)
{
  fill(0);
  text(txt, x+2, y+2);
  fill(fillColor);
  text(txt, x, y);
}
//----------------------------------------------------------
void drawZoomSlider()
{
  if (zoomMode)
  {
    strokeWeight(4);
    stroke(lineColor);
    fill(fillColor);
    rectMode(CORNER);
    int buttonDistance = buttonSize*3/2;
    sliderY = constrain (mouseY, buttonDistance, height-buttonDistance-1); 
    rect (width - buttonSize, sliderY-buttonSize/2, buttonSize, buttonSize);
  }
}
//----------------------------------------------------------
void doRendering()
{
  pushMatrix(); 
  lights();
  translate(width/2, height*0.47, -distance);  // place to screen center
  if (mousePressed)
  {
    if (!menuMode)
    {
      rotX -= 0.002*(pmouseX-mouseX);
      if (!zoomMode)
        rotY += 0.002*(pmouseY-mouseY);
    }  
    else if (mouseY > buttonY)      // button array 
    {
      // check for repeating commands
      if ((mouseX >= buttonX[1]) && (mouseX <= buttonX[3]))  // +/- button ?
        doButtonCommand();
    }
  }
  rotX += rotAngle;     // add rotation
  rotateX(rotY);
  rotateY(rotX);

  // draw RGB cubes
  int trans = 255;
  if (showTrans) trans = 88;
  strokeWeight(0);
  float d2 = dim * 0.5 - 0.5;
  for (int r=0; r<dim; r++)
  { int redValue = 255*r/(dim-1);
    for (int g=0; g<dim; g++)
    { int greenValue = 255-255*g/(dim-1);
      for (int b=0; b<dim; b++)
      { pushMatrix();
          fill(redValue, greenValue, 255*b/(dim-1), trans);
          translate((r-d2)*gridSize, (g-d2)*gridSize, (b-d2)*gridSize);
          box(boxSize);
        popMatrix();        
      }
    }
  }
  popMatrix();        
}
//----------------------------------------------------------
void changeGridCount (int delta)
{
  dim = constrain(dim+delta, 2, 10);
  gridSize = wm / dim;
  boxSize = gridSize * rescale;
  //println("grid: " +dim+'*'+dim+'*'+dim + "   " + dim*dim*dim + " cubes");
}  
//----------------------------------------------------------
void changeGridSize (int delta)
{
  rescale = constrain(rescale+0.02*delta, 0.2, 1.0);
  boxSize = gridSize * rescale;
  //println("cube size: " + boxSize);
}
//----------------------------------------------------------
void changeRotationSpeed (float addAngle)
{
   rotAngle = constrain(rotAngle + addAngle, -0.05, 0.05);
}
//----------------------------------------------------------
void changeRotation()
{
  if (rotAngle < 0.0) rotAngle = angleDelta;
  else if (rotAngle > 0.0) rotAngle = 0.0;
  else rotAngle = -angleDelta;
}
//----------------------------------------------------------
void changeCamera (int zoomDelta)
{
  distance -= zoomDelta;
}
//----------------------------------------------------------
void changeSmooth()  // only usefull for >= v2.0
{
  doSmooth = !doSmooth;
  if (doSmooth) smooth();
  else noSmooth();
}
//----------------------------------------------------------
void mousePressed()
{
  if (mouseY < buttonSize) showInfo = !showInfo;
  menuMode = (mouseY > buttonY);
  if (menuMode) doButtonCommand();
  else zoomMode = (mouseX > sliderX);
}
//----------------------------------------------------------
void mouseReleased()
{
  zoomMode = false;
}
//----------------------------------------------------------
void mouseMoved()    // no mouse button pressed
{
  if (mouseX > width) zoomMode = false;  //???
  if (mouseY > buttonY)menuMode = true;
  //println ("mouseMoved: " + mouseX + "  " + mouseY);
}
//----------------------------------------------------------
void mouseDragged()    // mouse button pressed
{
  if (!menuMode)
  if (mousePressed)
  {
    int mdx = mouseX - pmouseX;
    int mdy = mouseY - pmouseY;
    if (zoomMode)
    {                                // zoom
        changeCamera(mdy);
    }
    else                             // rotate
    { 
      if (mdx == 0)
        rotAngle = 0.0;
      else
        rotAngle = mdx * angleDelta;
    }
  }
}
//----------------------------------------------------------
void doButtonCommand()
{
  if      (mouseX < buttonX[1]) reset();
  else if (mouseX < buttonX[2]) changeGridSize(-1);
  else if (mouseX < buttonX[3]) changeGridSize(+1);
  else if (mouseX < buttonX[4]) changeGridCount(-1);
  else if (mouseX < buttonX[5]) changeGridCount(+1);
  else if (mouseX < buttonX[6]) changeRotation();
  else if (mouseX < buttonX[7]) showTrans = !showTrans;
  else if (mouseX < width) showInfo = !showInfo;
}
//----------------------------------------------------------
void keyPressed()
{
  inputKeyCode = keyCode;
  if      (key == 'i') showInfo = !showInfo;
  else if (key == 'r') reset();
  else if (key == 't') showTrans = !showTrans;
  else if (key == 'o') changeRotation();
  else if (key == 'a') changeGridSize(-1);
  else if (key == 'd') changeGridSize(+1);
  else if (key == '+') changeCamera(+10);
  else if (key == '-') changeCamera(-10);  
  else if (key == 'M') noSmooth();  
  else if (key == 'u')  menuMode = !menuMode;  

  else if (keyCode ==  82) menuMode = !menuMode;  // android menu button pressed

  else if((keyCode ==  38)   // cursor up
         |(keyCode == 105))  // num 9
                             changeCamera(+10);  
  else if((keyCode ==  40)   // cursor down
         |(keyCode ==  99))  // num 3
                             changeCamera(-10);  
  else if (keyCode ==  101)  changeRotation();     // num 5
  else if (keyCode ==  37)   changeRotationSpeed(-angleDelta);  // cursor left
  else if (keyCode ==  39)   changeRotationSpeed(+angleDelta);  // cursor right

  else if (keyCode == 100)   changeGridCount(-1);  // num 4
  else if (keyCode == 102)   changeGridCount(+1);  // num 6

  else if((keyCode ==  33)   // page up
         |(keyCode == 104))  // num 8
                             changeGridSize(+1);
  else if((keyCode ==  34)   // page down
         |(keyCode ==  98))  // num 2
                             changeGridSize(-1);
}
//----------------------------------------------------------
void keyReleased()
{
  keyCode = 0;
  if      (key == 'q') changeGridCount(+1);
  else if (key == 'y') changeGridCount(-1);
  else if (key == 'm') changeSmooth();  
  else if (key == 's') save("RGB_Cube.png");
}
//----------------------------------------------------------
int drawRect(int x)
{
  strokeWeight(4);
  stroke(lineColor);
  fill(fillColor);
  rect (x, buttonY, buttonSize, buttonSize);    
  fill(lineColor);
  return x + buttonSize / 2;
}
//----------------------------------------------------------
void drawButtons()
{
  int mx = 1;
  int my = buttonY + buttonSize / 2;  

  mx = drawRect(buttonX[0]);     // reset
  noStroke();
  rect (mx-8, my-8, 16, 16);

  mx = drawRect (buttonX[1]);    // size - 
  line (mx-10, my, mx+10, my);
  
  mx = drawRect (buttonX[2]);    // size +
  line (mx-10, my, mx+10, my);
  line (mx, my-10, mx, my+10);

  mx = drawRect (buttonX[3]);    // grid -
  strokeWeight(0);
  for (int ni =0; ni<4; ni++)
    rect (mx-10+14*(ni%2), my-10+14*(ni/2),6,6);

  mx = drawRect (buttonX[4]);    // grid + 
  strokeWeight(0);
  for (int ni =0; ni<16; ni++)
    rect (mx-14+ 8*(ni%4), my-14+8*(ni/4), 6,6);

  mx = drawRect (buttonX[5]);    // rotate +/-
  noStroke();
  ellipse (mx,my-2,29,14); 
  fill(fillColor);
  ellipse (mx,my,22,10); 

  mx = drawRect (buttonX[6]);    // transparency on/offt 
  textAlign(CENTER);
  text ("T",mx, my+5);    

  mx = drawRect (buttonX[7]);    // info on/off
  textAlign(CENTER);
  text ("info",mx, my+5);    
}


