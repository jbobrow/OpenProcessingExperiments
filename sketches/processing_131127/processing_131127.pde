
float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 100;
float grab = 0.0;

void setup() {
  size(640, 640);

  fill(255,160);
}

void draw() {
  background(0);
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  
  
  noStroke();
  rect(260,140,120,120);
  rect(240,320,160,300);  
  stroke(255, 160);
  
  grab = 1+0.4*sin(2*PI* (frameCount % 90 /90.0));
  
  pushMatrix();
  segment(420,320, angle1); 
  segment(segLength, 0, angle2);
  claw(segLength,0,grab);
  popMatrix();
  
  pushMatrix();
  segment(220,320, -1*angle1); 
  segment(segLength, 0, angle2);
  claw(segLength,0,grab);
  popMatrix();
  
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  strokeWeight(30);
  line(0, 0, segLength, 0);
}

void claw(float x, float y, float a) {

  strokeWeight(20);
  translate(x, y);
  rotate(a);
  line(0, 0, 35, 0);
  pushMatrix();
    translate(35, 0);
    rotate(-0.8*a);
    line(0, 0, 30, 0);
    pushMatrix();
      translate(30, 0);
      rotate(1.5*a-PI*0.785);
      line(0, 0, 15, 0);
    popMatrix();
    
    
 popMatrix();
 

 
 
  rotate(-2*a);
  line(0, 0, 35, 0);
    pushMatrix();
    translate(35, 0);
    rotate(0.8*a);
    line(0, 0, 30, 0);
        pushMatrix();
      translate(30, 0);
      rotate(-1.5*a+PI*0.75);
      line(0, 0, 15, 0);
    popMatrix();
    
    
    
  popMatrix();
  
  
  
}


