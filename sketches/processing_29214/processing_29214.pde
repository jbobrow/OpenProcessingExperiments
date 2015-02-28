
/*
  Gravity Simulator
  by Erik Schluntz, 2011
*/
 
import controlP5.*;
ControlP5 controlP5;

float G = 1; //gravitational constant
float max_speed = 10;//max speed 

public int NUMBER = 500; //NUMBER of particles
public float EXPONENT = -2;
public float ACCURACY = 2500;
public int SPEED = 20;
public boolean maintain = true;
public int style_h;
public int style_l;

orb[] planets;

void setup()
{
  background(0);
  size(800, 600);
  frameRate(60);
  smooth();
  
  planets = new orb[NUMBER];
  for (int i = 0; i < NUMBER; i++) planets[i] = new orb();
  NUMBER = 200;
  
  //control GUI
  controlP5 = new ControlP5(this);
  controlP5.addToggle("maintain").linebreak();
  controlP5.addSlider("NUMBER",0,500).linebreak();
  controlP5.addSlider("ACCURACY",1,5000).linebreak();
  controlP5.addSlider("SPEED",1,50).linebreak();
  controlP5.addSlider("EXPONENT",-3,1).linebreak();
  Slider p = (Slider)controlP5.controller("EXPONENT");
    p.setNumberOfTickMarks(9);
    p.setSliderMode(Slider.FLEXIBLE);
  
  //color controls
  Radio h = controlP5.addRadio("radioh",75,20);
    h.add("RED",0);
    h.add("GREEN",1);
    h.add("BLUE",2); 
    h.activate("BLUE");
  Radio l = controlP5.addRadio("radiol",125,20);
    l.add("RED",0);
    l.add("GREEN",1);
    l.add("BLUE",2);
    l.activate("GREEN");
}

void draw()
{
  //fading background
  fill(0,10);
  rect(0,0,width, height);
  
  //drawing mass
  fill(255);
  stroke(255);
  ellipse(width/2, height/2, 10, 10);
  
  //calculating
  for (int i = 0; i < NUMBER; i++) {
    for (int j = 0; j < SPEED; j++) {
      planets[i].update();
    }
    planets[i].render();
  }
}

public void radioh(int c)
{
  style_h = c;
}

public void radiol(int c)
{
  style_l = c;
}
  
class orb
{
  float x;
  float y;
  
  float last_x;
  float last_y;
  
  float v_x;
  float v_y;
  
  int high;
  int low;
  
  //functions
  void render()
  {
    int ored = 0;
    int ogreen = 0;
    int oblue = 0;
    
    switch(style_h) {
      case(0): //red
        ored = high;
        break;
      case(1): //green
        ogreen = high;
        break;
      case(2): //blue
        oblue = high;
        break;
    }
    switch(style_l) {
      case(0): //red
        ored = low;
        break;
      case(1): //green
        ogreen = low;
        break;
      case(2): //blue
        oblue = low;
        break;
    }

    stroke(ored,ogreen,oblue);
    if ((abs(v_x) < 40) && (abs(v_y) < 40)){
    line((x+1) * height/2 + (width - height)/2, (y+1) * height/2, (last_x +1) * height/2 + (width - height)/2, (last_y +1) * height/2);
    }
    last_x = x;
    last_y = y;
  };
  
  void update()
  {
    float force;
    float f_x;
    float f_y;
    float d;
    
    //updating velocity
    d = sqrt(x*x + y*y);
    force = -G * pow(d,EXPONENT);
    
    //components of force
    f_x = force * x / d;
    f_y = force * y / d;
    
    //adding to V
    v_x += f_x / ACCURACY;
    v_y += f_y / ACCURACY;
    
    //updating position
    x += v_x / ACCURACY;
    y += v_y / ACCURACY;
    
    //resetting points
    if (((abs(x) > 2) || (abs(y) > 2)) && maintain) reset();
  }
  
  void reset()
  {
    float magnitude;
    float angle;
    
    //setting random position
    magnitude = random(.5);
    angle = random(2*3.14159);
    x = magnitude * cos(angle);
    y = magnitude * sin(angle);
    
    last_x = x;
    last_y = y;
    
    //setting random velocity
    magnitude = random(max_speed);
    angle = random(2*3.14159);
    v_x = magnitude * cos(angle);
    v_y = magnitude * sin(angle);
  }
    
  //constructor
  orb()
  { 
    //setting random color
    high = 255;
    low = int(random(255));
    
    //setting position
    reset();
  }
}  
    
  
    

