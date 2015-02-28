
int RIPPLES=3;
//color to=color(255,0,226); // bg color cycling extreme colours
//color from=color(0,249,255);
//float CYCLEPERIOD=100.0; // bg color cycling speed
float DAMPING=0.2; // speed ripples fade at

class source {
  public float x;
  public float y;
  public float amp;
  public float wavelength;

  public source(float _x,float _y, float _amp,float _wave) {
  x=_x;y=_y;amp=_amp;wavelength=_wave;
}

public float getPart(float xx, float yy, float time) {
  float distt=mag(xx-x, yy-xx);
  return amp*(float)Math.cos(((time-distt)/wavelength));
}

public void fade() {
  amp*=DAMPING; 
} 
}

ArrayList ripples;

void setup() {
  size(700, 700, P3D);
  reset();
}

void reset() {
  ripples=new ArrayList();
  for (int i=0;i<RIPPLES;i++) {
    addNewRipple();
  }
}

void mousePressed() {
  reset();
}

void keyPressed() {
  addNewRipple();
}

void addNewRipple() {
  ripples.add(new source(random(-100, 100), random(-100, 100), random(2, 60), random(2, 12)));
}

void draw() {
  if (frameCount%10==0) print(""+frameRate+"fps\n");
  background(lerpColor(from,to,.3+.2*(float)Math.cos(frameCount/CYCLEPERIOD)));
  noStroke();


  for (int i=0;i<ripples.size();i++) {
    source s=(source)ripples.get(i);
    s.fade();
  }

  translate(300, 300, -400);
  rotateX(mouseY/30.0);

  float totalAmp=0.0;

  for (float y=-200.0;y<200.0;y+=3.0) {
    for (float x=-150.0;x<150.0;x+=3.0) {

 
      float hite=0.0;
      for (int i=0;i<ripples.size();i++) {
        source s=(source)ripples.get(i);
        hite+=s.getPart(x, y, (float)frameCount);
      }
      totalAmp+=Math.abs(hite); 

      // brightness level
      float h=128+(5*hite);
      fill(h);

      if (h>20) {
    
        pushMatrix();
        translate(x*4, y*4, hite);
        box(8);
        popMatrix();
      }
    }
  }

  if (totalAmp<5000.0) {
    print ("Settled down, start again");
    reset();
  } 
  else {
    if (frameCount%10==0) print ("TotalAmp="+totalAmp+"\n");
    ;
  }
}



