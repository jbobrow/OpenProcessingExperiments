
int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 4;

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)

             
void setup(){
  size(500, 500);
  smooth();
  frameRate(100);
  background(0);
  colorMode(RGB, 255, 255, 255, 100);
   w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(30,100);
    float period = random(300,500); // How many pixels before the wave repeats
    dx[i] = (PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];


     fill(random(100,255),random(100,255),random(0,100),50);
     rectMode(CENTER);
     rect(0,0,5000,5000);
}     
void draw(){
  strokeWeight(0.05);
 
   float x = theta;
   
   calcWave();
  renderWave();
   

if(keyPressed){
setup();
}
if(mousePressed){
setup();
}
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += random(0.005-0.1);

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    translate(width/5, height/5);
    rotate(theta);

    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  stroke(255,5);
  fill(random(250,255),2);
  ellipseMode(CENTER);
   
  for (int x = 0; x < yvalues.length; x++) {
    line(x*xspacing,width/2+yvalues[x],random(0,20),random(0,20));
    
   

  }
  
}



