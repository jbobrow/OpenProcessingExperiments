
//The Milky Way and Sol--by Maximilian Uriarte
//Click the planets!
// original galaxy code author : Philippe Guglielmetti (Dr. Goulu www.goulu.net)
// galaxy code was modified heavily to make it prettier and look more like the Milky Way, I just couldn't figure out the algorithm for the spiral alone
// textured sphere code adapted from processing.org example
// I really wanted to do all of the planets in 3D, but I couldn't figure out how to turn the textured sphere code into its own class,
// so I could only do one planet, so the others are just images.

import processing.opengl.*;
float pi=4*atan(1);

int mode = 0;

//solar system floats
PImage mercury,venus,mars,jupiter,uranus,neptune,saturn,sun;

float x,y;
float ex,ey,s;
float mx,my;
float vx,vy;
float Mx,My;
float jx,jy;
float satx,saty;
float ux,uy;
float nx,ny;
float ax,ay;
float ang;
float moonx,moony; 
int stars=30000; //number of stars (far less than the 400 billion in real life)
int Rmax=350; // galaxy radius
float speed=0.004;  // rotation speed

//galaxy floats
 
// stars follow elliptic orbits around the center
float eratio=.9020268; // ellipse ratio
float etwist=.028142858; // twisting factor (orbit axes depend on radius)
 
float []angle=new float[stars];
float []radius=new float[stars];
 
float cx; float cy; //center
float sx, sy;

//earth floats

PImage bg;
PImage texmap;

int sDetail = 35;  // Sphere detail setting
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float globeRadius = 450;
float pushBack = 0;

float[] c2x, c2z, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);

//
 
void setup(){
  size(900,900,OPENGL);
  background(0); // back to black
  speed=speed/frameRate;
  smooth();
  
  //galaxy variables
  // begin in the center
  cx = width/2;
  cy = height/2;
  // itit stars
  for (int i=0; i< stars; i++){
    angle[i]= random(0,2*pi);
    radius[i]=random(1,Rmax);
  }
  
  //solar system variables
  mercury = loadImage("mercury.jpeg");
  venus = loadImage("venus.jpeg");
  mars = loadImage("mars.jpeg");
  jupiter = loadImage("jupiter.jpeg");
  saturn = loadImage("saturn.jpeg");
  uranus = loadImage("uranus.jpeg");
  neptune = loadImage("neptune.jpeg");
  sun = loadImage("sun.jpeg");
  
  ex = 0;
  ey = 0;
  mx = 0;
  my = 0;
  vx = 0;
  vy = 0;
  Mx = 0;
  My = 0;
  jx = 0;
  jy = 0;
  satx = 0;
  saty = 0;
  ux = 0;
  uy = 0;
  nx = 0;
  ny = 0;
  ax = 0;
  ay = 0;
  moonx = 0;
  moony = 0;
  ang = 0;
  
  imageMode(CENTER);
  
  //earth variables
  texmap = loadImage("earth.png");
  initializeSphere(sDetail);
  
}
 
void draw(){
  background(0); // back to black
  //info
  
  if(mode == 0){
    if(mousePressed == true){
    fill(255);
    text("Milky Way Galaxy",50,50);
    text("Type: Barred Spiral Galaxy",50,75);
    text("Stars: Est. 300-500 Billion",50,100);
    text("Diameter: 100,000 Light Years",50,125);
    text("Nearest Neigboring Galaxy: Andromeda",50,150);
    text("Sol",450,630);
    text("Perseus Arm", 400,700);
    text("Scutum-Centaurus Arm",470,300);
    text("Super-Massive Black Hole",390,520);
  }

      //solar system
  if(mouseX > 400){
    if(mouseX < 500){
      if(mouseY > 600){
        if(mouseY < 700){
          text("Sol",450,630);
          if(mousePressed == true){
            mode = 1;
          }
        }
      }
    }
  }
  
  
  sx = 440;
  sy = 620;
  stroke(255);
  noFill();
  ellipse(sx, sy, 10,10);
  
  //
  stroke(255,255,255,150);
  for (int i =0; i< stars; i++){
    float r=radius[i];
    float a=angle[i]+speed; // increment angle
    angle[i]=a;
    float x = r*sin(a);
    float y= r*eratio*cos(a);
    float b=r*etwist;
    float s=sin(b);
    float c=cos(b);
    point(cx+s*x+c*y,cy+c*x-s*y); // a bit of trigo
  }
  
  for (int i =0; i< 200; i++){
    float r=radius[i];
    float a=angle[i]+speed; // increment angle
    angle[i]=a;
    float x = r*sin(a);
    float y= r*eratio*cos(a);
    float b=r*etwist;
    float s=sin(b);
    float c=cos(b);
    noStroke();
    fill(255,255,255,15);
    ellipse(cx+s*x+c*y,cy+c*x-s*y,25,50); // a bit of trigo
  }
  for (int i =0; i< 300; i++){
    float r=radius[i];
    float a=angle[i]+speed; // increment angle
    angle[i]=a;
    float x = r*sin(a);
    float y= r*eratio*cos(a);
    float b=r*etwist;
    float s=sin(b);
    float c=cos(b);
    noStroke();
    fill(200,200,255,15);
    ellipse(cx+s*x+c*y,cy+c*x-s*y+15,50,100); // a bit of trigo
  }
  for (int i =0; i< 50; i++){
    float r=radius[i];
    float a=angle[i]+speed; // increment angle
    angle[i]=a;
    float x = r*sin(a);
    float y= r*eratio*cos(a);
    float b=r*etwist;
    float s=sin(b);
    float c=cos(b);
    noStroke();
    fill(255,255,100,5);
    ellipse(cx+s*x+c*y*2,cy+c*x-s*y+15,100,100); // a bit of trigo
  }
  }

