
// Orbiting Particles
// Matthew Pearson 2012

float[][] x0;
float[][] x;
float[][] v;
float[][] a;
color[] c;
float[] colorAngle;
float globalColorAngle = 0;
int n = 120;
int customIndex = 0;

int mouseVX;
int mouseVY;
int mouseX0;
int mouseY0;

void setup() {
  size(500,500);
  //frameRate(5);
  //smooth();
  
  x = new float[n][2];
  x0 = new float[n][2];
  v = new float[n][2];
  a = new float[n][2];
  c = new color[n];
  colorAngle = new float[n];
  
  mouseX0 = 0;
  mouseY0 = 0;
  fill(0);
  noStroke();
  rect(0,0,width,height);
  fill(0,10);
  strokeWeight(2);
  
  for(int i=0;i<n;i++) {
    x[i][0] = int(random(200,width-200));
    x[i][1] = int(random(100,height-100));
    x0[i][0] = x[i][0];
    x0[i][1] = x[i][1];
    
    colorAngle[i] = random(0,20);
    c[i] = color(int(random(10,80)));

    float angle = PI/2+atan2((width/2) - x[i][0],(height/2) - x[i][1]);
    float r = dist(width/2,height/2,x[i][0],x[i][1]);

    if(r==0)
      r = 1;
    float magnitude = random(80,100)/r;
//    if(random(2) > 1)
//      magnitude *= -1;
 
    v[i][0] = magnitude*sin(angle);
    v[i][1] = magnitude*cos(angle);
  }
  
}

void draw() {
  globalColorAngle = 10;
  //globalColorAngle += 1;
  if(globalColorAngle >= 360)
    globalColorAngle = 0;
  mouseVX = mouseX - mouseX0;
  mouseVY = mouseY - mouseY0;
  
  mouseX0 = mouseX;
  mouseY0 = mouseY;
  
  noStroke();
  rect(0,0,width,height);
  for(int i=0;i<n;i++) {
    
    //float r = max(1,dist(width/2,height/2,x[i][0],x[i][1]));
    float r = max(1,dist(mouseX,mouseY,x[i][0],x[i][1]));
    
    int subticks = ceil(constrain(32.0/r,1,32));
    tick(i,subticks);
  }
  
  if(mousePressed) {
    if(customIndex > x.length-1)  
      customIndex = 0;
    
    x[customIndex][0] = mouseX;
    x[customIndex][1] = mouseY;
    x0[customIndex][0] = x[customIndex][0];
    x0[customIndex][1] = x[customIndex][1];
    v[customIndex][0] = mouseVX/5;
    v[customIndex][1] = mouseVY/5;
    
    c[customIndex] = color(0,210,255);
    
    customIndex++;
  }
}

void tick(int index,int subticks) {

  for(int i=0;i<subticks;i++) {
    
    //float d3 = pow(pow((width/2) - x[index][0],2) + pow((height/2) - x[index][1],2),1.5);
    float d3 = pow(pow(mouseX - x[index][0],2) + pow(mouseY - x[index][1],2),0.4);
    
    if(d3==0)
      d3 = 0.1;

    a[index][0] = (.20/subticks)*(mouseX - x[index][0])/d3;
    a[index][1] = (.20/subticks)*(mouseY - x[index][1])/d3;
    //a[index][0] = (500.0/subticks)*((width/2) - x[index][0])/d3;
    //a[index][1] = (500.0/subticks)*((height/2) - x[index][1])/d3;

    v[index][0] += a[index][0];
    v[index][1] += a[index][1];
    
    x[index][0] += v[index][0]/subticks;
    x[index][1] += v[index][1]/subticks;
    
    colorMode(HSB,360,100,100,100);
    float b = pow(v[index][0],2)+pow(v[index][1],2);
    color c1 = color(globalColorAngle+colorAngle[index],100,100,constrain(1200/b,0,100));
    stroke(c1);

    line(x0[index][0],x0[index][1],x[index][0],x[index][1]);
    //point(x[index][0],x[index][1]);
    x0[index][0] = x[index][0];
    x0[index][1] = x[index][1];
  }
}

