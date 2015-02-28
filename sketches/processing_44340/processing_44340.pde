
 

//move thing glodals 
float X, Y, Z;
float speedy; //intial speed of the initials in the y
float speedx; //intial speed of the initials in the x
float speedz; //intial speed of the initials in the x
float Rx;
float Ry;
float Rz;
boolean Xt; 
boolean Xf; 

//
float SliderX;
float SliderY;
float SliderZ;
float boxw;// the width of the sliders
float boxh;// the length of the sliders
float boxx;
//=============================================================== (draw thing)
int prevSec;
int millisRolloverTime;
  int Sl;
float wd;
int mils;

float [] positionerX = new float [20];
float [] positionerY = new float [20];
float [] positionerZ = new float [20];
float [] rotateXer = new float [20];
float [] rotateYer = new float [20];
float [] rotateZer = new float [20];
//
//Xt= false;
//Xf= false;

// Sphere Variablescccccccccc
float R = 100;
int xDetail = 40;
int yDetail = 30;
float[] xGrid = new float[xDetail+1];
float[] yGrid = new float[yDetail+1];
float[][][] allPoints = new float[xDetail+1][yDetail+1][3];
float camDistance = -50;
// Texture
PImage texmap;
PImage texmap1;
PImage texmap3;
PImage gold;

void setup()
{
  size(800, 800, P3D);
// =======change position of thing
  X=width/2;
  Y=height/2;
  Z= 0;
  speedy = 0; //intial speed of the initials in the y
  speedx = 0; //intial speed of the initials in the x
  speedz = 0; //intial speed of the initials in the x
     SliderY= .5;
        SliderX= .5;
           SliderZ= .5;
//======== sliders
  boxw = width - 200;
  boxh = 20;
  boxx = 170;
  
//=========draw thing
    noStroke();

  texmap = loadImage("wax.jpg");
  texmap3 = loadImage("wax2.jpg");
  texmap1= loadImage("ice.jpg");
  gold= loadImage("gold.jpg");
  
  for (int i= 0; i< positionerX.length-1; i++)
  {
    positionerX[i]= random (-width*.1, width*.1);
    positionerY[i]= random (-height*.1, height*.1);
    positionerZ[i]= random (-height*.15, 0);
    rotateXer[i] = random(-.5,.5);
    rotateYer[i] = random(-.5,.5);
    rotateZer[i] = random(-.5,.5);
  }
  
  //time
    millisRolloverTime = 0;

}

void draw()
{
  background(255, 255, 255);

  moveThing();
  drawThing();
    button();
  sliderX();
 sliderY();
 sliderZ();
  data();

}

void data()
{
 fill (255);
 textSize(15); 
 text("Rotation X: "+int(Rx), 20, 120);
 text("Rotation Y: "+int(Ry), 20, 170);
 text("Rotation Z: "+int(Rz), 20, 70);
 

 text ("MOVEMENT: ", 20,220);
  text ("x: "+speedx, 30,240);
   text ("y : "+speedy, 30,255);
    text ("z : "+speedz, 30,270);

text ("DISTANCE: ", 20,320);
  text ("x : "+(X-400), 30,340);
   text ("y : "+(Y-400), 30,355);
    text ("z : "+Z, 30,370);
     
//  
}


void button()
{
  pushMatrix();
  float diam = 40;
  float diam1 = 40;
  translate (150,650,0);  
  fill (255);
  textSize(30);
  text ("Stop", -120, 0);
  setupSphere(diam, xDetail, yDetail);
  drawSphere(gold);
  
  float d= dist(150,650, mouseX, mouseY);
  if ((mousePressed)&&(d<20))
  {
    speedx=0;
    speedy=0;
    speedz=0;
  }  
  
  translate (0,90,0);
  text ("ReSet", -130, 0);  
  
  float d2= dist(150,740, mouseX, mouseY);
  if ((mousePressed)&&(d2<20))
  {
    speedx=0;
    speedy=0;
    speedz=0;
    SliderX=.5;
    SliderY=.5;
    SliderZ=.5;
    X=width/2;
    Y=height/2;
    Z=0;
    
  }  
  
  setupSphere(diam1, xDetail, yDetail);
  drawSphere(texmap);
  
  popMatrix();
}

