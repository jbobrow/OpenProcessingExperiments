
//3)

//source:http://processing.org/learning/basics/sinewave.html

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 0.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float angVel = 0.02;
float redCol = 100;
float scaleNummm = 0;

void setup() {
  size(600,500);
  frameRate(800);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];

}

void draw() {
  background(255);
  fill(100, 255, 100, 50);
  rect(0, 300, 600, 200);
  
  fill(0, 50, 255, 50);
  rect(0, 0, 600, 300);
  //calcWave();
  fill(redCol+=0.2, 100,  100, 100);

  if (mousePressed){
   calcWave(); 
   redCol+=0.2;
   amplitude += 0.2;
   if(amplitude > 100.0){
     amplitude = 100.0;}
  }
  else{
  redCol-=0.2;
  if(amplitude>0.0){ amplitude -= 0.1; }
  else{ amplitude = 0; }
  redCol = 100;
  calcWave();
  }
  renderWave();
}



void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += angVel;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 7; x < (yvalues.length)-7; x++) {
    noStroke();

    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],16,16);
  }
  
  
    // A simple way to draw the wave with an ellipse at each location
  for (int x = 69; x < (yvalues.length)-7; x++) {
    noStroke();
    scaleNummm = amplitude/100;
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],20,20);
    fill(255);
    if (amplitude !=0.0){
      
    ellipse(x*xspacing +2 - (scaleNummm*5),width/2+yvalues[x] - 6,scaleNummm*5,5);
    ellipse(x*xspacing + 8 - (scaleNummm*5),width/2+yvalues[x] - 6,scaleNummm*5,5);
    fill(92);
    rect((x*xspacing) + 10 - (scaleNummm*10),width/2+yvalues[x],scaleNummm*8,8);
    }
  }
}


