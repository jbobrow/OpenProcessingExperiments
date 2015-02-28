


int patternSeperationX = 125;
int patternSeperationY = 75;

void setup(){
  size(500,500);
  background(0);
  smooth();
  
  for(int i = 0; i < width/patternSeperationX; i++){
 for(int j = 0; j < height/patternSeperationY; j++){
   pushMatrix();
   translate(i*patternSeperationX, j*patternSeperationY);
   yourFunction();
   popMatrix();
  }
}
}

void yourFunction(){
 
  
  noStroke();
  smooth();
  fill(68,93,102,random(70));
  ellipse(50,50,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(70));
  ellipse(50,0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(70));
  ellipse(50,100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(70));
  ellipse(5,25,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(70));
  ellipse(95,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(70));
  ellipse(5,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(70));
  ellipse(95,25,50,50);
  
  scale(random(0.5));
  rotate(random(360));
   noStroke();
  smooth();
  fill(68,93,102,random(128));
  ellipse(50,50,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(128));
  ellipse(50,0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(128));
  ellipse(50,100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(128));
  ellipse(5,25,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(128));
  ellipse(95,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(128));
  ellipse(5,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(128));
  ellipse(95,25,50,50);
  
 
  strokeWeight(2);
  smooth();
  noFill();
  stroke(68,93,102);
  ellipse(50,50,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(143,152,176);
  ellipse(50,0,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(143,152,176);
  ellipse(50,100,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(115,113,128);
  ellipse(5,25,50,50);
  
  strokeWeight(2);
  noFill();
  smooth();
  stroke(115,113,128);
  ellipse(95,75,50,50);
  
  strokeWeight(2);
  noFill();
  smooth();
  stroke(48,54,57);
  ellipse(5,75,50,50);
  
 strokeWeight(2);
  noFill();
  smooth();
  stroke(48,54,57);
  ellipse(95,25,50,50);
  
}

