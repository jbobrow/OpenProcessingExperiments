
// Fractal3D forest
// create animating fractals with changing color, rotations and growing
//
//
 
PVector triCol0[] = new PVector[] {
  new PVector( 1.0f, -1.0f,-1.0f),
  new PVector( -1.0f, 1.0f, -1.0f),
  new PVector( -1.0f,-1.0f,1.0f),
  new PVector( 1.0f,1.0f,1.0f)
  };
 
PVector growStart[] = new PVector[] {
  new PVector( 1.0f, -1.0f, -1.0f),
  new PVector( 1.0f, 1.0f,-1.0f),
  new PVector( 1.0f, -1.0f,  -1.0f),
  new PVector( 1.0f, -1.0f,  -1.0f),
};
 
PVector binaryCol[] = new PVector[] {
  new PVector( -1.0f, -1.0f, 1.0f),
  new PVector( 1.0f, 1.0f,1.0f),
  new PVector( -1.0f, -1.0f,  1.0f),
  new PVector( -1.0f, -1.0f,  1.0f),
};
PVector[] cols[] = new PVector[][] {
  triCol0,
  binaryCol,
  growStart,
};
 
float  g_Fov = 45.0f;
int CalculateMaxDepth( PVector pos, PVector cpos, float initialsize, float lodFactor, float logFactor)
{
  PVector dvect = new PVector();
  dvect.set(cpos);
  dvect.sub(pos);
  float dist = dvect.mag();
 
  // find width of single pixel
  PVector cvect = new PVector();
  cvect.set(cpos);
  dvect.normalize();
  cvect.normalize();
  if ( cvect.dot(dvect) < cos(radians(45)))
    return 0;
  if ( cvect.dot(dvect) < cos(radians(35)))
    initialsize*=0.5f;
  float pixelwidth = (tan( g_Fov *0.5)*dist / 480.0f ) *lodFactor;
  // cull quality on behinid or to the side of the camera
  return (int)(log( initialsize / pixelwidth) / log(logFactor));
}
PFont g_font;
void setup()
{
  size(640,480,P3D);
  noSmooth();
  noStroke();
  mouseX=width/2-50;
  mouseY=40;
 
  g_font = loadFont("Arial-ItalicMT-32.vlw");
}
float smoothstep (float edge0, float edge1, float x)
{
  x =  min(max((x - edge0) / (edge1 - edge0),0.0f),1.0f);
  return x*x*(3-2*x);
}
void drawBase()
{
  pushMatrix();  // draw base
  scale(40.0f);
  fill(160,120,80);
  translate(0.0f,-0.015f,0.0f);
  box(1.05f, 0.04f, 1.05f);
  translate(0.0f,-0.5f,0.0f);
  box(1.2f, 1.0f, 1.2f);
  popMatrix();
}
int drawFractal( PVector campos, float px, float py, float animf, boolean isSponge, PVector[] colTable )
{
  pushMatrix();
  translate(px,0.0f,py);
 
  // calculate animation factors
  float r0 = smoothstep(8.0f, 12.0f,animf)*2.0f *PI;
  float anim = sin(min(max(animf-12.0f,0.0),4.0f)*PI/4.0f)*PI*2.0f;
  float g0 = smoothstep(2.0f, 12.0f,animf)*10.0f;
  float hidden = smoothstep(0.2, 2.,animf)* smoothstep(20.0, 18.,animf);
  scale(smoothstep(0.0f,0.25,hidden));
  hidden = smoothstep(0.5f,1.0,hidden);
 
  rotateY(r0);
  drawBase();
 
  float intialSize =  isSponge ? 30.0f : 40.0f;
  scale( intialSize);
  translate(0.0f, -1.0f + min(hidden,1.0f),0.0f);
  PVector pos = new PVector(px,20.0f,py);
  int maxDepth = CalculateMaxDepth(pos, campos, intialSize, 8.0,isSponge ? 3 : 2);
  int selDepth = (int)ceil(g0);
  float blendV = g0 - floor(g0);
  blendV = smoothstep(0.,1.,blendV);
 
  if ( maxDepth < selDepth )
  {
    selDepth =maxDepth;
    blendV=1.;
  }
  if (!isSponge)
  {
     SeirpenskiTriangle( 0,selDepth,anim, new PVector(1.0,1.0,1.0),
       0.5f, colTable, blendV);
  }
  else
  {
    translate(0.0f,0.5,0.);
    PVector cvect = new PVector();
    cvect.set(pos);
    cvect.sub(campos);
    MengerSponge sponge = new MengerSponge( cvect, r0, colTable);
    sponge.Draw( 0,selDepth,anim, new PVector(1.0,1.0,1.0), 0.5f, blendV );
  }
  popMatrix();
  return maxDepth;
}
void draw()
{
  beginCamera();
  PVector cpos = new PVector( mouseX-width*0.5,10+mouseY*0.6,34.0);
  camera(cpos.x,cpos.y,cpos.z,
    0.0,20.0,0.0,
    0.0,-1.0,0.0);
 
  perspective(45.0f, float(width)/float(height), 0.1f, 100.0f);      
  endCamera();
  float anim =(float)millis()/1000.0f;
  float fade = smoothstep(0.0f,2.0f, anim)*smoothstep(74.,68.,anim);
  background((int)(84.*fade),(int)(84.*fade),(int)(100.*fade));
  randomSeed(1200);  
 
  ambientLight(100,110,180);
  directionalLight(225*fade, 210*fade, 178*fade, 0.707f, -0.707f, 0.0f);
  directionalLight(64, 16, 0, 0.5f, -0.1f, 0.5f);
  
  anim-=1.0f;
  boolean useSponge = false;
  float animMany = 0.0f;
  if ( anim > 44.0f )
  {
    animMany = anim-44.0f;
    anim = animMany;
  }
  if ( anim > 22.0f)
  {
    anim -=22.0f;
    useSponge = true;
  }
  int maxDepth =0;
  if ( animMany == 0.0f)
  {
    maxDepth=drawFractal( cpos, 0.0f, 0.0f, anim, useSponge, useSponge ? binaryCol : growStart);
 
    float textAlpha = smoothstep(2.,6.,anim)*smoothstep(12.,8.,anim)*255;
    fill(255,255,255,textAlpha);
    textFont(g_font, 32);
    textMode(SCREEN);
    text(useSponge ? "Menger Sponge" : "Seirpenski Triangle",10 + (useSponge ? width/2. : 0), height-50 );
  }
 
  if ( animMany > 0.0f)
  {
    int tileSize = 12;
    float spacing = 80;
    int hts = tileSize/2;
    for (int i =0; i < tileSize; i++ )
      for (int j = 0; j < tileSize; j++)
        if ( i !=hts || j!= hts )
        {
          PVector [] cs = cols[(int)floor(random(0,2.9))];
          float px = (float)(i- hts)*spacing;
          float py = (float)(j- hts)*spacing;         
          drawFractal( cpos, px,py, animMany-random(0,10.0f), random(0,2)>1.0f, cs);
        }
  }
  //text("fps: "+(int)frameRate +" Depth : "+maxDepth ,10,40 );
}

 

