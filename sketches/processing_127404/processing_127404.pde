
int counter = 0;

void setup(){
  size(400, 400);
  background(46,289,106);
  background(120);
  
  color c = color(random(255),random(255),random(255));
  stroke(c);
  strokeWeight(10);
  line(0,0,400,400);
  
  color d = color(201,234,255);
  stroke(d);
  strokeWeight(5);
  fill(c);
  rect(50, 50, 100, 100, 18);
  
  noStroke();
  fill(d);
  ellipse(300, 300, 100, 100);
  
  fill(c);
  triangle(400, 300, 325, 100, 400, 100);
  
  stroke(random(255));
  arc(200, 200, 100, 100, 0, HALF_PI);
}

/*
void draw(){
  counter = counter + 1;
  background(counter);
}
*/


