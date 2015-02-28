
// Assignment #1: Eyes and Boxes
// by Daniel Wyllie Lacerda Rodrigues

// By mixing Op Art with Surrealism, I intend to create 
// an atmosphere of dream and illusion in this artwork.
// Be careful. While you watch this composition, you 
// are also being watched. 

// Adjacent 3D boxes always share a face in common.
// The colors were chosen from the Color Wheel to 
// establish a continuous connection between all the 
// elements.

// In geometric terms, the shape is a 2D projection 
// of a 3D solid called Rhombic Triacontahedron.

// I uploaded this code to OpenProcessing
// http://www.openprocessing.org/sketch/108448

// I also uploaded this animation to YouTube (with sound)
// http://www.youtube.com/watch?v=w0EZM2RqLDU

// I completed this Coursera Course before this one:
// https://www.coursera.org/records/euMnBmPBDu59cqFf

// Time Counter
int counter = 0;
boolean rotation_mode = false;

// Zoom Factor (consider >= 45)
float x = 60; 

// Ten RGB Colors
color c_0 = color(0,131,181);
color c_1 = color(111,59,191);
color c_2 = color(217,37,40);
color c_3 = color(255,129,31);
color c_4 = color(197,206,47);

color c_5 = color(48,78,211);
color c_6 = color(168,44,111);
color c_7 = color(255,65,33);
color c_8 = color(253,199,47);
color c_9 = color(25,204,44);

// Array of Colors: Rhombuses 0
color [] acr_0 = {c_1, c_2, c_3, c_4, c_0};  
// Array of Colors: Rhombuses 1
color [] acr_1 = {c_6, c_7, c_8, c_9, c_5};
// Array of Colors: Circles 0
color [] acc_0 = acr_0;
// Array of Colors: Circles 1
color [] acc_1 = acr_0;

// Coordinates depends on x
float desc_h = x*tan(PI/5);
float x_tmp =  2*x*sin(PI/5);
float y_tmp =  2*x*cos(PI/5);
float [] coord_A = {0,0};
float [] coord_B = {desc_h,x};
float [] coord_C = {0,2*x};
float [] coord_D = {-desc_h,x};
float [] coord_O = {0,x};

void setup()
{
  size(460, 500);
  background(0);
  smooth();
  stroke(0,0,0);
  strokeWeight(3);
  strokeJoin(ROUND);
  frameRate(30);
}

void draw()
{
  if (rotation_mode)
  {
    if (counter == 200)
    {
       counter = 0; 
    }
    counter ++;
  }
  
  // Translate the Origin to the Center of the Canvas
  translate(width/2, height/2-40);
  pushMatrix();
  rotate(counter*TWO_PI/200);
  background(0);
  
  // Loop -> Repeat 5 Times
  for (int i =0; i<5; i++)
  {
    pushMatrix();
    rotate(-TWO_PI/10);
    translate(coord_C[0], coord_C[1]);
    fill(acc_0[i]);
    arc(0, 0, 110, 110, -PI/10, 11*PI/10);
    fill(255,90);
    arc(0, 0, 90, 60, -1.5*PI/10, 11.5*PI/10);
    popMatrix();
    fill(acr_0[i]);
    quad(coord_A[0], coord_A[1],
         coord_B[0], coord_B[1],
         coord_C[0], coord_C[1],
         coord_D[0], coord_D[1]);
    fill(acr_1[i]);
    quad(coord_C[0], coord_C[1],
         coord_B[0], coord_B[1],
         2*x*sin(TWO_PI/5), 2*x*cos(TWO_PI/5),
         x_tmp, y_tmp);
    fill(acc_1[i]);
    ellipse(x_tmp, y_tmp, 45, 45);
    noStroke();
    fill(0,70);
    ellipse(x_tmp, y_tmp, 25, 25);
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(x_tmp, y_tmp, 10, 10);      
    rotate(-TWO_PI/5);
   }
   popMatrix();
   
   PFont f;
   f = createFont("Gisha", 18);
   fill (255,255,255);
   textFont(f);
   textAlign(CENTER, CENTER);
   text("Click on the left button of the mouse", 0, 220);
   text("to start or stop rotation", 0, 240);  
}

void mousePressed()
{
  rotation_mode = !rotation_mode;
}
