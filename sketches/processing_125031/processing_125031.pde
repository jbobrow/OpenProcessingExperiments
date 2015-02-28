
// Vann
// swirling magic 2005
import processing.opengl.*;

int numParticles = 500;
int numFields = 3;
particle[] ps;
field[] f;
wanderer w;
float ts = 0.08;
float k = 1000;
int width = 200;
int height = 200;
int depth = -100;
float fieldRadius = 10;
float friction = 0.01; // coefficient of friction between 0..1, closer to 0
int time = 0;
int cameraMode  = 1;

int autoCameraX = 0; 

void setup() 
{
  // Set the starting position of the shape
  size(250, 250, OPENGL);
  noStroke();
  frameRate(60);
  colorMode(HSB, 255); 
  //  smooth();
  ps = new particle[numParticles];
  w = new wanderer();
  time = 0;
  for (int i=0; i < numParticles; i++) {
    ps[i] = new particle() ;
    // ps[i].reset(w);
    ps[i].myhue = float(i)/numParticles * 255;
  }
  f = new field[numFields];
  for (int i=0; i < numFields; i++) {
    f[i] = new field(w) ;
  }
  f[0].isRepeller = false;

}

void draw() 
{
  lights();


  // pointLight(0, 0, 127, 1, 1, 1);
  //pointLight(0, 127, 0, -1, -1, -1);

  background(0,0,0);
  perspective(); //fov, aspect, cameraZ/10.0, cameraZ*10.0);

  /*switch (cameraMode) {
  case 1:*/
    camera(width/2 , (height/2), ((height/2.0) / tan(PI*60.0 / 360.0) ),  // eye position (x,y,z)
    width/2.0, height/2.0, 0,  // center position, where the eye is focusing (x,y,z)
    0, -1, 0); // direction of up vector

    float  boxCenterX = width/2;
    float boxCenterY = height/2;
    float boxCenterZ = depth/2;

    float  cameraDist = width; // float(mouseY)/height*width;
    autoCameraX++;
    float theta = float(autoCameraX)/180*PI;//float(height)/width * PI;
    float cameraDistCenterX = cameraDist*sin(theta);
    float cameraDistCenterZ = cameraDist*cos(theta);

    float cameraCenterX = cameraDistCenterX + boxCenterX;
    float cameraCenterZ = cameraDistCenterZ + boxCenterZ;
    float cameraCenterY = boxCenterY;
    camera(cameraCenterX , cameraCenterY, cameraCenterZ,  // eye position (x,y,z)
    width/2.0, height/2.0, 0,  // center position, where the eye is focusing (x,y,z)
    0, -1, 0); // direction of up vector
    /* break;
    
  case 2:
    camera(width*(cos(float(mouseX)/width*PI)), height + (height/2), ((height/1.0) / tan(PI*60.0 / 360.0) + width*(sin(float(mouseX)/width*PI))),  // eye position (x,y,z)
    width/2.0, height/2.0, 0,  // center position, where the eye is focusing (x,y,z)
    0, -1, 0); // direction of up vector
    break;
    
  case 3:
    //  camera(0,0,0,f[0].p.x,f[0].p.y,f[0].p.z, 0, -1, 0); // origin looking at first attractor field.

    particle p =  ps[0];

    camera(p.x,p.y,p.z, p.x + p.vx, p.y+ p.vy, p.z+p.vz, 0, -1, 0); // particle looking in direction its moving

    break;
  case 4:
    camera(f[0].p.x, f[0].p.y, f[0].p.z, 0,0,0, 0, -1, 0); // attractor looking at center.
    break;
  default:
    cameraMode = 1;
    break;
  }*/

  //translate(width/2+30, height/2, 0);
  //rotateX(-PI/6);
  //rotateY(-PI/3 + mouseY/float(height) * PI);

  //sphere(5);
  pushMatrix();
  noFill();
  translate(width/2, height/2, depth/2);
  stroke(255,255,255);
  box(width,height,-depth); 
  popMatrix();
  // noStroke();

  //popMatrix(); 
  // box(30);

  for (int i=0; i < numParticles; i++) {
    particle p =  ps[i];

    for (int j=0; j < numFields; j++) {
      f[j].frc(p);
    }
    p.update(w);
    //if (i == 0) {
    //   println("z, a: " + p.z + ", " + p.alpha);
    //  }
    if (p != null)
      p.draw();
  }

  for (int i=0; i < numFields; i++) {
    // f[i].draw();
    f[i].frc(w.p);
    f[i].p.update(null);
  }
  w.draw();
  // drawGrid();
  w.update();

  time++;

}

