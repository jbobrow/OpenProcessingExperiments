
// ripples in 3D
// by Steven Kay

int RIPPLES=3;
color to=color(0); // bg color cycling extreme colours
color from=color(77,0,77);
float CYCLEPERIOD=100.0; // bg color cycling speed
float DAMPING=0.998; // speed ripples fade at, low value=faster

class source{
  public float x;
  public float y;
  public float amp;
  public float wavelength;
  
  public source(float _x,float _y, float _amp,float _wave) {
    x=_x;y=_y;amp=_amp;wavelength=_wave;
  }
  
  public float getPart(float xx,float yy,float time) {
    float distt=mag(xx-x,yy-y);
    return amp*(float)Math.cos(((time-distt)/wavelength));
  }

  public void fade() {
    amp*=DAMPING; // damping factor
  }  
}

ArrayList ripples;

void setup() {
  size(400,400,P3D);
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
  ripples.add(new source(random(-100,100),random(-100,100),random(2,60),random(2,12)));
}

void draw() {
  //if (frameCount%10==0) print(""+frameRate+"fps\n");
  background(lerpColor(from,to,.5+.5*(float)Math.cos(frameCount/CYCLEPERIOD)));
  noStroke();
  
  // fade waves out over time
  for (int i=0;i<ripples.size();i++) {
    source s=(source)ripples.get(i);
    s.fade();
  }
  
  translate(200,200,-400);
  rotateX(mouseY/300.0);
  
  float totalAmp=0.0;
  
  for (float y=-100.0;y<100.0;y+=3.0) {
    for (float x=-100.0;x<100.0;x+=3.0) {

      // sum of waves from different sources at this point
      float hite=0.0;
      for (int i=0;i<ripples.size();i++) {
        source s=(source)ripples.get(i);
        hite+=s.getPart(x,y,(float)frameCount);
      }
      totalAmp+=Math.abs(hite); // has to be abs() or settles far too fast ;-)
      
      // brightness level
      float h=128+(5*hite);
      fill(h);
      
      if (h>100) {
        // don't bother unless cube bright enough to see :)
        pushMatrix();
        translate(x*4,y*4,hite);
        box(8);
        popMatrix();
      }
      
    }
  }
  // once settled down to a calm sea, start again
  if (totalAmp<2000.0) {
    print ("Settled down, start again");
    reset();
  } else {
    //if (frameCount%10==0) print ("TotalAmp="+totalAmp+"\n");
    ;
  }
}

