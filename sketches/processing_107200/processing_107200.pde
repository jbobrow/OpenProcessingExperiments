
 
//==========================================================
// sketch: PG_ParametricSurfaceViewer_V1.pde - by Gerd Platl
//
// Parametric Surface Viewer.  
// View parametric surface defined by p(x,y,z) = f(u,v)
//       
// v0.1  2013-04-08  start working
// v1.0  2013-08-22  first release
// 
// mouse commands:
//  left button    rotate
//
// key commands:
// 0..n  select surface
// ' '   next surface
// <BS>  previous surface
//  a    axis on/off
//  b    background white/black
//  c    color change
//  r    reset
//  s    save 'PSurface_<surface.name>.png' 
//  t    texture change
//  u    toggle UMin
//  v    toggle VMin
// +/-   zoom
//  F1, h  change help level
//  F2, g  change coloring
//  F3, c  random colors
//  F4, d  change texture
//  F5, o  change resolution
// F10, a  axis on/off
// cursor  rotate
//==========================================================

int helpMode = 2;               // F1, h
int lineHeight = 44;            // text height
int xtext = 10;
int ytext = lineHeight;

int textureIndex = 0;
int maxTextures = 4;
String textureImage = "Texture0.png";

color bgColor[] = {255, color(50,22,11), 0};   // background color 
int   bgIndex = 0;                             // background index 
int   bgCount = bgColor.length;                // # of background colors  

PSurfaceMesh surfaceMesh_1, surfaceMesh_2, surfaceMesh_3;

boolean showAxis = false;     
boolean doMorphing = false;   // true = morphing active
float morphingPictures = 10;
int startCount = 0;
int resMode = 2;
float startTimeMSec;

