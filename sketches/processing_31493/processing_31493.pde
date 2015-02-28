
int bubble = 25;
int value = 0;


void setup(){
  size(500,500);
  background(0);
  
}

void draw(){
  noStroke();
  fill(random(255),13,255);
  ellipse(mouseX,mouseY,bubble,bubble);

}

void mouseClicked() {
  if(bubble > 0) {
    bubble = bubble + 1;
  } else {
    bubble = 0;
  }
}
