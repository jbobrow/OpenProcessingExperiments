

//==========================================================
// sketch:  PG_PlanetMaker.pde
//  v1.0  2012-12-02  initial release
//  v1.1  2013-02-09  android adaptions
//  v1.2  2013-02-24  corrections
//  v1.3  2013-03-14  resizing correction
// tested:  with OpenProcessing v2.0b7 (Java & JavaScript)
//==========================================================
/**
This sketch creates a random planet given by various parameters 
which can be changed by following input commands:
  0..9    select predefined planet
  + / -   change planet radius 
  F1/F2   change planet radius
  F3/F4   change halo size
  F5-F8   change colors...
    F9    random noise pattern
 <blanc>  create a random planet
    a     animation on/off
    c     color palette on/off
    f     frames per second on/off
    p     pause on/off
    r     reset planet
    s     save planet picture
 left mouse button   pause on/off
right mouse button   surface animation on/off 
*/

String title = ">>> PlanetMaker v1.3 <<<";

boolean isPaused = false;
boolean isAnimated = false;
boolean redrawPlanet = false;
boolean showPalette = false;
boolean showFPS = false;
boolean savePNG = false;
boolean savePic = false;
PImage loadedImage, backImage;
Ray ray1 = new Ray(new PVector(0, 0, -1000)
                  ,new PVector(0, 0, 1));
int menuY = 0;
color buttonRectColor = color(180,180,255,130);
color buttonFillColor = color(80,80,120,60);

//----------------------------------------------------------
void setup() 
{
//  size(800, 600);
  size(640, 480);
//  size(480, 320, P2D);
//  orientation(LANDSCAPE);     // only for Android
  println (title);
  selectPlanet (planetId);
  // load and transform backImage to screen size
  loadedImage = loadImage("Space.jpg");

  textAlign(CENTER,CENTER);
  textSize(height/24);
  //textMode(SHAPE);
}
//--------------------------------------------------------------
int iWidth = 10;
int iHeight = 10;
int buttonWidth = 60;
int buttonHeight = 48;
//--------------------------------------------------------------
void checkResizing()
{
  if ((iWidth != width) || (iHeight != height))
  { // window resizes e.g. because of browser zooming
    image(loadedImage, 0, 0, width, height);  // resize to screen
    backImage = get();                        // get from screen
    iWidth = width;
    iHeight = height;
    buttonWidth = width / predefinedPlanets;
    buttonHeight = height / 10;
    //println (width + "*" +height);
  }
}
//----------------------------------------------------------
void draw()
{
  checkResizing();
  // attention: background image must have the same size as your application
  background(backImage);
  if ((isAnimated) || (redrawPlanet)) 
    drawPlanet();
  int px = (width - planetImageSize) / 2;
  int py = (height - planetImageSize) / 2;
  image (planetImage, px+px*sin(frameCount*0.01), py);
  if (savePNG) savePlanet();
  if (savePic) savePicture();
  if (showFPS) { fill(255,122);  text (round(frameRate)+ " fps  "+planetName, 88, buttonHeight + 14); }
  if (showPalette) drawPalette();
  if (menuY > 0) drawMenu();
  redrawPlanet = false;
  if ((mousePressed) && (menuY > 0) && (mouseX < 4*buttonWidth)) 
    mousePressed();
}
//---------------------------------------------------------
void drawPalette()
{
  float v = 0.0;
  color sColor;
  float w2 = width * 0.5;
  for (int xi=0; xi<width; xi++)
  {
    sColor = planetColor1;
    if (xi < w2) 
    {
      v = noise(sq(xi*0.02), 0, 0); 
      sColor = lerpColor(planetColor1, planetColor2, v);
    }
    else
    { 
      v = (xi-w2)*1.0/w2;
      sColor = lerpColor(planetColor1, haloColor, v);
      sColor = lerpColor(0, sColor, 1.0-sq(v));  // fade out halo
    }
    stroke (sColor);
    line(xi, height-buttonHeight-4, xi, height);
  }
}
//----------------------------------------------------------
String[] button2text = {"rad -", "rad +", "halo-", "halo+"
                , "col1", "col2", "halo", "light", "pSize"};

void drawMenu()
{
  strokeWeight(3);
  stroke(buttonRectColor);
  fill(buttonFillColor);
  for (int ni=0; ni < predefinedPlanets; ni++)
//    rect(4 + ni*(width-2) / predefinedPlanets, menuY, buttonWidth-6, buttonHeight,6);
    rect(4 + ni*(width-2) / predefinedPlanets, menuY, buttonWidth-6, buttonHeight);
  // draw button text
  fill(255,122);
  if (menuY < 100)
    for (int ni=0; ni < predefinedPlanets; ni++)
      text (ni+1, (2*ni+1) * width / predefinedPlanets / 2, menuY+buttonHeight/2);
  else 
    for (int ni=0; ni < predefinedPlanets; ni++)
      text (button2text[ni], (2*ni+1) * width / predefinedPlanets / 2, menuY+buttonHeight/2);
}
//----------------------------------------------------------
void togglePause() 
{ 
  isPaused = !isPaused;
  if (isPaused)
    noLoop();
  else loop();
}
//----------------------------------------------------------
void mouseMoved() 
{ 
  prepareMenu();
}
//----------------------------------------------------------
void mouseDragged() 
{ 
  prepareMenu();
}
//----------------------------------------------------------
void prepareMenu() 
{
  if (mouseY < buttonHeight)
    menuY = 4;
  else if (mouseY > height - buttonHeight)
    menuY = height - buttonHeight - 4;
  else menuY = 0;
}
//----------------------------------------------------------
void mousePressed() 
{
  if (mouseY < buttonHeight)
    selectPlanet (1+(mouseX * predefinedPlanets ) / width);  
  else if (mouseY > height - buttonHeight)
    changePlanet((mouseX * predefinedPlanets ) / width);
  else if (mouseX < 50) 
    togglePause();
  else createRandomPlanet(); 
  if (isPaused) redraw();
}
//----------------------------------------------------------
void keyPressed() 
{ 
  if      (key == '-') changePlanet(0);      // sphereRadius -
  else if (key == '+') changePlanet(1);      // sphereRadius +
  else if (keyCode == 112) changePlanet(0);  // F1 sphereRadius -
  else if (keyCode == 113) changePlanet(1);  // F2 sphereRadius +
  else if (keyCode == 114) changePlanet(2);  // F3 halo +
  else if (keyCode == 115) changePlanet(3);  // F4 halo -
  else if (keyCode == 116) changePlanet(4);  // F5 color1
  else if (keyCode == 117) changePlanet(5);  // F6 color2
  else if (keyCode == 118) changePlanet(6);  // F7 halo color
  else if (keyCode == 119) changePlanet(7);  // F8 light color
  else if (keyCode == 120) changePlanet(8);  // F9 noise pattern
  if (isPaused) redraw(); 
} 
//----------------------------------------------------------
void keyReleased() 
{ 
  if     ((key >= '0') && (key <= '9')) selectPlanet(key-48);
  else if (key == ' ') createRandomPlanet();
  else if (key == 'a') isAnimated = !isAnimated;
  else if (key == 'c') showPalette = !showPalette;
  else if (key == 'f') showFPS = !showFPS;
  else if (key == 'p') togglePause();
  else if (key == 'r') resetPlanet();
  else if (key == 's') savePNG = true;
  else if (key == 'S') savePic = true;
  else if (key == 'w') writePlanet();
  if (isPaused) redraw();  
}


