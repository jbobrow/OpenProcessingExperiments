
import controlP5.*;    
import processing.pdf.*;

ControlP5 steuerung; 

float rMax;
float x0;
float y0;
int num;   

float groesse;
int   alter; 

void setup() {
  size(500,400);
  smooth();
  rMax = 150;
  num = 400;
  x0 = (width-100)/2+100;
  y0 = height/2;
  
  frameRate(30);
  groesse = 0.5;   
  alter = 3;
  
  steuerung = new ControlP5(this);
  Slider s1 = steuerung.addSlider("alter",0,40,20,20,10,200); 
  Slider s2 = steuerung.addSlider("groesse",0,2,50,20,10,200);  
}

float[] xx = new float[1000];
float[] yy = new float[1000];   

void draw() {
  float w,x,y;
  background(0);
  
  for (int i=0; i<num; i++) {
    w = TWO_PI*i/num;
    xx[i] = cos(w)+groesse*cos(alter*w);   
    yy[i] = sin(w)+groesse*sin(alter*w);
  }
  for (int i=0; i<num; i++) { 
    plot(i);
  }
}


void plot(int n) {
  float rSize = rMax/(1+abs(groesse));
  float x = x0+rSize*xx[n];
  float y = y0-rSize*yy[n];
  int vorher = n-1;
  if (vorher<0) { vorher = vorher+num; }
  float x2 = x0+rSize*xx[vorher];
  float y2 = y0-rSize*yy[vorher];
    
  stroke(255);
  line(x2,y2,x,y);
}
 
void mousePressed() {   
  strokeWeight(random(1,5));  
}

void keyPressed() {
  if (key == 's') { saveFrame("geb-####.tif");}
   
  if (key == 'p') {
  beginRecord(PDF, "geb-####.pdf");
  background(255);
  }
   
  if (key == 'e') {endRecord(); }
 
}
    

