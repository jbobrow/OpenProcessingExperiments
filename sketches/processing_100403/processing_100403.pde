
/////   2D Evolving Fractal Generator
//   ==================================
//
// - Douglas Adam Smith II
//
// - /////   SoC - Project 0
//   //   =====================
//   // - June 1, 2013
//
/////

// The fractal!
Fractal fract;


void setup(){
  size(400,300);
  // make a fractal with a random complexity
  fract = new Fractal(int(random(8)), int(random(8)));
}


void draw(){
  background(0);
  // draw the fractal in the middle, with a begginning length of 75
  fract.visualize(width/2, height/2, 75);
  fill(30,30,220);
  textSize(25);
  textAlign(LEFT);
  text("Click to make a new fractal!", 40, 40);
}

void mousePressed(){
  // click to make a new fractal
  fract = new Fractal(int(random(2, 8)), int(random(8)));
}
/////   THE FRACTAL CLASS
//   =======================
// - emcompasses TimeWaves (see other tab) in order to
//   construct an evolving fractal
// - is built by recursively attaching branches, and 
//   modulating their lengths and angles with sinusoidal functions
// - is two-dimensional (3D version coming soon!)
//
class Fractal{
  
  // PARAMETERS:
  int s, c, status;  // sprouts, components, and status
  float[] decays;    // length and thickness decay values for each branch
  TimeWave[] lengths, angles;  // sinusoidal function to control movement
                               // (see "TimeWave")

  // COLORS
  color baseColor, lineColor;
  
  
  // CONSTRUCTOR
  Fractal(int sprouts, int comps){
    // initilize paramters
    s = max(sprouts, 2); 
    c = max(comps, 2);
    status = int(random(0,3));
    decays = new float[s];
    lengths = new TimeWave[s];
    angles = new TimeWave[s];
    // randomize parameters
    for(int i = 0; i < s; i++){
      decays[i] = random(.4, .7);
      lengths[i] = new TimeWave(comps);
      angles[i]  = new TimeWave(comps);
    }
    // generate random colors
    baseColor = color(random(250),random(250),random(250));
    lineColor = color(random(250),random(250),random(250));
  }
  
  /////   VISUALIZATION
  //   ===================
  // - initiates the recursive display
  //
  void visualize(int x, int y, int b){
    stroke(250);
    pushMatrix();
      translate(x, y);
      drawFractal(b, 4, baseColor, lineColor);
    popMatrix();
    fill(250);
    textSize(15);
    textAlign(CENTER);
    text(s + " sprouts controlled by waves by " + c + " components", width/2, height - 22);
  }
  
  
  /////   FRACTAL DRAWING
  //   =====================
  // - recursively displays fractal
  //
  void drawFractal(float b, float t, color col, color scol){
    // base case...
    // - stop if increments become to small in order to prevent
    //   latency
    if(b > 3  &&  t > .5){
      // draw each branch
      for(int i = 0; i < s; i++){
        // use matricies
        // - simplifies recursion
        // - mitigates use of trig
        pushMatrix();
          // retrieve ~(-1, 1) values from TimeWaves, and map them accordingly
          float length = map(lengths[i].currentValue(), -2, 2, 0, b);
          float angle = map(angles[i].currentValue(), -1, 1, 0, 2*PI);
          // perform tranformations
          rotate(angle);
          stroke(scol);
          fill(col);
          strokeWeight(t);
          // depending on status...
          // - draw rectangle, circle, or line
          switch(status){
            case 0:  line(0,0,0,length);
                       break;
            case 1:  rect(0,0,t*5, t*5);
                       break;
            case 2:  ellipse(0,0,t*5, t*5);
                       break;
          }
          // move forward and start next branch
          translate(0,length);
          drawFractal( b*decays[i] , t*decays[i], color(red(col)*.8, green(col)*.8, blue(col)*.8), color(red(scol)*.8, green(scol)*.8, blue(scol)*.8));
        popMatrix();
      }
    }
  }
}
/////   THE TIMEWAVE CLASS
//   ========================
// - basically just a sinusoidal function
// - encompasses multiple additive components
// - produces values according to time since start
//
class TimeWave{
  
  // COMPONENT INFORMATION
  // A - amplitude
  // T - period
  // S - time shift
  float[] A, T, S;
  
  // number of components
  int cs;
  
  /////   CONTRUCTOR
  //
  TimeWave(int comps){
    cs = comps;
    A = new float[cs];  // store amplitudes
    T = new float[cs];  // store periods
    S = new float[cs];  // store shifts
    // randomize values
    for(int i = 0; i < cs; i++){
      A[i] = random(1);
      T[i] = random(3000, 30000); // make periods between 3 and 30 seconds
      S[i] = random(30000);
    }
  }
  
  /////   VALUE GRABBER
  // - just evaluates function
  float value(int time){
    float sum = 0;
    for(int i = 0; i < cs; i++){
      sum += A[i]*sin(2*PI*time/T[i] + S[i]);
    }
    return sum;
  }
  
  /////   TIMEWAVE
  // - grabs value according to time
  //
  float currentValue(){
    return value(millis());
  }
  
  /////   FUNCTION VISUALIZATION
  // - pretty much just here to check if the class was working...
  //
  void visualize(){
    stroke(250);
    strokeWeight(1);
    for(int t = 0; t < 10000; t++){
      line(map(t, 0, 10000, 0, width), 100*value(t) + height/2, map(t+1, 0, 10000, 0, width), 100*value(t+1) + height/2);
    }
  }
}


