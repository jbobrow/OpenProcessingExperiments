
int 
X,Y;
final int
TEXT_COL      = 0xaa000000,
DATA_COL      = 0x99ff0000,
HOVER_COL     = 0xffff0000,
WORLD_TINT    = 0xffffffff,
LINES_WEIGHT  = 2,
BUFF_LINES_W  = 6;
float 
a,b;
PGraphics 
bg, 
hover;
PFont 
h0,h1,h2,h3;
//
Globe w;
// crosshair c;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup(){
   
  size(1300,900,P3D); 
  bg= createGraphics(width,height, P2D);    //Buffer for storing the background
  hover=  createGraphics(width,height,P3D); //Color picking buffer
   //Fonts
  h1= loadFont("Lato-Regular-24.vlw");
  h2= loadFont("Lato-Light-24.vlw");
   //General settings
  X=  width/2;
  Y= height/2;
  createBackground (bg,X,Y,.1);
  frameRate(30);
  cursor(HAND);
  textMode(SCREEN);
   //Objects
  w= new Globe(352,24,"1.png");
 
}
  
  void createBackground (PGraphics pg, int X, int Y,float f){ 
      int x,y;
      pg.beginDraw();
      pg.smooth();
      for(int i=0;++i<pg.width*pg.height;) 
       {pg.set (x=i%pg.width, y=i/pg.width, (255-round(dist(x,y,X,Y)*f))*0x010101);}
      pg.endDraw();
      background(pg);
  }
  


///////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw(){
  
  background(bg);
  hover.beginDraw(); hover.background(0); hover.endDraw();
  lights();
  w.update();
  render(X,Y); 
  detectHover();
}

void render(int x, int y){
  hover.beginDraw();
  pushMatrix();
  translate(x,y);
  hover.translate(x,y);
  pushMatrix();
  rotateX(w.rotation.x);
  rotateY(w.rotation.y);
  hover.rotateX(w.rotation.x);
  hover.rotateY(w.rotation.y);
  fill(WORLD_TINT);
  w.render();
  popMatrix();
  popMatrix();
  hover.endDraw();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

void mouseDragged(){
  if (mouseButton==LEFT)  w.addRotation(mouseX,mouseY,pmouseX,pmouseY);
}

void detectHover(){
  int c=hover.get(height/2,width/2);
  int index= c/0x010101 + 254; 
}


public class Globe {
  
  PImage 
  txtMap;
  int 
  globeRadius; 
  float 
  rWRatio, 
  rHRatio,
  ROTATION_FACTOR=.01*DEG_TO_RAD;
  PVector   
  rotation, 
  rotSpeed;
  
  // Textured sphere implementation 
  float[][] 
  texturedSphereX,
  texturedSphereY, 
  texturedSphereZ, 
  texturedSphereU, 
  texturedSphereV; 
  int   
  texturedSphereDetail;

  ////////////////////////////////////////////////////////////////////////CONSTRUCTOR
   
  Globe(int _radius, int _sphereDetail, String _mapFilename) {
    globeRadius = _radius;
    txtMap = loadImage(_mapFilename);
    rWRatio= txtMap.width/globeRadius;
    rHRatio= txtMap.height/globeRadius;
    setTexturedSphereDetail(_sphereDetail); 
    rotation= new PVector(0,HALF_PI);
    rotSpeed= new PVector(0,0);
  }
  
  ////////////////////////////////////////////////////////////////////////////METHODS
  
  void setTexturedSphereDetail(int detail) {   //Set the detail level for textured spheres, constructing the underlying vertex and uv map data  
    
    if (detail == texturedSphereDetail) return; 
    
    texturedSphereDetail = detail; 
    float step = PI / detail; 
    float ustep = .5 / detail; 
    float vstep = 1. / detail; 
    int d1= detail+1;
    int d2= detail*2 +1;

    texturedSphereX = new float[d1][d2]; 
    texturedSphereY = new float[d1][d2]; 
    texturedSphereZ = new float[d1][d2]; 
    texturedSphereU = new float[d1][d2]; 
    texturedSphereV = new float[d1][d2]; 

    for (int i = 0; i <= detail; i++) { 
      float theta = step * i; 
      float y = cos(theta); 
      float sin_theta = sin(theta); 
      float v = 1.0f - vstep * i; 

      for (int j = 0; j <= 2 * detail; j++) { 
        float phi = step * j; 
        float x = sin_theta * cos(phi); 
        float z = sin_theta * sin(phi); 
        float u = 1.0f - ustep * j; 

        texturedSphereX[i][j] = x * globeRadius; 
        texturedSphereY[i][j] = y * globeRadius; 
        texturedSphereZ[i][j] = z * globeRadius; 
        texturedSphereU[i][j] = u * txtMap.width; 
        texturedSphereV[i][j] = v * txtMap.height; 
      }   
    } 
  }

  void render() {  // draw the sphere
    noStroke();
    int nexti, t2= 2*texturedSphereDetail;
    //
    for (int i = 0; i < texturedSphereDetail; i=nexti) { 
      nexti = i + 1;   
      beginShape(QUAD_STRIP); 
      texture(txtMap); 
        for (int j=0 ; j<=t2 ; j++) {         
          float u  = texturedSphereU[i][j]; 
          float x1 = texturedSphereX[i][j]; 
          float y1 = texturedSphereY[i][j]; 
          float z1 = texturedSphereZ[i][j]; 
          float v1 = texturedSphereV[i][j]; 
          float x2 = texturedSphereX[nexti][j]; 
          float y2 = texturedSphereY[nexti][j]; 
          float z2 = texturedSphereZ[nexti][j]; 
          float v2 = texturedSphereV[nexti][j]; 
          vertex(x1, y1, z1, u, v1); 
          vertex(x2, y2, z2, u, v2); 
        }   
      endShape(); 
    }
  }
  
  void addRotation(int mX,int mY,int pmX,int pmY){
    rotSpeed.x += (pmY-mY)* ROTATION_FACTOR;
    rotSpeed.y -= (pmX-mX)* ROTATION_FACTOR;     
  }
 
  void update(){
    rotation.add  (rotSpeed);
    rotSpeed.mult (.95);  
  }
}



