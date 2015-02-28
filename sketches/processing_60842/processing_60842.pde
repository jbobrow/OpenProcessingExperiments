
void setup() {
  size(500, 500);
  smooth();
}


void draw() { 
  background(18, 44, 64);
  noStroke();

  fill(255, 204, 0);
  translate(width/2, height/2); 
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30);


  //Ellipse_1+1a+1b
  pushMatrix();
  rotate(millis() * 0.0008 * TWO_PI / 10.0);   
  translate(200, 0);   
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 20, 20);
  
  pushMatrix();
  rotate(millis() * 0.0008 * TWO_PI / 10.0);  
  translate(30, 0);  
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 10, 10);
  
  pushMatrix();
  rotate(millis() * 0.006 * TWO_PI / 8.0);  
  translate(13, 0);  
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 4, 4);

  popMatrix();
  popMatrix();
  popMatrix();


  //Ellipse_2 
  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI / 10.0);   
  translate(150, 0);   
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 12, 12);
  popMatrix();
  

  //Ellipse_3+3a
  pushMatrix();
  rotate(millis() * 0.0005 * TWO_PI / 10.0);   
  translate(100, 0);  
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 25, 25); 
  
  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI / 10.0);   
  translate(30, 0);  
  fill(255, 204, 0);
  noStroke();
  ellipse(0, 0, 8, 8);

  popMatrix();
  popMatrix();
}


