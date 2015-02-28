
// Sphere Variables
float R = 500;
int H = 1000;
int xDetail = 25;
int yDetail = 15;
float[] xGrid = new float[xDetail+1];
float[] yGrid = new float[yDetail+1];
float[][][] allPoints = new float[xDetail+1][yDetail+1][3];

// Rotation Variables
float camDistance = -700;
float rotationX = 90;
float rotationY = 90;
float velocityX = 0;
float velocityY = 0;

// Texture
PImage texmap;

////////////////////////////////////////////////////////////////////////
void setupSphere()
{
  hint(ENABLE_DEPTH_SORT) ;
  frameRate(60);
  setupSphere(R, xDetail, yDetail);
}
////////////////////////////////////////////////////////////////////////
void drawGlobe()
{
  
  background(0);
  translate(width/2.0, height/2.0, camDistance);
  rotateX( radians(-rotationX) );  
  rotateZ( radians(270 - rotationY) );
  texmap = buffer.get(0, 0, buffer.width - 1, buffer.height - 1);
  drawSphere(texmap);

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
    xGrid[i]= (float)i / (float) xDetail;
  } 
  for(int i = 0; i <= yDetail; i++){
    yGrid[i]= (float)i / (float) yDetail;
  }

  textureMode(NORMALIZED);

  // Transform the 2D grid into a grid of points on the sphere, using the inverse mercator projection
  for(int i = 0; i <= xDetail; i++){
    for(int j = 0; j <= yDetail; j++){
      allPoints[i][j] = mercatorPoint(R, xGrid[i], yGrid[j]);
    }
  }
  texmap = buffer.get(0, 0, buffer.width, buffer.height);
}

////////////////////////////////////////////////////////////////////////
float[] mercatorPoint(float R, float x, float y){

  float[] thisPoint = new float[3];
  float phi = x*2*PI;
  float theta = PI - y*PI;

  //thisPoint[0] = R*cos(phi);
  //thisPoint[1] = R*sin(phi);
  //thisPoint[2] = H * y - 0.5*H;
  thisPoint[0] = R * sin(theta) * cos(phi);
  thisPoint[1] = R * sin(theta) * sin(phi);
  thisPoint[2] = R * cos(theta);
  return thisPoint;
}

////////////////////////////////////////////////////////////////////////
void drawSphere(PImage Map){
  noStroke();
  for(int j = 0; j < yDetail; j++){
    beginShape(TRIANGLE_STRIP);
    texture(Map);
    for(int i = 0; i <= xDetail; i++){
      vertex(allPoints[i][j+1][0],   allPoints[i][j+1][1],   allPoints[i][j+1][2],   xGrid[i],   yGrid[j + 1]);
      vertex(allPoints[i][j][0],     allPoints[i][j][1],     allPoints[i][j][2],     xGrid[i],   yGrid[j]);
    }
    endShape(CLOSE);
  }
}
 

