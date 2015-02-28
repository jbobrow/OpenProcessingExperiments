
// rational drawing of circles  
// an example from Pearson (2011), p.68  
// revised to use setup() and draw()  
// schien@mail.ncku.edu.tw  
//Class exercise: Liliam Rodas


void setup() {  

  size(350, 350);   
  background(0);   
  strokeWeight(5);   
  smooth();
  frameRate (2);
  //noLoop ();
}  


void draw() {  

background (0);

  // set the radius and center point  


  float radius = 50;   

  float centX = random (width);   
  float centY = random (height);   
 float i;
  // draw the circle in steps  

  for (i=0; i<3; i++) {
    stroke (random (255), random (255), random (255));
    strokeWeight (random (2));  
    radius =25;
    float x, y;   
    float lastx = -999;   
    float lasty = -999;
    float radiusNoise= random (10);
    for (float ang=0; ang<=360*4; ang+=10) { 
      radiusNoise += 0.05;
      radius +=0.5;

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


