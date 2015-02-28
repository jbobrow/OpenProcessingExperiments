

//----------------------------------------------------------
// sketch:  PG_RoughSea.pde
// v1.0  2012-06-12  inital release
// v1.1  2012-07-03  added mouse handling
//                   corrections for resizing in browser
// v1.2  2013-03-31  sky/cloud contrast improved
// v1.3  2013-05-30  animationMode added
//       2013-11-27  working on...
//
// Greetings and credits go to
//   Jim Bumgardner for his 'Mousy Clouds' sketch #1273 and to  
//   Sam Hinton for his 'lowlevel' sketch #3614,
//   who inspired me for this sketch. 
//
// key input:
//      i      toogle information
//      s      save as picture 'RoughSea.png'  
//   <blanc>   change animation mode (0..3)
// left/right  change falloff value
//   up/down   change octave value
//----------------------------------------------------------
int w, h;                 // display dimension 
boolean showInfo = false;
int animationMode = 0;    // current display mode
int maxAnimModes = 4;
int   noiseOctaves = 4;
float noiseFalloff = 0.5;
color waveColor = color (66, 111, 255);
//----------------------------------------------------------
void setup()
{
  //orientation(LANDSCAPE);     // Android
//  size(1200, 800, P3D);
  size(800, 480, P3D);        // Android
//  size(480, 320, P3D);        // Android
//  size(screen.width, screen.height, P3D);  // v1.5.1  Android 
//  size(displayWidth, displayHeight, P3D);  // v2.1  Android 
  textSize(18);
  noStroke();
  noiseDetail(noiseOctaves, noiseFalloff);
}
//----------------------------------------------------------
void draw()
{
  background(waveColor); // v1.5.1 clear zbuffer
  w = width;
  h = height;
  lights();
  drawSky();
  drawWaves();
  if (showInfo) 
  {  
    textMode (SCREEN);  //v1.5.1
    colorMode(RGB, 255);
    fill (255);
    if (animationMode == 3)
    text ("paused", 20, 30, 20);
    else text (round(frameRate) 
       + " fps  octaves=" + noiseOctaves
       + "  falloff=" + nf(noiseFalloff,0,2) 
       + "  wds=" + wds , 20, 30, 20);
  }
  updatePause();
}
//----------------------------------------------------------
void changeDisplayMode()
{
   animationMode = (animationMode +1) % maxAnimModes;
}
//----------------------------------------------------------
void updatePause()
{
   if (animationMode >= 3) noLoop();
   else loop();
}
//----------------------------------------------------------
void changeNoiseDetails (int deltaOctaves, float deltaFalloff)
{
  noiseOctaves = constrain (noiseOctaves + deltaOctaves, 1, 10);
  noiseFalloff = constrain (noiseFalloff + deltaFalloff, 0.3, 0.8);
  println ("Octaves="+noiseOctaves+"  Falloff="+nf(noiseFalloff,0,2));
  noiseDetail(noiseOctaves, noiseFalloff);
}
//----------------------------------------------------------
void resetAll()
{
  noiseOctaves = 4;
  noiseFalloff = 0.5;
  wds = 4;
}
//----------------------------------------------------------
void keyPressed()
{
  loop();
  //println (keyCode + " '" + key + "'    coded="+(key == CODED));
  if (key == CODED)
  {
    if      (keyCode ==  LEFT) changeNoiseDetails (-1, 0.0);
    else if (keyCode == RIGHT) changeNoiseDetails (+1, 0.0);
    else if (keyCode ==    UP) changeNoiseDetails ( 0, +0.01);
    else if (keyCode ==  DOWN) changeNoiseDetails ( 0, -0.01);
  }
  else if (key == ' ') changeDisplayMode();
  else if (key == 'f') showInfo = !showInfo;
  else if (key == 'i') showInfo = !showInfo;
  else if (key == 's') save("RoughSea.png");
  else if (key == '+') wds = constrain (wds+2, 4,20);
  else if (key == '-') wds = constrain (wds-2, 4,20);
  else if (key == 'r') resetAll();
}
//----------------------------------------------------------
void mousePressed()
{
  loop();
  if (mouseY < 100) showInfo = !showInfo;
  else changeDisplayMode();
}

//========================== sky ===========================

int skyHeight = 320;   // in pixel
int ps = 5;            // pixel step
float xNoise = 0.006;  // noise steps 
float yNoise = 0.009;
float ox, oy;          // cloud origin
color[] colors = new color[30000];
float time = 0.0;      // for cloud animation

//----------------------------------------------------------
void drawSky()
{
  skyHeight = (height*55)/100;   // in pixel
  colorMode(HSB, 1);
  if ((animationMode % 2) == 0)  // 0,2:on, 1,3:off
  { 
    time = millis() * 0.0001;  // for cloud animation
    ox += 0.005;   // move cloud origin
    oy += 0.004;
  }
  int ni = 0;
  int n = w/ps+2;
  float xstep = xNoise;
  float ystep = yNoise;
  beginShape(QUADS);
  for (int y = 0; y < skyHeight+50; y+=ps)
  {
    xstep *= 1.01;   // perspective trick
    ystep *= 1.02;   
    float vy = oy + y*ystep;
    float xoff = 1000 -ox - (w+ps)*0.5*xstep;
    for (int x = 0; x < w+ps; x+=ps)
    {
      float v = noise(xoff + x*xstep, vy, time);
      if (v < 0.3) v = 0.0;              // reduce clouds
      else v = (v-0.3) / 0.7;
      if (ni >= colors.length) break;    // prevent crash
      colors[ni] = color(0.65 - y * 0.1 / height, 0.75-v, 0.5+v*v);
      if ((x > 0) && (y > 0))
      { 
        fill(colors[ni-n]);     vertex(x-ps, y-ps, 20);  
        fill(colors[ni-n+1]);   vertex(x, y-ps, 20);
        fill(colors[ni]);       vertex(x, y, 20);
        fill(colors[ni-1]);     vertex(x-ps, y, 20);
      }
      ni++;
    }
  }
  endShape();
}

//========================= waves ==========================

int wds = 4;          // wave detail step 
float r, j = 0.008;   // wave step
int x1, y1, x2, y2;

//----------------------------------------------------------
void drawWaves()
{
  colorMode(RGB, 256);
  fill(waveColor);
  for (int i=0; i<w*h; i+=wds)
  {
    x1 = i%w;  x2 = x1+wds;
    y1 = i/w;  y2 = y1+wds;
    
    float v1 = nv(y1*w+x1);
    float v2 = nv(y2*w+x2);
    beginShape(TRIANGLES);
    // triangle 1
    vertex(x1, v1, y1);
    vertex(x2, nv(y1*w+x2), y1);
    vertex(x2, v2, y2);
    // triangle 2
    vertex(x2, v2, y2);
    vertex(x1, nv(y2*w+x1), y2);
    vertex(x1, v1, y1);
    endShape();

    i += (x1==0) ? w*(wds-1) : 0;
  }
  // do wave animation
  if (animationMode < 2) r -= j;  // 0,1:on, 2,3:off
}
//----------------------------------------------------------
float nv(float i)  // get noise value
{ 
  return skyHeight -wds*4 + noise(i%w*j, i*j/w+r)*wds*10;
}


