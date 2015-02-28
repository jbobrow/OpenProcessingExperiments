
// Revolution Editor
// Editor for revolution surfaces using curves
//

import controlP5.*;

ControlP5 controlP5;
ControlWindow controlWindow;

float[] cone = {
  0.25666666, -0.106666684,   0.21666667, 0.0, -0.0016666667, 0.50666666,  
  -0.065, 0.65    };

float[] splash = {
  0.2, -0.1533333, 0.165, 0.0033333302,  0.23333333, 0.100000024,  
  0.0, 0.01999998,  -0.108333334, 0.26666668  };
  
float[] lobe = {
  0.2, -0.1533333,     0.165, 0.0033333302,  0.02, 0.060000002,   0.035, 0.29,
  0.0016666667, 0.38, -0.075, 0.4333333 };

float[] teardrop = {
  -0.12166667, 0.093333304,  -0.0016666667, 0.0033333302,   0.065, 0.120000005,        
  0.0033333334, 0.43666667,  0.0, 0.68333334 };

float [] puddle = {
  0.26166666, -0.0033333302,   0.21, 0.0033333302, 
  -0.0016666667, 0.01999998,  -0.20333333, 0.04666668 };

float[] pawn = {
0.21, -0.08333331,         0.123333335, 0.0033333302,  0.07333333, 0.04333335,  
 0.115, 0.13,              0.036666665, 0.37666667,  0.08, 0.48666668,
 0.02, 0.49333334,         0.05, 0.56, -0.0033333334, 0.5966667, 
 -0.10333333, 0.60333335 };

float[] house = {
0.008333334, 0.0,          0.11666667, 0.0033333302,  0.108333334, 0.19666666, 
0.12833333, 0.23000002,    0.195, 0.25666666,        0.028333334, 0.47666666,
 0.02, 0.52,                0.0033333334, 0.62333333 };
 
float[] torus = {
	0.035, 0.13999999,	0.15333334, 0.16000003,	0.14666666, 0.27,	0.09833334, 0.27333334,
	0.09166667, 0.16000003,	0.15166667, 0.16333336,	0.16666667, 0.44666666,};

float [] lamp = {
  0.23166667, -0.04333335,    0.07666667, 0.0,   0.14, 0.33,               
  0.05666667, 0.45333335,    0.09166667, 0.5733333,    0.16, 0.5966667 };
  
float[] beerbottle ={
  0.08833333, 0.0,         0.016666668, 0.0033333302,  0.08833333, 0.026666641, 
  0.08166666, 0.24000001,   0.031666666, 0.40666667, 0.021666666, 0.46333334, 
  -0.14833333, 0.64666665 };
  
float[] tree = {
  0.08833333, -0.12666667,  0.025, 0.0,   0.026666667, 0.04666668,  
  0.17666666, 0.056666672,   0.108333334, 0.17333335,  -0.0016666667, 0.40666667,
   0.10333333, 0.62 };  

float [] fountain ={
	0.16, -0.13999999,	0.15833333, 0.00999999,	0.15666667, 0.13666666,	0.13, 0.14333332,
	0.13166666, 0.023333311,	0.07666667, 0.026666641,	0.065, 0.14999998,	0.035, 0.18,
	0.026666667, 0.29666665,	0.048333332, 0.33,	0.026666667, 0.36333334,	0.11666667, 0.40333334,
	0.12666667, 0.46666667,	0.14833333, 0.50666666,	0.108333334, 0.50666666,	0.093333334, 0.45,
	0.038333334, 0.42,	0.035, 0.48666668,	0.011666667, 0.52666664,	0.008333334, 0.63,
	0.035, 0.65999997,	0.0016666667, 0.65999997,	-0.07666667, 0.6533333};

float [] nothing={
  0.0f,0.0f,  0.0f,0.0f,   0.0f,0.0f,  0.0f,0.0f,
};


PVector [] g_Points = new PVector[] {};
 
class Scene
{
  public   boolean  ySort;
  public   float[]  pts;
   public   PVector c1,c2;
  Scene( float[] p, boolean sort, PVector _c1,PVector _c2 ) { 
    pts =p; ySort = sort; c1 =_c1; c2 =_c2;
  } 
};

