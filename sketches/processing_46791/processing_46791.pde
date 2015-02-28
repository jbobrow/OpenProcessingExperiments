
float x, y, cp1X, cp1Y, cp2X, cp2Y, endX, endY, distX, distY, stretch;
int num = 55;  // Number of bezier segments in chain.
int iterations = 2;  // Scaler based on width.
float contain = 13; //  Limit curviness of beziers.
color shade = color(0,noise(-100,100));
int alphaVal = 150;  // Alpha value variance.
float spacing = .7;
float thickness = 3;  // StrokeWeight variance.
 
void setup() {
  size(600, 700);
  background(240,50,10);
  noFill();
  frameRate(1000);

  smooth();
  x = 0;  //  Setup first segment.
  y = 123;
  endX = 0;  // First end point.

}
 
void draw() {


  for (int j = 0; j < width * iterations; j++) { 
 
    beginShape();
 
    vertex(x, y); 
    cp1X = x + random(-contain, contain); 
    cp1Y = y + random(-contain, contain);
 
    endY = height/num + random(-height/num, height/num);
    cp2X = endX + random(-contain, contain); 
    cp2Y = endY + random(-contain, contain);
 
    for (int i = 1; i <= num; i++) { 
      distX = endX - cp2X;
      distY = endY - cp2Y;
      stretch = random(0.5, 1.5); 
 
      if (i != 0) {
        cp1X = endX + (distX * stretch);
        cp1Y = endY + (distY * stretch);
 
        endY += height/num + random(-height/num, height/num);
        cp2X = endX + random(-contain, contain);
        cp2Y = endY + random(-contain, contain);
      }
 
      bezierVertex(cp1X, cp1Y, cp2X, cp2Y, endX, endY);
    }
 
    color shade = color(random(50), random(40), random(20));
    stroke(255, random(alphaVal));
    endShape();
     
    x += spacing;
    endX += spacing;
    strokeWeight(noise(thickness)*1.7);
  }
  
     
  

  
  

}
 
void mousePressed() {
  setup();


}

void keyPressed () {
// set the radius and center point 
  float radius = 60; 
  int centX = 300;  
  int centY = 300;  
 
  // draw the circle in steps 
  stroke(0, 60);
  radius=10; 
  float x, y;  
  float lastx = -999;  
  float lasty = -999;
  float radiusNoise = random(4);
   
  for (float ang=0; ang<=360*5; ang+=1) {
    radiusNoise +=20.1;
    radius+=0.5;
    float thisRadius = radius + (noise(radiusNoise)*100) - 100; 
    float rad = radians(ang);                                    
    x = centX + (thisRadius * cos(rad));  
    y = centY + (thisRadius * sin(rad));
     
    if (lastx>-999) {
      line(x, y, lastx, lasty);
      stroke(#212355); 
      strokeWeight(0.5);
      line(x, y, centX, centY);
       
      
    }
    lastx=x;
    lasty=y;
  }





}



