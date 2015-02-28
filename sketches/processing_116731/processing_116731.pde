
/*

 Name      :  Voxel Landscape
 Notes     :  Integer based for speed. Variable degrees of freedom.  Distance Fog
 
 "The ray casting approach for terrain rendering
 assumes that the terrain is modeled by a Digital Elevation
 Map (DEM) and Digital Color Map (DCM). The DEM
 associates an elevation to each position (x,y) in the
 terrain and the DCM associates a color value to each
 position in the terrain. These maps are sampling of a
 height and color field in a uniform grid. A column of the
 terrain raised with a height and color taken from the
 DEM and DCM, respectively, is called a voxel"
 
 Press arrow keys to move around.
 
 Press 'T' for TRON mode!
 Press 'L' for Landscape mode! 
 
 references:
 http://www.flipcode.com/voxtut/
 http://www.bundysoft.com/L3DT/downloads/examples/#maps
 http://www.tecgraf.puc-rio.br/publications/artigo_1997_realtime_rendering.pdf
 
 */

int RENDERWIDTH = 640;
int RENDERHEIGHT = 480;
int RENDERLENGTH = (RENDERWIDTH * RENDERHEIGHT)-RENDERWIDTH;

int MAPWIDTH = 512;
int MAPWIDTH_MIN_1 = MAPWIDTH - 1;
int MAPSIZE = MAPWIDTH * MAPWIDTH;
int MAPSHIFT = 9;

int sinTable[];
int cosTable[];

int heightMap[];
int colorLut[];

int playerX = 0;
int playerY = 120;
int playerZ = 350 << 12;        // higher number = overhead view
int playerDistance = 277 << 11; // how tall the mountains are
int playerSpeed =2;            // positiver number faster forward
int playerAngle = 2700;            // which direction facing
int angleSpeed = 0;              // positive number turns right
int viewportHeight = 100 << 11;  // higher number = view more sky

PImage voxelmap;
PImage colormap;

void setup() {
  size(RENDERWIDTH, RENDERHEIGHT);

  loadMap("height.png", "lines.png");

  sinTable = new int[3600];
  cosTable = new int[3600];
  for (int i=0; i<3600; i++) {
    sinTable[i] = toFP((float)Math.sin(2f*3.141593f*i/3600f));
    cosTable[i] = toFP((float)Math.cos(2f*3.141593f*i/3600f));
  }
  colorLut = new int[65536];
  for (int i=0; i<256; i++) {
    for (int j=0; j<256; j++) {
      int idx = (i << 8) + j;
      float c = (float)i * (float)j/256f;
      colorLut[idx] = (int)Math.round(c);
    }
  }  
}
int frameC = 0;

void loadMap(String DEM, String DCM){
  voxelmap = loadImage(DEM);
  colormap = loadImage(DCM);
  heightMap = new int[MAPSIZE];
  int k = 0;
  do {
    int aByte = (0x000000FF & ((int)voxelmap.pixels[k]));
    heightMap[k] = aByte << 12 ;
  } 
  while(++k < MAPSIZE);
}

void draw() {
  loadPixels();
  renderVoxel(playerX, playerY, playerZ, playerAngle, playerDistance);
  updatePixels();
}

int j3,x,y,z,m,dz;

public void renderVoxel(int eyeX, int eyeY, int eyeZ, int arc, int dpk)
{ 
  playerAngle += angleSpeed;
  if (playerAngle < 0)
    playerAngle += 3600;
  else if (playerAngle >= 3600)
    playerAngle -= 3600;
  if (frameC > 18) {
    playerSpeed = 3;
    angleSpeed = 0;
    frameC = 0;
  }
  frameC++;

  int cos = cosTable[playerAngle];
  int sin = sinTable[playerAngle];
  playerX += cos*playerSpeed;
  playerY += sin*playerSpeed;

  Arrays.fill(pixels, 0xFF000000);  // empty the screen

  int colAngle = arc - (RENDERWIDTH>>1); // view from angle-30 to angle+30
  if (colAngle < 0)
    colAngle += 3600;
  int col = 0;
  int pitch = eyeZ - viewportHeight;
  int invdpk =  28; //dpk/20008;

  do
  {
    j3 = RENDERLENGTH + col;
    int cosA = cosTable[colAngle];
    int sinA = sinTable[colAngle];
    z = eyeZ;
    x = eyeX;
    y = eyeY;
    dz = 0;
    m = pitch / dpk << 12;

    // bottom part of landscape requires no fog blending
    iterate(sinA,  cosA, invdpk,  RENDERHEIGHT-256,true);
    iterate(sinA,  cosA, invdpk,  256,false);  

    if (++colAngle >= 3600)
      colAngle = 0;
  } 
  while (++col < RENDERWIDTH);
}

