
int i;	

void setup() {
  frameRate(10);
  size(400, 400);
  colorMode(RGB, 255);
}
int pos = 0;
void draw() {
  background(0);
  
  strokeWeight(1);
  pos++;
  for(i=0; i<50; i++){
    stroke(pos*10, pos*5, 200);
  line(pos*i, pos*20, pos*10, i*pos);
  
  if(pos > width/10) {
    pos=-10;
  }
  }
}