void drawGrid() {

  float xstep = width/10;
  float ystep = height/10;
  float zstep = depth/10;
  for (int x = 0; x < width; x +=xstep)
    for (int y = 0; y < height; y +=ystep)
      for (int z = 0; z > depth; z +=zstep) 
      {
        stroke(150,255,100,float(z)/depth*150 + 155);
        line(x-5,y,z,x+5,y,z);
        line(x,y-5,z,x,y+5,z);
        line(x,y,z-5,x,y,z+5); 
      }
}

/*
void keyPressed()
{
  // if the key is between 'A'(65) and 'z'(122)
  if( key >= 'A' && key <= 'z') {
    int keyIndex;
    if(key <= 'Z') {
      keyIndex = key-'A';
    } 
    else {
      keyIndex = key-'a';
    }
  } 
  else {

  }
  cameraMode++;
}
*/


public class wanderer
{
  particle p ;

  wanderer() {
    p = new particle();
    p.ax = random(-10,10);
    p.ay = random(-10,10);
    p.az = random(-10,10);
  }

  void update() {

    int mod = int(random(100)) % 10;
    if ( mod == 0) 
    {
      p.ax = random(-5,5);
      p.ay = random(-5,5);
      p.az = random(-5,5);
    }

    p.update( null);
  }

  void draw () {

    //triangle(p.x-5,p.y,p.x,p.y-5,p.x+5,p.y);
    // perspective();
    if (cameraMode != 3) { // don't draw self if we're the camera
      pushMatrix();
      fill(100,255,255);
      noStroke();
      translate(p.x,p.y,p.z);
      sphere(10);

      popMatrix();
    }
  }
}

public class field
{
  particle p = new particle();
  float fhue;
  wanderer w ;
  boolean isRepeller =false;

  field(wanderer w2) {
    w = w2;
    fhue = random(255);
    int sometimes = int(random(3)) % 2;
    /* p.x = width/2;
     p.y = height/2;
     p.z = depth/2;
     */
    if (sometimes == 0) isRepeller=true;
  }

  void draw() {
    //  lights();
    //    perspective();

    if (cameraMode != 4) { // don't draw self if we're the camera
      pushMatrix();
      translate(p.x, p.y,p.z); 
      fill(fhue,255,255);
      noStroke();
      sphere(fieldRadius);
      popMatrix();
    }
  }

  /* get the force  */
  void frc(particle p2) {
    float dx =  p2.x - p.x ;
    float dy =  p2.y - p.y;
    float dz = p2.z - p.z;
    float distsq = sqrt((dx*dx) + (dy*dy) + (dz*dz));
    float f = 1/distsq;
    if (distsq > fieldRadius) {
      float xfac = dx*f ;
      float yfac = dy*f;
      float zfac = dz*f;

      if (isRepeller) { // twister
        f *= -1;
        p2.ax += -f*yfac*k;
        p2.ay += -f*xfac*k;
        p2.az += -f*zfac*k;
      }
      else {
        p2.ax += -f*xfac*k;
        p2.ay += -f*yfac*k;
        p2.az += -f*zfac*k;
      }
      p2.vx = p2.vx*(1 - friction);
      p2.vy = p2.vy*(1 - friction);
      p2.vz = p2.vz*(1 - friction);
    }
    else {
      p2.reset(w);
    }
  }


}

