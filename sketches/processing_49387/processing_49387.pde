

//------------------------------------------------------- 
// sketch:   PG_RayRefraction.pde
// purpose:  test of v3d.refract(...)
// date:     v1.0  2012-01-17
//
//------------------------------------------------------- 
/* comment:  --- Interactive Ray Refraction Simulation ---
You can change the length and direction of the ray,
the refraction index and in test mode the ray resolution. 
Press [blanc] to change test mode and [r] to reset parameters.
If you have some improvemnts, let me know...
*/

int midX = 300;
int midY = 300;
int topY = -300;
float refractionIndex = 1.333;  // water
float step = 20.0;
int testMode = 0;
v3d normal = new v3d(0,500,0);

//------------------------------------------------------- 
void setup()
{
  size (600, 600);
  midX = width / 2;
  midY = height / 2;
  topY = height / -2;
  textSize(14);
  smooth();
  fill(0);
  println("---PG_RayRefraction.pde---");
  printTableValues();
}
//------------------------------------------------------- 
void draw()
{
  color waterColor = color (122,122,255,127);
  color blueRay = color (44,200,255);

  if (mouseY < 0 || mouseY > height)  return;
  if (mouseX < 0 || mouseX > width)  return;
  if (mousePressed)
  {
    if (mouseButton == RIGHT)
      resetAll();
    else {
      if (mouseX < 400) step = 2 + 18.0 * (float(mouseX) / height);
      //normal.set((mouseY-midY) / 4, 500, 0);  // change normal direction
    }
  }
  background (127);
  translate (0, height/2);
  // draw water
  fill (waterColor);
  noStroke();
  pushMatrix();
    translate (width/2,0);
    float ra = PI/2 - normal.angle();
    pushMatrix();
      rotate (ra);
      if (refractionIndex > 1.0)               // draw water  
           rect(-width,0, 2*width, height);    
      else rect(-width,0, 2*width,-height);
      stroke(188);                             // draw normal
      drawLine (0, -1000, 0, 1000);   
    popMatrix();
  
  //--- draw mouse ray ---
  boolean refracted = false;
  stroke(255);
  v3d pos = new v3d(mouseX-midX, height/2-mouseY, 0);
  v3d dst = new v3d(0, 0, 0);
  v3d ray = new v3d(pos, dst);  // input vector
  v3d vr = new v3d(ray);        // vector refracted
  v3d nn = new v3d(normal);    // normalized normal
  nn.normalize();
  //-------------------------------------------------
  refracted = refractVector (vr, nn, 1.0, refractionIndex);
  //-------------------------------------------------
  drawLine (pos.x, pos.y, dst.x, dst.y);   // ray
  if (!refracted) stroke (blueRay);        // vr
  drawLine (dst.x, dst.y, dst.x+vr.x, dst.y+vr.y);   
  
  popMatrix();

  //--- write values ---
  float alpha = degrees (acos(abs(ray.dot(nn)) / ray.mag()));
  float beta = degrees (acos(abs(vr.dot(nn)) / vr.mag()));
  float lim = degrees (asin(refractionIndex));
  if (refractionIndex > 1.0) lim = degrees (asin(1/refractionIndex));
  fill(255);
  text ("ri=" + nf(refractionIndex,0,3), 200, topY+20);
  text ("limit=" + nf(lim,0,2) + "°", 200, topY+40);
  text ("+/-/w change refraction index", midX+10, topY+20);
  text ("[blanc] change test mode,   [r] reset",      midX+10, topY+40);
  text ("alpha=" + nf(alpha,0,2) + "°",  midX+10, topY+60);
  text ("beta=" + nf(beta,0,2) + "°",    midX+10, topY+80);
  text ("V.N=" + nf(ray.dot(nn),0,2),    433, topY+80);
  if (refracted)         text ("ray=refracted", 433, topY+60);
  else {fill(blueRay);   text ("ray=reflected", 433, topY+60); }
  
  fill(255);
  text ("nn "  + nn.toString(2),    midX +10, midY-80);
  text ("ray " + ray.toString(2),   midX +10, midY-60);
  text ("vr  " + vr.toString(2),    midX +10, midY-40);
  text ("r = |ray| / |vr| = " + nf(ray.mag()/vr.mag(), 0,3), midX+10, midY-20);
//  text ("    angle = " + nf(degrees(ra) ,0,2) + "°");

  //--- draw upper air rays ---
  translate (width/2,0);
  rotate (ra);
  color rayColor = color (255,255,111,127);
  stroke(rayColor);
  if ((testMode == 1) || (testMode == 3))
  for (float ni = 0; ni < height/2; ni+=step)
  {
    pos.set(-midX, height/2 - ni, 0);
    dst.set(-(ni/2), 0, 0); 
    vr.set(pos, dst);
    //-------------------------------------------------
    refracted = refractVector (vr, nn, 1.0, refractionIndex);
    //-------------------------------------------------
    vr.setLength(800);
    drawLine (pos.x, pos.y, dst.x, dst.y);
    drawLine (dst.x, dst.y, dst.x+vr.x, dst.y+vr.y);   
  }
 
  //--- draw under water rays ---
  rayColor = color (144,255,255,127);
  stroke(rayColor);
  if (testMode >= 2)
  for (float ni = 0; ni <= height; ni+=step)
  {
    pos.set(-midX, -ni, 0);
    dst.set(-ni/4.0, 0, 0);
    vr.set(pos, dst);
    //-------------------------------------------------
    refracted = refractVector (vr, nn, 1.0, refractionIndex);
    //-------------------------------------------------
    vr.setLength(800);
    drawLine (pos.x, pos.y, dst.x, dst.y);
    drawLine (dst.x, dst.y, dst.x+vr.x, dst.y+vr.y);
  }
}
//------------------------------------------------------- 
void keyPressed()
{
  if (key == '-') refractionIndex -= 0.01;
  if (key == '+') refractionIndex += 0.01;
  if (key == 'w') refractionIndex = 1.333;   // water
  if (key == 'r') resetAll();   
  if (key == ' ') testMode = (testMode+1)%4;
}
//------------------------------------------------------- 
void resetAll()
{
  refractionIndex = 1.333;   // water
  normal.set(0, 500, 0);  
}
//------------------------------------------------------- 
void drawLine (float x1, float y1, float x2, float y2)    // origin is left bottom
{
  line (x1, -y1, x2, -y2); 
}
//------------------------------------------------------- 
void printTableValues()
{
  println ("\n--- table values ---\n");
  v3d nn = new v3d (0,10,0);
  nn.normalize();
  printValues (new v3d (5,-3,0), nn, 1.0, 1.33);
  printValues (new v3d (5, 5,0), nn, 1.0, 1.33);
  printValues (new v3d (5, 1,0), nn, 1.0, 1.22);  
}
//------------------------------------------------------- 
void printValues(v3d ray, v3d nn, float n1, float n2)
{
  v3d rn = new v3d (ray);
  v3d vr = new v3d (ray);
  rn.normalize();
  nn.normalize();
  float d = rn.dot(nn);
  boolean refracted = refractVector (vr, nn, n1, n2);

  ray.debug("ray=", 0,2);
  nn.debug("nn=", 0,2);
  vr.debug("t=", 0,2);
  println ("d=" + nf(d,0,3) + "  r=" + nf(n1/n2,0,3) + "  refraction=" + refracted + "\n");
}