void drawThing()
{
  pushMatrix();
 
  background(255);

 float noiseValue3 = noise(  millis()/3000.0 ); 
 float noiseValue2 = noise( (millis()+12345)/6357.9 ); 
 float noiseValue1 = noise( (millis()+23456)/5111.1  );

 float S = map(noiseValue3, 0,1,  -10,10); 
 float S2 = map(noiseValue2, 0,1,  10,-10); 
  float S3 = map(noiseValue3, 0,1,  -10,10); 


   translate(X, Y, Z);
  rotateX(radians(Rx));
  rotateY(radians(Ry));
  rotateZ(radians(Rz));

  ////time
    Sl = second();
   wd= 100;


  if (prevSec != Sl){
    millisRolloverTime = millis();
  } 
  
  prevSec = Sl;
  mils = millis() - millisRolloverTime;

    float centerX2 = 50;
  float amplitude = 5;
  float period = .0005;
  float metricSecond = mils;
  float xPos = centerX2 + amplitude * sin(metricSecond*(TWO_PI)*2*period);
  
  ////time
  
  for (int i= 0; i< positionerX.length-15; i++)
  {
    pushMatrix();
    rotateX(radians(S*rotateXer[i]));
    rotateY(S2*rotateYer[i]);
    rotateZ(S3*rotateZer[i]);
    setupSphere(xPos, xDetail, yDetail);
     drawSphere(texmap);
     popMatrix();
  }

  for (int i= 0; i< positionerX.length-1; i++)
  {

   // rotateX((counter2/500.0)*rotateXer[i]);  
    pushMatrix();
    
    translate (positionerX[i], positionerY[i], positionerZ[i]);
    rotateX(radians(S*rotateXer[i]));
    rotateY(S2*rotateYer[i]);
    rotateZ(S3*rotateZer[i]);
    setupSphere(50, xDetail, yDetail);
    drawSphere(texmap3);
    popMatrix();
  } 
  
    setupSphere(3000, xDetail, yDetail);
    drawSphere(texmap1);

popMatrix();
}


void keyPressed()
{

  //  float acceleration= .005;

  if (keyCode == UP)
  {
    speedy = speedy - 1;
  }
  else if (keyCode == DOWN)
  {
    speedy = speedy + 1;
  }
  else if (keyCode== LEFT)
  {
    speedx = speedx - 1;
  }
  else if (keyCode== RIGHT)
  {
    speedx = speedx + 1 ;
  }
  else if (key=='c')
  {
    speedz = speedz + 1 ;
  }
  else if (key=='a')
  {
    speedz = speedz - 1 ;
  }

  else if ( key==' ')
  {
    speedx=0;
    speedy=0;
    speedz=0;
    SliderX=.5;
    SliderY=.5;
    SliderZ=.5;
    X=width/2;
    Y=height/2;
    Z=0;
    
  }
  
  else if (key=='s')
  {
    speedx=0;
    speedy=0;
    speedz=0;
  }
  else if (key=='z' )
  {
   Z=Z-500;
  }
    else if (key=='x' )
  {
    Z= Z+500;
  }
}

void moveThing()
{
  Y= Y+speedy;
  X= X+speedx;
  Z= Z+speedz;
}

