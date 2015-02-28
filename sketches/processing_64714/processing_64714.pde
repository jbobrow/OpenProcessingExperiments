
void setup() {
  
size(600,400);
background(180,180,180);

  strokeWeight(2);
  frameRate(10);
}

void draw() {
  
if(mousePressed == true) {
  fill(random(250),random(250),random(250));
  rect(50,50,500,200);
  
}
}


