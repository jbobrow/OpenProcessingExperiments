

void setup(){
  size(500,500);
  background(255,240,0);
  noStroke();
}


void draw() {

}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0,200,255);
  } else { //try right click
    fill(255,0,200);
  } 
    ellipse(width/2,height/2,width,height);
}

