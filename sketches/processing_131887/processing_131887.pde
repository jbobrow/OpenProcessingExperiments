
int counter;
void setup() {
  size(900, 900);
  background(150);
  smooth();
  noStroke();
  colorMode(HSB);
  counter = 4;
}

void draw(){
  if (frameCount % 10 == 0) {
   fill(random(255),100,255,50);
      counter++;
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount * 2  % 360));
    rect(0,0, 200, 200);
    popMatrix();
  }
if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 50, 50);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
