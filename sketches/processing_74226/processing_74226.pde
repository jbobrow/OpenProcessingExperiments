
void setup() {
  size(500, 500);
  background(0);
}
void draw() {
  
  //glava
  noStroke();
  fill(255, 180, 130);
  ellipse(250, 250, 200, 450);
  
  //oci
  stroke(0);
  fill(255);
  ellipse(150, 250, 120, 70);
  
  stroke(0);
  fill(255);
  ellipse(350, 250, 120, 70);
  
  //zjenice
  fill(0);
  ellipse(150, 250, 8, 35);
  
  fill(0);
  ellipse(350, 250, 8, 35);
  
  //kapci
  noFill(); 
  ellipse(150, 250, 120, 35);
  
  ellipse(350, 250, 120, 35);
  
  //usta
  noStroke();
  fill(0);
  ellipse(250, 420, 20, 2);
  
  //brk
  noStroke();
  ellipse(210, 400, 80, 10);
  
  noStroke();
  ellipse(290, 400, 80, 10);
  
}


