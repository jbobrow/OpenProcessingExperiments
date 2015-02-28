
float r = 0;

void setup() {
  size(900,500);
  fill(0);
  stroke(200,55,0);
  strokeWeight(8);
  rectMode(CENTER);
}

void draw(){
  background(70,0,0);
  
  translate(200,200);
  rotate(r);
  rect(0,0,1500,20);
  resetMatrix();
  
  translate(400,200);
  rotate(r);
  rect(0,0,20,1200);
  resetMatrix();
  
  translate(600,300);
  rotate(r);
  rect(0,0,25,1500);
  resetMatrix();
  
  translate(800,350);
  rotate(r);
  rect(0,0,20,1500);
  resetMatrix();
  
  translate(50,50);
  rotate(r);
  rect(0,0,20,1500);
  resetMatrix();
  
  translate(900,100);
  rotate(r);
  rect(0,0,60,2000);
  resetMatrix();
  
  translate(400,1000);
  rotate(r);
  rect(0,0,50,4000);
  resetMatrix();
  
  translate(0,0);
  rotate(r);
  rect(0,0,10,2500);
  resetMatrix();
  
  translate(500,400);
  rotate(r);
  rect(0,0,50,2500);
  resetMatrix();
  
  translate(50,200);
  rotate(r);
  rect(0,0,50,2000);
  resetMatrix();
  
  translate(1000,760);
  rotate(r);
  rect(0,0,50,5000);
  resetMatrix();
  

  r=r+0.04;
}
