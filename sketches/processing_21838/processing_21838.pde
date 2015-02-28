
//D10
void setup() {
  size(600,600);
  background(0);
}

void draw() {
  translate(300,300);
  noStroke();
  fill(255);
  ellipse(0,0,500,500);
  fill(121,118,216);
  triangle(0,0,250,0,300,20);
  for(int i=0; i<100; i++) {
    pushMatrix();
    noStroke();
    fill(255);
    triangle(0,0,250,0,300,20);
    triangle(0,0,250,0,300,-20);
    line(0,0,300,300);
    rotate(radians(30*i));
    triangle(0,0,250,0,300,20);
    triangle(0,0,250,0,300,-20);
    popMatrix();
  }
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(255);
    strokeWeight(20);
    line(0,0,300,300);
    rotate(radians(30*i));
    line(0,0,300,300);
    popMatrix();
  }
  stroke(0);
  strokeWeight(10);
  ellipse(0,0,400,400);
  fill(0);
  ellipse(0,0,350,350);
  
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(255);
    strokeWeight(16);
    line(0,0,179,0);
    rotate(radians(30*i));
    line(0,0,179,0);
    popMatrix();
  }
  stroke(255);
  strokeWeight(10);
  fill(0,0);
  ellipse(0,0,700,700);
  
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(255);
    strokeWeight(10);
    line(0,0,350,0);
    rotate(radians(10*i));
    line(0,0,350,0);
    popMatrix();
  }
  
  fill(255);
  ellipse(0,0,200,200);
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(0);
    strokeWeight(15);
    line(0,0,300,300);
    rotate(radians(30*i));
    line(0,0,300,300);
    popMatrix();
  }
  fill(0);
  ellipse(0,0,100,100);
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(0);
    strokeWeight(10);
    line(0,0,300,0);
    rotate(radians(30*i));
    line(0,0,300,0);
    popMatrix();
  }
  fill(255);
  ellipse(0,0,80,80);
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(255);
    strokeWeight(5);
    line(0,0,300,300);
    rotate(radians(30*i));
    line(0,0,300,300);
    popMatrix();
  }
  fill(0);
  ellipse(0,0,50,50);
  for(int i=0; i<100; i++) {
    pushMatrix();
    stroke(0);
    strokeWeight(1);
    line(0,0,300,300);
    rotate(radians(30*i));
    line(0,0,300,300);
    popMatrix();
  }
  

}


