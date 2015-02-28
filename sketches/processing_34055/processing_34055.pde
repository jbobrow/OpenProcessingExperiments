
int value = 0;

void setup(){
  size(700,400);
  background(255);
}

void draw() {
 fill(value);
 rect(0,0,width,height);
 }

void mouseClicked() {
  if(value == 0) {
    value = (255);
  } else {
    value = 0;
  }
}

