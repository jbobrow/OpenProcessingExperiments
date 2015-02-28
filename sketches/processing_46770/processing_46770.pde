
// imports the toxic library core
import toxi.geom.*;

//PGraphicsOpenGL pgl;
//GL gl;

Vec3D[] loc;
Vec3D vel;
Vec3D velToMouse;
int len;
float radius;

void setup() {
  size(800, 800, P3D);
  background(255);
  smooth();
    // Turn on 4X antialiasing
 // hint( ENABLE_OPENGL_4X_SMOOTH );

  //pgl         = (PGraphicsOpenGL) g;
  //gl          = pgl.gl;

  vel = new Vec3D();
  velToMouse = new Vec3D();

  int gen         = 1;
  radius      = 60; //random( 10 - gen, 50 - ( gen-1)*10 );

  len         = (int)( radius );

  loc   = new Vec3D[ len ];
  
  for (int i=0; i<len; i++) {
    loc[i] = new Vec3D( new Vec3D().add( new Vec3D().randomVector().scaleSelf( random( 5.0 ) ) ) );
  }
}


void draw() {
  background(255);
 
  drawEllipse();
  
  drawRibbons();
}

void drawEllipse() {
  velToMouse.set(mouseX - loc[0].x, mouseY - loc[0].y, 0);
  vel.interpolateToSelf(velToMouse, .25);

  loc[0].addSelf(vel);

  pushMatrix();
  translate(loc[0].x, loc[0].y, 0);
  fill(0, 0, 64);
  ellipse(0, 0, radius, radius);
  fill(220, 0, 255);
  ellipse(0, 0, radius/3, radius/3);
  popMatrix();
}

void drawRibbons(){
  lights();
  directionalLight(255, 0, 145, -1, 0, 0);
  directionalLight(220, 30, 30,  1, 0, 0);
  
  for ( int i=len-1; i>0; i-- ) {
    loc[i].set(loc[i-1]);
  }
  loc[0].addSelf( vel );

  float xp, yp, zp;
  float xOff, yOff, zOff;
  
  beginShape(QUAD_STRIP);
  stroke(0);
  int j = 0;
  for (int i=0; i<len; i++) {
    float per = ( (float)i/(float)(len-1) );
    
    if(i <= len/2){
     j = i;
    }else{
     per = (float)j/(float)(len-1);
     j--;
    }
    
    xp = loc[i].x;
    yp = loc[i].y;
    zp = loc[i].z;

    if (i<len-2) {
      Vec3D perp0 = loc[i].sub(loc[i+1]);
      Vec3D perp1 = perp0.cross( new Vec3D(0, 1, 0)).normalize();
      Vec3D perp2 = perp0.cross(perp1).normalize();
      perp1 = perp0.cross(perp2).normalize();

      xOff = perp1.x * radius * per;
      yOff = perp1.y * radius * per;
      zOff = perp1.z * radius * per;

      vertex(xp - xOff, yp - yOff, zp - zOff);
      vertex(xp + xOff, yp + yOff, zp + zOff);
    }
  }

  endShape();
  
}


