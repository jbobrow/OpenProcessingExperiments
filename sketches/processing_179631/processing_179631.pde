
//=========================================================
// sketch: PG_Shaders3d.pde - by Gerd Platl
//
/**
 This sketch is for an easy selection of some 3d shader examples.
 The shader examples are written in 'OpenGL Shading Language'. 
 They are executed directly on the GPU of modern graphic cards.
 Therefore they are executed much more faster than using a graphics API. 
 The Shader examples are loaded from data/*.glsl files.
 
 !!! Note: do not run under processing.js - so run it offline !!!
*/
//
// Examples taken from:
//  * GLSL Sandbox http://glslsandbox.com/    // use it to comile your own GLSL examples
//  * Shadertoy https://www.shadertoy.com/
//  * http://www.iquilezles.org/apps/shadertoy/index2.html
// ingenious regards to all shader artists!!!
// 
// v0.1  2014-12-19  start coding 
// v1.0  2014-12-31  inital release
// v1.1  2014-01-02  texture usage added
// v1.2  2014-01-11  bug fixing
//
// tested with:      processing v2.2.1
// 
// Tags:  GLSL, GPU, shader, 3d, animation, ray, marching, tracing, real time, 
//        shadertoy, glslsandbox 
//
// more infos at...
//   http://en.wikipedia.org/wiki/OpenGL_Shading_Language
//   http://www.opengl.org/registry/doc/GLSLangSpec.4.40.pdf
//   https://processing.org/tutorials/pshader/
//   https://codeanticode.wordpress.com/2012/08/02/shaders-in-processing-2-0-part/
//=========================================================

final boolean JavaScript = true;

final String title = ">>> PG_Shaders3d v1.2 <<<";

final String menuFilename = "ShaderMenu.png";

int xtiles = 4;
int ytiles = 4;
int tiles = xtiles * ytiles;
int tileIndex = 0;

String[] shaderList 
  = { "SeaNoise"
     ,"EdgeAntialising"
     ,"GoldNugget"
     ,"RayMarchingPrimitives"
     ,"ToTheRoadOfRibbon"
     ,"CrazySprings"
     ,"ChainsAndGears"
     ,"Catacombs"
     ,"Grassland"
     ,"Clouds"
     ,"SunsetOnTheSea"
     ,"GeneratorsRedux"
     ,"TheRoadToHell"
     ,"TruchetTentacles"
     ,"AlienThorns"
     ,"Apollonian"
    };

int shaderCount = shaderList.length;
int shaderIndex = -1;
String picName = "data/ShadersMenu.png";
String shaderName = shaderList[0];
PShader shader;
boolean animate = true;

// textures
String[] textureList 
  = { "texture1.jpg"
     ,"texture2.jpg"
     ,"texture3.jpg"
     ,"texture4.jpg"
     ,"noise1.jpg"
     ,"noise2.jpg"
     ,"noise3.jpg"
     ,"noise4.jpg"
    };
int textureCount = textureList.length;
int textureIndex = 0;
int textureNumber = 0;  // 0..3
String textureName = "textures/"+textureList[0];
// current textures
PImage texture1;
PImage texture2;
PImage texture3;
PImage texture4;

// display modes
final int dm_load = 0;
final int dm_make = 1;
final int dm_menu = 2;
final int dm_draw = 3;
int displayMode = dm_load;

PImage menuImage;
PImage backImage;

//---------------------------------------------------------
void setup() 
{
  size(600, 400, P2D);
  println (title);
  if (!JavaScript) 
    frame.setResizable(true);  // do not work in JavaScript
  noStroke();
  initMenu();
  initTexture();
}
//---------------------------------------------------------
void draw() 
{
  //println ("draw:  displayMode="+displayMode + "  " + round(frameRate) + "   " + frameCount);
  switch (displayMode)
  {        case dm_load:  loadMenu();
    break; case dm_make:  makeMenu();
    break; case dm_menu:  showMenu();
    break; case dm_draw:  drawShader();  
  }
}

//=========================================================
// MENU
//=========================================================

int tileSizeX = 150;
int tileSizeY = 100;

