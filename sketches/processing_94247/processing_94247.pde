
final float goldenRatio = (1+sqrt(5))/2;
final float f = 60;

ArrayList<Planet> planets;
int x,y;
int count;
boolean pause, label, orbit;

static float s;

void setup() {
  size(1300 ,650);
  x = (int)(0.46*width);
  y = height/2;
  count = 0;
  pause = false;
  label = false;
  orbit = false;
  s = 1;
  
  planets = new ArrayList<Planet>(); //                                 (DIFFERENTLY)
  //                                  (SCALED)   (SCALED)   (ABSOLUTE)    (SCALED)   
  // Planetary Values:               PERIHELION  APHELION   ECCENTRICITY   RADIUS    PERIOD (RELATIVE TO EARTH YEAR)
  planets.add(new Planet("MERCURY",    35.24,       53.49,    0.20563,     2*1.87,     0.24));
  planets.add(new Planet("VENUS",      82.34,       83.46,    0.006756,    2*4.64,     0.62));
  planets.add(new Planet("EARTH",     112.69,      116.52,    0.01671123,  2*4.88,     1.00));
  planets.add(new Planet("MARS",      158.33,      190.92,    0.093315,    2*2.59,     1.88));
  planets.add(new Planet("JUPITER",   567.34,      625.53,    0.048775,    2*52.99,   11.86));
  planets.add(new Planet("SATURN",   1036.96,     1159.34,    0.0557232,   2*43.91,   29.46));
  planets.add(new Planet("URANUS",   2105.93,     2301.65,    0.04440559,  2*19.35,   84.01));
  planets.add(new Planet("NEPTUNE",  3411.34,     3399.13,    0.01121427,  2*18.81,  164.80));
  planets.add(new Planet("CERES",     291.88,      342.19,    0.079138,    2*0.365,    4.60));
  planets.add(new Planet("PLUTO",    3399.13,     5600.87,    0.24880766,  2*0.899,   17.14));
  planets.add(new Planet("MAKEMAKE", 4405.77,     6046.73,    0.157,       2*0.586,   28.96));
  //planets.add(new Planet("ERIS",     4347.55,    11177.22,    0.435763,    2*0.928,   44.19));
  
}

void draw() {
  background(0);
  translate(x,y);
  
  if(!orbit) {
    stroke(255,128,0);
    point(0,0);
  }
  
  scale(s);
  if (!pause) count++;
    
  float time = count/100.0;
  for (Planet p : planets)
    p.drawPlanet(time,label,orbit,s);
}

void keyPressed() { 
  if (keyCode == LEFT) x -= 10;
  else if (keyCode == RIGHT) x += 10;
  else if (keyCode == UP) y -= 10;
  else if (keyCode == DOWN) y += 10;
  
  else if (key == '=') s *= goldenRatio;
  else if (key == '-') s /= goldenRatio;
  
  else if (key == '1') frameRate(frameRate/2);
  else if (key == '2') frameRate(frameRate*2);
  
  else if (key == '3') label = !label;
  else if (key == '4') orbit = !orbit;
  else if (key == '5') pause = !pause;
  
  else if (key == '0') {
    x = (int)(0.46*width);
    y = height/2;
    s = 1;
    frameRate(f);
    pause = false;
  }
  
  if (frameRate < 1) frameRate(1);
  
}

class Planet {
  
  private final color MERCURY = color(190);
  private final color VENUS = color(251,208,103);
  private final color EARTH = color(0,128,255);
  private final color MARS = color(200,127,100);
  private final color JUPITER = color(240,200,130);
  private final color SATURN = color(255,200,75);
  private final color URANUS = color(195,205,240);
  private final color NEPTUNE = color(30,70,255);
  private final color CERES = color(175,185,200);
  private final color PLUTO = color(215);
  private final color MAKEMAKE = color(0,0,200);
  //private final color ERIS = color(202);
  
  private float perihelion;
  private float aphelion;
  private float eccentricity;
  private float period;
  
  private float directrix;
  
  private String name;
  
  private float radius;
  private boolean rings;
  private color c;
  
  Planet (String name, float perihelion , float aphelion, float eccentricity, float radius, float period) {
    this.perihelion  = perihelion;
    this.aphelion = aphelion;
    this.eccentricity = eccentricity;
    this.period = period;
    
    this.name = name;
    
    this.directrix = (1/eccentricity-1)*aphelion;
    
    this.radius = radius;
    this.rings = name.equals("SATURN") || name.equals("URANUS");
    this.c = getColor(name);
  }
  
  void drawPlanet(float t, boolean label, boolean orbit, float sc) {
    if (orbit) {
      stroke(255);
      strokeWeight(1/sc);
      noFill();
      float c = (aphelion-perihelion)/2;
      float w = (aphelion+perihelion)/2;
      float h = w*sqrt(1-sq(eccentricity));
      
      ellipse(c,0,w,h);
    } 
    
    fill(c);
    stroke(c);
    
    float angle = theta(t);
    float rd = r(angle);
    
    ellipseMode(RADIUS);
    float x1 = rd*cos(angle);
    float y1 = rd*sin(angle);
    ellipse(x1,y1,radius,radius);
    
    stroke(255);
    if (label) {
      textSize(16/sc);
      text(name,x1+radius,y1);
    }
    
  }
  
  float theta (float t1) {
    return t1/period;
  }
  
  float r (float theta1) {
    return eccentricity*directrix/(1-eccentricity*cos(theta1));
  }

  color getColor(String s) {
    if (s.equals("MERCURY")) return MERCURY;
    else if (s.equals("VENUS")) return VENUS;
    else if (s.equals("EARTH")) return EARTH;
    else if (s.equals("MARS")) return MARS;
    else if (s.equals("JUPITER")) return JUPITER;
    else if (s.equals("SATURN")) return SATURN;
    else if (s.equals("URANUS")) return URANUS;
    else if (s.equals("NEPTUNE")) return NEPTUNE;
    else if (s.equals("CERES")) return CERES;
    else if (s.equals("PLUTO")) return PLUTO;
    else if (s.equals("MAKEMAKE")) return MAKEMAKE;
    //else if (s.equals("ERIS")) return ERIS;
    
    return 0;
  }
  
}
