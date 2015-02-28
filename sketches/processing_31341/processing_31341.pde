
float zPos = -200;
// Sphere Variables
float R = 250;
int xDetail = 40;
int yDetail = 30;
float[] xGrid = new float[xDetail+1];
float[] yGrid = new float[yDetail+1];
float[][][] allPoints = new float[xDetail+1][yDetail+1][3];
// Rotation Variables
float camDistance = -50;
float rotationX = 100;
float rotationY = 170;
//float velocityX = 0;
//float velocityY = 0;
// Texture
PImage texmap;
PImage bg;
void setup(){
  size(700, 700, P3D);
  background(0);
  bg = loadImage("night.jpg");
  noStroke();
  texmap = loadImage("map.jpg");
  setupSphere(R, xDetail, yDetail);
}
void draw(){
  hint(DISABLE_DEPTH_TEST);
  background(bg);
  hint(ENABLE_DEPTH_TEST);
  translate(width/2.0, height/2.0, camDistance);
  
  rotateX( radians(-rotationX) );
  rotateZ( radians(270 - rotationY) );
  rotateZ(radians(frameCount));
  drawSphere(texmap);
  //rotationX += velocityX;
  //rotationY += velocityY;  
  //velocityX *= 0.95;
  //velocityY *= 0.95;

  }
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
    }  }}
  

float[] mercatorPoint(float R, float x, float y){
  float[] thisPoint = new float[3];
  float phi = x*2*PI;
  float theta = PI - y*PI;
  thisPoint[0] = R*sin(theta)*cos(phi);
  thisPoint[1] = R*sin(theta)*sin(phi);
  thisPoint[2] = R*cos(theta);
  return thisPoint;
}


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
pushMatrix();
  translate(width/2+200, height/2-400, zPos);
  fill(211,211,211);
  sphere(80);
  popMatrix();
} 




