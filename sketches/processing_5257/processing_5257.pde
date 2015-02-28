
//import peasy.org.apache.commons.math.*;
//import peasy.*;
//import peasy.org.apache.commons.math.geometry.*;
public boolean showlight = false;
PGraphics portal;
PImage gp;
public boolean viewwin= false;
public boolean autorotate = false;
/**
 * Textured Sphere 
 * by Mike 'Flux' Chang (cleaned up by Aaron Koblin). 
 * Based on code by Toxi. 
 * 
 * A 3D textured sphere with simple rotation control.
 * Note: Controls will be inverted when sphere is upside down. 
 * Use an "arc ball" to deal with this appropriately.
 */ 

//PeasyCam cam;

import processing.opengl.*;
import processing.video.*;
PImage bg;
PImage texmap;
PGraphics pop;
Movie mm;
PImage mmget;
int sDetail = 175;  //Sphere detail setting
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float globeRadius = 300;
float pushBack = 0;
public float rotation = 0.0f;
float[] cx,cz,sphereX,sphereY,sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5f;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);
public String  [] file;

    
//  

void setup()
{
  file = new String[9];

file[0]  = "http://www.ignorancia.org/uploads/panoramas/patio/sm_patio.jpg"; //"world32k.jpg";   
file[1]  = "http://www.peterstephens.co.uk/blog_images/full/nissan_gtr.jpg";
file[2]  = "http://upqe.se/blog/wp-content/uploads/kitchen.jpg";
file[3]  = "http://www.ptgui.com/man/images/proj_equirectangular.jpg";
file[4]  = "http://www.hoelle.net/tmp/mp2id/img/pano26_try.jpg";
file[5]  = "http://www.ignorancia.org/uploads/panoramas/the-office/sm_office-85.jpg"; //"http://hof.povray.org/images/bigthumb/glasses.jpg";
file[6]  = "http://www.ignorancia.org/uploads/panoramas/patio/sm_patio.jpg";
file[7]  = "2z.jpg"; 
file[8]  = "http://hof.povray.org/images/chado_Big.jpg";


//
////file[5]="http://www.ignorancia.org/uploads/panoramas/lotw-041119/sm_lotw-041119.jpg";
////file[6]="http://hof.povray.org/images/kitchen.jpg";
//file[27]="qtvr.jpg";
//file[8]="sx.jpg";
//file[9]="ben.jpg";
//file[10]="p2.jpg";
//file[11]="eh.jpg";
//file[12]="8.jpg";
//file[13]="2az.jpg";
//file[14]="er.jpg";
//file[15]="ob.jpg";
//file[16]="2a.jpg";
//file[18] = "mug.jpg";
//file[19]  = "atnight.PNG";    
//file[20]  = "2.jpg";    
//file[21]  = "b.jpg";    
//file[22]  = "3.jpg";    
//file[23] = "patio.jpg";    
//file[24]  = "o1.jpg";    
//file[25]  = "gui.jpg";    
//file[26]  = "fall.jpg"; 
//
//file[28]  = "roof.jpg"; 
//file[28]  = "front.jpg"; 
//file[29]  = "street.jpg";
//file[30]  = "o1.jpg";
//file[31]  = "i2.jpg";
//file[32]  = "er2.jpg";

//  cam = new PeasyCam (this,100);

  mmget = new PImage (255,255);
 //texmap  = loadImage  (file[2]);
  
 if (texmap == null){
  size(640, 480, P3D);  
      texmap  = loadImage  (file[7]); 
     
 }

  hint(DISABLE_OPENGL_2X_SMOOTH);
  smooth();
  pop = createGraphics(width,height,P3D);
  pop.beginDraw();
  loadPixels();
  portal = createGraphics(width,height,P3D);
  portal.beginDraw();
  portal.loadPixels();
if (texmap !=null){
  portal.image(texmap,0,0,width,height);
  portal.endDraw();
  portal.updatePixels();
 
  pop.loadPixels();
  pop.image(texmap,0,0,width,height);
  pop.updatePixels();
}
  initializeSphere(sDetail);
  
  gp = new PImage (640,480);
  noStroke();
  gp.loadPixels();
   

}



int x,y,i,w=512; 



int r(int a){return int(random(a));} 

void draw()
{    


  background(0);




  rotation +=.02;
 translate(width/2,height/2, 300);
  //rotateY(radians(180)); // uncomment to look ahead
 if (autorotate){
 rotateY(rotation);
 }
 
 renderGlobe(); 


if (viewwin){
 for (int x= 0;x<width;x++){
 for (int y= 0;y<height;y++){
   
      set (x,y,portal.pixels[x+width*y]);
  
   }
 }
      
}
 }


void renderGlobe() 
{
  pushMatrix();
  //translate(width/2.0, height/2.0, pushBack);
  pushMatrix();
  noFill();
  stroke(255,200);
  strokeWeight(2);
  //smooth();
  popMatrix();
  lights();    
  pushMatrix();
  rotateX( radians(-rotationX) );  
  rotateY( radians(270 - rotationY) );
  fill(200);
  noStroke();
  textureMode(IMAGE);  




  texturedSphere(globeRadius,texmap);

  popMatrix();  
  popMatrix();
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
  endShape(CLOSE);   
  
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
    endShape(CLOSE);
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
  vertex(0, r, 0,u, v+iv);
  vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
  endShape(CLOSE);
  
}






void keyPressed(){
  if (key =='s' || key =='S'){
  save("walk.png");
 } 

 if (key =='a' || key =='A'){
  autorotate = !autorotate;
  rotation = radians(270)- rotationY;
 }
if (key =='w' || key =='W'){
  viewwin = !viewwin;  
   } 

  if (key =='p' || key =='P'){
    setup();
 texmap  = loadImage(file[int(random(0,9))]); 
 portal.loadPixels();
 portal.beginDraw();
 portal.image(texmap,0,0,width,height);
 portal.endDraw();
 portal.updatePixels();
  }
}