void sliderX()
{
  //================================(the slider) 


  Rx= map (SliderX, 0, 1, -360, 360);
 float rW = map(SliderX, 0, 1, 0, boxw); 
//  if (Rx==0)
//  {
//    rW=0;
//  }

  // draw RGB sliders
   fill (255); 
  rect (boxx, 100, boxw, boxh);

  
  fill (0); 
  image (gold, boxx, 100, rW, boxh);
  
  pushMatrix();

  translate (boxx+rW,110);  
  setupSphere(20, xDetail, yDetail);
  drawSphere(gold);
  popMatrix();
  // draw black rectangles in background
 
  // perform interaction which sets the RGB values
  if (mousePressed) {
    if ((mouseY > 100) && (mouseY < 100+boxh)) {
       SliderX = constrain(map(mouseX-boxx, 0, boxw, 0, 1), 0, 1);
    }
  }

}


void sliderY()
{
  
   float rW = map(SliderY, 0, 1, 0, boxw); 

  // draw RGB sliders
   fill (255); 
  rect (boxx, 150, boxw, boxh);

  
  fill (0); 

  image (gold, boxx, 150, rW, boxh);
  
  pushMatrix();

  translate (boxx+rW,160);  
  setupSphere(20, xDetail, yDetail);
  drawSphere(gold);
  popMatrix();
  // draw black rectangles in background
 
  // perform interaction which sets the RGB values
  if (mousePressed) {
    if ((mouseY > 150) && (mouseY < 150+boxh)) {
       SliderY = constrain(map(mouseX-boxx, 0, boxw, 0, 1), 0, 1);
    }
   
  }

  Ry= map (SliderY, 0, 1, -360, 360);
  
}
void sliderZ()
{
  //================================(the slider) 
Rz = map(SliderZ, 0, 1, 0, boxw); 
  // draw RGB sliders
   fill (255); 
  rect (boxx, 50, boxw, boxh);

  
  fill (0); 
  
 image (gold, boxx, 50, Rz, boxh);
  
  pushMatrix();

  translate (boxx+Rz,60);  
  setupSphere(20, xDetail, yDetail);
  drawSphere(gold);
  popMatrix();

  // draw black rectangles in background
 
  // perform interaction which sets the RGB values
  if (mousePressed) {
    if ((mouseY > 50) && (mouseY < 50+boxh)) {
       SliderZ = constrain(map(mouseX-boxx, 0, boxw, 0, 1), 0, 1);
    }
  }

  Rz= map (SliderZ, 0, 1, -360, 360);
}

////////////////////////////////////////////////////////////////////////
void setupSphere(float R, int xDetail, int yDetail) {

  // Create a 2D grid of standardized mercator coordinates
  for (int i = 0; i <= xDetail; i++) {
    xGrid[i]= i / (float) xDetail;
  } 
  for (int i = 0; i <= yDetail; i++) {
    yGrid[i]= i / (float) yDetail;
  }

  textureMode(NORMALIZED);

  // Transform the 2D grid into a grid of points on the sphere, using the inverse mercator projection
  for (int i = 0; i <= xDetail; i++) {
    for (int j = 0; j <= yDetail; j++) {
      allPoints[i][j] = mercatorPoint(R, xGrid[i], yGrid[j]);
    }
  }
}

////////////////////////////////////////////////////////////////////////
float[] mercatorPoint(float R, float x, float y) {

  float[] thisPoint = new float[3];
  float phi = x*2*PI;
  float theta = PI - y*PI;

  thisPoint[0] = R*sin(theta)*cos(phi);
  thisPoint[1] = R*sin(theta)*sin(phi);
  thisPoint[2] = R*cos(theta);

  return thisPoint;
}

////////////////////////////////////////////////////////////////////////
void drawSphere(PImage Map) {

  for (int j = 0; j < yDetail; j++) {
    beginShape(TRIANGLE_STRIP);
    texture(Map);
    for (int i = 0; i <= xDetail; i++) {
      vertex(allPoints[i][j+1][0], allPoints[i][j+1][1], allPoints[i][j+1][2], xGrid[i], yGrid[j+1]);
      vertex(allPoints[i][j][0], allPoints[i][j][1], allPoints[i][j][2], xGrid[i], yGrid[j]);
    }
    endShape(CLOSE);
  }
}



