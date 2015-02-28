
void setup () {
  size(600,600);
  background(100,89,79);
  frameRate(100);
}

void draw () {
  smooth();
  background(random(255), 131,131,5);
  frameRate(30);
  fill(255,255,255);
  ellipse (300,300, random(900), random(900));
  fill(100,89,79);
  ellipse (300,300, random(300), random(300));
  line(300,300,random(900), random (900));
  strokeWeight(5);
  stroke(0,0,0,random(100));
  
    
}

