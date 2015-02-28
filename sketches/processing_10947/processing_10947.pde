
/**
 * Procedural Parametric L system
 * Uses parametric l system to generate multiple different trees from
 * from http://algorithmicbotany.org/papers/sigcourse.2003/2-1-lsystems.pdf
 * can display grid of 144 trees using lods and branch culling. 
 * Also can switch on smoothing to see detailed branches.
 *
 *
 */
 
void cylinder(float len, float width, float baseWidth, boolean lowLod, boolean highLod )
{
  float ls = baseWidth*0.98f;
  float shrink = width/baseWidth;
  int numSegs = lowLod ? 4 : highLod ? 16 : 8;
  beginShape(QUAD_STRIP);
  float diff = (2.0f*PI)/(float)numSegs;
  float yn = (1.0f - shrink)*width/len;
  float nd = 1.0f - yn;
  float xr = 0.0f;
  float zr = 1.0f;
  float xs = xr * ls;
  float zs = zr * ls;
 
  normal(xr*nd, yn,  zr*nd);
  vertex(xs*shrink,len,zs*shrink);
  vertex(xs,0.0f,zs);
  float ang = diff;
  for (int i =0; i < numSegs; i++ , ang += diff)
  {
    float xr2 = sin(ang);
    float zr2 = cos(ang); 
    float xs2 = xr2 * ls;
    float zs2 = zr2 * ls;
 
    normal(xr2*nd, yn,  zr2*nd);
    vertex(xs2*shrink,len,zs2*shrink);     
    vertex(xs2,0.0f,zs2);
  } 
  endShape();
  translate(0.0f,len,0.);
}
 
// Stores the tree type settings
class PSettings  
{
  public float w0, alpha1, alpha2, phi1, phi2;
  public float r1, r2,  q, e, minS, minW;
  int n;
  PVector scol, lcol;
  int pscol, plcol;
  int ldepth;

  public PSettings( float _r1, float _r2, float _a1, float _a2, float _ph1, float _ph2,
        float _w0, float _q, float _e, float _minS, int _n, PVector _scol, PVector _lcol, int _ldepth )
  {
    r1 = _r1; r2 =_r2; w0 = _w0;    q=_q;     n=_n;
    alpha1 = radians(_a1);  alpha2=radians(_a2);    phi1 =radians(_ph1);     phi2=radians(_ph2);
    minS=_minS;    scol =_scol;     lcol = _lcol;
    ldepth =  _n - _ldepth;    minW = 0.0f; 
  }
  public PSettings( PSettings a, PSettings b, float f)
  {
    r1 = lerp(a.r1,b.r1,f); r2 =lerp(a.r2, b.r2,f); w0 = lerp(a.w0,b.w0,f);    q=lerp(a.q,b.q,f);  n=(int)lerp((float)a.n,(float)b.n,f);
    alpha1 = lerp(a.alpha1,b.alpha1,f);  alpha2=lerp(a.alpha2,b.alpha2,f); 
    phi1 =lerp(a.phi1,b.phi1,f);  phi2=lerp(a.phi2,b.phi2,f);
    minS=lerp(a.minS,b.minS,f);   
    scol = new PVector( lerp(a.scol.x,b.scol.x,f),lerp(a.scol.y,b.scol.y,f),lerp(a.scol.z,b.scol.z,f));    
    lcol = new PVector( lerp(a.lcol.x,b.lcol.x,f),lerp(a.lcol.y,b.lcol.y,f),lerp(a.lcol.z,b.lcol.z,f));    
    ldepth =  (int)lerp((float)a.ldepth, (float)b.ldepth,f);    minW = 0.0f; 
    pscol = color(scol.x, scol.y, scol.z);
    plcol = color(lcol.x, lcol.y, lcol.z);
  }
};
 
