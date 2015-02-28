
void setup(){
  size(500, 500);
}

void draw(){
  line(30, 100, 70, 400);
  fill(194, 10, 19, 5); //Red
  triangle(400, 300, 355, 450, 500, 450);
  rect(0, 0, 250, 250);
  
  fill(0, 194, 47, 10); //green
  rect(250, 0, 250, 250);
  
  fill(0,23,194, 15); //blue
  rect(0, 250, 250, 250);
  
  fill(255,0,148, 10); //pink
  rect(250, 250, 250, 250);
  
  stroke(0, 194, 47, 10);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, random(50),dist(pmouseX, pmouseY, mouseX, mouseY));
  
}
