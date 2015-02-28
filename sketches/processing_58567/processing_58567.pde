
// A Young's Double Slit Experiment Sketch
// by Oliver Lomax
// April 2012

float theta;
float lambda = 400e-9;
float slit_separation = 1e-5;
float slit_width = 1e-4;
float screen_dist;
float array_size;
float[] intensity;

HScrollbar hs_slit_separation, hs_wavelength, hs_slit_width, hs_screen_dist;

void setup()
{
  //size(screen.width, screen.height);
  size(640, 480);
  array_size = width;
  intensity = new float[(int)array_size];
  colorMode(HSB, 360, 100, 1);
  
  hs_screen_dist = new HScrollbar(20, height-170, width-40, 20, 3*5+1, 0.1, 50);
  hs_slit_separation = new HScrollbar(20, height-120, width-40, 20, 3*5+1, 1e-4, 1e-2);
  hs_slit_width = new HScrollbar(20, height-70, width-40, 20, 3*5+1, 1e-6, 1e-3);
  hs_wavelength = new HScrollbar(20, height-20, width-40, 20, 3*5+1, 400e-9, 700e-9);
 
 }


void draw()
{
  //clear the screen
  background(204);
  
  // Update the text
  String sd = "Screen Distance = " + screen_dist + " m";
  String ss = "Slit Separation = " + slit_separation/1e-3 + " mm";
  String sw = "Slit Width = " + slit_width/1e-3 + " mm";
  String wl = "Wavelength = " + lambda/1e-9 + " nm";
  
  fill(0);
  text(sd, 10, height - 185);
  text(ss, 10, height - 135);
  text(sw, 10, height - 85);
  text(wl, 10, height - 35);
  
  // Get variables from scroll bars
  screen_dist = hs_screen_dist.getPos();
  lambda = hs_wavelength.getPos();
  slit_separation = hs_slit_separation.getPos();
  slit_width = hs_slit_width.getPos();
  
  // Draw Slit 
  stroke(0,100,100,0);
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, 150, 150);
  fill(204);
  float sep = slit_separation*5000;
  float w = slit_width*5000;
  w = (w < 1? 1: w);
  rect(width/2-sep/2,height/2, w, 150);
  rect(width/2+sep/2,height/2, w, 150);
  rectMode(CORNER);
  
  // Calculate the intensity for every point across the screen
  for (int i = 0; i < array_size; i++) {
    theta = atan((i-(array_size/2.0))/(screen_dist*4000));
    intensity[i] = pow(cos(PI*slit_separation*sin(theta)/lambda), 2.0) * pow(sin(PI*slit_width*sin(theta)/lambda),2.0)/pow((PI*slit_width*sin(theta)/lambda),2.0);
  }
  //Draw the diffraction pattern and the graph
  float colour = map2(lambda, 400e-9, 700e-9, 300, 0);
  for (int i = 1; i < array_size; i++) {
    stroke(colour, 100, intensity[i]);
    line(i, 100,i, 200);
    stroke(0);
    line(i-1, 100*(1-intensity[i-1]), i, 100*(1-intensity[i]));
  }
  
  // Fill in the center line because the sinc function gives 0 instead of 1 for theta = 0
  stroke(colour, 100, 100);
  line(width/2, 100,width/2, 200);
  stroke(0);
  
  // Update all the scroll bars
  hs_slit_separation.update();
  hs_wavelength.update();
  hs_slit_width.update();
  hs_screen_dist.update();
  hs_slit_separation.display();
  hs_wavelength.display();
  hs_slit_width.display();
  hs_screen_dist.display();
}


boolean sb_locked = false;
class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  float minValue, maxValue; // min and max values to return.
  int fixedMouseY;

  HScrollbar (int xp, int yp, int sw, int sh, int l, float minv, float maxv) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    minValue = minv;
    maxValue = maxv;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over && !sb_locked) {
      locked = true;
      sb_locked = true;
    }
    if(!mousePressed) {
      locked = false;
      sb_locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(153, 102, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    //return spos * ratio;
    float ret_value = spos;
    //map(ret_value, sposMin, sposMax, 0.0, 1.0);
    //ret_value = ((spos-sposMin)/(sposMax-sposMin))*(maxValue-minValue)+minValue;
    ret_value = map2(spos, sposMin, sposMax, minValue, maxValue);
    
    return ret_value;
  }
}

float map2(float value, float min1, float max1, float min2, float max2)
{
  float ret_value = ((value-min1)/(max1-min1))*(max2-min2)+min2;
  return ret_value;
}

