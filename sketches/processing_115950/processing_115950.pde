
int ms;
int ms_offset;
int last_ms;
int max_ms_hr;
int max_ms_min;
int max_ms_sec;

float slope_of_light;
float slope_of_window;
float windowtop;
float windowheight;
float windowleft;
float windowlength;
float lightleft;
float lightright;

color shadow_color;

int w;
int h;

/* golden ratio constant */
float phi = (1 + sqrt(5)) / 2;

void setup() {
  /* set up time */
  int ms_s = second()*1000;
  int ms_m = minute()*60*1000;
  int ms_h = hour()*60*60*1000;
  ms_offset = ms_h + ms_m + ms_s;
  max_ms_hr = 24*60*60*1000;
  max_ms_min = 60*60*1000;
  max_ms_sec = 60*1000;
  
  /* set up size */
  h = 600;
  w = int(h*sqrt(phi));
  size(763, 600);
  
  /* set up locations of objects */
  slope_of_light = -phi;
  slope_of_window = 1/(phi*phi*phi);
  windowtop = h/2.0 * sq(1/phi)*(1/phi);
  windowheight = w * (1-1/phi) * (1/phi);
  windowleft = w/2.0;
  windowlength = w/2.0 / phi + w/2.0 * (1-1/phi) * (1-1/phi);
  lightleft = w/2.0 * (1-1/phi);
  lightright = w / phi + w * sq(1-1/phi);
  
  shadow_color = color(24);
  
  noStroke();
}

float noisectr = 0;

void draw() {
  ms = (millis() + ms_offset) % max_ms_hr;
  
  if (ms != last_ms) {
    
    /* set up colors based on time */
    
    /* get time from ms */
    int ms_s = ms % max_ms_sec;  /* determines clouds at the moment */
    int ms_m = ms % max_ms_min;  /* determines overall cloudiness */
    int ms_h = ms;               /* determines overall light */
    
    /* convert time to radians */
    float s_rad = TWO_PI * ms_s/max_ms_sec;
    float m_rad = TWO_PI * ms_m/max_ms_min;
    float h_rad = TWO_PI * ms_h/max_ms_hr;
    
    /* convert radians to light/color values */
    float overall_light = constrain(-cos(h_rad)+1/3.0, 0, 2) * 3/4.0 * 255;
    float overall_cloud = (-cos(m_rad)+1)/2 * constrain(-cos(h_rad)+1/3.0, 0, 2) * 3/4.0;
    //float clouds = (sin(s_rad)+1)/2 * overall_cloud * 55;
    float clouds = noise(noisectr) * overall_cloud * 55;
    float lightness = constrain(overall_light - clouds, 0, 255);
    
    /* draw shit */
    
    background(shadow_color);
    
    /* draw reflected light in the room */
    fill(255, lightness*200/256);
    rect(0, 0, w, h);
    
    /* draw light streaming from window */
    pushMatrix();
    translate(windowleft, windowtop);
    fill(constrain(lightness, shadow_color, 255), lightness/2);
    beginShape();
    vertex(0, 0);
    vertex(lightleft-windowleft, (lightleft-windowleft)*slope_of_light);
    vertex(lightleft-windowleft + windowlength,
           (lightleft-windowleft)*slope_of_light
         + windowlength*slope_of_window);
    vertex(lightright-windowleft, windowlength*slope_of_window + windowheight
                                + (lightright-windowlength-windowleft)
                                * slope_of_light);
    vertex(windowlength, windowlength*slope_of_window + windowheight);
    endShape(CLOSE);
    
    /* draw the window */
    fill(lightness);
    beginShape();
    vertex(0, 0);
    vertex(windowlength, windowlength*slope_of_window);
    vertex(windowlength, windowlength*slope_of_window + windowheight);
    vertex(0, windowheight);
    endShape(CLOSE);
    popMatrix();
    
    last_ms = ms;
    noisectr += 0.005;
  }
}
