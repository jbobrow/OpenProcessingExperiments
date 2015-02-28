
// 08: make the number of circles a variable

float angle=-35; 
float radius=250; 
float r = 0.;  
float x = 0.; 
float y = 0.; 
float range =150;
float t = 0.; 
float t1 = 0.; 
 float a_radius=100; 
  float a_angle =0; 
float a_x=cos(a_angle*PI/180)*a_radius; 
  float a_y=sin(a_angle*PI/180)*a_radius; 

int num = 400;  

float[] pos = new float[num]; 
float[] var = new float[num];
float[] wiggle = new float[num];

void setup() {
  size(500, 500);
  background(0);  
  for (int i = 0; i<num; i++) {  // intitializing arrays
    pos[i]=(i*width/num+((width/num)/2)); // we have to come up with something to evenly space the circles, plus an offset
  }
  for (int i = 0; i<num; i++) {
    var[i]=random(0.9, 2.); // that we can keep
  }
  for (int i = 0; i<num; i++) {
    wiggle[i]=random(5); // that we can keep
  }
}

void draw() {
  fill(0,5);
  noStroke();
  rect(0, 0, 500, 500);
  fill(mouseX,mouseY,mouseY*2,50);
  for (int i = 0; i<num; i++) {
    moveShapes(pos[i], (y*var[i])%height, wiggle[i]);
  }

  t=t+0.01;
  y++;
}

void moveShapes(float x, float y, float t1) {
  float xcoord = cos(angle*TWO_PI/360)*radius;  
    float ycoord = sin(angle*TWO_PI/360)*radius;  
rotate(sin(angle*TWO_PI/360)*radius );
  ellipse(map(noise(t+t1), 0., 1., x-range, x+range), y,sin(angle*TWO_PI/360)*radius/a_x, a_x/cos(angle*TWO_PI/360)*radius);
}