public class particle {
  public float x, y, z;
  public float  vx, vy, vz, ax, ay, az;
  public float sleep, size, counter;
  public wanderer w; 
  public boolean   bCollision = false;
  public float myhue;
  public float alpha = 0;

  // Contructor (required)
  particle() {
    x = (random(width));
    y = (random(height));
    z = (random(depth,0));
    vx = random(-15,15);
    vy = random(-15,15);
    vz = random(-15,15);
    ax = 0; //random(-2,2);
    ay = 0; //random(-2,2);
    az = 0;
    sleep = random(500);
    counter = 0;
    // myhue = random(1)*50;
    println(x + "," + y + " hue: " + myhue);
  }

  void reset (wanderer w) {

    int sometimes = int(random(100)) % 2;

    if (w == null) return;


    if (sometimes == 0) {
      x = w.p.x;
      y = w.p.y;
      z = w.p.z; 
    }
    else {
      x = random(width); //w.p.x;
      y = random(height); //w.p.y;
      z = random(depth); //w.p.z;
    }
    vx = random(-5,5);
    vy = random(-5,5);
    vz = random(-5,5);
    myhue = time % 255;
  }

  void update(wanderer w) {

    /* counter++;
     if (counter > sleep) {
     reset(w);
     counter=0;
     }*/

    vx += ax*ts;
    vy += ay*ts;
    vz += az*ts;

    x = (x + (vx*ts) + (ax*ts*ts));
    y = (y + (vy*ts) + (ay*ts*ts));
    z = (z + (vz*ts) + (az*ts*ts));

    if (x < 0) {
      x = 0;
      vx *= -0.8;
      ax *= -0.8;
      bCollision = true;
    }

    if (x > width) {
      x = width;
      vx *= -0.8;
      ax *= -0.8;
      bCollision = true;
    }

    if (y < 0) {
      vy *= -0.8;
      ay *= -0.8;
      y = 0;
      bCollision = true;
    }

    if (y > height) {
      vy *= -0.8;
      ay *= -0.8;
      y = height;

      bCollision = true;    
    }
    if (z< depth) {
      vz *= -0.8;
      az *= -0.8;
      z = depth;
      bCollision = true;
    }

    if (z > 0) {
      vz *= -0.8;
      az *= -0.8;
      z = 0;
      bCollision = true;
    }

    if (bCollision)
      reset(w);

  }

  void draw() {

    float saturation  = 256 - (abs(vy)/5*127);
    alpha = (z/depth*192) + 64;

    color c = color(int(myhue), 255, 255, int(alpha)); 
    //color c = color(255,255,255);
    // translate(x,y,z);
    // box(vx*0.1 );

    float x2 = x+(vx*0.3);
    float y2 = y+(vy*0.3);
    float z2 = z+(vz*0.3);

    float tx = ax*0.3;
    float ty = ay*0.3;
    float tz = az*0.3;

    stroke(c);
    //strokeWeight(3);
    fill(c);
    beginShape(POLYGON); 
    vertex(x,y,z); 
    //vertex(x+(vx*0.3),y+(vy*0.3),z+(vz*0.3));
    bezierVertex(
    x+tx,y+ty,z+tz,    // first anchor point
    x2+tx,y2+ty,z2+tz, // second anchor point
    x2,y2,z2); // end point

    endShape(); 

    if (bCollision) {

      /*  pushMatrix();
       translate(x,y,z);
       fill(255,255,255);
       //noStroke();
       box(5,5,0);
       */
      bCollision = false;
      //      noFill();

      //      popMatrix();
    }

    ax = ay=az =0;
    //  bezier(x, y, x+vx, y+vy, x+ax, y+ay, x,y); 

    //    set(int(x), int(y), c); 
  }
}





