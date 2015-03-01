
float animating = 0;
float initial = 0;
float stop1=10;
float stop2=20;
float forwarding = 0;
float numtorender = 15;

float[][] points = { 
   {100,100}, {700, 100}, {100,500}, {700,500}};

void setup() {
  size(800, 600);
}


void draw() {
  
  translate (89,0);
  background(255);
  noFill ();
  strokeWeight(50);
  
  beginShape();
   for (int i=0; i<points.length; i++) {
     
    scale (random (0.98, 0.99));
    stroke (237, 101, 69, 100);
    float x0 = -50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y0 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x0, y0);
  }
  endShape();
  
  beginShape();

  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,1,255), 230, random(200), 100);
    float x0 = -50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y0 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x0, y0);
  }
  endShape();
  
  beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,200,255), 256*forwarding, random(200), 200*forwarding);
    float x1 = points[i][0] + (width/2-points[i][0]) * forwarding;
    float y1 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x1, y1);
  }
  endShape();
  
  beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,100,200), 256*forwarding, random(200), noise(256*forwarding));
    float x2 = 50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
 
 beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,100,200), 256*forwarding, random(200), 256*forwarding);
    float x2 = 50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
  
 beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,220,235), 200*forwarding*1.5, random(230), 256*forwarding*2);
    float x2 = -100+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
  
  for (int i=0; i<points.length; i++) {
    scale (random (0.98, 0.99));
    stroke (237, 101, random(200), 100);
    float x0 = -50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y0 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x0, y0);
  }
  endShape();
  strokeWeight(100);
  
  beginShape();

  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,1,255), 230, random(200), 100);
    float x0 = -50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y0 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x0, y0);
  }
  endShape();
  
  beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,200,255), 256*forwarding, random(200), 200*forwarding);
    float x1 = points[i][0] + (width/2-points[i][0]) * forwarding;
    float y1 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x1, y1);
  }
  endShape();
  
  beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,100,200), 256*forwarding, random(200), noise(256*forwarding));
    float x2 = 50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
 
 beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,100,200), 256*forwarding, random(200), 256*forwarding);
    float x2 = 50+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
  
 beginShape();
  for (int i=0; i<points.length; i++) {
    stroke (map(forwarding,0,1,220,235), 200*forwarding*1.5, random(230), 256*forwarding*2);
    float x2 = -100+points[i][0] + (width/2-points[i][0]) * forwarding;
    float y2 = points[i][1] + (i*200-points[i][1]) * forwarding;
    vertex(x2, y2);
  }
  endShape();
 
  if (animating == stop1) {
    forwarding += 0.01;
    forwarding = min(1, forwarding);
  }else if(animating == stop2) {
    forwarding -= 0.01;
    forwarding = max(0, forwarding);
  }
}

void mousePressed() {
  if (animating == initial) {
    animating = stop1;
  }else if (animating == stop1) {
    animating = stop2;
  }else if(animating == stop2){
    animating = stop1;
  }
 
}






