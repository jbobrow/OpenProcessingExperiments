

int wy= 171;
int whiteDiam= 120;
float x = 0;
float y = 0;
float xr = 0;
float yr = 0;
int pupils = 30;
 
void setup () {
  size (640, 480);
  smooth ();
 
}
 
void draw () {
  background(50);
  //whites
  noStroke ();
  fill (255);
  ellipse (238, wy, whiteDiam, whiteDiam);
  ellipse (387, wy, whiteDiam, whiteDiam);  
  //eye color
  strokeWeight (10);
  stroke (100);   
  //left pupil
  float mx = constrain (mouseX, 210, 265);
  float my = constrain (mouseY, 145, 196);
  x += (mx-x)*0.5;
  y += (my-y)*0.5;
  fill (0);
  ellipse (x, y, pupils, pupils);
  //right pupil
  float mxr = constrain (mouseX, 360, 415);
  float myr = constrain (mouseY, 145, 196);
  xr += (mxr-xr) * 0.5;
  yr += (myr-yr) * 0.5;
  fill (0);
  ellipse (xr, yr, pupils, pupils);
 

     
     
}