//---------------------------------------------------------
// try to load menu image and if not exist create new menu 
//---------------------------------------------------------
void initMenu()
{
  tileSizeX = width / xtiles;
  tileSizeY = height / ytiles;
  println (xtiles + "*" + ytiles + "  "+tileSizeX + "*" + tileSizeY);
}
//---------------------------------------------------------
// try to load menu image and if not exist create new menu 
//---------------------------------------------------------
void loadMenu()
{
  menuImage = loadImage(menuFilename);
  //println ("menu: " + menuImage.width + "*" + menuImage.height);
  if (menuImage != null)
  {
    backImage = loadImage(menuFilename);
    //println ("back: " + backImage.width + "*" + backImage.height);
    displayMode = dm_menu;
  }
  else
  {
    menuImage = new PImage (600, 400);
    backImage = new PImage (600, 400);
    displayMode = dm_make;
  }
}
//---------------------------------------------------------
// create new menu picture 
//---------------------------------------------------------
void createNewMenu()
{
  shaderIndex = -1;
  selectShader(0);  
  drawShader();
  displayMode = dm_make;
}
//---------------------------------------------------------
// create new menu picture 
//---------------------------------------------------------
void makeMenu()
{
  int dx = (tileIndex % xtiles) * tileSizeX;
  int dy = (tileIndex / xtiles) * tileSizeY;
  println ("MakeMenu: " + shaderIndex + "  "  + dx+","+dy);
  if (tileIndex < tiles)
  {
    selectShader(tileIndex);
    drawShader();
    loadPixels();
    PImage tempImage = get();          // get shader picture
    tempImage.resize (tileSizeX, tileSizeY);
    menuImage.set(dx,dy,tempImage);    // copy tile to menu image
    if (frameCount % 2 == 1)           // attention: very tricky !!!
    {
      tileIndex++;
      selectShader (tileIndex);
    }
  }
  else
  {                              // save menu picture
    println ("saving '" + menuFilename + "'  "+menuImage.width + "*"+menuImage.height);
    set(0,0,menuImage);
    save (menuFilename);
    backImage = loadImage(menuFilename);
    tileIndex = 0;
    displayMode = dm_menu;
  }
}
//---------------------------------------------------------
// show menu pictures and wait for shader selection
//---------------------------------------------------------
void showMenu()
{
  drawBackground();
  int currentIndex = getShaderIndex();
  
  if ((frameCount < 500) && (displayMode == dm_menu))
  {
    shadowText2 (" 'a' to toggle animation",   4, 20);
    shadowText2 (" 'm' make menu picture",     4, 40);
    shadowText2 (" 'r' reload current shader", 4, 60);
    shadowText2 (" 's' to save picture",       4, 80);
  }
 
  fill(0);
  if (JavaScript) 
    shadowText ((currentIndex+1) + ": " + shaderList[currentIndex], 4, height-8);
  else 
    frame.setTitle ((currentIndex+1) + ": " + shaderList[currentIndex]);     
}
//---------------------------------------------------------
// draw background image and resize it if necessary
//---------------------------------------------------------
void drawBackground()
{
  //println ("drawBackground: ");
  if (menuImage == null)
    background(0);
  else 
  { 
    if ((backImage.width != width) || (backImage.height != height))
    {
      //println (width + "*" + height + "  -  " + backImage.width + "*" + backImage.height);
      backImage.resize (width, height);
      backImage.copy(menuImage, 0,0, menuImage.width, menuImage.height
                              , 0,0, width, height);   // copy 
      //println (width + "*" + height + "  -  " + backImage.width + "*" + backImage.height);
    }
    //background(backImage);
    set(0,0,backImage);
//    copy(menuImage, 0,0, menuImage.width, menuImage.height
//                  , 0,0, width, height);   // copy to window
  }
}
//---------------------------------------------------------
void shadowText (String txt, int x, int y)
{
  fill (  0);   text(txt,x,y);  
  fill (255);   text(txt,x-1,y-1);  
}
//---------------------------------------------------------
void shadowText2 (String txt, int x, int y)
{
  int transp = min (500-frameCount, 255); 
  fill (  0, transp);   text(txt,x,y);  
  fill (255, transp);   text(txt,x-1,y-1);  
}

//=========================================================
// SHADER
//=========================================================

//---------------------------------------------------------
// return shader index of current mouse position
//---------------------------------------------------------
int getShaderIndex()      // return 0 .. shaders-1
{ 
  return ( floor((mouseX * xtiles) / width) 
  + xtiles * floor((mouseY * ytiles) / height) ) % shaderCount; 
}
//---------------------------------------------------------
// load shader program by name
//---------------------------------------------------------
void selectShader(String name)
{
  picName = "data/" + name +".png";
  shaderName = name;
  try
  { 
    shader = loadShader(shaderName +".glsl"); 
  }
  catch (Exception ex) 
  { selectShader (shaderIndex + 1); }
}
//---------------------------------------------------------
// load shader program by index
//---------------------------------------------------------
void selectShader(int nameIndex)    // 0..15
{
  int newIndex = (nameIndex + shaderCount)  % shaderCount;
  if (newIndex == shaderIndex) return;
  shaderIndex = newIndex;
  shaderName = shaderList[shaderIndex];
  println ((shaderIndex+1) + ": " + shaderName);
  selectShader (shaderName);
}

