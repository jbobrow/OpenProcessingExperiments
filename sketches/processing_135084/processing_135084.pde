
void setup() {  // setup() runs once
  size(300,300);
  frameRate(30);
}
void mousePressed() {
background(random(255),random(255),random(255),random(255));  
}
void draw(){
  stroke(random(150,250),random(150,250),random(150,250));
  strokeWeight(random(10,50));
  fill(random(100),random(100),random(100));
ellipse(random(300),random(300),random(150),random(150));
}