boolean g_useSmooth = false;
float cposX=0.0f, cposY =0.0f, cposZ = 34.0f;
boolean g_useCull = true , g_useLowLod = true, g_displayOne = true, g_displayHelp = false;
int g_TileAmt = 12;
float g_Fov = 45.0f;
 
void TreeSplit( int depth, float s, float w, float wold, PSettings settings )
{
  fill( depth < settings.ldepth ? settings.pscol: settings.plcol);
  if ( w <  1.0f && g_useSmooth )
   smooth();
  else
    noSmooth();
 
  cylinder(s, w, wold, g_useLowLod && w <= settings.minW*8.0, w >= settings.minW*16.0f );
  if ( w >= settings.minW && s >= settings.minS && depth < settings.n )
  {    
    pushMatrix();
    rotateX( settings.alpha1 );
    rotateY( -settings.phi1);
    TreeSplit( depth+1, s* settings.r1, w*settings.q ,w,settings);
    popMatrix();
 
    pushMatrix();
    rotateX(  settings.alpha2);
    rotateY( -settings.phi2);
    TreeSplit(  depth+1,s * settings.r2, w * (1.0f - settings.q),w,settings);
    popMatrix();
  }
}
 
void drawTree( float px, float pz, float scaleV, float r0, PSettings s )
{
  
  shininess(40.0f);
  pushMatrix();
  translate( px, 0.0f, pz);
    pushMatrix();  // draw base
    fill(180,180,240);
    translate(0.0f,-4.0f,0.0f);
    box(38.0f, 4.0f, 38.0f);
    translate(0.0f,-10.0f,0.0f);
    box(40.0f, 20.0f, 40.0f);
    popMatrix();
    
   
  scale(scaleV);
  rotateY(r0);
 
  if (g_useCull)
  { 
    PVector dvect = new PVector(px-cposX, 40.0f-cposY, pz-cposZ);
    PVector cvect = new PVector(0.0f-cposX, 40.0-cposY, 0.0-cposZ);
    float dist = dvect.mag();
    dvect.normalize();
    cvect.normalize();
    if ( cvect.dot(dvect) < cos(radians(55)))
    {
       popMatrix();
      return;
    }
    // choose max split depending on dist
    float scwidth = (tan( g_Fov *0.5)*dist / 480.0f ) *0.5/scaleV;
    s.minW =  scwidth;
  }
  else
    s.minW = 0.0f;
 
   shininess(5.0f);

  TreeSplit(  0, 100.0f, s.w0,s.w0, s );
  popMatrix();
}
PSettings [] treeTypes = new PSettings[]
{
  new PSettings(.75,.77,35,-35,0,0,30,.50,.40,0.0,10-2, new PVector(150,120,20), new PVector(150,220,60), 1),
  new PSettings(.65,.71,27,-68,0,0,20,.53,.50,1.7,10-2, new PVector(150,120,20), new PVector(150,220,60), 1),
  new PSettings( .50,.85,25,-15,180,0, 20, .45, .50, 0.5, 9-2, new PVector(150,120,20), new PVector(150,220,60), 1),
  new PSettings(.60,.85,25,-15,180, 180, 20, .45, .50, 0.0, 10-2, new PVector(150,120,20), new PVector(150,220,60), 1),
  new PSettings(.58,.83,30,15, 0,180, 20, .40, .50, 1.0, 11-3, new PVector(150,150,150), new PVector(130,120,100), 1),
  new PSettings(.92,.37,0,60, 180,0, 5, .50, .00, 0.5, 15- 6, new PVector(150,220,60), new PVector(220,220,60), -1), // fern
  new PSettings(.80,.80,30,-30,137, 137, 30, .50, .50, 0.0, 10- 2, new PVector(150,120,120), new PVector(150,220,60), -1),
  new PSettings(.95,.75,5,-30,-90, 90, 40, .60, .45, 25.0, 12- 3, new PVector(150,120,120), new PVector(150,220,60), -1),
  new PSettings(.55,.95,-5,30,137,137,5,.40,.00,5.0,12 - 3, new PVector(150,120,120), new PVector(150,220,60), -1)
  };
