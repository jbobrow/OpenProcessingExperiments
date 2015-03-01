
// Move the mouse across the image
// to change its value
int value = 0;
int move = 0;
void setup(){
size(600,600);
background(255);
noStroke();
smooth();
}

void draw() {
  fill(0,value,value,10);
  ellipse(random(move),random(move),value,value);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
  move = move+1;
  if(move>600){
  move = 0;

  }
}