// TODO: remove duplicates
Scene[] g_Scenes = new Scene[] {
  new Scene( pawn,  true,  new PVector(0.9f,0.8f,0.7f),new PVector(1.0f,1.0f,1.0f)), //new PVector(0.4f,0.35f,0.1f),new PVector(0.8f,0.85f,0.2f)),
  new Scene( teardrop, false, new PVector(0.7f,0.9f,1.0f),new PVector(0.8f,1.0f,1.0f) ),
  new Scene( puddle, false, new PVector(0.7f,0.9f,1.0f),new PVector(0.8f,1.0f,1.0f)),
  new Scene( splash, false, new PVector(0.7f,0.9f,1.0f),new PVector(0.8f,1.0f,1.0f)),
  new Scene( lobe, false, new PVector(0.7f,0.9f,1.0f),new PVector(0.8f,1.0f,1.0f)),  
  new Scene( house, true, new PVector(1.0f,0.0f,0.0f),new PVector(1.0f,1.0f,0.0f)),
  new Scene( cone,  true, new PVector(1.0f,0.0f,1.0f),new PVector(0.0f,1.0f,1.0f)),
  new Scene( lamp,  true, new PVector(0.0f,0.0f,1.0f),new PVector(0.0f,1.0f,1.0f)),
  new Scene( beerbottle, true, new PVector(0.1f,0.1f,1.f),new PVector(1.0f,1.0f,1.0f)), 
  new Scene( tree,  true,   new PVector(0.4f,0.4f,0.1f),new PVector(0.6f,0.95f,0.4f)),
  new Scene( fountain,  false,  new PVector(0.9f,0.8f,0.7f),new PVector(1.0f,1.0f,1.0f)),
 new Scene( torus, false, new PVector(1.0f,1.0f,0.0f),new PVector(1.0f,1.0f,0.0f)),
 
};

float pointSize = 8./300;
int selectedPoint = -1;
 
int GetPoint(PVector np)
{
  for( int i =0; i<g_Points.length; i++)  {
    PVector p = g_Points[i];
    if ( abs(p.x - np.x) < pointSize && abs(p.y-np.y) < pointSize )
          return i;
  }
  return -1;
}
PVector g_Trans = new PVector(0.0f,0.0f);
 
PVector GetScaledMousePos()
{
  return new PVector( ((float)mouseX - (float)width*3/4)/ (float)width, 0.75 - (float)mouseY/ (float)height,1.0f);
}
void mousePressed() {
 
  if ( mouseX < width/2)
  {
    g_Trans = GetScaledMousePos();
    g_Trans.x += 0.75f;
    selectedPoint=-1;
    return;
  }
  selectedPoint = GetPoint(GetScaledMousePos() );
  if ( selectedPoint ==-1)
  {
    g_Points= (PVector[])append( g_Points, GetScaledMousePos());
  }
}
 
void mouseDragged() {
  if ( mouseX < width/2)
  {
    mousePressed();
    return;
  }
  if (selectedPoint !=-1)
    g_Points[selectedPoint] = GetScaledMousePos();
 }
 
 
boolean Sort_Hieght = true;
float   Rotate = 0.;
float   Noise = 0.0f;
boolean Add_Ground = true;
int     Subdivisions = 8;
int     Subdivisions_Across=32;
int        g_SceneId = 0;
float    AO=1.;
boolean Animate = false;
float   Wobble = 0.;
boolean Use_Example = false;
boolean WireFrame = false;

// colors
float  bottomCol_Red=1.;
float  bottomCol_Green=1.;
float  bottomCol_Blue=1.;

float  TopCol_Red=1.;
float  TopCol_Green=1.;
float  TopCol_Blue=1.;

