
// Spiral Galaxy Simulation
// author : Philippe Guglielmetti (Dr. Goulu www.goulu.net)
// 2008.04.03 PhG : my first processing program !
//                  converted from my LUA/Demoniak 3D demo V 1.0
//                  see http://3dmon.wordpress.com/2007/08/26/simulation-de-galaxie-spirale/
// 2008.04.04 PhG : much faster in P3D mode : now ok with 10'000 stars !
//                  keyboard interaction : use arrow keys to alter the galaxy

import gifAnimation.*; // http://www.extrapixel.ch/processing/gifAnimation/

float pi=4*atan(1);

int stars=10000; // only ...
int Rmax=200; // galaxy radius
float speed=0.02;  // rotation speed

// stars follow elliptic orbits around the center
float eratio=.85; // ellipse ratio
float etwist=8.0/Rmax; // twisting factor (orbit axes depend on radius)

float []angle=new float[stars];
float []radius=new float[stars];

float cx; float cy; //center

color col=color(255,255,192); // yellow stars

void setup(){
  size(int(Rmax*3), int(Rmax*2),P3D);
  background(0); // back to black
  speed=speed/frameRate;

  // begin in the center
  cx = width/2;
  cy = height/2;
  // itit stars
  for (int i=0; i< stars; i++){
    angle[i]= random(0,2*pi);
    radius[i]=random(1,Rmax);
  }
  // gifExport = new gifAnimation.GifMaker(this, "galaxy.gif");
  // gifExport.setRepeat(0);	
}

void draw(){
  background(0); // back to black
  stroke(col);
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
  // gifExport.setDelay(1); gifExport.addFrame();
}

void keyPressed() {
  if(keyCode == UP) { eratio=eratio*1.02; }
  if(keyCode == DOWN) { eratio=eratio/1.02; }
  if(keyCode == LEFT) { etwist=etwist+0.001; }
  if(keyCode == RIGHT) { etwist=etwist-0.001; } 
  println("eratio="+eratio+" etwist="+etwist);
}

