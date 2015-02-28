
void setup(){
 size(1000,500);
 smooth(); 
 noLoop();
}

void draw(){
  background(255);
  for (int i=0; i<1000; i+=100){
   watch(i, 250, random(-5,5), random(255),random(255),random(255));
  }
}

void watch(float x, float y, float a, float r, float g, float b) {
  pushMatrix();
  translate(x,y);
  rotate(a);
  fill(r,g,b);
  noStroke();
  rect(135, 100, 30, 300);
  ellipse(150, 250, 60,60);
  rect(130, 120, 40, 10);
  rect(130, 150, 40, 10);
  fill(255);
  ellipse(150, 250, 45,45);
  ellipse(150, 320, 10,10);
  ellipse(150, 340, 10,10);
  ellipse(150, 360, 10,10);
  ellipse(150, 380, 10,10);
  strokeWeight(5);
  stroke(r,g,b); 
  rect(132.5, 70, 35, 30);
  line(150,80, 150,100);
  line(150,250, 150, 235);
  line(150,250, 160, 250);
  popMatrix();
}

void mousePressed() {
 redraw(); 
}




