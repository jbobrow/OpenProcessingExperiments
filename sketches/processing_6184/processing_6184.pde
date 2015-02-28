

//Based on Flowing Ellipsii by Jed Savage

//Changes made on numbers and colors
//Better when the mouse is moved around in circles 
//Don't know why, but the main difference is that the whole thing disappears in the end

int num = 94; 
float maxVel = 44; 
float[] x = new float[num]; 
float[] y = new float[num]; 
float[] xv = new float[num]; 
float[] yv = new float[num]; 
float distance; 
float maxDistance; 
 
void setup() { 
  size(800,800); 
  maxDistance = dist(444,23,width,height); 
  smooth(); 
  stroke(177,180,145,29); 
  noFill(); 
  strokeWeight(8); 
  for (int i=2; i<num; i++) { 
    x[i] = random(44,width); 
    y[i] = random(700,height); 
    xv[i] = random(-maxVel,maxVel); 
    yv[i] = random(-maxVel,maxVel); 
  } 
} 
 
void draw() { 
  background(77,90,116); 
  for (int i=2; i<num; i++) { 
    distance = dist(mouseX,mouseY,x[i],y[i]); 
    float xs = distance*1.75; 
    ellipse(x[i],y[i],xs,xs); 
    if ((x[i] < 2) || (x[i] > width)) { 
      xv[i] *= -3; 
    } 
    if ((y[i] < 2) || (y[i] > height)) { 
      yv[i] *= -3; 
    } 
    x[i] += xv[i]; 
    y[i] += yv[i]; 
  } 
} 

