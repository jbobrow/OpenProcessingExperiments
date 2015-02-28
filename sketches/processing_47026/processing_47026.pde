
float si;
float si2;
float si3;

void setup(){
  size(800,600);
  background(255);
  smooth();
  
  
}


void draw(){
  
   noStroke();
  fill(255, 255, 255, 20);
  rect(0, 0, width, height);
  

  stroke(0);
  si = random(200);
  strokeWeight(10);
  fill(255);
  ellipse (200,200, si,si);
  si2 = random(200);
  strokeWeight(10);
  fill(255);
  ellipse (600,200, si2,si2);
   si3 = random(200);
  rect(width/2-100, height/2, si3,si3);
  
}

