
void setup(){
 size(500, 500); 
}

void draw(){
 
  if(mousePressed)
  stroke(random(255), random(255), random(255));
 fill(random(255), random(255), random(255));
  line(mouseX, mouseY, 250, 250);
  ellipse(mouseX, mouseY, 50, 50);
  rect(mouseY, mouseX, 456, 456);
}


