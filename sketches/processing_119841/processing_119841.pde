
int i;
void setup() {
  size(500,500);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  for(i=mouseX;i>0;i--) {
    if(i%2 == 0) {
      fill(0);
    } else {
      fill(255);
    }
    rect(width/2,height/2,i*5,i*5);
  }
  
}
