


void setup() {
  size(400, 400);
  background(125,125,0);
  
}

void draw(){
  background(125,mouseX,mouseY);
  line(0, 0, width/2, height/2);
  stroke(125, 255, 0);
  line(width, 0, width/2, height/2);
  stroke(122, 58, 12);
  line(width/2, height, width/2, height/2);
}


