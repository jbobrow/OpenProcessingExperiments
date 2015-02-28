
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID: wjddms6847

void setup() {
  size (1024, 768);
  smooth();
  noLoop();
}

void draw() {
  background(255,255,255);
  
  for(int a = 10; a<1024; a = a+50){
  for(int b = 10; b<768; b = b+50){
    
 fill(255,70,128);
 ellipse(a, b, 45, 45);
 fill(255,255,255);
 ellipse(a, b, 30, 30);
 strokeWeight(random(4));
  
  }
  }
 
  for(int c = 10; c<530; c = c+50){
  for(int d = 10; d<768; d = d+50){

 fill(47,247,206);
 ellipse(c, d, 45,45);
 fill(255,255,255);
 ellipse(c, d, 30,30);
 strokeWeight(random(4));
  
  }
  }
  }

void keyPressed() {
  background(0);
  redraw();

  } 

