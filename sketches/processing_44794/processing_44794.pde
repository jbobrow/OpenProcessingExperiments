
// rational drawing of circles  

// an example from Pearson (2011), p.68  

// revised to use setup() and draw()  

// schien@mail.ncku.edu.tw  

   

void setup() {  

  size(500,300);   

  background(255);   

  strokeWeight(2);   

  smooth();  

}  

   

void draw() {  

  // refresh  

  background(0);  

   

  // set the radius and center point  

  float radius = 100;   

  int centX = 250;   

  int centY = 150;   

   

  // draw the circle the easy way  

  stroke(0, 30);   

  noFill();   

  ellipse(centX,centY,radius*2,radius*2);  

   

  // draw the circle in steps  

  stroke(165,198,22);   

  float x, y;   

  float lastx = -999;   

  float lasty = -999;   

  for (float ang=0; ang<=360; ang+=3) {                     

    float rad = radians(ang);                                     

    x = centX + (radius * cos(rad));   

    y = centY + (radius * sin(rad));   
if (lastx > -999) {
line(x,y,lastx,lasty);
 

  }  
lastx=x;
lasty=y;

}  

}

void mousePressed() {  

  saveFrame("circle1.png");  

} 


