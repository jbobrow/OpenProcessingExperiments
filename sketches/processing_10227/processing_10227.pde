

// anaglyph 3D Shapes     //
// Will Birtchnell 06/10  //

float y=0;
float z=0;
int v[][] = new int[2][3];
float rotX;
float rotY;
float rotZ;
int ani=0;
int len=140; // number of blocks
float trans=2600;
PFont fontA;
int mode=2;
String modes[] = {"left","right","red/cyan","cyan/red","yellow/blue","blue/yellow","magenta/green","green/magenta"};
int maskL;
int maskR;
int pxCount;

PGraphics pgl;
PGraphics pgr;
color col;
color[] colorTable = new color[1000];
int px;

int depth=40;
int conv=-10;

int gridSects=20;
int gridHeight=1100;
int gridWidth=1300;
int gx,gy;

void setup(){ 
  size(700, 600, P3D);
  fontA = loadFont("CourierNew36.vlw");
  textFont(fontA, 15);
  pxCount=width*height;
  pgl = createGraphics(width,height, P3D);
  pgr = createGraphics(width,height, P3D);
  pgl.beginDraw();
  pgr.beginDraw();
  pgl.noStroke();
  pgr.noStroke();
  pgl.endDraw();
  pgr.endDraw();
  setCams();
  newV();
  newV();
  
  for (int x=0;x<len;x++)
  {
    colorTable[x]=color(220+sin(x/(len/TWO_PI))*35,180+sin((x+(len/3))/(len/TWO_PI))*75,200+sin(((x+(2*len)/3))/(len/TWO_PI))*55);
  }
} 

// set two cameras for left/right eye
void setCams()
{
  pgl.camera(-depth,0,2500, -conv,0,0,  0,1.0,0);
  pgr.camera(depth,0,2500,  conv,0,0,  0,1.0,0);
  
  float fov = PI/6.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  pgl.perspective(fov, float(width)/float(height),cameraZ/10.0, cameraZ*10.0);
  pgr.perspective(fov, float(width)/float(height),cameraZ/10.0, cameraZ*10.0);
}

void newV()
{
  int diff;
  for (int i=0;i<3;i++)
  {
    v[0][i]=v[1][i];
  }  
  do{
    diff=0;
    for (int i=0;i<3;i++)
    {
      v[1][i]=round(random(1,5));
      diff+=abs(v[1][0]-v[0][0]);
    }
  }
  while ((diff<1)||(diff>3));
}

void draw(){
  


  // Draw left & right background grid
  pgl.beginDraw();
  pgr.beginDraw();
  pgl.background(255);
  pgr.background(255); 
  pgl.pushMatrix();
  pgr.pushMatrix(); 
  pgl.translate(0,0,-1200);
  pgr.translate(0,0,-1200); 
  pgl.fill(220); 
  pgr.fill(220);
  
  for (gx=0;gx<gridSects;gx++)
  {
    for (gy=0;gy<gridSects;gy++)
    {
      if((gx+gy)%2==0){
        pgl.rect(-gridWidth+(gridWidth*gx*2/gridSects),-gridHeight+(gridHeight*gy*2/gridSects),gridWidth*2/gridSects,gridHeight*2/gridSects);
        pgr.rect(-gridWidth+(gridWidth*gx*2/gridSects),-gridHeight+(gridHeight*gy*2/gridSects),gridWidth*2/gridSects,gridHeight*2/gridSects);
      }
    }
  }
  
  pgl.popMatrix();
  pgr.popMatrix();
    
  pgl.directionalLight(255,255,255, 0, 0, -1);
  pgr.directionalLight(255,255,255, 0, 0, -1);
  
  ani++;
  if (ani>=trans){
    ani=0;
    newV();
  } 
  y= (y<1)? y+(80/trans) : y+(80/trans)-1;
  
  
  for (int x=0;x<len;x++)
  {
    z=x+y;
    rotX=z*TWO_PI*(v[0][0]+(v[1][0]-v[0][0])/trans*ani)/len;
    rotY=z*TWO_PI*(v[0][1]+(v[1][1]-v[0][1])/trans*ani)/len;
    rotZ=250+abs(sin(z*TWO_PI*((v[0][2]+(v[1][2]-v[0][2])/trans*ani)/len))*350);
    
    // draw image for left eye
    pgl.pushMatrix(); 
    pgl.rotateX(rotX); 
    pgl.rotateY(rotY); 
    pgl.translate(rotZ,0,0); 
    pgl.fill(colorTable[x]);
    pgl.box(250,100,20); 
    pgl.popMatrix();
    
    // draw image for rght eye
    pgr.pushMatrix(); 
    pgr.rotateX(rotX); 
    pgr.rotateY(rotY); 
    pgr.translate(rotZ,0,0); 
    pgr.fill(colorTable[x]);
    pgr.box(250,100,20); 
    pgr.popMatrix();
    
  }
  
  pgl.endDraw();
  pgr.endDraw(); 
  

  // combine left/right image to make anaglyph image
  loadPixels();
  pgl.loadPixels();
  pgr.loadPixels();
  
  if (mode==0) // left
  {
    maskL=0xffffff;
    maskR=0x000000;
  }
  if (mode==1) // right
  {
    maskL=0x000000;
    maskR=0xffffff;
  }
  if (mode==2) // red/cyan
  {
    maskL=0xff0000;
    maskR=0x00ffff;
  }
  if (mode==3) // cyan/red
  {
    maskL=0x00ffff;
    maskR=0xff0000;
  }
  if (mode==4) // yellow/blue
  {
    maskL=0xffff00;
    maskR=0x0000ff;
  }
  if (mode==5) // blue/yellow
  {
    maskL=0x0000ff;
    maskR=0xffff00;
  }
  if (mode==6) // mag/green
  {
    maskL=0xff00ff;
    maskR=0x00ff00;
  }
  if (mode==7) // green/mag
  {
    maskL=0x00ff00;
    maskR=0xff00ff;
  }

  for (px=0;px<(pxCount);px++)
  {
    pixels[px]= pgl.pixels[px]&maskL | pgr.pixels[px]&maskR;
  }

  fill(0,80);
  text("depth:" + depth + " convengence:" +conv + " mode:"+ modes[mode],8,height-6);
  
} 

void keyPressed()
{

  if (key=='z') if (trans<4000) trans=int(trans*1.3);
  if (key=='x') if (trans>200) trans=int(trans*0.8);
  
  if (key=='n'){
    conv=max(-60,conv-1);
    setCams();
  }
  if (key=='m'){
    conv=min(60,conv+1);
    setCams();
  }
  if (key==','){
    depth=max(0,depth-2);
    setCams();
  }
  if (key=='.'){
    depth=min(150,depth+2);
    setCams();
  }    
  
  if (key=='a'){
    mode=(mode+1)%modes.length;
  }    
    
}

void mousePressed()
{
  newV();
  ani=0;
}








