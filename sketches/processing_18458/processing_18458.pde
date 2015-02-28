
void setup() {
size(250, 250);
background(250);
smooth();
}
 
void draw() {
  frameRate(2);
  stroke(500);
  strokeWeight(500);
  fill(random(250),random(455));
  ellipse(100,100,50,50);
 
  stroke(500);
  strokeWeight(500);
  fill(random(455),random(155));
  ellipse(105,200,50,50);
  
   stroke(500);
  strokeWeight(500);
  fill(random(455),random(155));
  ellipse(200,10,50,50);
  
   stroke(500);
  strokeWeight(500);
  fill(random(455),random(155));
  ellipse(50,50,20,20);
  
   stroke(500);
  strokeWeight(500);
  fill(random(455),random(155));
  ellipse(200,200,20,20);
}

