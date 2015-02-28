

void setup(){
  size(250,250);
    background(255,240,20);
    frameRate(20);
}

void draw(){

  if (mousePressed){
    strokeWeight(random(200));
    stroke(random(150));
    line(mouseX,mouseY,mouseY,mouseX);
  }
}




