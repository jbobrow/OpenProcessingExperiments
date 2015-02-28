
void setup() {
  size(500,300);
  strokeWeight(3);
  smooth();
  //noLoop();
  frameRate(8);
}
 
void draw() {
  // refresh
  background(60,30,30,50); 
  // set the radius and center point
  float radius = 100;
  int centX = width/2;
  int centY = height/2;
  // draw the circle in steps
 float mx=mouseX;
 float my=mouseY;
 int c =second();
  stroke(mx/2, my-50,c*4 );
  radius = 10;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(10);
  for (float ang=0; ang<=360*4; ang+=5) { 
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*(mx+my/4)) - 100;                
    float rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    if (lastx > -999) {
      line(x,y,lastx,lasty);
    }
    lastx = x;
    lasty = y;
  }
}
 
void mousePressed() {
  redraw();
  saveFrame("spiral####.png");
}


