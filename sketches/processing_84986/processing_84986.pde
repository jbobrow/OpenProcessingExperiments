
///-----------------------------------------------------------------------------
///
/// author: (c) thomas diewald
/// date: 11.01.2013
/// Menger Sponge
///
///-----------------------------------------------------------------------------
/// FACE ENCODING:
/// save current depth - used for indexing color LUT - of currently active
/// faces, using 4 bits (max 16 colors).
/// only faces, that are not already used by parents blocks can be set.
/// ... parents block-faces are always the most outer ones.
/// 
/// block:     28     24     20    16     12     8     4     0
/// content:   -   DEPTH     XN    XP     YN    YP    ZN    ZP
/// integer: 0000   0000   0000  0000   0000  0000  0000  0000
///
/// this mask is also used to eliminate/ignore faces that are not part of the 
/// surface -> the according face-bits are set to 0.
/// this reduces the amount of quads to draw A LOT.
///
/// the depth is also saved in at the 7th block (at bit 24) ... for each voxel.
/// 
/// FACE-COUNT:
/// 
///            max  |   optimized |        diff
///  1)          6  |          6  |          -0
///  2)        120  |         72  |         -48
///  3)      2.400  |      1.056  |      -1.344
///  4)     48.000  |     17.856  |     -30.144
///  5)    960.000  |    321.600  |    -638.400
///  6) 19.200.000  |  5.896.512  | -13.303.488
///
///-----------------------------------------------------------------------------


import java.util.Locale;
import peasy.*;

private final static float _1_DIV_3_ = 1/3f; // fix scaling factor
PeasyCam cam;

// menger sponge settings
int DEPTH = 4;            // max recursion-depth
int SIZE  = 400;          // size of MengerSponge-Boundingbox

// rendering
boolean BACKFACE_CULLING = true; // toggle backface culling
int FACES_RENDERED = 0;          // counter for actualy rendered faces
int FACES_MAX      = 0;          // counter for max number of faces to render (6 faces per voxel)*number of voxels

private final PVector cam_pos = new PVector(); // camera position (WS) for backface culling

// vertex buffers
private final PVector v1 = new PVector(), v2 = new PVector(), v3 = new PVector(), v4 = new PVector();  
private final PVector v5 = new PVector(), v6 = new PVector(), v7 = new PVector(), v8 = new PVector();

// LookUpTable for colors
int[] COL_LUT_XP,  COL_LUT_XN;
int[] COL_LUT_YP,  COL_LUT_YN;
int[] COL_LUT_ZP,  COL_LUT_ZN;

float[][] COL_LUT = {
    new float[]{   0,   0,   0 }, // depth 0
    new float[]{  30,  30,  30 }, // depth 1
    new float[]{ 240, 240, 240 }, // depth 2
    new float[]{ 255, 190,   0 }, // depth 3
    new float[]{ 150,  75,   0 }, // depth 4
    new float[]{  65,  20,   0 }, // depth 5
    new float[]{   0,   0,   0 }, // depth 6
    new float[]{   0,   0,   0 }, // depth 7
};



@Override
public void setup(){
  size(700, 700, P3D);

  cam = new PeasyCam(this, 0, 0, 0, 1000);
  cam.setRotations( -1.3968815, 0.71367186, -0.12572986);
  
  textFont( createFont("Calibri", 12) );
  textMode(SCREEN);
   
  // creating color lookuptables for 6 faces
  COL_LUT_XP = new int[COL_LUT.length]; COL_LUT_XN = new int[COL_LUT.length];
  COL_LUT_YP = new int[COL_LUT.length]; COL_LUT_YN = new int[COL_LUT.length];
  COL_LUT_ZP = new int[COL_LUT.length]; COL_LUT_ZN = new int[COL_LUT.length];
     
  // coeff for fake shading
  final float dxp = .85f, dxn = .55f;
  final float dyp = .70f, dyn = .50f;
  final float dzp = .95f, dzn = .30f;   
  
  for(int i = 0; i < COL_LUT.length; i++) {  
    float[] c = COL_LUT[i];     
    COL_LUT_XN[i] = ( 0xFF000000 | (int)(dxn*c[0])<<16 | (int)(dxn*c[1])<<8 | (int)(dxn*c[2]) );
    COL_LUT_XP[i] = ( 0xFF000000 | (int)(dxp*c[0])<<16 | (int)(dxp*c[1])<<8 | (int)(dxp*c[2]) );
    COL_LUT_YN[i] = ( 0xFF000000 | (int)(dyn*c[0])<<16 | (int)(dyn*c[1])<<8 | (int)(dyn*c[2]) );
    COL_LUT_YP[i] = ( 0xFF000000 | (int)(dyp*c[0])<<16 | (int)(dyp*c[1])<<8 | (int)(dyp*c[2]) );
    COL_LUT_ZN[i] = ( 0xFF000000 | (int)(dzn*c[0])<<16 | (int)(dzn*c[1])<<8 | (int)(dzn*c[2]) );
    COL_LUT_ZP[i] = ( 0xFF000000 | (int)(dzp*c[0])<<16 | (int)(dzp*c[1])<<8 | (int)(dzp*c[2]) );
  }
}



