

/** sketch: SpotLightDemo.pde 
Demonstrate usage of pointLight (magenta) and spotLight (yellow and blue).
Move mouse over sphere to light with blue spotlight. 
*/
// v1.0  2012-04-17
// v2.0  2013-11-16
// tags:  light, pointLight, spotLight, 3d, lightning, animation, sphere

int concentration = 600;   // Try values 1 -> 10000

void setup() 
{
  size(400, 400, P3D);
  noStroke();
}

float sx,sy,sz;
float px,py,pz;
color c1,c2,c3;

void draw() 
{
  background(66); 
  translate (width/2, height/2);
  setLights();
  drawSpheres();
}

void drawSpheres()
{
  // basic sphere
  sphereDetail(72,36);
  fill(255);
  emissive (0);
  sphere(100); 
  
  // light sphere 1
  sphereDetail(26,18);
  pushMatrix();
    translate(sx,sy,sz); 
    fill(c1);
    emissive (c1);
    sphere(7);
  popMatrix();
  
  // light sphere 2
  translate(px,py,pz); 
  fill(c3);
  emissive (c3);
  sphere(7);  
}

void setLights()
{
  // light the top of the sphere
  directionalLight(0, 102, 126   // color
                 , 0, 1, -1);    // direction

  // orbiting orange spotlight 
  c1 = color(204, 153, 0);
  sx=80*cos(frameCount*0.02);
  sy=60*sin(frameCount*0.02);
  sz=200;
  spotLight(red(c1), green(c1), blue(c1),  // color
            sx, sy, sz*4,                  // position  
            0, 0, -1,                      // direction
            PI/2, concentration);  // angle, concentration

  // moving spotlight that follows the mouse
  c2 = color(102, 255, 204);
  float lx = mouseX - width/2;
  float ly = mouseY - height/2;
  spotLight(red(c2), green(c2), blue(c2),  // color
            lx, ly, 800,                   //position 
            0, 0, -1,                      // direction
            PI/24, concentration);  // angle, concentration
            
  // orbiting magenta pointlight 
  c3 = color(255, 166, 222);
  px=-80*cos(frameCount*0.015);
  py=-80*sin(frameCount*0.021);
  pz=100;
  pointLight(red(c3), green(c3), blue(c3),  // color
             px, py, pz);                   // position  
}

void keyPressed()
{
  if (key == 's') save("SpotLightDemo.png");
}


