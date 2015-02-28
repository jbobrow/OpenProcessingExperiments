
void setup(){ 
  size(400,400); 
  noStroke(); 
  fill(0);
}

void draw(){ 
  frameRate(10);
  background(255); 
  fill(0);
  rect(0,0,100,400);
  rect(150,0,100,400);
  rect(300,0,100,400);
  if(mouseY<200){ 
    float r=random(400);
    fill(0);
    ellipse(r,100,100,100); 
  }
else { 
  float r=random(400);
  fill(255);
  ellipse(r,300,100,100); 
  }
}
