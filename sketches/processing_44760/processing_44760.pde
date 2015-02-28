
//in-class practice to draw spiral

void setup() {
  size(500, 300);
  background(255);
  strokeWeight(5);
  smooth();
}

void draw() {
  // refresh
  background(255);

  // set the radius and center point
  float radius = 100;
  int centX = 250;
  int centY = 150;

  // draw the circle the easy way
  stroke(0, 30);
  noFill();
  ellipse(centX, centY, radius*2, radius*2);

  // draw the circle in steps
  stroke(20, 50, 70);
  float x, y;
  radius=mouseX/10;
  float lastx = -999;
  float lasty = -999;
  for (float ang=0; ang<=360*6; ang+=30) {  
    radius+=mouseY/60;    
    float rad = radians(ang);                                  
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    if (lastx>-999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;

    // point(x,y);
  }
}

void mousePressed() {
  saveFrame("circle1.png");
}