//----------------------------------------------
void setup() 
{
  size(600,600,P3D);
  startTimeMSec = millis();
  
  noStroke();
  lineHeight = height/28;
  textSize(lineHeight-4);
  
  resetCamera();
  
  surfaceMesh_1 = new PSurfaceMesh(startPSurface);
  surfaceMesh_1.setTexture (textureImage);
  surfaceMesh_1.doColoring();   // init
  
  surfaceMesh_2 = new PSurfaceMesh(startPSurface);
  surfaceMesh_2.setTexture (textureImage);
  surfaceMesh_2.doColoring();   // init

  surfaceMesh_3 = new PSurfaceMesh(realSurfaceIndex(startPSurface+1));
  surfaceMesh_3.setTexture (textureImage);
  surfaceMesh_3.doColoring();   // init
}
//----------------------------------------------
void draw()
{
  checkSelectionInput();

  background (bgColor[bgIndex % bgCount]);
  
  //--- setup material and lights ---
  noLights();
  //ambient(25);
  emissive(15);
  ambientLight(25,25,5);
  lightSpecular(130, 130, 60); 
  directionalLight(140, 140, 140, 3, 1, -2); 
  directionalLight(140, 140, 140, -3, 1, -2); 
  specular(color(220)); 
  shininess(55.0); 

  pushMatrix();

  handleCamera();

  //--- start drawing ---
  if (doMorphing)
  {
    float factor = (frameCount - startCount) / morphingPictures;
    surfaceMesh_1.morph (surfaceMesh_2, surfaceMesh_3, factor);
//    println ((frameCount-startCount) + ":  " + surfaceMesh_1.name() + " -> " + surfaceMesh_3.name() + " " + factor);
    if ((frameCount-startCount) >= morphingPictures)
    {
      // end morphing
      doMorphing = false;
      surfaceMesh_1.select (surfaceMesh_3.index());
      surfaceMesh_2.select (surfaceMesh_3.index());
    }
  }
  noStroke();
  surfaceMesh_1.draw();
  if (showAxis) drawAxis(3.5);
  
  popMatrix();

  DrawHelp();
}
//----------------------------------------------
// camera & rotation
//----------------------------------------------
float distance = 100.0;
float rotx = radians(-10);
float roty = 0.0;
float rotSpeed = 0.001;
//----------------------------------------------
void resetCamera() 
{
  rotx = radians(-10);
  roty = 0.0;
  distance = 100;
  perspective(1.2, float(width)/height, 10, 8000);
}
//----------------------------------------------
void handleCamera() 
{
  perspective(1.2, float(width)/height, 10, 8000);
  translate(width*0.5, height*0.5, distance);
  roty += rotSpeed; 
  rotateY(roty); 
  rotateX(PI*0.5 + rotx);
  //println ("rotx="+nf(rotx,0,2) + "  roty=" + nf(roty,0,2));
  scale(60);

  if (mousePressed)
  {
    int mx = pmouseX - mouseX;
    int my = pmouseY - mouseY;
    rotx += 0.005 * my;   rotSpeed = (mx > 0) ? -0.001 : 0.001;
    roty -= 0.005 * mx;   
  }
}
//----------------------------------------------
// draw help depending on helpMode
//----------------------------------------------
void DrawHelp()
{ 
  if (helpMode <= 0) return;
  
  textMode(SCREEN);  // v1.5.1
  ortho();
//  noLights();
  textAlign(RIGHT);
  xtext = width-10; 
  ytext = lineHeight; 
  if (paused)
    drawText ("paused");
  else drawText (round(frameRate+0.2) + " fps");

  textAlign(LEFT);
  xtext = 10; 
  ytext = lineHeight; 
  
  if (millis() < startTimeMSec + 5000)
  {
    drawText ("press F1 to change help level...");
    return;  
  }

  if (helpMode >= 1) drawText (surfaceMesh_1.index() +": " +surfaceMesh_1.name());

  if (helpMode == 2) drawText (surfaceMesh_1.info());

  if (helpMode == 3) 
  {
    ytext += lineHeight;
    drawText ("0 .. "+(pSurfaces-1) + "   select surface by number");
    drawText (" <blanc>   next surface");
    drawText ("  <BS>     previous surface");
    drawText ("   +/-     zoom");
    drawText ("    r      reset all");
    drawText ("    s      save 'PSurface_<surface.name>.png'");
    drawText ("left/right rotation speed (" + rotSpeed + ")");
    drawText ("  up/down  turn up/down");
    drawText ("  F1, h    change help level");
    drawText ("  F2, g    change coloring");
    drawText ("  F3, c    random colors");
    drawText ("  F4, d    change texture");
    drawText ("  F5, o    change resolution");
    drawText ("  F10, a   axis on/off");
  }
}
//----------------------------------------------
void drawText(String helptext)               
{
  fill(0);
  text (helptext, xtext+1, ytext+1);
  fill(188,188,66);
  text (helptext, xtext, ytext);
  ytext += lineHeight;
}
//----------------------------------------------
void changeHelp()                          // F1
{
  helpMode = (helpMode+1) % 4;
}
//----------------------------------------------
void changeColoring(int delta)             // F2
{
  surfaceMesh_1.changeTextureMode(delta);
}
//----------------------------------------------
void setRandomColor()                      // F3
{
  color color1 = color(random(255),random(255),random(255));
  println("surface color: " + (int)red(color1) + "-" + (int)green(color1) + "-" + (int)blue(color1));
  surfaceMesh_1.setColor(color1);
}
//----------------------------------------------
void getNextTexture()                      // F4
{
  textureIndex = (textureIndex+1) % maxTextures;
  textureImage = "Texture" +textureIndex + ".png";
  surfaceMesh_1.setTexture (textureImage);
}
//----------------------------------------------
void changeResolution(int delta)           // F5
{
  int res[] = {64, 128, 256};
  resMode = (resMode + delta + 3) % 3;
  println("changeResolution: " + resMode);
  int x = res[resMode];
  int y = x;
  surfaceMesh_1.setResolution (x,y);
  surfaceMesh_2.setResolution (x,y);
  surfaceMesh_3.setResolution (x,y);
}
//----------------------------------------------
void startMorphing (int surfaceIndex)
{
  if (doMorphing)    // is morphing still active ? 
  {                  // end morphing first
    surfaceMesh_1.select (surfaceMesh_3.index());
    surfaceMesh_2.select (surfaceMesh_3.index());
  }
  surfaceMesh_3.select(surfaceIndex);
  doMorphing = true;  
  startCount = frameCount;
  morphingPictures = round(frameRate);
}
//----------------------------------------------
void changeMorphing (int deltaIndex)
{
  startMorphing(surfaceMesh_2.index() + deltaIndex);
}
//----------------------------------------------
void toggleUMin() 
{ 
  float u = (surfaceMesh_1.uMin == 0.0) ? -PI : 0.0; 
  surfaceMesh_1.uMin = u;   surfaceMesh_1.calculateMeshPoints(); 
  surfaceMesh_2.uMin = u;   surfaceMesh_2.calculateMeshPoints(); 
  surfaceMesh_3.uMin = u;   surfaceMesh_3.calculateMeshPoints(); 
}
//----------------------------------------------
void toggleVMin()
{ 
  float v = (surfaceMesh_1.vMin == 0.0) ? -PI : 0.0; 
  surfaceMesh_1.vMin = v;   surfaceMesh_1.calculateMeshPoints(); 
  surfaceMesh_2.vMin = v;   surfaceMesh_2.calculateMeshPoints(); 
  surfaceMesh_3.vMin = v;   surfaceMesh_3.calculateMeshPoints(); 
}
//----------------------------------------------
void changeDistance (float delta)
{
  distance = constrain (distance + delta, -400.0, 400.0);
  // println ("d="+distance);
}
//----------------------------------------------
void resetAll()
{
  showAxis = false;
  resetCamera();
  surfaceMesh_1.setLimits(-PI, PI, -PI, PI);
  surfaceMesh_2.setLimits(-PI, PI, -PI, PI);
  surfaceMesh_3.setLimits(-PI, PI, -PI, PI);
}
//----------------------------------------------
//  save current view as PNG picture  
//----------------------------------------------
void savePNG()  
{  
  String surfaceName = "PSurface_" + surfaceMesh_1.paramSurface.name + ".png";
  save(surfaceName);  
  println ("picture saved as '" + surfaceName + "'");  
}
//----------------------------------------------
//  draw main axis:  x=red, y=green, z=blue
//----------------------------------------------
void drawAxis(float len)
{
  pushStyle();
  noLights();
  strokeWeight(3);
  textSize(len / 10.0);
  axis ('x', color(255, 0, 0), new PVector(len, 0.0, 0.0));
  axis ('y', color(0, 255, 0), new PVector(0.0, len, 0.0));
  axis ('z', color(0, 0, 255), new PVector(0.0, 0.0, len));
  popStyle();
}
//----------------------------------------------
void axis (char axisName, color axisColor, PVector dir)
{
  stroke(axisColor);
  line (0, 0, 0, dir.x, dir.y, dir.z);
  stroke(lerpColor(axisColor, 0, 0.4));
  line (0, 0, 0, -dir.x, -dir.y, -dir.z);
  //fill(axisColor);
  //text (axisName, dir.x, dir.y, dir.z);
}
//----------------------------------------------
int numberInputTimeout = 800;    // milliSeconds
int selectionEndTime = 99999999;
int inputNumber = 0;
//----------------------------------------------
void checkSelectionInput()
{
  if ((millis() > selectionEndTime)    // key input timeout?
  || (inputNumber > 9))
  {
    startMorphing (inputNumber);   // 0..n: select surface function
    inputNumber = 0;
    selectionEndTime = 999999999;
  }
}
//----------------------------------------------
void numberPressed()
{ 
  selectionEndTime = millis() + numberInputTimeout;  // end of key input = current time + 1000 msec
  inputNumber = inputNumber * 10 + keyCode-48;
}      
//----------------------------------------------
void keyPressed()
{
  //println ("keyPressed: " +keyCode + " '" + key + "'    coded="+(key == CODED));
  if     ((key >= '0')
       && (key <= '9')) numberPressed();
//  else if (key ==  8 ) changeMorphing (-1);             // backspace
//  else if (key == ' ') changeMorphing (+1);             // blanc
  else if (key == '+') changeDistance (+5.0);           // zoom in
  else if (key == '-') changeDistance (-5.0);           // zoom out
  else if (key == 'a') showAxis = !showAxis;            // axis on/off
  else if (key == 'b') bgIndex = (bgIndex + 1) % bgCount;    // background color
  else if (key == 'B') bgIndex = (bgIndex + bgCount - 1) % bgCount; 
  else if (key == 'c') setRandomColor();
  else if (key == 'h') changeHelp();
  else if (key == 'o') changeResolution(+1);
  else if (key == 'O') changeResolution(-1);
  else if (key == 't') getNextTexture(); 
  else if (key == 'u') toggleUMin();
  else if (key == 'v') toggleVMin();
  else if (key == 'r') resetAll();
  else if (key == 'p') printParametricSurfaceList();
  else if (key == 'g') changeColoring(+1);
  else if (key == 'G') changeColoring(-1);
  else if (key == 's') savePNG();

  if      (keyCode == 38)   rotx -= 0.01;
  else if (keyCode == 40)   rotx += 0.01;
  else if (keyCode == 37) { roty += 0.01;  rotSpeed = +0.001; }
  else if (keyCode == 39) { roty -= 0.01;  rotSpeed = -0.001; }
}
//----------------------------------------------
void keyReleased()
{
  //println ("keyReleased: " +keyCode + " '" + key + "'    coded="+(key == CODED));
  switch (keyCode)
  {        case   8: changeMorphing (-1);      // backspace   
    break; case  32: changeMorphing (+1);      // blanc
    break; case 112: changeHelp();             // F1
    break; case 113: changeColoring(+1);       // F2
    break; case 114: setRandomColor();         // F3
    break; case 115: getNextTexture();         // F4
    break; case 116: changeResolution(+1);     // F5
/*
    break; case 117: switchTransparency();     // F6
    break; case 118: doShininess(-0.1);        // F7
    break; case 119: doShininess(+0.1);        // F8
    break; case 120: toggleRotate();           // F9
    */
    break; case 121: showAxis = !showAxis;     // F10 
  }
}