//---------------------------------------------------------
// reload shader if shader has changed
//---------------------------------------------------------
void reloadShader()
{
  selectShader (shaderList[shaderIndex]);
}

//---------------------------------------------------------
//  execute current shader program in full screen 
//---------------------------------------------------------
void drawShader() 
{
  if (JavaScript)
  {
    set (0,0, menuImage);
    fill(0);
    textSize(22);
    shadowText("Sorry, Shaders are NOT running as JavaScript ?!?", 32, 220);
    return;
  }
  frame.setTitle ((shaderIndex+1) + ": " + shaderName + "  fps: " + round(frameRate));     

  rect(0, 0, width, height);
  shader.set("resolution", float(width), float(height));
  shader.set("mouse", float(mouseX), float(mouseY), mousePressed ? 1.0 : 0.0);
  shader.set("texture", texture1);  
  shader.set("texture2", texture2);  
  shader.set("texture3", texture3);  
  shader.set("texture4", texture4);  

  if (animate)
  { 
    //shader.set("time", (millis() / 1000.0));
    shader.set("time", frameCount / 100.0);
  }
  try
  {
    shader(shader);   // execute shader program
  }
  catch (Exception ex)      //??? do not work ???
  { displayMode = dm_menu; }
}

//=========================================================
// TEXTURE
//=========================================================

//---------------------------------------------------------
// load 4 default textures
//---------------------------------------------------------
void initTexture()
{
  //texture1 = loadImage("textures/" + textureList[0]);
  texture2 = loadImage("textures/" + textureList[1]);
  texture3 = loadImage("textures/" + textureList[2]);
  texture4 = loadImage("textures/" + textureList[3]);
  loadTexture(0);
}
//---------------------------------------------------------
// load texture with given index from file
//---------------------------------------------------------
void loadTexture(int index)
{
  textureIndex = textureIndex % textureCount;
  textureName = textureList[textureIndex];
  println ((textureIndex+1) + ": " + textureName);
  switch (textureNumber)
  {        case 0: texture1 = loadImage("textures/" + textureName);
    break; case 1: texture2 = loadImage("textures/" + textureName);
    break; case 2: texture3 = loadImage("textures/" + textureName);
    break; case 3: texture4 = loadImage("textures/" + textureName);
  }
}
//---------------------------------------------------------
// load next texture from file
//---------------------------------------------------------
void loadNextTexture()
{
  loadTexture (textureIndex++);
}
//---------------------------------------------------------
void changeTextureNumber()
{
  textureNumber = (textureNumber + 1) % 4;
  loadTexture (textureIndex);
}

//=========================================================
// INPUT
//=========================================================

//---------------------------------------------------------
void keyPressed()
{
  //println (" keyPressed: " + keyCode  + " '" + key + "'  " + int(key)+ "    coded="+(key == CODED));
  
  if ((key >= '0') && (key <= '9')) 
    selectShader(key-48);
  else switch (key) 
  {        case 's': println ("saving '" + picName + "'");   save (picName);
    break; case 'a': animate = !animate;             // animate on/off
    break; case 'p': animate = !animate;             // pause on/off
    break; case 'm': createNewMenu();                // new menu
    break; case 'r': reloadShader();                 // reload
    break; case 'u': reloadShader();                 // update = reload
    break; case 't': loadNextTexture();              // next texture
    break; case 'T': changeTextureNumber();          // change texture: 0..3
    break; case ' ': selectShader (shaderIndex +1);  // next shader
    break; case BACKSPACE: selectShader (shaderIndex -1);  // previous shader
    break; case       ESC: if (displayMode == dm_draw)     // ESC
                     { key = 0; displayMode = dm_menu; }   // menu input
    default: ;
  }
}
//---------------------------------------------------------
void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    if (displayMode == dm_draw) displayMode = dm_menu;  // go back to menu
  }
  else
  switch (displayMode)
  {        case dm_load: ;
    break; case dm_menu: selectShader (getShaderIndex());  displayMode = dm_draw;
//    break; case dm_draw: selectShader (shaderIndex + 1);   
  }
}
