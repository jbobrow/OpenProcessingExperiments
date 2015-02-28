
float mx; // brown left
float my;
float bx; // black right
float by;
float rx;  // brown right
float ry;
float kx; // black left
float ky;

float easing = 0.07;
float easingT = 0.04;

void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  if (mousePressed) {
  background(238,156,176);
 
  //Eyes - White
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse(200,187,109,190); //left
  ellipse(433,187,109,190); //right
  
  //Brown - left
  noStroke();
  fill(149,206,139);
  float newmx = constrain(mouseX, 178, 224);
  float newmy = constrain(mouseY, 156, 212);
  
  mx += (newmx - mx) * easing;
  my += (newmy - my) * easing;
  
  ellipse(mx, my, 50,90);

  //Brown - right
  float newrx =constrain(mouseX, 410, 457);
  rx += (newrx - rx) * easing;
  
  ellipse(rx, my, 50, 90);

  //Black - right
  fill(0);
  float newbx = constrain(mouseX, 405,459);
  float newby = constrain(mouseY, 144, 226);
  
  bx += (newbx - bx) * easingT;
  by += (newby - by) * easingT;
  ellipse(bx,by,25,42);
  
  //Small shine
  fill(255);
  noStroke();
  ellipse(bx - 10, by - 18, 7, 7);
  
  //Big shine
  ellipse(bx +11, by +15, 11,11);
  
  
  
  //Black - left
  fill(0);
  strokeWeight(3);
  float newkx = constrain(mouseX, 174, 229);

  
  kx += (newkx - kx) * easingT;
 
ky = by;
  
  ellipse(kx,ky,25,42);
  
  //Small shine
  fill(255);
  noStroke();
  ellipse(kx - 10, ky - 18, 7, 7);
  
  //Big shine
  ellipse(kx +11, ky +15, 11,11);
 
 
 
 
  } else {
 
 
   
   
    background(198,221,125);
  
  //Eyes - White
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse(200,187,109,190); //left
  ellipse(433,187,109,190); //right
  
  //Brown - left
  noStroke();
  fill(117,76,41);
  float newmx = constrain(mouseX, 178, 224);
  float newmy = constrain(mouseY, 156, 212);
  
  mx += (newmx - mx) * easing;
  my += (newmy - my) * easing;
  
  ellipse(mx, my, 50,90);

  //Brown - right
   float newrx =constrain(mouseX, 410, 457);
  rx += (newrx - rx) * easing;
  ellipse(rx, my, 50, 90);

  //Black - right
  fill(0);
  float newbx = constrain(mouseX, 405,459);
  float newby = constrain(mouseY, 144, 226);
  
  bx += (newbx - bx) * easingT;
  by += (newby - by) * easingT;
  ellipse(bx,by,25,42);
  
  //Small shine
  fill(255);
  noStroke();
  ellipse(bx - 10, by - 18, 7, 7);
  
  //Big shine
  ellipse(bx +11, by +15, 11,11);
  
  
  //Black - left
  fill(0);
  strokeWeight(3);
    float newkx = constrain(mouseX, 174, 229);

  
  kx += (newkx - kx) * easingT;

  ky = by;
  ellipse(kx,ky,25,42);
  
  //Small shine
  fill(255);
  noStroke();
  ellipse(kx - 10, ky - 18, 7, 7);
  
  //Big shine
  ellipse(kx +11, ky +15, 11,11);
  }



}

