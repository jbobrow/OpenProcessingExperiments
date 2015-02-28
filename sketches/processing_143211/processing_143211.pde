
 
 
void setup() {

  size (500,500);
    background (255);

      }
void draw()
{
 background(255);
 
 
 
   rectMode(CORNER);
  noStroke();
  fill(255, 255, 255, 5);
  rect(0, 0, width, height);
  //background(255, 255, 255);
  noFill();
  stroke(100, 100, 100);
  strokeWeight(1/2);
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(millis()/700.0);
  rect(0, 0, 100, 100);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(4);
  rotate(millis()/-700.0);
  rect(0, 0, 100, 100);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(millis()/-700.0);
  rect(0, 0, 142, 142);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(4);
  rotate(millis()/700.0);
  rect(0, 0, 142, 142);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(millis()/700.0);
  rect(0, 0, 201, 201);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(4);
  rotate(-millis()/700.0);
  rect(0, 0, 201, 201);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(millis()/-700.0);
  rect(0, 0, 284, 284);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(4);
  rotate(millis()/700.0);
  rect(0, 0, 284, 284);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(millis()/700.0);
   fill(50,121,103,2);
  rect(0, 0, 402, 402);
  popMatrix();
 
  pushMatrix();
  rectMode(CENTER);
  translate(140, 160);
  rotate(4);
  rotate(-millis()/700.0);
  fill(50,121,103,5);
  rect(0, 0, 402, 402);
  popMatrix();

  

  
  for ( int i=0; i<360; i+=16)
  {
    pushMatrix();
     translate(140, 160);
    rotate (radians (6*second()-90));
    strokeWeight(1);
    strokeCap(ROUND);
    stroke(0, 0, 0,20);
    line(0, 0, 180, 0);
    fill(50,121,103,15);
    rotate (radians (6*second()-90));
    ellipse(0,0,i*2,i*2);
   
    popMatrix();
    
    
    
    
    
    pushMatrix();
      translate(150, 400);
    rotate (radians (6*minute()-90));
    strokeWeight(3);
    strokeCap(ROUND);
    stroke(0, 0, 0,20);
    line(0, 0, 170, 0);
    fill(97,147,50,10);
    rotate (radians (6*second()-90));
    ellipse(0,0,i/3,i/3);
    popMatrix();
    
    
    
    
    pushMatrix();
      translate(380, 250);
    rotate (radians (30*hour()-90));
    strokeWeight(5);
    strokeCap(ROUND);
    stroke(0, 0, 0,20);
    line(0, 0, 70, 0);
    fill(0,173,128,10);
    rotate (radians (6*second()-90));
    ellipse(0,0,i/2,i/2);
    popMatrix();
  }
 
 
 
}