void SetupUI()
{
  int windowWidth =330;
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("Editor Controls",0,0, windowWidth,350);
  controlWindow.setBackground(color(40));
  controlWindow.setTitle("Curve Editor Controls");
  
  int xpos = 20;
  int ypos = 40;
  int step = windowWidth/5;
   controlP5.addSlider("Scene",0,g_Scenes.length-1).linebreak().setWindow(controlWindow);;

  controlP5.addToggle("Sort_Hieght", xpos,ypos,20, 20).setWindow(controlWindow);;
  controlP5.addToggle("Add_Ground",  xpos += step,ypos,20, 20).setWindow(controlWindow);; 
  controlP5.addToggle("Animate",  xpos += step,ypos,20, 20).setWindow(controlWindow);;
  controlP5.addToggle("WireFrame",  xpos += step,ypos,20, 20).linebreak().setWindow(controlWindow); ;
    
  controlP5.addSlider("Rotate",0.,2*PI).linebreak().setWindow(controlWindow);;
  controlP5.addSlider("Noise",0.,1.).linebreak().setWindow(controlWindow);;
  
  controlP5.addSlider("Subdivisions",1,32).linebreak().setWindow(controlWindow);;
  controlP5.addSlider("Subdivisions_Across",1,128).linebreak().setWindow(controlWindow);;
  
  controlP5.addSlider("Wobble",0.,1.).linebreak().setWindow(controlWindow);;
  controlP5.addSlider("AO",0.,1.).linebreak().setWindow(controlWindow);;
  
  controlP5.addSlider("bottomCol_Red",0.,1.).linebreak().setWindow(controlWindow);
  controlP5.addSlider("bottomCol_Green",0.,1.).linebreak().setWindow(controlWindow);
  controlP5.addSlider("bottomCol_Blue",0.,1.).linebreak().setWindow(controlWindow);

  controlP5.addSlider("TopCol_Red",0.,1.).linebreak().setWindow(controlWindow);
  controlP5.addSlider("TopCol_Green",0.,1.).linebreak().setWindow(controlWindow);
  controlP5.addSlider("TopCol_Blue",0.,1.).linebreak().setWindow(controlWindow);
  
  xpos = 20;
  controlP5.addButton("Output_File").setWindow(controlWindow);;
  
}
void DrawSettingsText()
{
  textMode(SCREEN);
  fill(0);
}
void Scene( int scene)
{
  g_SceneId = scene;
  g_Points = curveUnpack(g_Scenes[g_SceneId].pts);
  Sort_Hieght =  g_Scenes[g_SceneId ].ySort;
  selectedPoint = -1;
  
  bottomCol_Red= g_Scenes[g_SceneId ].c1.x;
  bottomCol_Green= g_Scenes[g_SceneId ].c1.y;
  bottomCol_Blue= g_Scenes[g_SceneId ].c1.z;
  
  TopCol_Red= g_Scenes[g_SceneId ].c2.x;
  TopCol_Green= g_Scenes[g_SceneId ].c2.y;
  TopCol_Blue= g_Scenes[g_SceneId ].c2.z;
  
  // update UI
  controlP5.controller("bottomCol_Red").setValue(bottomCol_Red);
  controlP5.controller("bottomCol_Green").setValue(bottomCol_Green);
  controlP5.controller("bottomCol_Blue").setValue(bottomCol_Blue);

  controlP5.controller("TopCol_Red").setValue(TopCol_Red);
  controlP5.controller("TopCol_Green").setValue(TopCol_Green);
  controlP5.controller("TopCol_Blue").setValue(TopCol_Blue);
  
//  controlP5.controller("Sort_Hieght").setValue(Sort_Hieght);

}
void SetCols()
{
  g_Scenes[g_SceneId ].c1 = new PVector( bottomCol_Red,bottomCol_Green,bottomCol_Blue);
  g_Scenes[g_SceneId ].c2 = new PVector( TopCol_Red,TopCol_Green,TopCol_Blue);
}
 void keyPressed()
 {
  if (  keyCode == BACKSPACE || keyCode == DELETE && selectedPoint != -1)
  {
     g_Points[selectedPoint]=g_Points[max( g_Points.length-1,0)];
    g_Points = (PVector[])shorten(g_Points);
    selectedPoint = -1;
  }
}
void Output_File()
{
  println("Write a file curvePos.txt with curve details");
  outputFile( Sort_Hieght ? curveSortOnY(g_Points) : g_Points );   
}
 
PrintWriter output;
 
void outputFile( PVector[] pts )
{ 
  output = createWriter("curvePos.txt");
  output.println( "float [] curvePoints ={");
 
 int cnt = 0;
  for (PVector p: pts)
  {
    if ( cnt++ > 2)
    {
      output.println("\t" + p.x + ", " + p.y + ",");
      cnt =0;
    }
    else
     output.print("\t" + p.x + ", " + p.y + ",");
  }
   
  output.println("};");
  output.println("");
   output.println("\tnew Scene(curvePoints, " + Sort_Hieght 
   + ", new PVector(" + g_Scenes[g_SceneId ].c1.x +", "+g_Scenes[g_SceneId ].c1.y + ", "+g_Scenes[g_SceneId ].c1.z
   + "), new PVector(" + g_Scenes[g_SceneId ].c2.x+ ", "+g_Scenes[g_SceneId ].c2.y + ", "+g_Scenes[g_SceneId ].c2.z+" )), ");
   
  output.flush();
  output.close();
}
 
 
void setup() {
  size(600, 300, P3D);
  strokeWeight(2);
 
  g_Trans.x= 0.25f;//width/4;
  g_Trans.y = 0.25f;//height/4;
  
  SetupUI();
  Scene(0);
  rectMode(CENTER);
 
 }
