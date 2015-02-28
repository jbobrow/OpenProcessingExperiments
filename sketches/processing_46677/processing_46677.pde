

//-----------------------------------------------------------------------------
// sketch:   PG_MengerSponge.pde
// descr.:   recursive menger sponge variants ...
// date:     v1.0  2011-11-22
//
// View different variations of recursive cube replacement.
// left mouse button to rotate object
// right mouse button to zoom object 
// key commands:
//   1 .. 7   select object
//   + / -    change recursion deep
//     a      toggle light animation  
//     o      toggle rotation
//     p      toggle light drawing
//   F1/F2    change figure
//   F3/F4    change texture
//-----------------------------------------------------------------------------

import processing.opengl.*;   // use opengl
import peasy.*;               // use easy camera

float cubeSize = 400;         // length of cube side
int depth = 3;                // recursion-deep
int figures = 8;              // figure count
int figure = 1;               // current figure: 1=menger 2=cross 3=star, 4=sierpinski
int frame = 0;                // used frame count 
int cubes = 0;                // drawn cubes 
boolean drawLights = false;   // draw lights if true
boolean animate = true;       // run/stop light animation
boolean rotation = false;     // run/stop rotation
int textures = 4;             // texture count (0=noTexture)
int useTexture = 1;           // current texture
PeasyCam cam;                 // easy camera
PCube texturedCube;           // textured cube
int winSize = 800;            // window dimension 

//--------------------------------------------------------
void setup()
{
  size(800,800, !online ? OPENGL : P3D);
//  size(winSize, winSize, P3D);
//  size(winSize, winSize, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  hint(DISABLE_OPENGL_ERROR_REPORT);
  
  println ("PG_MengerSponge:  " + width + '*' + height);

  cam = new PeasyCam(this, 0, 0, 0, 800);
  cam.setRotations( 0.01, 0.03, 0);
  sphereDetail(5,4);
  initTexturedCubes (textures, "MetalRusty.jpg");
  texCube[1].wrapImage ("Beton.jpg");
  texCube[2].wrapImage ("MetalPlate.png");
  texturedCube = new PCube(0);
}
//--------------------------------------------------------
void draw()
{
//  println ("--- DRAW ---");
  background(25);
  if (animate) frame = frameCount;
  setUpLights();
  if (rotation) rotateY(0.01*frameCount);
  cubes = 0;
  switch (figure) 
  { case 2: mengerInvers  (0,0,0, cubeSize, 0, depth);   break;
    case 3: cubeCross     (0,0,0, cubeSize, 0, depth);   break;
    case 4: axisCross     (0,0,0, cubeSize, 0, depth);   break;
    case 5: cubeStar      (0,0,0, cubeSize, 0, depth);   break;
    case 6: cubeFrame     (0,0,0, cubeSize, 0, depth);   break;
    case 7: mengerTower   (0,0,0, cubeSize, 0, depth);   break;
    default: mengerSponge (0,0,0, cubeSize, 0, depth);
  }
  textMode(SCREEN);
  fill(155);
  text("F1/F2 figure=" + figure + "   +/- depth=" + depth
      +"   F3/F4 texture=" + useTexture  + "   cubes=" + cubes, 16, 16); 
  text(int(frameRate) + " fps", width - 50, 16); 
}
//--------------------------------------------------------
void setUpLights()
{
/*
  // draw main axis
  strokeWeight(3);
  stroke(55,55,255);   line(-205,0,0, 205,0,0);
  stroke(55,255,55);   line(0,-205,0, 0,205,0);
  stroke(255,55,55);   line(0,0,-205, 0,0,205);
  noStroke();
*/  
  shininess(2.0); 
  specular(0.4);
  ambientLight(22,22,22);
  directionalLight(144,66,44,  250,170, -90);
  directionalLight(22,66,122,  -250,-170, 90);

  // use 3 inner lights
  float lx = 5+sin(frame*0.02)*150;
  float ly = 5+sin(PI/4+frame*0.02)*150;
  float lz = 5+sin(PI/2+frame*0.02)*150;
  pointLight (255,22,222, lx,0,0);
  pointLight (55,222,22, 0, ly,0);
  pointLight (55,77,222, 0, 0, lz);
  if (drawLights)
  { sphere (255,22,222, lx,0,0, 2);
    sphere (55,222,22,  0,ly,0, 2);
    sphere (55,77,222,  0,0,lz,2 );
  }  

  // use 2 outer lights
  lx = sin(frame*0.02)*350;
  lz = cos(frame*0.02)*350;
  pointLight(55,122,255,  lx, lz, lz);
  pointLight(255,22,222,  -lx, -lz, lz);
  if (drawLights)
  { sphere (55,122,255, lx, lz, lz, 4); 
    sphere (255,22,222, -lx, -lz, lz, 4);
  }
  noStroke();
}

