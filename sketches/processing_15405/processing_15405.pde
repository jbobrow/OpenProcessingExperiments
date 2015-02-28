
/*Additive Wave by Daniel Shiffman.
  Create a more complex wave by adding two waves together.
  http://processing.org/learning/basics/additivewave.html 
   Modded by Dustin Taylor Nov.2010
     -Created mostly unique waves for all the letter keys a-z
     -theta can be changed with < and > keys
     -mouseX controls size of spheres
     -mouseY controls the xspacing between spheres.
*/   

int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 4;   // total # of waves to add together
float z = .01;
int q = 0;
float theta = 0.003;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)
float a1;
float a2;
float a3=1;
float trig;
float trig2;
float x;
void setup() {
  size(500, 500);
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  w = width+16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(0,30);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * 2;
      }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  rect(6,20,12,12);
  rect(20,20,12,12);
  rect(40,20,12,12);
  rect(70,20,12,12);
  rect(430,430,40,40);
  rect(440,400,20,20);
  calcWave();
  renderWave();
  xspacing = mouseX/9;   //left-right mouse movement change sphere spacing
  q = mouseY/2;          //up-down mouse movement changes size of spheres
  if (xspacing < 1){
    xspacing = 1;
  }
  }

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.005+z;
  if (int(key)==46){
        z=z+.005;
      }
  if (int(key)==44){   //theta is now controlled by the < and > keys
        z=z-.02;       //when desired rate is reached choose wave to set
      }                
      if (z<0){          
        z=0.000000000001;
      }
      if (z>1){
        z=4;
      }    

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += 3*a1*amplitude[j];
      else yvalues[i] += a2*amplitude[j];
      x+=dx[j];
      trig = sin(x);
      a1=sin(x);
      a2=0;
      if (int(key)==49){  //most of the keys are configered
      a1 = sin(x);        //with a different set of waves
      maxwaves=1;
      }
      else if (int(key)==50){
      a1 = cos(x);
      maxwaves=1;
      }
      else if (int(key)==51){
      a1 = tan(x);
      maxwaves=1;
      }
      else if (int(key)==52){   
      a1 = (1/sin(x));
      maxwaves=1;
      }
      else if (int(key)==53){
      a1 = (1/cos(x));
      maxwaves=1;
      }
      else if (int(key)==54){  
      a1 = (1/tan(x));
      maxwaves=1;
      }
      else if (int(key)==113){
      a1 = sin(x);
      a2 = sin(x);
      maxwaves = 4;
      }
      else if (int(key)==119){
      a1= cos(x++);
      a2= cos(x);
      maxwaves=4;
      }
      else if (int(key)==101){
      a1 = tan(x-10*sin(x));
      a2 = tan(x);
      maxwaves=4;
      }
      else if (int(key)==114){   
      a1 = (1/sin(x));
      a2 = tan(x/x++);
      maxwaves = 4;
      }
      else if (int(key)==116){
      a1 = (1/cos(x));
      a2 = tan(x--);
      maxwaves = 4;
      }
      else if (int(key)==121){
      a1 = (1/tan(x));
      a2 = cos(x++);
      maxwaves = 4;
      }
      else if (int(key)==117){   
      a1 = sin(x++);
      maxwaves=4;
      }
      else if (int(key)==105){
      a1 = (cos(x));
      maxwaves=4;
      }
      else if (int(key)==111){
      a1 = tan(x);
      maxwaves=4;
      }
      else if (int(key)==112){   
      a1 = (1/sin(x));
      maxwaves=4;
      }
      else if (int(key)==50){
      a1 = cos(x);
      maxwaves = 4;
      }
      else if (int(key)==97){
      a1 = -tan(x-sin(x--));
      maxwaves = 4;
      }
      else if (int(key)==115){   
      a1 = (1/sin(x));
      maxwaves = 4;
      }
      else if (int(key)==100){
      a1 = (sq(sin(sin(x))/cos(x)));
      maxwaves = 4;
      }
      else if (int(key)==102){  
      a1 = (1/tan(x));
      a2 = tan(x);
      maxwaves = 4;
      }
      else if (int(key)==103){
      a1 = sin(x);
      a2 = (-10*sin(x++));
      maxwaves = 4;
      }
      else if (int(key)==104){
      a1 = cos(x++);
      a2 = 2*cos(x-1000);
      maxwaves = 4;
      }
      else if (int(key)==106){
      a1 = tan(x-10*sin(x));
      a2 = tan(x);
      maxwaves=4;
      }
      else if (int(key)==107){   
      a1 = (1/sin(x++));
      a2 = cos(x/x++);
      maxwaves = 4;
      }
      else if (int(key)==108){
      a1 = (1/cos(x));
      a2 = tan(4*x++);
      maxwaves = 4;
      }
      else if (int(key)==110){
      a1 = (1/tan(x));
      a2 = cos(x++);
      maxwaves = 4;
      }
      if (int(key)==109){   
      a1 = sin(x--);
      maxwaves=4;
      }
      else if (int(key)==122){
      a1 = tan(x-10*sin(x--));
      a2 = 1/sq(tan(x--));
      maxwaves=4;
      }
      else if (int(key)==99){   
      a1 = (1/sin(x));
      a2 = tan(x/x++);
      maxwaves = 4;
      }
      else if (int(key)==118){
      a1 = (1/cos(x));
      a2 = a1*tan(x--);
      maxwaves = 4;
      }
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  noStroke();
  fill(240,20);
  ellipseMode(CENTER);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,width/2+yvalues[x],5+q,5+(q));
  }
  if (int(key)==107){  
    q = q + 2;
  }
  if (int(key)==106){
    q = q - 2;
  }
  if (q < -5){
  q = 1;
  }
  if (q >250){
    q = 250;
  }
  }
  

  




