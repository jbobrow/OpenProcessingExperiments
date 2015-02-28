
boolean fswitch = false;
    
void setup() {
  size(500,500);
  noStroke();
  smooth();
  background(0);
}


void draw() {
  frameRate(100);
  if(fswitch==false){
    stroke(0);
    fill(#FFFF00);
    ellipse(mouseX,mouseY,15,15);
    stroke(255);
    strokeWeight(2);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  else {
    fill(0);
    noStroke();
    ellipse(mouseX,mouseY,100,100);
  }
}

void mouseMoved() {
  fswitch=false;
}

void mouseDragged() {
  fswitch=true;
}




