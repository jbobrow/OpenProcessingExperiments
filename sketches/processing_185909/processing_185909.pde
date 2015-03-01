
boolean stop = false;
void setup() {
  size(400,400);
  background(#317E4D);
}
void draw() {
//  background(#317E4D);
  if (stop == false) {
  int value = random(10,40);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,value,value);
  }
   if (mousePressed && (mouseButton == RIGHT)) {
    background(#317E4D);
   } 
}
void mousePressed(){
  if (stop == false) {
    stop = true;
  }else {
    stop = false;
  }
}


