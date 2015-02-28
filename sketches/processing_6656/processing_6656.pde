
// Lissajou figures
// by Steven Kay

  long phase=0;
  
  // tweak the following...
  double phasex=25.0; 
  double phasey=25.0;  
  
  int length=120; // length of worm
  int changeEvery=1000; // randomize every N frames
  int headcolor=color(255,0,0,255);
  int tailcolor=color(0,255,255);
  int[] cols;
  
  void setup(){
    size(400, 400);
    stroke(255);
    cols=new int[length];
    for (int i=0;i<length;i++) {
      cols[i]=lerpColor(headcolor, tailcolor, (float)i*(1.0f/(float)length));
    }
  }

  void mousePressed() {
    phasex=((double)mouseX/10.0);
    phasey=((double)mouseY/10.0);
  }
  
  public void draw(){
    background(0);
    for (int step=0;step<length;step++) {
      long l=phase-step;
      fill(cols[step]);
      stroke(255);
      int x=(int) (length*Math.sin(l*Math.PI/phasex));
      int y=(int) (length*Math.cos(l*Math.PI/phasey));
      ellipse(200+x,200+y,length-step,length-step);
    }
    phase++;
    
    // nudge the phase params every so often
    if (phase%changeEvery==0) {
      phasex=random(1,50);
      phasey=random(1,50);
    }
    
  }

