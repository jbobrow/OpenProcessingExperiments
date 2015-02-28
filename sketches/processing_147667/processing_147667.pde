
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID:wjddms6847

void setup() {
  size (1024, 768);
  smooth();
  noLoop();
}

void draw() {
  background(0);

   for (int a = 10; a<1024; a = a+50) {
   for (int b = 10; b<768; b = b+50) {

   fill(80,255,239);
   ellipse(a, b, 45, 45);
   fill(0);
   ellipse(a, b, 30, 30);
   strokeWeight(random(5));
  }
  }
  
   for (int c = 10; c<800; c = c+50) {
   for (int d = 10; d<768; d = d+50) {

   fill(240,255,227);
   ellipse(c, d, 45, 45);
   fill(0);
   ellipse(c, d, 30, 30);
   strokeWeight(random(5));
  }
  }
  
  for (int e = 10; e<600; e = e+50) {
  for (int f = 10; f<768; f = f+50) {

  fill(255,13,134);
  ellipse(e, f, 45, 45);
  fill(0);
  ellipse(e, f, 30, 30);
  strokeWeight(random(5));
  }
  }

 for (int g = 10; g<400; g = g+50) {
 for (int h = 10; h<768; h = h+50) {
 
  fill(250,207,228);
  ellipse(g, h, 45, 45);
  fill(0);
  ellipse(g, h, 30, 30);
  strokeWeight(random(5));
  }
  } 
  
  for (int i = 10; i<200; i = i+50) {
  for (int j = 10; j<768; j = j+50) {

  fill(90,255,21);
  ellipse(i, j, 45, 45);
  fill(0);
  ellipse(i, j, 30, 30);
  strokeWeight(random(5));
      
  }
  } 
  }
  void keyPressed() {
  background(0);
  redraw();
 } 

