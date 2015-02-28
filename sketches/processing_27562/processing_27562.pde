
             
// Draw note as circle on the bezier tree
// you can use piano VMPK (free download) and loopBE1, internal midi port (free)
// check loopBe1 ,it must be active
float[][] coordinate = new float[2][61]; // 6 rami*10 divisioni +1
float k=1.0/8.0; // parametro usata per disegnare le curve bezier
import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus

void setup() {
  background(0); // black background
  stroke(255); // white stroke
  size(1024,768);  // screen width, height  
  int w= width;  // screen w
  int h= height; // screen h
  drawTOT(w,h,k); 
  MidiBus.list(); // List all available Midi devices on STDOUT. 
  //                   Parent In Out
  //                     |    |  |
  myBus = new MidiBus(this, 0, 0); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.
  println("Width:"+width+"  Height:"+height);  
}

void draw() {
  smooth(); // antialias
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note ON:---------");
  println("Channel:"+channel+"  Pitch:"+pitch+"  Velocity:"+velocity);
  int vel = velocity;
  int pit = pitch;
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));  // note have a random color
  int xr=int(random(1,60));  
  int yr=xr;
  ellipse(coordinate[0][xr], coordinate[1][yr], vel/2, vel/2);  // note widht linked to velocity
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note OFF:---------");
  println("Channel:"+channel+"  Pitch:"+pitch+"  Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:---------");
  println("Channel:"+channel+"  Number:"+number+"  Value:"+value);
  if((number==121)&&(value==0)) {  // reset all on virtualpiano VMPK
  
    background(0); // clear background
    stroke(255); // important!  otherwise are black, invisible
    drawTOT(width,height,k); 
  }
}
void drawTOT( int w, int h, float k) {
  drawbezier(w*4*k,h,3*k*w,5*k*h,3*k*w,5*k*h,0,6*k*h,1);  // curve number 1 to 6
  drawbezier(w*4*k,h,3*k*w,3*k*h,3*k*w,3*k*h,0,4*k*h,2);
  drawbezier(w*4*k,h,3*k*w,0,3*k*w,0,0,k*h,3);
  drawbezier(w*4*k,h,5*k*w,5*k*h,5*k*w,5*k*h,w,6*k*h,4);
  drawbezier(w*4*k,h,5*k*w,3*k*h,5*k*w,3*k*h,w,4*k*h,5);
  drawbezier(w*4*k,h,5*k*w,0,5*k*w,0,w,k*w,6);
}

// draw the bezier curve
void drawbezier(float xp1,float yp1,float cpx1,float cpy1,float cpx2,float cpy2,float xp2,float yp2, int n) {
  noFill();
  bezier(xp1,yp1,cpx1,cpy1,cpx2,cpy2,xp2,yp2);  // disegna le 6 curve
  int divis=10;
  int steps = divis*n; 
  //float[][] coordinate = new float[2][6*divis+1];  // global in setup  
  for (int i = (steps-9); i <= steps; i++) {
    float t = (i-10*(n-1)) / float(divis);    // t must be float 0 to 1
    float x = bezierPoint(xp1, cpx1, cpx2, xp2, t);
    float y = bezierPoint( yp1, cpy1, cpy2, yp2, t);
    // riempe la matrice
    coordinate[0][i] = x;
    coordinate[1][i] = y;
  }
};
                