void setup() {
  size(640, 480, P3D);
  noStroke();
  mouseX=width/2-150;
  mouseY=120;
}
float SmoothBlend( float x ){
  return x*x*(3.-2.*x);
}
void draw() {
   
  float timeSecs =(float)millis()/1000.0f;
  float fade = 0.5;
  int skycol = color(200.*fade,198.*fade,188.*fade);
  background(skycol);
 
  beginCamera();
  
   if (  g_displayOne)  {
    cposX = (mouseX-width*0.5)*0.5;
    cposY = 10+mouseY*0.6;
    cposZ = 34.0f;
   }
   else {
    cposX = (mouseX-width*0.5)*2.;
    cposY = 20.0f;
    cposZ = (mouseY-width*0.5)*2.;
   }
 
  camera(cposX,cposY,cposZ,
  0.0,40.0,0.0,  0.0,-1.0,0.0);
 
  perspective(g_Fov, float(width)/float(height),  0.1f, 100.0f);      
  endCamera();
 
  ambientLight(100,110,180);
  lightSpecular(204, 204, 204);
  directionalLight(192, 180, 138, 0, -1.0f, -0.5f);
  directionalLight(128, 32, 0, 0.5f, -0.1f, 0.5f);
  specular(128, 128, 128); 
  

  if ( keyPressed ) {
    if ( key == 'a' || key=='A') {       g_displayOne = !g_displayOne;    }
    if ( key == 's' || key=='S') {       g_useSmooth = !g_useSmooth;   }
    if ( key == 'c' || key=='C') {       g_useCull = !g_useCull;    }
    if ( key == 'l' || key=='L') {       g_useLowLod = !g_useLowLod; }
    if ( key == 'h' || key=='H') {       g_displayHelp = !g_displayHelp; }
    if ( key == '+' || key=='=') {       g_TileAmt++; }
    if ( key == '-' || key=='_') {       g_TileAmt=max(g_TileAmt-1,0); }
    keyPressed = false;
  }
  noSmooth();
  int drawTreeType = (int)floor(timeSecs/3. );
  float blendV = timeSecs/3.  - (float)drawTreeType;
  
  if (  g_displayOne)  {
    rotateY((timeSecs/3.)*2.*PI);
    drawTreeType = drawTreeType % 9;
    int drawTreeTypeNext = (drawTreeType +1)% 9;
    blendV = SmoothBlend(min(blendV*4.0f,1.0f)); 
    drawTree( 0.0f,0.0f,0.2f, 0.0f, new PSettings( treeTypes[drawTreeType], treeTypes[drawTreeTypeNext], blendV));
  }
  else  {
     float space = 60.0f;
     randomSeed(100);
     int off = g_TileAmt/2;
     for (int i = 0; i < g_TileAmt; i++ )
      for (int j = 0; j < g_TileAmt; j++ )      {  
        int firstType = drawTreeType + (i%3)*3+(j%3);
        float bf = max(min(blendV*4.0f + random(-3.0f,0.0f),1.0f),0.0f);
        PSettings settings = new PSettings( treeTypes[firstType%9], treeTypes[(firstType+1)%9], bf);
        drawTree( -space * (float)i + off*space,  -space* (float)j + off*space, 0.1f, random(0,PI*2.0f), settings);
      }
  }
  if ( g_displayHelp)
  {
    fill(0);
    textMode(SCREEN);
    text("fps: "+(int)frameRate +" (C)ull: " +g_useCull +" (S)mooth: " +g_useSmooth + " (L)od : "
                   + g_useLowLod + " (A)ll: " + !g_displayOne  +" (+/-) Grid Size " + g_TileAmt + " (H)elp :"+ g_displayHelp,10,20 );
  }
}

 

