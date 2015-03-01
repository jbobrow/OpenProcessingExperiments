
/**
 * A fast method for getting an arbitrary number of equidistant points on a sphere.
 * Draws a fibonacci spiral down from the pole, which maintains uniform surface area.
 *
 * Click to toggle point adding.
 *
 * Jim Bumgardner 10/6/2011
 */
 // import processing.opengl.*;
 
float R = 180; //277;
 
float rotationX = -15;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float pushBack = 0;
 
float phi = (sqrt(5)+1)/2 - 1; // golden ratio
float ga = phi*2*PI;           // golden angle
 
int kMaxPoints = 10000000;
 
int nbrPoints = 10000000;
int cntPoints = 1;
 
// To add: Give each point a heading and velocity, adjust based on distance/heading to nearby points.
//
class SpherePoint {
  float  lat,lon;
  SpherePoint(float lat, float lon)
  {
    this.lat = lat;
    this.lon = lon;
  }
};
 
SpherePoint[] pts = new SpherePoint[kMaxPoints];
 
boolean addPoints = false;
 
void initSphere()
{
  cntPoints = 1;
  for (int i = 1; i <= min(nbrPoints,pts.length); ++i) {
    float lon = ga*i;
    lon /= 2*PI; lon -= floor(lon); lon *= 2*PI;
    if (lon > PI)  lon -= 2*PI;
 
    // Convert dome height (which is proportional to surface area) to latitude
    float lat = asin(-1 + 2*i/(float)nbrPoints);
 
    if( shouldRender(lat,lon)){
        pts[cntPoints] = new SpherePoint(lat, lon);
        cntPoints++;
    }
  }
}
 
void setup()
{
  // size(1024, 768, P3D); 
  size(1000, 1000, OPENGL); 
  //R =  .8* height/2;  //regular
  R =  1.4* height/2;  //max zoom
  //R =  1.55883* height/2;  //max zoom
   
  initSphere();
   
  colorMode(RGB, 1);
  background(0);
 
 
}

boolean drawOnce = true;
boolean drawn = false;

boolean allowDraw(){
    
    if (!drawOnce) {
        return true;
    } else if (drawOnce && !drawn){
        drawn = true;
        return true;
    }
    
    return false;
}
 
void draw()
{   
 if (allowDraw()) {
    if (addPoints) {
        nbrPoints += 1;
        nbrPoints = min(nbrPoints, kMaxPoints);
        initSphere();
      }
     
      background(0);           
      smooth();
     
      renderGlobe();
     
      rotationX += velocityX;
      rotationY += velocityY;
      velocityX *= 0.95;
      velocityY *= 0.95;
       
      // Implements mouse control (interaction will be inverse when sphere is  upside down)
      if(mousePressed){
        velocityX += (mouseY-pmouseY) * 0.01;
        velocityY -= (mouseX-pmouseX) * 0.01;
      }
   }
}
 
 
void renderGlobe()
{
  pushMatrix();
  translate(width/2.0, height/2.0, pushBack);
   
  float xRot = radians(-rotationX);
  float yRot = radians(270 - rotationY); // - millis()*.01);
  rotateX( xRot ); 
  rotateY( yRot );
  
 
  strokeWeight(2);
   
  float elapsed = millis()*.001;
  float secs = floor(elapsed);
  
  for (int i = 1; i < cntPoints; ++i) //min(nbrPoints,pts.length)
  {
      float lat = pts[i].lat;
      float lon = pts[i].lon;
     
          pushMatrix();
          rotateY( lon);
          rotateZ( -lat);
          //float lum = (cos(pts[i].lon+PI*.33+yRot)+1)/2;
          //stroke(.5,.5*lum,.2+lum*.8);
          stroke(1.0,0.0,0.0);
          //point(R,0,0);
          line(R,0,0,R,.5,.38);

          pushMatrix();
          rotateY( .00030);
          rotateZ( .00018);
          stroke(0.0,1.0,0.0);
          //point(R,0,0);
          line(R,0,0,R,.5,.38);          

          pushMatrix();
          rotateY( .00030);
          rotateZ( .00018);
          stroke(0.0,0.0,1.0);
          //point(R,0,0);
          line(R,0,0,R,.5,.38);
          popMatrix();
  
          popMatrix();
          
          popMatrix();
  }
 
  popMatrix();
   
}
 
boolean shouldRender(float lat, float lon)
{
   int window_lat = 3;
   int window_lon = 16;
   if(((lat > (-PI/6) * cos(lon)+.3*exp(-pow(5*lon,2) )) && (lat < (PI/6) * cos(lon)) && lon > -1 && lon < 1 ) && 
   (lat > -PI/window_lat && lat < PI/window_lat && lon > -PI/window_lon && lon < PI/window_lon)) {
        return true;
    }
    
    return false;
}
 
void mouseClicked()
{
  //addPoints = !addPoints;
}