void iterate( int sinA, int cosA, int invdpk, int amount, boolean blendIt){

  for (int i=0; i<amount; i++) 	// abscis iteration
  {
    y += sinA;
    x += cosA;
    z -= m;
    dz += invdpk;
    int xm = (x >> 12) & MAPWIDTH_MIN_1;  // mod 512
    int ym = (y >> 12) & MAPWIDTH_MIN_1;  // mod 512
    int idx = (ym << MAPSHIFT) + xm;
    int hi = heightMap[idx] ;
    while (hi > z && j3 > 0) {
      int texel = colormap.pixels[idx] ;
      pixels[j3] = (blendIt) ? texel : blend_black(texel,0x00000000,i);
      j3 -= RENDERWIDTH;
      m -= invdpk;
      z += dz;
    } 
  }  
}

// fast
private final int blend_lut(int c1, int c2, int f) {
  int r1 = (c1 & 0x00FF0000) >> 16;
  int r2 = (c2 & 0x00FF0000) >> 16;
  int r = (colorLut[(r1 << 8) + (255 - f)] + colorLut[(r2 << 8) + f]) << 16;

  int g1 = (c1 & 0x0000FF00) >> 8;
  int g2 = (c2 & 0x0000FF00) >> 8;
  int g = (colorLut[(g1 << 8) + (255 - f)] + colorLut[(g2 << 8) + f]) << 8;

  int b1 = (c1 & 0x000000FF);
  int b2 = (c2 & 0x000000FF);
  int b = colorLut[(b1 << 8) + (255 - f)] + colorLut[(b2 << 8) + f];

  return 0xFF000000 + r + g + b;
}

// faster
private final int blend_calc(int c1, int c2, int nAlpha) {
  if ( 0 == nAlpha )
    return c1;

  if ( 255 == nAlpha )
    return c2;

  int nInvAlpha = 255-nAlpha;

  int r1 = (c1 & 0x00FF0000) >> 16;
  int r2 = (c2 & 0x00FF0000) >> 16;
  int r  = ( r2   * nAlpha + r1 * nInvAlpha   )>>8;

  int g1 = (c1 & 0x0000FF00) >> 8;
  int g2 = (c2 & 0x0000FF00) >> 8;
  int g  = ( g2 * nAlpha + g1 * nInvAlpha )>>8;

  int b1 = (c1 & 0x000000FF);
  int b2 = (c2 & 0x000000FF);
  int  b = ( b2  * nAlpha + b1 * nInvAlpha  )>>8;
  return 0xff000000 | r << 16 | g << 8 | b;
}

// fastest - blend to black
private final int blend_black(int c1, int c2, int nAlpha) {
  int nInvAlpha = 255-nAlpha;

  int r1 = (c1 & 0x00FF0000) >> 16;
  int r  = (r1 * nInvAlpha ) >> 8;

  int g1 = (c1 & 0x0000FF00) >> 8;
  int g  = (g1 * nInvAlpha ) >> 8;

  int b1 = (c1 & 0x000000FF);
  int  b = (b1 * nInvAlpha ) >> 8;
  return 0xff000000 | r << 16 | g << 8 | b;
}

public static int toFP(float f)
{
  float absf = Math.abs(f);
  int k = Math.round(absf);
  int l = Math.round((absf - k) * 10000);
  int i1 = (k << 12) + (l << 12) / 10000;
  if (f < 0.0f) {
    i1 = -1 * i1;
  }
  return i1;
}

// steering enable
void keyPressed() {

  switch(keyCode) { 

  case UP:
    frameC=0;
    playerSpeed = 0;
    playerSpeed+=10;
    break; 

  case DOWN:
    frameC=0;
    playerSpeed = 0;
    playerSpeed-=10;
    break; 

  case LEFT:
    frameC=0;
    playerSpeed = 0;
    angleSpeed = -45;
    break; 

  case RIGHT:
    frameC=0;
    playerSpeed = 0;
    angleSpeed = 45;
    break; 

  case 84:
    loadMap("height.png", "lines.png");  
    break;

  case 76:
    loadMap("height.jpg", "lines.jpg");  
    break;

  default: // any other key 
    println(frameRate);
    break;
  }
}




