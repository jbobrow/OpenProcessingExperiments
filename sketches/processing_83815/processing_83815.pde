

PImage noh;
PImage ff;
PImage baba;

int H; 
int M; 
int S; 
int counter;
int mils;
int millisRolloverTime;
int prevSec;

//tonight, figure out for-loop for spheres. make all images for planets, begin arches, whatever else 

int sDetail = 35;  // Sphere detail setting
float deg= 0;
float rotationX = 0.0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float q=.001;
float d=.001;
float metricSecond = millis();
float period = .0005;
float globeRadius = 100;
float nohRadius = 100;
float divRadius = 50;
float pushBack = -100;

float[] cx, cz, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
float camDistance = -50;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);
int rotY = 0;

void setup() {
  size(800, 760, P3D);  
 noh = loadImage("ff00ff.png");
 baba=loadImage("7fff00.png");
 ff = loadImage("32cd32.png");
  initializeSphere(sDetail);
  S = second();
  M = minute();
  H = hour();
}

void draw() {    
 background(0);
 M = minute();
 H = hour();
 
 
 
// background(0);
//translate(width/2.0, height/2.0, camDistance);   
  renderGlobe(); 
  millisRolloverTime = 0;
}

void renderGlobe() {   
int H = hour();
int M = minute();
int S = second();


if(prevSec != S)
{
  millisRolloverTime = millis();
}
prevSec = S;
mils = millis() - millisRolloverTime;
println(mils);
  
//BUDDHA
  pushMatrix();
    translate(width/2,height/2, pushBack);
    lights();    
      pushMatrix();
        rotateY((millis())*TWO_PI/1000);  
       fill((0+millis()));
        noStroke();
        textureMode(IMAGE);  
        texturedSphere(globeRadius, baba);
      popMatrix();  
  popMatrix();
  



  //noh
    
  pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     // rotate( radians();  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
   textureMode(IMAGE);
    texturedSphere(nohRadius*sin(millis()*10), noh);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(270+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(360+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
  
  
  //reverse
   pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     rotateX( radians(180));  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
     // else textureMode (IMAGE);
     // }
     texturedSphere(nohRadius*sin(millis()*10), noh);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(270+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(360+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
  
  //side
    
   pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     rotateX( radians(90));  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
     // else textureMode (IMAGE);
     // }
     texturedSphere(nohRadius*sin(millis()*10), noh);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
      
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, 200, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(0) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(0));
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), noh);
     popMatrix();  
  popMatrix();
     
  //BUDDHA
  
  pushMatrix();
    translate(width/2,height/2, pushBack);
    lights();    
      pushMatrix();
        rotateY((millis())*TWO_PI/1000);  
       fill((0+millis()));
        noStroke();
        textureMode(IMAGE);  
        texturedSphere(globeRadius, ff);
      popMatrix();  
  popMatrix();
  



  //noh
    
  pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     // rotate( radians();  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
   textureMode(IMAGE);
    texturedSphere(nohRadius*sin(millis()*10), ff);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(270+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(0) );  
      rotateY( radians(360+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
  
  
  //reverse
   pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     rotateX( radians(180));  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
     // else textureMode (IMAGE);
     // }
     texturedSphere(nohRadius*sin(millis()*10), ff);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(270+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(180) );  
      rotateY( radians(360+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
  
  //side
    
   pushMatrix();
    translate(width/2, height/2, pushBack);
  //  lights();    
      pushMatrix();
     rotateX( radians(90));  
      rotateY( radians(90+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
     // else textureMode (IMAGE);
     // }
     texturedSphere(nohRadius*sin(millis()*10), ff);
      popMatrix();  
  popMatrix();
    pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(180+millis()) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
      
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, 200, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(0) );
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
     // if(s <= 9){
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
      pushMatrix();
    translate(width/2, height/2, pushBack);
      pushMatrix();
      rotateX( radians(90) );  
      rotateY( radians(0));
      translate((250)*sin(radians(.03*millis())),(250)*cos(radians(.03*millis())),0);
      fill(255, 144, 146);
      noStroke();
      textureMode(IMAGE);  
      texturedSphere(nohRadius*sin(millis()*10), ff);
     popMatrix();  
  popMatrix();
     }
void initializeSphere(int res)
{
  sinLUT = new float[SINCOS_LENGTH];
  cosLUT = new float[SINCOS_LENGTH];

  for (int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SINCOS_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SINCOS_PRECISION);
  }

  float delta = (float)SINCOS_LENGTH/res;
  float[] cx = new float[res];
  float[] cz = new float[res];
  
  // Calc unit circle in XZ plane
  for (int i = 0; i < res; i++) {
    cx[i] = -cosLUT[(int) (i*delta) % SINCOS_LENGTH];
    cz[i] = sinLUT[(int) (i*delta) % SINCOS_LENGTH];
  }
  
  // Computing vertexlist vertexlist starts at south pole
  int vertCount = res * (res-1) + 2;
  int currVert = 0;
  
  // Re-init arrays to store vertices
  sphereX = new float[vertCount];
  sphereY = new float[vertCount];
  sphereZ = new float[vertCount];
  float angle_step = (SINCOS_LENGTH*0.5f)/res;
  float angle = angle_step;
  
  // Step along Y axis
  for (int i = 1; i < res; i++) {
    float curradius = sinLUT[(int) angle % SINCOS_LENGTH];
    float currY = -cosLUT[(int) angle % SINCOS_LENGTH];
    for (int j = 0; j < res; j++) {
      sphereX[currVert] = cx[j] * curradius;
      sphereY[currVert] = currY;
      sphereZ[currVert++] = cz[j] * curradius;
    }
    angle += angle_step;
  }
  sDetail = res;
}


// Generic routine to draw textured sphere
void texturedSphere(float r, PImage t) 
{
  int v1,v11,v2;
  r = (r + 240 ) * 0.33;
  beginShape(TRIANGLE_STRIP);
  texture(t);
  float iu=(float)(t.width-1)/(sDetail);
  float iv=(float)(t.height-1)/(sDetail);
  float u=0,v=iv;
  for (int i = 0; i < sDetail; i++) {
    vertex(0, -r, 0,u,0);
    vertex(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, u, v);
    u+=iu;
  }
  vertex(0, -r, 0,u,0);
  vertex(sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r, u, v);
  endShape();   
  
  // Middle rings
  int voff = 0;
  for(int i = 2; i < sDetail; i++) {
    v1=v11=voff;
    voff += sDetail;
    v2=voff;
    u=0;
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int j = 0; j < sDetail; j++) {
      vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, u, v);
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2++]*r, u, v+iv);
      u+=iu;
    }
  
    // Close each ring
    v1=v11;
    v2=voff;
    vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1]*r, u, v);
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v+iv);
    endShape();
    v+=iv;
  }
  u=0;
   // Add the northern cap
  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i = 0; i < sDetail; i++) {
    v2 = voff + i;
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v);
    vertex(0, r, 0,u,v+iv);    
    u+=iu;
  }
 
  vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
  endShape();
  
}

