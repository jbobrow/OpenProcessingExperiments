
int radius = 40;
float radSpeed = 0.05;
float maxTheta = 8*3.141592;
int ellCenterX;
int ellCenterY;
float theta;

void setup()
{
  size(800,400);
  ellipseMode(RADIUS);
  ellCenterX = 100;
  ellCenterY = height/2;
  theta = 0;
  smooth();
  frameRate(30);
}

void draw()
{
  background(200);
  
  // draw a circle
  strokeWeight(2);
  stroke(128);
  noFill();
  ellipse(ellCenterX, ellCenterY, radius, radius);
  
  // draw a moving point on the circle
  stroke(0);
  fill(0);
  ellipse(ellCenterX + radius*cos(theta), ellCenterY + radius*sin(theta), 3, 3);
  theta += radSpeed;
  if( theta >= maxTheta )
  {
    theta = 0;
  }
  
  // draw a function
  int originX = ellCenterX + 200;
  int originY = ellCenterY;
  float thetaScale = 15;
  
  strokeWeight(3);
  line(originX, originY, originX + thetaScale*(maxTheta+1), originY);
  line(originX, originY + 1.5*radius, originX, originY - 1.5*radius);
  
  stroke(128);
  strokeWeight(1);
  for( float tempTheta = 0; tempTheta < theta; tempTheta += radSpeed )
  {
    line(originX + tempTheta*thetaScale,
    originY + radius*sin(tempTheta),
    originX + (tempTheta+radSpeed)*thetaScale,
    originY + radius*sin(tempTheta+radSpeed));
  }
  stroke(0);
  for( float tempX = ellCenterX + radius*cos(theta); tempX < originX + theta*thetaScale; tempX += 4 )
  {
    line(tempX, ellCenterY + radius*sin(theta), tempX + 2, ellCenterY + radius*sin(theta));
  }  
  
}

