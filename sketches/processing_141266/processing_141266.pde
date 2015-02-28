
// Based on

// "Circular rainbow" by Jerome Herr, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
// Work: http://openprocessing.org/visuals/?visualID= 140422  
// License: 
// http://creativecommons.org/licenses/by-sa/3.0/
// http://creativecommons.org/licenses/GPL/2.0/

int num = 54;
float step, sz = 18, theta = 0, theta_vel = 0, theta_acc = 0.00005;
int mod = 12;

 
void setup() {
  size(1280, 720);
  step = width/(num+1);
  noStroke();
  fill(0);
  colorMode(HSB, 360,100,100);
}
 
void draw() {
  fill(0,10);
  rect(0,0,width, height);
 
  translate(width/2, height/2);
 
  for (int i=0; i<num; i++) {
    //fill((i%(mod*2))*(360/(mod*.2)),100,100);
    fill(360,100,100);
    pushMatrix();
    rotate(theta/2.4);  
    //translate(1, 11);
    float x = step*(i+1) ;
    float y = 0;
    ellipse(x, y, sz, sz);
    popMatrix();
  }
  // theta += (TWO_PI/120);
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  // theta += theta_vel;
  theta += (TWO_PI*theta_vel);
  //if (frameCount > 100 && frameCount%4==0 && frameCount<221) saveFrame("image-###.gif");
   //    if (frameCount<2500) saveFrame("swirling-red-dots-####.png");
}

