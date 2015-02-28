
//code for applying image to sphere taken from: http://www.facebook.com/l.php?u=http%3A%2F%2Fprocessing.org%2Fdiscourse%2Fyabb2%2FYaBB.pl%3Fnum%3D1274893475&h=ZAQArJRV_

int prevSec;
int millisRolloverTime;
  int H;
  int M;
  int S;
float wd;
int mils;
 
// Sphere Variables
float R = 100;
int xDetail = 40;
int yDetail = 30;
float[] xGrid = new float[xDetail+1];
float[] yGrid = new float[yDetail+1];
float[][][] allPoints = new float[xDetail+1][yDetail+1][3];

// Rotation Variables
float camDistance = -50;
float rotationX = 100;
float rotationY = 170;
float velocityX = 0;
float velocityY = 0;

 ArrayList<Circlee> hours=new ArrayList(); 
 
// Texture
PImage texmap;
PImage texmap1;

////////////////////////////////////////////////////////////////////////
void setup(){

  millisRolloverTime = 0;
  
  size(700, 700, P3D);
  noStroke();
  
  texmap = loadImage("wax.jpg");
  texmap1= loadImage("wax2.jpg");
 // smooth();

  for (int i=0; i< hour(); i++)
  {
    hours.add(new Circlee((int)random(300),(int)random(300),30,30, i));
  } 
}
////////////////////////////////////////////////////////////////////////
void draw(){

  background(255);

  translate(width/2.0, height/2.0, camDistance);
  rotateX( radians(-rotationX) );  
  rotateZ( radians(270 - rotationY) );
  //setting the time variables
 
  H = hour();
  M = minute();
  S = second();
   wd= 100;


 
 
  // Reckon the current millisecond, 
  // particularly if the second has rolled over.
  // Note that this is more correct than using millis()%1000;
  if (prevSec != S){
    millisRolloverTime = millis();
  } 
  
  prevSec = S;
  mils = millis() - millisRolloverTime;
  
  ///setting up the variables for each circle
  
    /// second sphere
    float centerX = 100;
  float amplitude = 10;
  float period = .0005;
  float metricSecond = mils;
  float xPos = centerX + amplitude * sin(metricSecond*(TWO_PI)*2*period);
  
  //for the line
  
  float centerE = 0;
  float amplitudeE = 120;
  
  float xPosE = centerE + amplitudeE * sin(metricSecond*(-TWO_PI)*2*period);   
  float yPosE = centerE + amplitudeE * cos(metricSecond*(-TWO_PI)*2*period);   

        ///draw second sphere
   setupSphere(xPos, xDetail, yDetail);
   drawSphere(texmap);
 // strokeWeight(9);
//  stroke(255);
//  line (0,0, xPosE,yPosE);
///  noStroke();
    /// minute sphere
  
  float centerX2 = 100;
  float amplitude2 = 100;
  float period2 = .0005;
  float metricSecond2 = (S * 1000) + mils;
  //text(metricSecond2, width/2,270);
  metricSecond2 = map(metricSecond2, 0, 60000, 0, 1000);
  float xPos2 = centerX2 + amplitude2 * sin(metricSecond2*(TWO_PI)*period2);
  
   
  
    ///hour sphere
  
  float centerX3 = 100;
  float amplitude3 = 100;
  float period3 = .0005;
  float metricMinute3 = (M * 60000);
  metricMinute3 = map(metricMinute3, 0, 3600000, 0, 1000);
  float xPos3 = centerX3 + amplitude3 * sin(metricMinute3*(TWO_PI)*period3);
      

  ////
 
    
      // draw minute sphere
      
        translate (100,100,-300);
        setupSphere(xPos2, xDetail, yDetail);
        drawSphere(texmap1);
//        strokeWeight(9);
//        stroke(255);
//       line (0,0, 100,100);
//         noStroke();
         
               /// draw hour sphere
         translate (100,100,300);
         setupSphere(xPos3, xDetail, yDetail);
        drawSphere(texmap1);
        
          for(int i=0; i< hours.size(); i++)
          hours.get(i).display();
        
         setupSphere(1000, xDetail, yDetail);
        drawSphere(texmap1);
  

  

  

  
 // setupSphere(xPos, xDetail, yDetail);
 // drawSphere(texmap);
 
 


  // Implements mouse control (interaction will be inverse when sphere is  upside down)
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;
  if(mousePressed){
    velocityX += (mouseY-pmouseY) * 0.01;
    velocityY -= (mouseX-pmouseX) * 0.01;
  }
}

////////////////////////////////////////////////////////////////////////
void setupSphere(float R, int xDetail, int yDetail){

  // Create a 2D grid of standardized mercator coordinates
  for(int i = 0; i <= xDetail; i++){
    xGrid[i]= i / (float) xDetail;
  } 
  for(int i = 0; i <= yDetail; i++){
    yGrid[i]= i / (float) yDetail;
  }

  textureMode(NORMALIZED);

  // Transform the 2D grid into a grid of points on the sphere, using the inverse mercator projection
  for(int i = 0; i <= xDetail; i++){
    for(int j = 0; j <= yDetail; j++){
      allPoints[i][j] = mercatorPoint(R, xGrid[i], yGrid[j]);
    }
  }
}

////////////////////////////////////////////////////////////////////////
float[] mercatorPoint(float R, float x, float y){

  float[] thisPoint = new float[3];
  float phi = x*2*PI;
  float theta = PI - y*PI;

  thisPoint[0] = R*sin(theta)*cos(phi);
  thisPoint[1] = R*sin(theta)*sin(phi);
  thisPoint[2] = R*cos(theta);

  return thisPoint;
}

////////////////////////////////////////////////////////////////////////
void drawSphere(PImage Map){

  for(int j = 0; j < yDetail; j++){
    beginShape(TRIANGLE_STRIP);
    texture(Map);
    for(int i = 0; i <= xDetail; i++){
      vertex(allPoints[i][j+1][0],   allPoints[i][j+1][1],   allPoints[i][j+1][2],   xGrid[i],   yGrid[j+1]);
      vertex(allPoints[i][j][0],     allPoints[i][j][1],     allPoints[i][j][2],     xGrid[i],   yGrid[j]);
    }
    endShape(CLOSE);
  }
}
 

