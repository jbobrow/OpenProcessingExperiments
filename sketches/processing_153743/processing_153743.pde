
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65628*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */


/* @pjs preload=""clown.jpg""; 
 */

/**
 * Simple plan to volume.
 * 
 * Converts a flat image into spatial data points and rotates the points
 * around the center. Click to stop/start rotation. Hit Space bar to start/stop transformation.
 * Hit 1 2 or 3 to change the type of volume: 1 for sphere, 2 for cylinder, 3 for tore.
 */

PImage extrude;
int[][] values;
PVector[][][] coxyz;
PVector[][] cobary;
int coorX0;
int coorY0;
float angle = 0;
float rayon=100;
float rayon2=200;
float theta;
float phi;
int pas=20;
float YRotation=0;
float XRotation=0;
float speed=0.01;
boolean rotation=true;
float count=1;
boolean unwrap=true;
float amortissement=0.1;
float deceleration=0.001;
int tyFrom=3;
int tyTo=1;
int w2, h2;


void setup() {

 
  // Load the image into a new array
  extrude = loadImage("clown.jpg");
  extrude.loadPixels();
  w2=extrude.width;
  h2=extrude.height;
  size(401, 501, P3D);
  coxyz=new PVector[5][w2][h2];
  cobary=new PVector[w2][h2];
  values = new int[w2][h2];
  for (int y = 0; y < h2; y++) {
    for (int x = 0; x < w2; x++) {  
      cobary[x][y]=new PVector();
    }
  }
  volume();
  
}

void draw() {
  background(10,0,20);
lights();
lights();
noStroke();
  if (rotation) {
    YRotation=((float)mouseX-width/2)/100;
    XRotation=-((float)mouseY-height/2)/100;
  }
  translate(width/2, height/2, 0);
  rotateY(YRotation);
  rotateX(XRotation);
  translate(-width/2, -height/2, 0);
  if (unwrap) {
    count+=speed;
    if (count>1) {
      speed=-speed;
      tyTo=floor(random(5));
    }
    if (count<0) {
      speed=-speed;
      tyFrom=floor(random(5));
    }
  }
 
  for (int y = 0; y < h2; y+=pas) {
    for (int x = 0; x < w2; x+=pas) {
     
      cobary[x][y]=barycentre(count, coxyz[tyTo][x][y], coxyz[tyFrom][x][y]);
    }
  }
  display();
 // fill(0,0,50);
 // sphere(1000);
}


void display(){
   beginShape(QUADS);
   texture(extrude);
   fill( 255);
for (int y = 0; y < h2-pas; y+=pas) {
    for (int x = 0; x < w2-pas; x+=pas) {
     
    vertex(cobary[x][y].x ,cobary[x][y].y ,cobary[x][y].z,x,y);
    vertex(cobary[x+pas][y].x ,cobary[x+pas][y].y ,cobary[x+pas][y].z,x+pas,y);
    vertex(cobary[x+pas][y+pas].x ,cobary[x+pas][y+pas].y ,cobary[x+pas][y+pas].z,x+pas,y+pas);
    vertex(cobary[x][y+pas].x ,cobary[x][y+pas].y ,cobary[x][y+pas].z,x,y+pas);
   
    }}
    endShape(); 
}




PVector barycentre(float b, PVector u, PVector v) {
  float a=1-b;
  return new PVector(a*u.x+b*v.x, a*u.y+b*v.y, a*u.z+b*v.z);
}

void volume() {
  float vx, vy, vz;
  for (int i = 0; i < 5; i++) {
    for (int y = 0; y <h2; y+=pas) {
      for (int x = 0; x < w2; x+=pas) {
        color pixel = extrude.get(x, y);
        values[x][y] = pixel;
        if (i==0) {
          coxyz[i][x][y]=new PVector(x, y, 0);
        }
        if (i==1) {
          phi=((y-(h2/2))*PI/h2)+PI/2;
          theta=(x-(w2/2))*2*PI/w2+PI;
          rayon=100;
          vx=w2/2-rayon*sin(theta)*sin(phi);
          vy=h2/2-rayon*cos(phi);
          vz=-rayon*cos(theta)*sin(phi);
          coxyz[i][x][y]=new PVector(vx, vy, vz);
        }
        if (i==2) {
          theta=(x-(w2/2))*2*PI/(w2)+PI;
          rayon=100;
          vx=w2/2-rayon*sin(theta);
          vy=y;
          vz=-rayon*cos(theta);
          coxyz[i][x][y]=new PVector(vx, vy, vz);
        }
        if (i==3) {
          phi=((y-(h2/2))*2*PI/h2)+PI/2;
          theta=(x-(w2/2))*2*PI/w2+PI;
          rayon=100;
          vx=w2/2-(rayon2+rayon*sin(phi))*sin(theta);
          vy=h2/2-rayon*cos(phi);
          vz=-(rayon2+rayon*sin(phi))*cos(theta);
          coxyz[i][x][y]=new PVector(vx, vy, vz);
        }
        if (i==4) {        
          vx=x;
          vy=y;
          vz=rayon*sin((float)x/100)*cos(3*(float)y/100);
          coxyz[i][x][y]=new PVector(vx, vy, vz);
        }
      }
    }
  }
}
void mouseReleased() {
  if (mouseButton==LEFT)rotation=!rotation;
  if (mouseButton==RIGHT) {
    tyFrom=floor(random(5));
    tyTo=tyFrom+floor(random(5-tyFrom));
  }
}
void keyPressed() {
  if (keyCode==32)unwrap=!unwrap;
  if ((keyCode>=97)&&(keyCode<106)) {
    pas=keyCode-95;
    strokeWeight(1+pas/2);
    volume();
  }
}


