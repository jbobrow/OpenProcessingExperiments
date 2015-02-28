
void setup() {  // setup() runs once
  size(300,300);
  frameRate(3500);
}
void mousePressed() {
background(random(123),random(123),random(123),random(123)); 
}
void draw(){
  stroke(random(45,78),random(45,78),random(45,78));
  strokeWeight(random(2,5));
  fill(random(255),random(188),random(205));
rect(random(300),random(300),random(300),random(300));
}