//--------------------------------------------------------
// draw a cube
//--------------------------------------------------------
void drawBox (float xpos, float ypos, float zpos, float sideLen)
{
  //  println ("box: " + xpos + ',' + ypos + ','  + zpos + ',' + sideLen);
  if (useTexture == 0)               // no texture?
  {
    pushMatrix();
      translate (xpos, ypos, zpos);
      fill(150); 
      box(sideLen);
      //sphere(sideLen/2);
    popMatrix();
  }
  else                              // draw textured cube 
  { texturedCube.setPosition (xpos, ypos, zpos);
    texturedCube.draw (sideLen/2.0);
  }
  cubes++;
}
//--------------------------------------------------------
// 1: draw menger sponge
//--------------------------------------------------------
void mengerSponge (float xpos, float ypos, float zpos, 
                   float sideLen, int deep, int repetitions)
{
  if (++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  {
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    {
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      {
        if( x == 0 && y == 0) continue;
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if (z == 0)
          {
            if (x == 0) continue;
            if (y == 0) continue;
          }  
          mengerSponge (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// 2: draw inverted menger sponge
//--------------------------------------------------------
void mengerInvers (float xpos, float ypos, float zpos, 
                   float sideLen, int deep, int repetitions)
{
  if (++deep < repetitions) 
  {
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    { 
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      { 
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if ((x == 0 && y == 0) 
           || (x == 0 && z == 0) 
           || (y == 0 && z == 0))
          {
            if (x == 0 && y == 0 && z == 0) continue; // inner cube?
            drawBox (xp, yp, zpos + sideLen*z, sideLen);
          }
          else mengerInvers (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } } 

//--------------------------------------------------------
// 3: draw cube cross
//--------------------------------------------------------
void cubeCross (float xpos, float ypos, float zpos, 
                float sideLen, int deep, int repetitions)
{
  if (++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  { 
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    { 
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      { 
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if (x == 0 || y == 0 || z == 0) 
          cubeCross (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// 4: draw axis cross 
//--------------------------------------------------------
void axisCross (float xpos, float ypos, float zpos, 
                float sideLen, int deep, int repetitions)
{
  if (++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  {
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    {
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      {
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if (x != 0 && y != 0) continue;
          if (x != 0 && z != 0) continue;
          if (y != 0 && z != 0) continue;
          axisCross (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// 5: draw cube star
//--------------------------------------------------------
void cubeStar (float xpos, float ypos, float zpos, 
               float sideLen, int deep, int repetitions)
{
  if (++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  {
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    {
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      {
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if ((x != 0 && y != 0 && z != 0)
            ||(x == 0 && y == 0 && z == 0))
          cubeStar (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// 6: draw cube frame with cube crosses
//--------------------------------------------------------
void cubeFrame (float xpos, float ypos, float zpos, 
                  float sideLen, int deep, int repetitions)
{
  if( ++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  { 
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    { 
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      { 
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if ((x == 0 && y == 0) 
           || (x == 0 && z == 0) 
           || (y == 0 && z == 0)) continue;
          cubeCross (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// 7: draw menger inverted
//--------------------------------------------------------
void mengerTower (float xpos, float ypos, float zpos, 
                  float sideLen, int deep, int repetitions)
{
  if( ++deep >= repetitions) 
    drawBox (xpos, ypos, zpos, sideLen);
  else 
  { 
    sideLen /= 3.0;
    for(int x = -1; x <= 1; x++)
    { 
      float xp = xpos + sideLen * x;
      for(int y = -1; y <= 1; y++)
      { 
        float yp = ypos + sideLen * y;
        for(int z = -1; z <= 1; z++)
        {
          if (x == 0 || z == 0) // || z == 0) 
             drawBox (xpos, ypos, zpos, sideLen);
          else mengerTower (xp, yp, zpos + sideLen*z, sideLen, deep, repetitions);
} } } } }

//--------------------------------------------------------
// draw a sphere with r,g,b color at x, y, z, with given radius
//--------------------------------------------------------
void sphere(int r, int g, int b, float x, float y, float z, float radius)
{
  sphereDetail(12);
  stroke(r,g,b);
  fill (r,g,b);
  pushMatrix();
    translate(x, y, z);
    sphere(radius);
  popMatrix();
}
//--------------------------------------------------------
// draw a sphere with gray color at x, y, z, with given radius
//--------------------------------------------------------
void sphere(float x, float y, float z, float radius)
{
  pushMatrix();
    translate(x, y, z);
    noStroke();
    fill(150); 
    sphere(radius);
  popMatrix();
}
//--------------------------------------------------------
//  change cyclic figure selection 1..n
//--------------------------------------------------------
void changeFigure (int delta)   
{
  figure = 1 + (figure-1+delta+figures) % figures;
  changeDepth (0);
}
//--------------------------------------------------------
//  change recursion depth 1..5
//--------------------------------------------------------
void changeDepth (int delta)   
{
  // make sure, that the recursion-level is not too high
  depth = constrain(depth+delta,1,5);
  if (depth > 5) depth = 5; 
  if ( figure == 1  
    || figure == 2
    || figure == 6
    || figure == 7)
  if (depth > 4) depth = 4; 
}
//--------------------------------------------------------
//  change cyclic texture selection 0..n
//--------------------------------------------------------
void changeTexture (int delta)   
{
  useTexture = (useTexture+delta+textures) % textures;
  texturedCube = new PCube(useTexture-1);
}
//--------------------------------------------------------
// handle keyboard input
//--------------------------------------------------------
void keyReleased()
{
//  println ("k="+int(key)+"  c="+keyCode); 
  if ((key >= '1') && (key <= '7'))
    figure = int(key)-48;  // select figure
  else switch (key)
  {        case ' ': changeFigure(+1);  // blanc:  figure + 1
    break; case   8: changeFigure(-1);  // delete: figure - 1
    break; case  43: changeDepth (+1);  // [+]:  depth + 1
    break; case  45: changeDepth (-1);  // [-]:  depth - 1
    break; case 'a': animate = ! animate;            
    break; case 'o': rotation = ! rotation;  
    break; case 'p': drawLights = ! drawLights;  
  }
  if( key == CODED)
  { switch (keyCode)
    {        case UP:    depth++;
      break; case DOWN:  if (depth > 1) depth--;
      break; case LEFT:  changeFigure(-1);
      break; case RIGHT: changeFigure(+1);
      break; case 112:   changeFigure(-1);    // F1
      break; case 113:   changeFigure(+1);    // F2
      break; case 114:   changeTexture (-1);  // F3
      break; case 115:   changeTexture (+1);  // F4
  } }
}


