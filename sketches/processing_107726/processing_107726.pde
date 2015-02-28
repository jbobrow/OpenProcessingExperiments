
import g4p_controls.*;

GSlider sdr, sa_sl;
GButton reset;
int w, h;
float q;
float xf = 3;
float A = 1, B = 1;
float K = 2;
float al = 0;
float D = 0;
int imax = 200;
float sa =0.1, sb = 0.1;
int r = 30;

float Ax = 0, Bx = 0;
float Ay = 0, By = 0;
float dA = 0; float dB = 0;

// comaxVnemaxV of phase potret
float phs_x = 200; 
float phs_y = 50; 
float minV = -2;
float maxV = 4;

GTimer timer;
int bkgc = 245;

public void setup() {
  float[] Ar = new float[imax];
  float[] Br = new float[imax];

  w = 700;
  h = 700;
  size(w, h);
  smooth();
  sdr = new GSlider(this, 0 , 10, w, 20, 20);
  sdr.setValue(0.9);
  sa_sl = new GSlider(this, 0 , 40, w, 20, 20);
  sa_sl.setValue(0.9);
  reset = new GButton(this, w-80, 80, 60, 40, "Res.");
  
  timer = new GTimer(this, this, "foo", 10);
  timer.start();

  float dA, dB;
  A = 0.002; B = 0.001;
  D = 0;

  background(bkgc);
  print ("Ku Ku!");

}

public void draw() {
  fill(bkgc); stroke(bkgc);
  rect(0,0,200, h);
  //background(245); 
  smooth();
  Ax = 40;
  Ay = map(A, minV, maxV, h, 0);
  fill(0,200,100);
  ellipse(Ax, Ay, r, r);
  
  Bx = 100;
  By = map(B, minV, maxV, h, 0);
  fill(0,100,200);
  ellipse(Bx, By, r, r);
  
  if (dist(Ax, Ay, mouseX, mouseY) < r && mousePressed == true)
      A = map(mouseY, 0, h, maxV, minV);   

  if (dist(Bx, By, mouseX, mouseY) < r && mousePressed == true)
      B = map(mouseY, 0, h, maxV, minV);  
     
  if(mouseX > phs_x && mouseX < w && mouseY > phs_y && mouseY < h && mousePressed == true)
  {
    A = map(mouseX, phs_x, w, minV, maxV);
    B = map(mouseY, phs_y, h, maxV, minV);
  } 
      
  // phase port
  
  float px = map(A, minV, maxV, phs_x, w);
  float py = map(dA, -0.05, 0.05, h, phs_y);
  //float py = map(B, minV, 4, h, phs_y);
  float trp = 8;
  float tr = 5;
  stroke(0,60,60,trp);
  fill(0,60,60,trp); 
  ellipse(px, py, tr, tr);
    
  px = map(B, minV, maxV, phs_x, w);
  py = map(dB, -0.05, 0.05, h, phs_y);
  stroke(60,0,60,trp);
  fill(60,0,60,trp); 
  ellipse(px, py, tr, tr);
      
}

public void foo(GTimer t) {
  simulate();
}

public void simulate()
{
    //float dA = 0.01*( A*(1 - A/K) - al*B);
    //float dB = 0.01* (B*(1 - B/K) - al*A);
 
    dA = 0.004*(K - A - al*B*B);
    dB = 0.004* (K - B - al*A*A);
 
    //if(A < 0) A = 0; 
    //if(B < 0) B = 0; 
    A = A + dA;
    B = B + dB;
    
    if(A < -10000 || A > 10000) { A = 0.002; }
    if(B < -10000 || B > 10000) { B = 0.002; }
    //println ( "A = " + A);
}

public void handleSliderEvents(GValueControl slider, GEvent event) { 
  if (slider == sdr)  
    K = 8*sdr.getValueF()-4; 
  if (slider == sa_sl)  
    al = sa_sl.getValueF()*2;  
}

void handleButtonEvents(GButton button, GEvent event) {
   if(button == reset && event == GEvent.CLICKED){
       A = 0.002; B = 0.001; background(bkgc); dA = 0; dB = 0;
   }
}



