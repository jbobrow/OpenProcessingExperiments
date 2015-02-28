
// Based on:
// the 0th dimension" by Jerome Herr, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
// Work: http://openprocessing.org/visuals/?visualID= 136366  
// License: 
// http://creativecommons.org/licenses/by-sa/3.0/
// http://creativecommons.org/licenses/GPL/2.0/

int num = 12;
float[] start_diam = new float[num];
float[] diam= new float[num];
float incr_diam;
float x, y, sd;
 
void setup() {
  size(1280, 720);
  background(255);
  stroke(255,0,0);
  noFill();
  x = width/2;
  y = height/2;
  incr_diam = width/num*1.3;
  strokeWeight(48);
 
  for (int i=0; i<num; i++) {
    start_diam[i]= diam[i] = sd;
    sd += incr_diam;
  }
}
 
void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    ellipse(x, y, diam[i], diam[i]);
    diam[i]++;
    if (diam[i]>(start_diam[i]+incr_diam)) diam[i]=start_diam[i];
  }
   
  //if (frameCount%3==0 && frameCount>50 && frameCount<185) saveFrame("image-###.gif");
 // saveFrame("redwhitecircles-####.png");// use .tga or .jpg or .png 
}
