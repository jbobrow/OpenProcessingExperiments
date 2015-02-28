
//Author: Liliam Rodas
//Purpose: Homework to generate different flower patterns. 
// The art work is based in noise spirals that generate different rose patterns.
//Functioning: Flowering roses with tones,shapes and sizes which fade wich branches.
//Reference: previous excercises provided in class and processing.


void setup() { 

  size(500, 350);  
  background(1, 10, 0);  
  smooth();
} 


void roses() { 

  noStroke ();
  fill(1, 10, 0, 70);
  rect (0, 0, width, height);

  // set the radius and center point 


    float radius = random (50);  

  float centX = random (width);  
  float centY = random (height);  
  float i;


  // draw the circle in steps 

  for (i=0; i<3; i++) {
    stroke (random (250), random (5), random (9));
    strokeWeight (random (2)); 
    float x, y;  
    float lastx = -999;  
    float lasty = -999;
    float radiusNoise= random (50);
    for (float ang=0; ang<=360*15; ang+=(random (20))) {
      radiusNoise += 0.05;
      radius +=0.02;

      float thisradius = radius + (noise (radiusNoise)*200)-100;
      float rad = radians(ang);                                    

      x = centX + (thisradius * cos(rad));  
      y = centY + (thisradius * sin(rad));  

      if (lastx>-999)
      {

        line (x, y, lastx, lasty);
      }
      lastx=x;
      lasty=y;
    }
  }
}

void branches () {
    if
    (mousePressed) {
    strokeWeight (0);  
    stroke(20,219,21);
    
  float xstep = 10;
  float ystep = 10;
  float lastx = random (50);
  float lasty = random (50);
  float y = random (500);
  for (int x=0; x<=500; x+=xstep) {
    ystep = random(10) - 10;
    y += ystep;
    
    line(y, x, lasty, lastx); 
    
    line(x, x+y-100, lastx, lastx+lasty-100); 
        
    lastx = x;
    lasty = y;
  }
}
}
void draw () {
  branches ();
  roses ();
  frameRate (2);
  
}

void keyPressed() {
  saveFrame("roses.jpg");
}