@Override
public void draw(){
  camPos();

  background(255);

  BKS(SIZE/2);

  mengerSpongeProc();

  if(!online) updateWindowTitle(); 
  
  cam.beginHUD();
    drawStats();
  cam.endHUD();
}

void drawStats(){
  String txt_fps      = String.format(Locale.ENGLISH, "fps: %4.2f", frameRate);
  String txt_depth    = String.format(Locale.ENGLISH, "depth [UP/DOWN]: %d", DEPTH);
  String txt_faces    = String.format(Locale.ENGLISH, "faces: %d of %d", FACES_RENDERED, FACES_MAX);
  String txt_backface = String.format(Locale.ENGLISH, "backface culling [b]: %s", BACKFACE_CULLING?"on":"off");
  String txt_showtess = String.format(Locale.ENGLISH, "show faces [SPACE]: %s", (box_scale!=.5f)?"on":"off");

  int x = 20, y = 40;
  fill(50);
  text(txt_fps,      x,y); y+=15;
  text(txt_depth,    x,y); y+=15;
  text(txt_faces,    x,y); y+=15;
  text(txt_backface, x,y); y+=15;
  text(txt_showtess, x,y); y+=15;
}


final void mengerSpongeProc(){
  FACES_RENDERED = 0;
  FACES_MAX      = 6*(int)Math.pow(20,DEPTH-1);  
  noStroke();
  DEPTH <<=24;
  menger(0,0,0, SIZE, 0x01111111/*.DEPTH-FACES.*/);
  DEPTH >>=24;
}

// Menger Sponge
final void menger(float x, float y, float z, float s, int F){ 
  if( (F & 0x00FFFFFF) == 0 )  return; // box got completely eliminated 
  if( (F & 0x0F000000) == DEPTH) {
    box(x, y, z, s, F);
  } else {
    s *= _1_DIV_3_;
    final float xn = x-s, xp = x+s;
    final float yn = y-s, yp = y+s;
    final float zn = z-s, zp = z+s;
    
    final int D = (F+=0x01000000)& 0x0F000000; // increment and extract depth
    final int XN = D>>4, YN = D>>12, ZN = D>> 20;
    final int XP = D>>8, YP = D>>16, ZP = D>> 24;
    
    menger( xn, yn, zn, s, (F & 0xFFF0F0F0)           );
    menger( xn, yn, z , s, (F & 0xFFF0F000) | XP | YP );
    menger( xn, yn, zp, s, (F & 0xFFF0F00F)           );
    menger( xn, y , zn, s, (F & 0xFFF000F0) | XP | ZP );
  //menger( xn, y , z , s, 0);
    menger( xn, y , zp, s, (F & 0xFFF0000F) | XP | ZN );
    menger( xn, yp, zn, s, (F & 0xFFF00FF0)           );
    menger( xn, yp, z , s, (F & 0xFFF00F00) | XP | YN );
    menger( xn, yp, zp, s, (F & 0xFFF00F0F)           );
  //
    menger( x , yn, zn, s, (F & 0xFF00F0F0) | YP | ZP );
  //menger( x , yn, z , s, 0);
    menger( x , yn, zp, s, (F & 0xFF00F00F) | YP | ZN );
  //menger( x , y , zn, s, 0);
  //menger( x , y , z , s, 0);
  //menger( x , y , zp, s, 0);
    menger( x , yp, zn, s, (F & 0xFF000FF0) | YN | ZP );
  //menger( x , yp, z , s, 0); 
    menger( x , yp, zp, s, (F & 0xFF000F0F) | YN | ZN );
  //
    menger( xp, yn, zn, s, (F & 0xFF0FF0F0)           );
    menger( xp, yn, z , s, (F & 0xFF0FF000) | XN | YP );
    menger( xp, yn, zp, s, (F & 0xFF0FF00F)           );
    menger( xp, y , zn, s, (F & 0xFF0F00F0) | XN | ZP );
  //menger( xp, y , z , s, 0);
    menger( xp, y , zp, s, (F & 0xFF0F000F) | XN | ZN );
    menger( xp, yp, zn, s, (F & 0xFF0F0FF0)           );
    menger( xp, yp, z , s, (F & 0xFF0F0F00) | XN | YN );
    menger( xp, yp, zp, s, (F & 0xFF0F0F0F)           );
  }
}


