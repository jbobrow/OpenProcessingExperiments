
ship shape[];


//change this for a different number of shapes;
int numShips = 150;

void setup() {
  size(600,600);
  smooth();
  background(0);
  
  
  shape = new ship[numShips];
  
  
  
  for (int j = 0; j < numShips; j++) {
    shape[j] = new ship(random(0.01, 0.15), random(5, 30), random(1, 5),random(1, 5), round(random(3, 6)), random(0, 200))

  }
 
}

void draw() {
  background(0);
  for (int i = 0; i < numShips; i++)  {
    shape[i].draw();
  }
}

class ship {
float dup;
 float d = 0;
 float xpos = 40;
 float ypos = 40;
  float radius;
  float xspeed;
  float yspeed;
int lines;
float colortemp;


  ship(float Speedvar, float tempradius, float xposvar, float tempypos, int linestemp, float colorvar) {
    dup = Speedvar;
    radius = tempradius;
    xspeed = xposvar;
    yspeed = tempypos;
    lines = linestemp;
    colortemp = colorvar;
  }

  void draw() {
    d += dup;
xpos+=xspeed;
ypos+=yspeed;
if(xpos>width-radius) {
  xspeed*=-1;
}
if(xpos<0+radius) {
  xspeed*=-1;
}
if(ypos>height-radius) {
  yspeed*=-1;
}
if(ypos<0+radius) {
  yspeed*=-1;
}


    fill(ypos/2+colortemp, radius/2+colortemp, xpos/2+colortemp);
beginShape();
  for (int h = 0; h < lines+1; h++) {
  vertex(xpos+(sin(d-(((2*PI)/lines)*h)))*radius, ypos+(cos(d-(((2*PI)/lines)*h)))*radius);
  }
  endShape();
}
}
