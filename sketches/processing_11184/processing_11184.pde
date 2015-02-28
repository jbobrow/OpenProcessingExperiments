
// NASA blue marble Orthographic Projection
// by steven kay, Aug 2010
// image by NASA http://veimages.gsfc.nasa.gov/2433/land_shallow_topo_2048.jpg
// wikipedia citation http://en.wikipedia.org/wiki/Orthographic_projection_(cartography)
// lots of precomputed lookups being done to speed things up as much as possible

// keys (can hold down more than one)
// q - tilt south
// a - tilt north
// o - rotate west
// p - rotate east
// t - toggle between nasa blue marble and nasa light pollution
// [SPACE] - reset
// [Click] - rotate to random place on globe

PImage globe;

// origin (center of circle lat/lon, in radians)

float lambda0,theta1=0;

// precomputed calculation tables for speed-up purposes

boolean[] bmask;
float[][] euclid;
float[][] cbuffer;
float[][] sincbuffer;
float[][] coscbuffer;

int[] globepixels;
int globenum=0;


void setup() {
  size(256,256);
  
  // lookup tables, used to speed up framerate
  
  bmask=new boolean[65536];
  euclid=new float[256][256];
  cbuffer=new float[256][256];
  sincbuffer=new float[256][256];
  coscbuffer=new float[256][256];
    
  // euclidean distance lookup tables (pixel distance from center of sketch)
  
  for (int x=0;x<256;x++) {
    for (int y=0;y<256;y++) {
      euclid[x][y]=mag(128-x,128-y);
      cbuffer[x][y]=asin(euclid[x][y]/128.0);
      sincbuffer[x][y]=sin(cbuffer[x][y]);
      coscbuffer[x][y]=cos(cbuffer[x][y]);
    }
  }
  
  // mask lookup table - true if pixel position is inside the globe
  for (int ix=0;ix<65536;ix++) {
    int y=ix/256;
    int x=ix%256;
    bmask[ix]=abs(mag(128-x,128-y))<128;
  }
  
  // equirectangular image 
  
  changeImage(0);
}

void changeImage(int _globe) {
  globenum=_globe;
  switch(globenum) {
    case 0:
      globe=loadImage("nasa globe equirectangular.jpg");
      break;
    case 1:
      globe=loadImage("light.jpg");
      break;
    default:
      ;
  }
  globepixels=globe.pixels;
}

void mousePressed() {
  
  // rotate globe to a random location
  
  lambda0=random(-2*PI,2*PI); // long
  theta1=random(-PI,PI); // lat
}

float deltalambda0=0.0; 
float deltatheta1=0.0; 

void keyPressed() {
  if (key=='p') deltalambda0=0.025 ;
  if (key=='o') deltalambda0=-0.025;
  if (key=='q') deltatheta1=0.025;
  if (key=='a') deltatheta1=-.025;
  if (key=='t') {
    changeImage(1-globenum);
  }
  if (key==' ') {
    lambda0=0;
    theta1=0;
    globenum=0;
    changeImage(globenum);
  }
}

void keyReleased() {
  if (key=='p') deltalambda0=0.0;
  if (key=='o') deltalambda0=0.0;
  if (key=='q') deltatheta1=0.0;
  if (key=='a') deltatheta1=0.0;
}


void draw() {
  background(0);
  noStroke();

  // rotate the globe by a certain amount each frame
  lambda0+=deltalambda0; // long
  theta1+=deltatheta1; // lat

  loadPixels();
  
  fill(0,255,255);
  float R=128.0; // radius
  
  float sint1=sin(theta1);
  float cost1=cos(theta1);
          
  for (int ix=0;ix<65536;ix++) {
        
      if (bmask[ix]) {
        // pixel is inside globe..
        
        int y=ix/256;
        int x=ix%256;
      
        int yy=128-y;
        int xx=128-x;
        
        // use inverse functions to work out latitude (theta) and longitude (lambda)
        // from screen coords (xx,yy)
        
        float rho=euclid[x][y];   
        float c=cbuffer[x][y];
        float sinc=sincbuffer[x][y];
        float cosc=coscbuffer[x][y];
        float theta=asin((cosc*sint1)+(((yy*sinc*cost1)/rho)));
        float lambda=lambda0+atan2(xx*sinc,((rho*cost1*cosc)-(yy*sint1*sinc)));
        if (lambda<-TWO_PI) lambda+=TWO_PI;
        if (lambda>TWO_PI) lambda-=TWO_PI;
        if (theta<-TWO_PI) theta+=TWO_PI;
        if (theta>TWO_PI) theta-=TWO_PI;
        
        // work out position in equirectangular source image
        float xget=(1024-(1024*(lambda/PI)));
        float yget=(512-(512*(theta/PI*2)));
        if (xget<0) xget+=2048;
        if (xget>2048) xget-=2048;
        if (yget<0) yget+=1024;
        if (yget>1024) yget-=1024;
        int ixx=((int)yget)*2048+(int)xget;
        
        // next two lines is a hack.. need to investigate ArrayOutOfBoundsExceptions
        if (ixx<0) ixx=0; 
        color col=globepixels[ixx%2097152]; 
        
        pixels[ix]=col;
          
      }
  }
  updatePixels();
  //if (frameCount%20==0) print ("framerate:"+frameRate+" fps\n");
}


