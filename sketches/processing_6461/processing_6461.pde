
// Chaos Game
// by Steven Kay
// A variation on the chaos game.

int SIDES=5; // number of vertices
int STEPS=1000; // number of points to plot
int ENERGIES=3; // complexity

// location of polygon vertices, the 'attractors'
float[] xp=new float[SIDES];
float[] yp=new float[SIDES];

float[] baseline=new float[ENERGIES];
float[] energy=new float[ENERGIES];

Random die=new Random();

void setup() {
  background(0);
  size(512,512);
  reset();
}

void reset() {
  // start a new fractal.
  ENERGIES=die.nextInt(2)+3;
  SIDES=die.nextInt(7)+3;
  float ang=(float)((Math.PI*2.0)/(float)SIDES);
  baseline=new float[ENERGIES];
  energy=new float[ENERGIES];
  xp=new float[SIDES];
  yp=new float[SIDES];
  for (int i=0;i<SIDES;i++) {
    xp[i]=256.0f+(float)(256.0*Math.cos(ang*i));
    yp[i]=256.0f-(float)(256.0*Math.sin(ang*i));
  }
  for (int i=0;i<ENERGIES;i++) {
    baseline[i]=0.5f+die.nextFloat();
    energy[i]=baseline[i];
  }

}

int fc=0; // frame counter

void draw() {
  fc+=1;
  if (fc%100==0) {
    //kick in a different fractal
    background(0);
    reset();
  }
  noStroke();
  float x,y;
  x=y=256.0f;
  fill(255,50);
  //play the chaos game
  for (int i=0;i<STEPS;i++) {
    rect(x,y,2,2);
    int towards=die.nextInt(SIDES);
    x+=(xp[towards]-x)*energy[fc%ENERGIES];
    y+=(yp[towards]-y)*energy[fc%ENERGIES];
  }  
  for (int i=0;i<ENERGIES;i++) {
    float change=-0.01f+(die.nextFloat()*0.02f);
    energy[i]=baseline[i]+0.1f*(float)Math.sin(fc/200.0);
  }
}