final void box(float x, float y, float z, float s, int F){ 
  
  ///    v1--YN--v2            |  v5--YN--v6     
  ///     |      |             |   |      |      
  ///    XN      XP  (ZN)      |  XN      XP  (ZP
  ///     |      |             |   |      |      
  ///    v4--YP--v3            |  v8--YP--v7     
  
  s*=box_scale;
   
  v1.x=x-s;  v1.y=y-s;  v1.z=z-s;    v5.x=x-s;  v5.y=y-s;  v5.z=z+s;
  v2.x=x+s;  v2.y=y-s;  v2.z=z-s;    v6.x=x+s;  v6.y=y-s;  v6.z=z+s;
  v3.x=x+s;  v3.y=y+s;  v3.z=z-s;    v7.x=x+s;  v7.y=y+s;  v7.z=z+s;
  v4.x=x-s;  v4.y=y+s;  v4.z=z-s;    v8.x=x-s;  v8.y=y+s;  v8.z=z+s;
  
  // computing visibility for backface culling: simplification of dot(view, face-normal).
  if( BACKFACE_CULLING){
    if(cam_pos.x>v1.x) F &= 0xFF0FFFFF; // XN
    if(cam_pos.x<v7.x) F &= 0xFFF0FFFF; // XP
    if(cam_pos.y>v1.y) F &= 0xFFFF0FFF; // YN
    if(cam_pos.y<v7.y) F &= 0xFFFFF0FF; // YP
    if(cam_pos.z>v1.z) F &= 0xFFFFFF0F; // ZN
    if(cam_pos.z<v7.z) F &= 0xFFFFFFF0; // ZP
  } 
  
  beginShape(QUADS);
  {   
    if( (F & 0x00F00000)!=0 ) { fill(COL_LUT_XN[(F>>20)&0xF]); quad(v1, v5, v8, v4); } // XN
    if( (F & 0x000F0000)!=0 ) { fill(COL_LUT_XP[(F>>16)&0xF]); quad(v2, v6, v7, v3); } // XP
    if( (F & 0x0000F000)!=0 ) { fill(COL_LUT_YN[(F>>12)&0xF]); quad(v1, v2, v6, v5); } // YN
    if( (F & 0x00000F00)!=0 ) { fill(COL_LUT_YP[(F>> 8)&0xF]); quad(v4, v3, v7, v8); } // YP
    if( (F & 0x000000F0)!=0 ) { fill(COL_LUT_ZN[(F>> 4)&0xF]); quad(v1, v2, v3, v4); } // ZN
    if( (F & 0x0000000F)!=0 ) { fill(COL_LUT_ZP[(F>> 0)&0xF]); quad(v5, v6, v7, v8); } // ZP
  }
  endShape();
}



final void quad(final PVector a, final PVector b, final PVector c, final PVector d){
  vertex(a.x, a.y, a.z);
  vertex(b.x, b.y, b.z);
  vertex(c.x, c.y, c.z);
  vertex(d.x, d.y, d.z);
  FACES_RENDERED++; 
}


void BKS(float s){
  strokeWeight(1.5f);
  stroke(255,0,0); line(0,0,0,s,0,0);
  stroke(0,255,0); line(0,0,0,0,s,0);
  stroke(0,0,255); line(0,0,0,0,0,s);
}

void camPos(){
  float[] pos = cam.getPosition();
  cam_pos.x = pos[0];
  cam_pos.y = pos[1];
  cam_pos.z = pos[2];
}

void updateWindowTitle(){
  String title = "menger sponge";
  String framerate = String.format(Locale.ENGLISH, "fps %4.2f", frameRate);
  title += " | " + framerate;
  frame.setTitle(title);
}


float box_scale = .5f;
@Override
public void keyReleased(){
  if( key == CODED){
    if( keyCode == UP)   DEPTH++;
    if( keyCode == DOWN) DEPTH--;
    
    if( DEPTH > 5 ) DEPTH = 5;     
    if( DEPTH < 1 ) DEPTH = 1;
  }
  if( key =='b' ) BACKFACE_CULLING = !BACKFACE_CULLING;
  
  if( key == ' ' ) box_scale = (box_scale==.5f)?.48f:.50f;
}


