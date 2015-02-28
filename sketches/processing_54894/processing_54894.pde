

int particleCount = 1000;

float[] x = new float[particleCount];
//the x location of ea. particle
float[] y = new float[particleCount];
//the y location of ea. particle
float[] spdX = new float[particleCount];
//the speed(aka velocity) in the x direction of ea. particle
//(could be positive or negative)
float[]spdY = new float[particleCount];
//the speed in the x direction of ea. particle
float[] gravity  = new float[particleCount]; 
//the gravitational accelerationv(how the spd changes/rate)
float[] w = new float[particleCount];
//the width of ea particle
float[] h = new float[particleCount];
//the height of ea particle
color[] strokeCol = new color[particleCount];
// the color of ea particle
float[] damping = new float[particleCount];
// slows down the particle motion along the y axis
float[] friction = new float[particleCount];
// stops the particles movt along the x axis ("once it hits the ground")
float[] wind = new float[particleCount];
// wind effect  

int tubeHeight;
int tubeWidth; 

void setup() {
  size(400, 400);
  smooth();
  // set values for some variables
  //we're telling the variables where to go, we've already established
  //their positions now we have to give it #'s
  for (int i=0; i<particleCount; i+=1) {
    //once i is greated than partcount we'll stop, incremented by one
    x[i] = width/2;
    //particle # "i"
    y[i] = 0;
    spdX[i] = random(-10, 10);
    gravity[i] = random(.01, .07);
    wind[i] =0;//random(0,.1);
    spdY[i] = 0.0;
    w[i] = random(2, 7);
    h[i] = random(2, 7);
    //strokeCol[i] = color(random(200));
    strokeCol[i] = color(random(255), random(255), random(255), random(255));
    damping[i] = random(.45, .9);
    friction[i] = random(.9, .95);
    tubeHeight = 400;
    tubeWidth = 200;
  }
}

void draw() {
  background(0);
  //noFill();
  
  
  
  for (int i=0; i<particleCount; i+=1) {
    stroke(strokeCol[i]);
    fill(strokeCol[i]);
    rect(x[i], y[i], w[i], h[i]);
    
    wind[i]= .000001*-pow(x[i]-width/2,3);
    // assign velocity to particle
    spdX[i]+= wind[i];
    x[i] += spdX[i];
    spdY[i] += gravity[i];
    y[i] += spdY[i];


    // after greter than collison, make collision perfect (use equal sign)
    if (x[i] >  width/2 + tubeWidth/2-w[i]) {
      x[i] = width/2 + tubeWidth/2-w[i];
      spdX[i] *= -1*friction[i];
      // strokeCol = color(random(255), random(255), random(255), 120);
    }

    if (x[i] < width/2 - tubeWidth/2) {
      x[i] = width/2 - tubeWidth/2;
      spdX[i] *= -1*friction[i];
      // strokeCol = color(random(255), random(255), random(255), 120);
    }

    if (y[i] > height-h[i]) {
      y[i] = height-h[i];
      spdY[i] *= -1;
      spdY[i] *= damping[i];

      spdX[i] *= friction[i];
      //strokeCol = color(random(255), random(255), random(255), 120);
    }

    if (y[i] < 0) {
      spdY[i] *= -1;
      // strokeCol = color(random(255), random(255), random(255), 120);
    }

}
translate(width/2, width/2);
  fill(225,150);
  rect(-tubeWidth/2,-tubeHeight/2, tubeWidth, tubeHeight);
  
  
  translate(-width/2,-width/2);
  
}


