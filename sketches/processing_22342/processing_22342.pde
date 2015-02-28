
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

FFT fft;
float easedVal;
float valL;

float x;
float y;
float targetX, targetY;
float easing = 0.05; //experiment with this value, the original is 0.05


float diam;
float a = 300;
float b = 0;

float speed = 0;

float gravity = 0.1;

void setup() 
{
  size(600, 600); 
  smooth();
  noStroke();  
  rectMode(CENTER);
  noCursor();
  minim = new Minim(this);

  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two and that it means the size of the spectrum
  // will be 512. see the online tutorial for more info.
  fft = new FFT(in.bufferSize(), in.sampleRate());
  //////////////////////////////////////////////////
  
  
Spring2D s1, s2;

float gravity = 6.0;
float mass = 2.0;


  smooth();
  fill(0);
  // Inputs: x, y, mass, gravity
  s1 = new Spring2D(0.0, width/2, mass, gravity);
  s2 = new Spring2D(0.0, width/2, mass, gravity);
  
  
}


void draw() 
{ 
  background(random (10) );

 
 // don't worry about this targetX or targetY code other than realizing that by changing
 // the easing value above you can adjust the easing effect
  targetX = mouseX+50;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY+70;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
///////////////////////////////////////////////////  
  diam = random(20);
  a = random(width);
  b = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(20);
  ellipse(a,b,diam,diam);
  
   b = b + speed;
  speed = speed + gravity;

  if(a > height + 3) {
    speed = speed * -.30;
  }
  
  
    ellipseMode(CENTER);
  fill(30);
  noStroke();
  ellipse(x, y, 10, 40);
  
  ellipse(x-90, y+30, 10, 40);
  ellipse(x-50, y+10, 10, 10);
  ellipse(x-50, y, 10, 10);
  ellipse(x-50, y-10, 10, 10);
  ellipse(x-50, y-20, 10, 10);
  ellipse(x-50, y+40, 10, 10);
  ellipse(x-60, y+40, 20, 20);
  ellipse(x-40, y+40, 20, 20);
  ellipse(x-40, y+80, 10, 40);
  ellipse(x-60, y+80, 10, 40);
  
  
  // Head
fill(30);                    // Set fill to black
//ellipse(276, 155, 45, 45);  // Head
ellipse(mouseX, mouseY, 70, 70);

ellipse(mouseX+20, mouseY+70, 20, 8);
ellipse(mouseX+20, mouseY+60, 25, 8);
ellipse(mouseX+20, mouseY+50, 30, 8);

ellipse(mouseX-20, mouseY+70, 20, 8);
ellipse(mouseX-20, mouseY+60, 25, 8);
ellipse(mouseX-20, mouseY+50, 30, 8);
  
fill(255);                  // Set fill to white
//ellipse(288, 150, 14, 14);  // LEFT eye
fill(0);
ellipse(mouseX+15, mouseY+0, 15, 14);
fill(0);                    // RIGHT eye
ellipse (mouseX-15, mouseY+0, 15, 14);
fill(153);                  // Set fill to light gray
////////////////////////////////////////////////////////////

 float mx = easedVal / .1;
   float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
//
//    stroke(60);
//    line(x + offsetA, 20, x - offsetB, 400);



//ellipse(263, 148, 5, 5);    // tooth 1
ellipse((mouseX-13)+offsetA, (mouseY+18), 5, 9);
//ellipse(296, 130, 4, 4);    // tooth 2
ellipse((mouseX-1)+offsetA, (mouseY+19), 5, 10);
//ellipse(305, 162, 3, 3);    // tooth 3
ellipse((mouseX+13)+offsetA, (mouseY+18), 5, 9);

//////Sound controls are below//////

fft.forward(in.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    valL = fft.getBand(i)*3;

    valL = constrain(valL,0,1);

    //the sound input runs between 1- and 1
    // Convert the values to set scalar range   
    // between 0 and 300 using map()
    valL = map(valL,0,1,0,50);


    float targetVal = valL;
    easedVal += (targetVal - easedVal) * easing;


    //for debugging and viewing sensor data, comment out when not needed
    // println("valL = " + valL +" : " + "easedVal = " + easedVal);
    //println("valL = " + valL );
  }

  fft.window(FFT.HAMMING); // this may smooth the input, comment or uncomment 

  /////////////////////////////////////////////////////////////////////////////////////////////////


  //println(easedVal);


  //code from dynamic_random_motion
  //have easedVal from sound input replace mouseX
  //++++++++++++++++++++++++++++++++++++++++++++++

//  for (int x = 20; x < width; x += 20) {
//    float mx = easedVal / 0.1;
//    float offsetA = random(-mx, mx);
//    float offsetB = random(-mx, mx);
//
//    stroke(60);
//    line(x + offsetA, 20, x - offsetB, 400);
//  }
  //++++++++++++++++++++++++++++++++++++++++++++++++++
}

//sound stuff don't forget this!
////////////////////////////////////////////////////////////////
void stop()
{
  // always close Minim audio classes when you finish with them
  in.close();
  minim.stop();

  super.stop();

  }
  
class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(float nx, float ny) {
//    noStroke();
//    ellipse(x, y, radius*2, radius*2);
//    stroke(255);
//    line(x, y, nx, ny);

  ellipse(x-90, y+30, 10, 40);
  ellipse(x-50, y+10, 10, 10);
  ellipse(x-50, y, 10, 10);
  ellipse(x-50, y-10, 10, 10);
  ellipse(x-50, y-20, 10, 10);
  ellipse(x-50, y+40, 10, 10);
  ellipse(x-60, y+40, 20, 20);
  ellipse(x-40, y+40, 20, 20);
  ellipse(x-40, y+80, 10, 40);
  ellipse(x-60, y+80, 10, 40);
  }
}


