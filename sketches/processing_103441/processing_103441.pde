
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

int SIZE = 500;

float CENTER = float (SIZE/2);

float scale = 1.75;

float R = scale*105;

float r = scale*50;

float rho = scale*44;

boolean playit;

int i = 0;

float start_x;
float start_y;

void setup() {

  size(500, 500);
  
  colorMode(HSB);

  background(0);

  frameRate(60);
  
  playit = true;  }

void draw() {
  
  if (playit) {
  
    float k = r/R;
    float l = rho/r;
    
    float T = radians(i);
    
    float delta_x = R*(((1 - k)*cos(T)) + ((l*k)*cos((((1 - k)/k)*T))));
    float delta_y = R*(((1 - k)*sin(T)) - ((l*k)*sin((((1 - k)/k)*T))));
    
    float spirograph_x = CENTER + delta_x;
    float spirograph_y = CENTER + delta_y;
    
    if (i == 0) {
      
      start_x = CENTER + delta_x;
      start_y = CENTER + delta_y;  }
    
    float d = dist(spirograph_x, spirograph_y, CENTER, CENTER);
    
    strokeWeight(1);
    
    stroke(d, 360, 360);
  
    point(spirograph_x,spirograph_y);
    
    if ((spirograph_x == start_x) && (i != 0)) {
      
      i = -1;
      
      scale -= 0.25;
      
      R = scale*105;

      r = scale*50;

      rho = scale*44;  }
    
    i += 1;
    
  }

}