void draw() {
  background(255);

  controlP5.draw();
 
  // calculate curve points
  PVector []  intialPoints =  null;
  PVector c1,c2;
  float t = (millis()/1000.0f)*0.5f; // 2 secs blend
  SetCols();
  
  if ( Animate)
  {
   float ft = floor(t);
   t -= ft;
  // t =  t*t*(-2*t +3);
   int fi = (int)ft;
   int s1 =fi%g_Scenes.length;
   int s2 = (fi+1)%g_Scenes.length;
   intialPoints =  curveBlend( curveUnpack(g_Scenes[s1].pts), curveUnpack(g_Scenes[s2].pts), t);
   c1 = lerp( g_Scenes[s1].c1, g_Scenes[s2].c1, t);
   c2 = lerp( g_Scenes[s1].c2, g_Scenes[s2].c2, t);
   selectedPoint = -1;
  }
  else
  {
     c1 = g_Scenes[g_SceneId].c1;
     c2 = g_Scenes[g_SceneId].c2;
     intialPoints = Sort_Hieght ? curveSortOnY(g_Points) : g_Points;
     g_Scenes[g_SceneId].pts = curvePack( g_Points);  
  }
   
  if ( Wobble > 0.)
  {
    intialPoints = wobble( intialPoints, t*2., Wobble, Add_Ground ? 0.0f : -1000.0f);
  }
  
  float angleEnd = 2.0f*PI;
  if ( Use_Example)
  {
    t*=0.25;
    float ft = floor(t);
   t -= ft;
    angleEnd = t * 2.0f*PI;
  }
  
  Revolute robj = new Revolute( intialPoints,
                new PVector(0.0f,0.0f,0.0f),
                new PVector(0.0f,0.0f,1.0f),
                1.-AO, c1,c2,  Subdivisions_Across,Subdivisions);
  
  robj.AddNoise(10., Noise*0.03, t*3.);
 
 if ( WireFrame )
   stroke(0,0,0);
  else
    noStroke();
    
  Draw3D( robj, angleEnd);
  Draw2DDisplay( robj.subPoints, intialPoints);
 
}
void Draw2DDisplay( PVector[] subPoints, PVector[] intialPoints )
{ 
  pushMatrix();
 
   stroke( 128,128,128,255);
   translate(0.0f, height);
     scale(width, -height);
    line(.5,0, .5,1.);  // centre divider line
   
    stroke(0.,0.,128,255);
    line(0.75,0, 0.75, 1.0f);
    line(0.5,0.25, 1.,0.25);
   
   translate(3./4., 0.25f);
  
   specular(0.0f,0.0f,0.0f);
 
   noFill();
   for ( PVector p: intialPoints)
      rect( p.x, p.y, pointSize/2, pointSize);
     
   
    stroke( 128,128,0,128);
    beginShape();
    for ( PVector p: subPoints)
       vertex( p.x, p.y);
    endShape();
 
    beginShape();    // mirror shape
    for ( PVector p: subPoints)
       vertex( -p.x, p.y);
    endShape();
   
     if ( selectedPoint !=-1)
    {
       fill(255,0,0);
       rect( g_Points[selectedPoint].x, g_Points[selectedPoint].y, pointSize/2, pointSize);
    }
    popMatrix();
}
void Draw3D(Revolute robj, float angleEnd )
{
    PVector lightDir = new PVector(0.0f,-0.5f, -1.0f);
    lightDir.normalize();
    
   pushMatrix();
   ambientLight(102, 102, 102);
   lightSpecular(204, 204, 204);
   directionalLight(102, 102, 102, lightDir.x, lightDir.y, lightDir.z);
   specular(255, 255, 255);
    fill(255,128,255,255);
    shininess(40.0f);
   
    // display the object
   translate(g_Trans.x*width, -g_Trans.y*height + height*1.0,2.0f);
   scale(height*1.0);
  
   rotateX(Rotate);
   rotateX(PI);
   
   
   if ( Add_Ground )
      drawTable( robj, lightDir, angleEnd);
   
   robj.Draw(lightDir,angleEnd, Add_Ground);
  
  popMatrix();
}
 void drawTable( Revolute robj, PVector lightDir, float angleEnd  )
  {
    robj.DrawReflection( angleEnd);
    
   fill( color(180,180,180,220));
   float fbase=20.0f;
  beginShape(QUADS);
   vertex(-fbase, 0.0f,-fbase);
    vertex(fbase, 0.0f,-fbase);
    vertex(fbase, 0.0f,fbase);
    vertex(-fbase, 0.0f,fbase);
  endShape();
 }

