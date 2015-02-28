


float x=0.; 
float y=0.; 
float z=0.; 
float r=5;
float a=0;
float b=0;
float c=0.; 

int num = 100;  

float[] pos = new float[num]; 
float[] fast = new float[num];
float[] wiggle = new float[num];

void setup() {
  size(600, 1000);
  background(240,190,70);  
  frameRate(50);
  for (int i = 0; i<num; i++) {
    pos[i]=(i*width/num+((width/num)/2)); 
  }
  for (int i = 0; i<num; i++) {
    fast[i]=random(0.5, 1.); 
  }
  for (int i = 0; i<num; i++) {
    wiggle[i]=random(2); 
  }
}

void draw() {
  ellipseMode(CENTER);
  fill(random(80),random(200),random(200));
  ellipse(mouseX,mouseY,50,50);
  translate(width/2,height/2);
  rotate(random(TWO_PI));
  fill(255,random(255),random(255),5); 

  for (int i = 0; i<num; i++) {
    light(pos[i], (y*fast[i])%width, wiggle[i]);
  }

  z++;
  y++;
}

void light(float x, float y, float c) {
  flake(map(noise(z+c), 0., 1., x-r, x+r), y);
}

void flake(float x, float y) {
  noStroke();
  curve(x, y,y+r,x-r,a,b,TWO_PI,HALF_PI); 
  curve(y, x, x+r, y-r, b, a, PI, TWO_PI);
ellipseMode(CENTER);
int steps = 10;
for (int p = 0; p <= steps; p++) {
  float t = p / float(steps);
  float m = curvePoint(x, y, x+r, y-r, t);
  float n = curvePoint(a, b, a+r, b-r, t);
  ellipse(m, n, 20, 20);
  x = curvePoint(x, x+r, y, y-r, t);
  y = curvePoint(x, a+r, b, b-r, t);
  ellipse(m, n, 20, 20);
}
  a=map(sin(x/2), -1., 1., TWO_PI*0.2, HALF_PI);
  b=map(sin(y/2), -1., 1., TWO_PI*0.7, TWO_PI);
}


